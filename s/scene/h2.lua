function h2_OnStart ()
	viewHead   = 0
	cursorCur  = 0
	cursorFirst= 0
	cursorLast = 3
	data = { "Ａ", "Ｂ", "Ｃ", "Ｄ", "Ｅ", "Ｆ", "Ｇ" }

	-- 1.まず画像を読み込む
	G.background   = loadGraphic("gfx/Bg_h2.png");
	G.frame1       = loadGraphic("gfx/メッセージ窓.png");

	-- 1.5.フォントを読み込む
	F.font1    = createTextureFont("font/font.lfd", ".png", false);

	-- 2.アクターを表示する。
	--     レイヤー番号は0から11までの12枚で、数字が大きいほど上になります。
	--     後から追加したシーンは、前に追加したシーンよりも上になります。
	A.background   = createActor(G.background, 640/2,   480/2,  8);
	A.frame1       = createActor(G.frame1    , 640/2, 6* 32  , 11);
	
	-- 2.5.アクターに 9patch をセットします。
   	--タイトルメニュー
	setv( A.frame1, 64, 5 )
	--左上の幅・高さ、右下の幅・高さを指定する場合。
	--     cut9PatchGraphic2(        g, x, y,  w,  h, w_left, h_top, w_right, h_bottom)
	tbl1 = cut9PatchGraphic2( G.frame1, 0, 0, 64, 64,      8,     8,       8,        8)
	set9patchGraphic( A.frame1, tbl1 )
   	addMover( A.frame1, -1, 50, MOVER_SETZOOM, 176, 200 )
   	
	A.cursor1= createTextActor( F.font1, "↓"   ,  8*32,  4*32  , 11 );
	A.msg1   = createTextActor( F.font1, data[1],  8*32,  5*32  , 11 );
	A.msg2   = createTextActor( F.font1, data[2],  9*32,  5*32  , 11 );
	A.msg3   = createTextActor( F.font1, data[3], 10*32,  5*32  , 11 );
	A.msg4   = createTextActor( F.font1, data[4], 11*32,  5*32  , 11 );
end

function h2_OnStep ()

    -- 1.ボタン判定部

    if( 1 == getJoyPressCount( BUTTON_RIGHT ) ) then
    	--→ボタン（端止まり／スクロール）
    	--境界内チェック
    	if( cursorCur < cursorLast )then
	    	cursorCur = cursorCur + 1
	   		flg_Cursor = 1
	    else
	    	if( viewHead < #data - cursorLast - 1 )then
		    	viewHead = viewHead + 1
		    	flg_Head = 1
		    end
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_LEFT ) ) then
	    --←ボタン（端止まり／スクロール）
    	--境界内チェック
    	if( cursorFirst < cursorCur )then
	    	cursorCur = cursorCur - 1
	   		flg_Cursor = 1
	    else
	    	if( cursorFirst < viewHead )then
		    	viewHead = viewHead - 1
		    	flg_Head = 1
		    end
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --１ボタン（次の画面へ）
	    changeScene("h3")
	    goto endFunc
    end
    
    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --２ボタン（前の画面へ）
	    changeScene("h1")
	    goto endFunc
    end

	-- 2.アクター動作部

    if( flg_Cursor==1 )then
    	addMover( A.cursor1, -1, 1, MOVER_SETPOSITION, (cursorCur+8)*32, 4*32 )
    end

    if( flg_Head==1 )then
		vanish(A.msg1);
		A.msg1   = createTextActor( F.font1, data[viewHead+1],  8*32, 5*32, 11 );
		vanish(A.msg2);
		A.msg2   = createTextActor( F.font1, data[viewHead+2],  9*32, 5*32, 11 );
		vanish(A.msg3);
		A.msg3   = createTextActor( F.font1, data[viewHead+3], 10*32, 5*32, 11 );
		vanish(A.msg4);
		A.msg4   = createTextActor( F.font1, data[viewHead+4], 11*32, 5*32, 11 );
    end
    
    ::endFunc::
end

function h2_OnClose ()
	-- 3.表示した画像を消去する
	vanish(A.frame1);
	vanish(A.cursor1);
	vanish(A.msg1);
	vanish(A.msg2);
	vanish(A.msg3);
	vanish(A.msg4);
	vanish(A.background);

	-- 4.画像を開放する
	deleteGraphic(G.frame1);
	deleteGraphic(G.background);
	deleteTextureFont(F.msg1);	-- フォント削除
end
