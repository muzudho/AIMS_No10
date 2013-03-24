function t4_OnStart ()
	-- 1.欄
	VIEW_COLUMNS    = 3		-- カーソル移動範囲の列数。
	VIEW_ROWS       = 3		-- カーソル移動範囲の行数。
	viewCursorColumn= 0		-- カーソルがある列番地。
	viewCursorRow   = 0		-- カーソルがある行番地。
	VIEW_LAST       = VIEW_ROWS*VIEW_COLUMNS-1
	-- 2.内容の表示位置
							-- viewHeadColumn は 0固定なので省略。
							-- viewHeadRow    は 0固定なので省略。
	viewHeadPage   = 0		-- 欄の先頭番地に表示されているデータのページ番地。
	-- 3.内容
	data = {
			 --ページ1
			 "Ａ", "Ｂ", "Ｃ",
			 "Ｄ", "Ｅ", "Ｆ",
			 "Ｇ", "Ｈ", "Ｉ",
			 --ページ2
			 "Ｊ", "Ｋ", "Ｌ",
			 "Ｍ", "Ｎ", "Ｏ",
			 "Ｐ", "Ｑ", "Ｒ",
			 --ページ3
			 "Ｓ", "Ｔ", "Ｕ",
			 "Ｖ", "Ｗ", "Ｘ",
			 "Ｙ", "Ｚ"
			}

	-- 1.まず画像を読み込む
	G.background   = loadGraphic("gfx/Bg_t4.png");
	G.frame1       = loadGraphic("gfx/Window1.png");

	-- 1.5.フォントを読み込む
	F.font1    = createTextureFont("font/font.lfd", ".png", false);

	-- 2.アクターを表示する。
	--     レイヤー番号は0から11までの12枚で、数字が大きいほど上になります。
	--     後から追加したシーンは、前に追加したシーンよりも上になります。
	A.background   = createActor(G.background, 640/2,     480/2,  8);
	A.frame1       = createActor(G.frame1    , 640/2, 5.5* 32  , 11);
	
	-- 2.5.アクターに 9patch をセットします。
   	--タイトルメニュー
	setv( A.frame1, 64, 5 )
	--左上の幅・高さ、右下の幅・高さを指定する場合。
	--     cut9PatchGraphic2(        g, x, y,  w,  h, w_left, h_top, w_right, h_bottom)
	tbl1 = cut9PatchGraphic2( G.frame1, 0, 0, 64, 64,      8,     8,       8,        8)
	set9patchGraphic( A.frame1, tbl1 )
   	addMover( A.frame1, -1, 50, MOVER_SETZOOM, 176, 256 )
   	
	A.cursor1= createTextActor( F.font1, "↓"   ,  8.5*32,  2*32  , 11 );
	A.msg1   = createTextActor( F.font1, data[1],  8.5*32,  3*32  , 11 );
	A.msg2   = createTextActor( F.font1, data[2],  9.5*32,  3*32  , 11 );
	A.msg3   = createTextActor( F.font1, data[3], 10.5*32,  3*32  , 11 );
	A.msg4   = createTextActor( F.font1, data[4],  8.5*32,  5*32  , 11 );
	A.msg5   = createTextActor( F.font1, data[5],  9.5*32,  5*32  , 11 );
	A.msg6   = createTextActor( F.font1, data[6], 10.5*32,  5*32  , 11 );
	A.msg7   = createTextActor( F.font1, data[7],  8.5*32,  7*32  , 11 );
	A.msg8   = createTextActor( F.font1, data[8],  9.5*32,  7*32  , 11 );
	A.msg9   = createTextActor( F.font1, data[9], 10.5*32,  7*32  , 11 );
	--ページ数
		local dataCursor = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + viewCursorRow*VIEW_COLUMNS + viewCursorColumn
		str = currentPage( 1, VIEW_LAST, dataCursor ) .."／".. totalPage( VIEW_LAST, #data)
		strw= getTextWidth(F.font1, str, false);
		A.msg10   = createTextActor( F.font1, str    , 640/2-strw/2,  8*32  , 11 );
end

function t4_OnStep ()

    -- 1.ボタン判定部

    if( 1 == getJoyPressCount( BUTTON_RIGHT ) ) then
    	--→ボタン（反対側に出る）
    	--境界内チェック
    	if( viewCursorColumn < VIEW_COLUMNS-1 )then
	    	viewCursorColumn = viewCursorColumn + 1
    	else
    		viewCursorColumn = viewCursorColumn - (VIEW_COLUMNS-1)
    	end
   		flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_DOWN ) ) then
    	--↓ボタン（反対側に出る）
    	--境界内チェック
    	if( viewCursorRow < VIEW_ROWS-1 )then
	    	viewCursorRow = viewCursorRow + 1
	   	else
			viewCursorRow = 0
    	end
   		flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_LEFT ) ) then
	    --←ボタン（反対側に出る）
    	--境界内チェック
    	if( 0 < viewCursorColumn )then
	    	viewCursorColumn = viewCursorColumn - 1
    	else
    		viewCursorColumn = VIEW_COLUMNS-1
    	end
    	flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_UP ) ) then
    	--↑ボタン（反対側に出る）
    	--境界内チェック
    	if( 0 < viewCursorRow )then
	    	viewCursorRow = viewCursorRow - 1
    	else
    		viewCursorRow = VIEW_ROWS - 1
    	end
    	flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --１ボタン（次の画面へ）
	    changeScene("t5")
	    goto endFunc
    end
    
    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --２ボタン（前の画面へ）
	    changeScene("t3")
	    goto endFunc
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG3 ) ) then
	    --３ボタン（前ページ・端止まり）
    	--境界内チェック
    	local dataCursor = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + viewCursorRow*VIEW_COLUMNS+viewCursorColumn
    	if( 1 < currentPage( 1, VIEW_LAST, dataCursor ) )then
    		viewHeadPage = viewHeadPage - 1
		else
			--カーソルは動かさず、ページだけを動かすのがコツ。
		
			viewHeadPage = math.ceil(#data / (VIEW_ROWS*VIEW_COLUMNS)) - 1
    	end
		flg_Head = 1
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG4 ) ) then
	    --４ボタン（次ページ・端止まり）
    	--境界内チェック
    	local dataCursor = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + viewCursorRow*VIEW_COLUMNS+viewCursorColumn
    	if( currentPage( 1, VIEW_LAST, dataCursor ) < totalPage( VIEW_LAST, #data) )then
    		viewHeadPage = viewHeadPage + 1
		else
    		viewHeadPage = 0
    	end
		flg_Head = 1
    end

	-- 2.アクター動作部

    if( flg_Cursor==1 )then
    	addMover( A.cursor1, -1, 1, MOVER_SETPOSITION, (viewCursorColumn+8.5)*32, (2*viewCursorRow+2)*32 )
    end

    if( flg_Head==1 )then
		if(isAlive(A.msg1))then
			vanish(A.msg1);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 1
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg1   = createTextActor( F.font1, data[dataNumber],  8.5*32,  3*32, 11 );
		end

		if(isAlive(A.msg2))then
			vanish(A.msg2);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 2
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg2   = createTextActor( F.font1, data[dataNumber],  9.5*32,  3*32, 11 );
		end
		
		if(isAlive(A.msg3))then
			vanish(A.msg3);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 3
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg3   = createTextActor( F.font1, data[dataNumber], 10.5*32,  3*32, 11 );
		end
		
		if(isAlive(A.msg4))then
			vanish(A.msg4);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 4
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg4   = createTextActor( F.font1, data[dataNumber],  8.5*32,  5*32, 11 );
		end
		
		if(isAlive(A.msg5))then
			vanish(A.msg5);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 5
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg5   = createTextActor( F.font1, data[dataNumber],  9.5*32,  5*32, 11 );
		end
		
		if(isAlive(A.msg6))then
			vanish(A.msg6);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 6
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg6   = createTextActor( F.font1, data[dataNumber], 10.5*32,  5*32, 11 );
		end
		
		if(isAlive(A.msg7))then
			vanish(A.msg7);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 7
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg7   = createTextActor( F.font1, data[dataNumber],  8.5*32,  7*32, 11 );
		end
		
		if(isAlive(A.msg8))then
			vanish(A.msg8);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 8
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg8   = createTextActor( F.font1, data[dataNumber],  9.5*32,  7*32, 11 );
		end
		
		if(isAlive(A.msg9))then
			vanish(A.msg9);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 9
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg9   = createTextActor( F.font1, data[dataNumber], 10.5*32,  7*32, 11 );
		end
		
		--ページ数
		if(isAlive(A.msg10))then
			vanish(A.msg10);
		end
    	local dataCursor = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + viewCursorRow*VIEW_COLUMNS+viewCursorColumn
		str = currentPage( 1, VIEW_LAST, dataCursor ) .."／".. totalPage( VIEW_LAST, #data)
		strw= getTextWidth(F.font1, str, false);
		A.msg10   = createTextActor( F.font1, str    , 640/2-strw/2,  8*32  , 11 );
    end
    
    ::endFunc::
end

function t4_OnClose ()
	-- 3.表示した画像を消去する
	vanish(A.frame1);
	vanish(A.cursor1);
	vanish(A.msg1);
	vanish(A.msg2);
	vanish(A.msg3);
	vanish(A.msg4);
	vanish(A.msg5);
	vanish(A.msg6);
	vanish(A.msg7);
	vanish(A.msg8);
	vanish(A.msg9);
	vanish(A.msg10);
	vanish(A.background);

	-- 4.画像を開放する
	deleteGraphic(G.frame1);
	deleteGraphic(G.background);
	deleteTextureFont(F.msg1);	-- フォント削除
end
