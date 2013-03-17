function v0_OnStart ()
	viewHead   = 0
	cursorCur  = 0
	cursorFirst= 0
	cursorLast = 3
	data = { "Ａ", "Ｂ", "Ｃ", "Ｄ" }

	-- 1.まず画像を読み込む
	G.background   = loadGraphic("gfx/Bg_v0.png");
	G.frame1       = loadGraphic("gfx/Window1.png");

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
   	addMover( A.frame1, -1, 50, MOVER_SETZOOM, 400, 176 )
   	
	A.cursor1= createTextActor( F.font1, "→"     , 640/2 - 1*32,  4  *32  , 11 );
	A.msg1   = createTextActor( F.font1, data[1], 640/2       ,  4  *32  , 11 );
	A.msg2   = createTextActor( F.font1, data[2], 640/2       ,  5  *32  , 11 );
	A.msg3   = createTextActor( F.font1, data[3], 640/2       ,  6  *32  , 11 );
	A.msg4   = createTextActor( F.font1, data[4], 640/2       ,  7  *32  , 11 );
end

function v0_OnStep ()

    -- 1.ボタン判定部

    if( 1 == getJoyPressCount( BUTTON_DOWN ) ) then
    	--↓ボタン（端止まり）
    	--境界内チェック
    	if( cursorCur < cursorLast )then
	    	cursorCur = cursorCur + 1
	   		flg_Cursor = 1
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
	    changeScene("v1")
	    goto endFunc
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --２ボタン（前の画面へ）
	    changeScene("h6")
	    goto endFunc
    end

	-- 2.アクター動作部

    if( flg_Cursor==1 )then
    	addMover( A.cursor1, -1, 1, MOVER_SETPOSITION, 640/2 - 1*32, (cursorCur + 4)*32 )
    end
    
    ::endFunc::
end

function v0_OnClose ()
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
