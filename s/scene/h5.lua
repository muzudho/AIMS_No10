function h5_OnStart ()
	-- 1.欄
	VIEW_FIRST = 0		-- カーソル移動範囲の先頭の番地。
	VIEW_CURSOR= 2		-- カーソルがある番地。固定。
	-- 2.内容の表示位置
	viewHead   = 0		-- 欄の先頭番地に表示されているデータの番地。
	-- 3.内容
	data = { "Ａ", "Ｂ", "Ｃ", "Ｄ", "Ｅ", "Ｆ", "Ｇ" }
	-- 4.欄の表示位置
	viewX     =  5.5* 32
	viewY     = 11  * 32
	viewWidth =  6  * 32
	viewHeight=  4  * 32

	-- 1.まず画像を読み込む
	G.background   = loadGraphic("gfx/Bg_h5.png");
	G.frame1       = loadGraphic("gfx/Window1.png");

	-- 1.5.フォントを読み込む
	F.font1    = createTextureFont("font/font.lfd", ".png", false);

	-- 2.アクターを表示する。
	--     レイヤー番号は0から11までの12枚で、数字が大きいほど上になります。
	--     後から追加したシーンは、前に追加したシーンよりも上になります。
	A.background   = createActor(G.background, 640/2,   480/2,  8);
	A.frame1       = createActor(G.frame1    , viewX, viewY  , 11);
	
	-- 2.5.アクターに 9patch をセットします。
   	--タイトルメニュー
	setv( A.frame1, 64, 5 )
	--左上の幅・高さ、右下の幅・高さを指定する場合。
	--     cut9PatchGraphic2(        g, x, y,  w,  h, w_left, h_top, w_right, h_bottom)
	tbl1 = cut9PatchGraphic2( G.frame1, 0, 0, 64, 64,      8,     8,       8,        8)
	set9patchGraphic( A.frame1, tbl1 )
   	addMover( A.frame1, -1, 50, MOVER_SETZOOM, viewWidth, viewHeight )
   	
   	--テキストは左上座標です。
	A.cursor1= createTextActor( F.font1, "↓"   , -0.5*32+viewX,  -1*32+viewY  , 11 );
	A.msg1   = createTextActor( F.font1, data[1], -2.5*32+viewX,   0*32+viewY  , 11 );
	A.msg2   = createTextActor( F.font1, data[2], -1.5*32+viewX,   0*32+viewY  , 11 );
	A.msg3   = createTextActor( F.font1, data[3], -0.5*32+viewX,   0*32+viewY  , 11 );
	A.msg4   = createTextActor( F.font1, data[4],  0.5*32+viewX,   0*32+viewY  , 11 );
	A.msg5   = createTextActor( F.font1, data[5],  1.5*32+viewX,   0*32+viewY  , 11 );
end

function h5_OnStep ()

    -- 1.ボタン判定部

    if( 1 == getJoyPressCount( BUTTON_RIGHT ) ) then
    	--→ボタン（ドラムロール末尾止まり）
    	--境界内チェック
    	if( viewHead < #data - VIEW_CURSOR - 1 )then
	    	viewHead = viewHead + 1
	   		flg_Head = 1
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_LEFT ) ) then
	    --←ボタン（ドラムロール先頭止まり）
    	--境界内チェック
    	if( 0 - VIEW_CURSOR < viewHead )then
	    	viewHead = viewHead - 1
	   		flg_Head = 1
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --１ボタン（次の画面へ）
	    changeScene("h6")
	    goto endFunc
    end
    
    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --２ボタン（前の画面へ）
	    changeScene("h4")
	    goto endFunc
    end

	-- 2.アクター動作部

    if( flg_Cursor==1 )then
	   	--テキストは左上座標です。
    	addMover( A.cursor1, -1, 1, MOVER_SETPOSITION, (VIEW_CURSOR-2.5)*32+viewX, -1*32+viewY )
    end

    if( flg_Head==1 )then
		if(isAlive(A.msg1))then
			vanish(A.msg1);
		end
		if( 1 <= viewHead+1 and viewHead+1 <= #data)then
		   	--テキストは左上座標です。
			A.msg1   = createTextActor( F.font1, data[viewHead+1],  -2.5*32+viewX, 0*32+viewY, 11 );
		end

		if(isAlive(A.msg2))then
			vanish(A.msg2);
		end
		if( 1 <= viewHead+2 and viewHead+2 <= #data)then
			A.msg2   = createTextActor( F.font1, data[viewHead+2],  -1.5*32+viewX, 0*32+viewY, 11 );
		end
		
		if(isAlive(A.msg3))then
			vanish(A.msg3);
		end
		if( 1 <= viewHead+3 and viewHead+3 <= #data)then
			A.msg3   = createTextActor( F.font1, data[viewHead+3], -0.5*32+viewX, 0*32+viewY, 11 );
		end
		
		if(isAlive(A.msg4))then
			vanish(A.msg4);
		end
		if( 1 <= viewHead+4 and viewHead+4 <= #data)then
			A.msg4   = createTextActor( F.font1, data[viewHead+4],  0.5*32+viewX, 0*32+viewY, 11 );
		end
		
		if(isAlive(A.msg5))then
			vanish(A.msg5);
		end
		if( 1 <= viewHead+5 and viewHead+5 <= #data)then
			A.msg5   = createTextActor( F.font1, data[viewHead+5],  1.5*32+viewX, 0*32+viewY, 11 );
		end
    end
    
    ::endFunc::
end

function h5_OnClose ()
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
