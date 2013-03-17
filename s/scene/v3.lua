function v3_OnStart ()
	viewHead   = 0
	cursorCur  = 0
	cursorFirst= 0
	cursorLast = 3
	data = { "Ａ", "Ｂ", "Ｃ", "Ｄ", "Ｅ", "Ｆ", "Ｇ",
				"Ｈ", "Ｉ", "Ｊ", "Ｋ", "Ｌ", "Ｍ", "Ｎ" }

	-- 1.まず画像を読み込む
	G.background   = loadGraphic("gfx/Bg_v3.png");
	G.frame1       = loadGraphic("gfx/Window1.png");

	-- 1.5.フォントを読み込む
	F.font1    = createTextureFont("font/font.lfd", ".png", false);

	-- 2.アクターを表示する。
	--     レイヤー番号は0から11までの12枚で、数字が大きいほど上になります。
	--     後から追加したシーンは、前に追加したシーンよりも上になります。
	A.background   = createActor(G.background, 640/2,   480/2     ,  8);
	A.frame1       = createActor(G.frame1    , 640/2, 6* 32  +32/2, 11);
	
	-- 2.5.アクターに 9patch をセットします。
   	--タイトルメニュー
	setv( A.frame1, 64, 5 )
	--左上の幅・高さ、右下の幅・高さを指定する場合。
	--     cut9PatchGraphic2(        g, x, y,  w,  h, w_left, h_top, w_right, h_bottom)
	tbl1 = cut9PatchGraphic2( G.frame1, 0, 0, 64, 64,      8,     8,       8,        8)
	set9patchGraphic( A.frame1, tbl1 )
   	addMover( A.frame1, -1, 50, MOVER_SETZOOM, 400, 176+32 )
   	
	A.cursor1= createTextActor( F.font1, "→"     , 640/2 - 1*32,  4  *32  , 11 );
	A.msg1   = createTextActor( F.font1, data[1], 640/2       ,  4  *32  , 11 );
	A.msg2   = createTextActor( F.font1, data[2], 640/2       ,  5  *32  , 11 );
	A.msg3   = createTextActor( F.font1, data[3], 640/2       ,  6  *32  , 11 );
	A.msg4   = createTextActor( F.font1, data[4], 640/2       ,  7  *32  , 11 );
	--ページ数
	str = currentPage( 1, cursorFirst, cursorLast, cursorCur+viewHead ) .."／".. totalPage( cursorFirst, cursorLast, #data)
	strw= getTextWidth(F.font1, str, false);
	A.msg5   = createTextActor( F.font1, str      , 640/2-strw/2,  8  *32  , 11 );
end

function v3_OnStep ()

    -- 1.ボタン判定部

    if( 1 == getJoyPressCount( BUTTON_RIGHT ) ) then
    	--→ボタン（次ページ・端止まり）
    	--境界内チェック
    	if( currentPage( 1, cursorFirst, cursorLast, cursorCur+viewHead + (cursorLast - cursorFirst + 1) ) <= totalPage( cursorFirst, cursorLast, #data) )then
	    	viewHead = viewHead + (cursorLast - cursorFirst + 1)
			flg_Head = 1
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_DOWN ) ) then
    	--↓ボタン（端止まり）
    	--境界内チェック
    	if( cursorCur < cursorLast )then
	    	cursorCur = cursorCur + 1
	   		flg_Cursor = 1
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_LEFT ) ) then
    	--←ボタン（前ページ・端止まり）
    	--境界内チェック
    	if( 1 <= currentPage( 1, cursorFirst, cursorLast, cursorCur + viewHead - (cursorLast - cursorFirst + 1) ) )then
	    	viewHead = viewHead - (cursorLast - cursorFirst + 1)
			flg_Head = 1
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_UP ) ) then
	    --↑ボタン（端止まり）
    	--境界内チェック
    	if( cursorFirst < cursorCur )then
	    	cursorCur = cursorCur - 1
	   		flg_Cursor = 1
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --１ボタン（次の画面へ）
	    changeScene("v4")
	    goto endFunc
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --２ボタン（前の画面へ）
	    changeScene("v2")
	    goto endFunc
    end

	-- 2.アクター動作部

    if( flg_Cursor==1 )then
    	addMover( A.cursor1, -1, 1, MOVER_SETPOSITION, 640/2 - 1*32, (cursorCur + 4)*32 )
    end

    if( flg_Head==1 )then
		if(isAlive(A.msg1))then
			vanish(A.msg1);
		end
		if( 1 <= viewHead+1 and viewHead+1 <= #data)then
			A.msg1   = createTextActor( F.font1, data[viewHead+1], 640/2       ,  4  *32  , 11 );
		end

		if(isAlive(A.msg2))then
			vanish(A.msg2);
		end
		if( 1 <= viewHead+2 and viewHead+2 <= #data)then
			A.msg2   = createTextActor( F.font1, data[viewHead+2], 640/2       ,  5  *32  , 11 );
		end
		
		if(isAlive(A.msg3))then
			vanish(A.msg3);
		end
		if( 1 <= viewHead+3 and viewHead+3 <= #data)then
			A.msg3   = createTextActor( F.font1, data[viewHead+3], 640/2       ,  6  *32  , 11 );
		end
		
		if(isAlive(A.msg4))then
			vanish(A.msg4);
		end
		if( 1 <= viewHead+4 and viewHead+4 <= #data)then
			A.msg4   = createTextActor( F.font1, data[viewHead+4], 640/2       ,  7  *32  , 11 );
		end
		
		--ページ数
		if(isAlive(A.msg5))then
			vanish(A.msg5);
		end
		str = currentPage( 1, cursorFirst, cursorLast, cursorCur+viewHead ) .."／".. totalPage( cursorFirst, cursorLast, #data)
		strw= getTextWidth(F.font1, str, false);
		A.msg5   = createTextActor( F.font1, str      , 640/2-strw/2,  8  *32  , 11 );
    end

    ::endFunc::
end

function v3_OnClose ()
	-- 3.表示した画像を消去する
	vanish(A.frame1);
	vanish(A.cursor1);
	vanish(A.msg1);
	vanish(A.msg2);
	vanish(A.msg3);
	vanish(A.msg4);
	vanish(A.msg5);
	vanish(A.background);

	-- 4.画像を開放する
	deleteGraphic(G.frame1);
	deleteGraphic(G.background);
	deleteTextureFont(F.msg1);	-- フォント削除
end
