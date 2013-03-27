function h1_OnStart ()
	-- 1.欄
	VIEW_FIRST= 0		-- カーソル移動範囲の先頭の番地。
	viewCursor= 0		-- カーソルがある番地。
	VIEW_LAST = 3		-- カーソル移動範囲の末尾の番地。
	-- 2.内容の表示位置
						-- viewHead は 0固定なので省略。
	-- 3.内容
	data = { "Ａ", "Ｂ", "Ｃ", "Ｄ" }
	-- 4.欄の表示位置
	viewX     =  4  * 32
	viewY     = 12  * 32
	viewWidth =  5  * 32
	viewHeight=  3.5* 32

	-- 1.まず画像を読み込む
	G.background   = loadGraphic("gfx/Bg_h1.png");
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
   	
	A.cursor1= createTextActor( F.font1, "↓"   , -2*32+viewX,  -1*32+viewY, 11 );
	A.msg1   = createTextActor( F.font1, data[1], -2*32+viewX,   0*32+viewY, 11 );
	A.msg2   = createTextActor( F.font1, data[2], -1*32+viewX,   0*32+viewY, 11 );
	A.msg3   = createTextActor( F.font1, data[3],  0*32+viewX,   0*32+viewY, 11 );
	A.msg4   = createTextActor( F.font1, data[4],  1*32+viewX,   0*32+viewY, 11 );
end

function h1_OnStep ()

    -- 1.ボタン判定部

    if( 1 == getJoyPressCount( BUTTON_RIGHT ) ) then
    	--→ボタン（反対側へ出る）
    	--境界内チェック
    	if( viewCursor < VIEW_LAST )then
	    	viewCursor = viewCursor + 1
    	else
    	  viewCursor = VIEW_FIRST
    	end
   		flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_LEFT ) ) then
	    --←ボタン（反対側へ出る）
    	--境界内チェック
    	if( VIEW_FIRST < viewCursor )then
	    	viewCursor = viewCursor - 1
    	else
    	  viewCursor = VIEW_LAST
    	end
    	flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --１ボタン（次の画面へ）
	    changeScene("h2")
	    goto endFunc
    end
    
    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --２ボタン（前の画面へ）
	    changeScene("h0")
	    goto endFunc
    end

	-- 2.アクター動作部

    if( flg_Cursor==1 )then
    	addMover( A.cursor1, -1, 1, MOVER_SETPOSITION, (viewCursor-2)*32+viewX, -1*32+viewY )
    end
    
    ::endFunc::
end

function h1_OnClose ()
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
