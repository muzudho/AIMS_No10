function v6_OnStart ()
	-- 1.欄
	VIEW_CURSOR = 2 -- カーソルがある番地。固定。
	-- 2.内容の表示位置
	viewHead    = 0 -- 欄の先頭番地に表示されているデータの番地。
	-- 3.内容
	data = { "Ａ", "Ｂ", "Ｃ", "Ｄ", "Ｅ", "Ｆ", "Ｇ" }
	-- 4.欄の表示位置
	viewX     = 640/2 - 6*32
	viewY     = 6* 32 +   32/2
	viewWidth = 6* 32
	viewHeight= 6* 32 +   16

	-- 1.まず画像を読み込む
	G.background   = loadGraphic("gfx/Bg_v6.png");
	G.frame1       = loadGraphic("gfx/Window1.png");

	-- 1.5.フォントを読み込む
	F.font1    = createTextureFont("font/font.lfd", ".png", false);

	-- 2.アクターを表示する。
	--     レイヤー番号は0から11までの12枚で、数字が大きいほど上になります。
	--     後から追加したシーンは、前に追加したシーンよりも上になります。
	A.background   = createActor(G.background, 640/2, 480/2,  8);
	A.frame1       = createActor(G.frame1    , viewX, viewY, 11);
	
	-- 2.5.アクターに 9patch をセットします。
   	--タイトルメニュー
	setv( A.frame1, 64, 5 )
	--左上の幅・高さ、右下の幅・高さを指定する場合。
	--     cut9PatchGraphic2(        g, x, y,  w,  h, w_left, h_top, w_right, h_bottom)
	tbl1 = cut9PatchGraphic2( G.frame1, 0, 0, 64, 64,      8,     8,       8,        8)
	set9patchGraphic( A.frame1, tbl1 )
   	addMover( A.frame1, -1, 50, MOVER_SETZOOM, viewWidth, viewHeight )
   	
	A.cursor1= createTextActor( F.font1, "→"   , viewX - 1*32,  viewY     -32/2, 11 );
	A.msg1   = createTextActor( F.font1, data[1], viewX       ,  viewY-2*32-32/2, 11 );
	A.msg2   = createTextActor( F.font1, data[2], viewX       ,  viewY-1*32-32/2, 11 );
	A.msg3   = createTextActor( F.font1, data[3], viewX       ,  viewY-0*32-32/2, 11 );
	A.msg4   = createTextActor( F.font1, data[4], viewX       ,  viewY+1*32-32/2, 11 );
	A.msg5   = createTextActor( F.font1, data[5], viewX       ,  viewY+2*32-32/2, 11 );
end

function v6_OnStep ()

    -- 1.ボタン判定部

    if( 1 == getJoyPressCount( BUTTON_DOWN ) ) then
    	--↓ボタン（ドラムロール反対側へ出る）
    	--境界内チェック
    	if( viewHead < #data - VIEW_CURSOR - 1 )then
	    	viewHead = viewHead + 1
	   	else
	   		viewHead = 0 - VIEW_CURSOR
    	end
		flg_Head = 1
    end

    if( 1 == getJoyPressCount( BUTTON_UP ) ) then
	    --↑ボタン（ドラムロール反対側へ出る）
    	--境界内チェック
    	if( 0 - VIEW_CURSOR < viewHead )then
	    	viewHead = viewHead - 1
	   	else
	    	viewHead = #data - VIEW_CURSOR - 1
    	end
		flg_Head = 1
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --１ボタン（次の画面へ）
	    changeScene("h0")
	    goto endFunc
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --２ボタン（前の画面へ）
	    changeScene("v5")
	    goto endFunc
    end

	-- 2.アクター動作部

    if( flg_Head==1 )then
		if(isAlive(A.msg1))then
			vanish(A.msg1);
		end
		if( 1 <= viewHead+1 and viewHead+1 <= #data)then
			A.msg1   = createTextActor( F.font1, data[viewHead+1], viewX, viewY-2*32-32/2, 11 );
		end

		if(isAlive(A.msg2))then
			vanish(A.msg2);
		end
		if( 1 <= viewHead+2 and viewHead+2 <= #data)then
			A.msg2   = createTextActor( F.font1, data[viewHead+2], viewX, viewY-1*32-32/2, 11 );
		end
		
		if(isAlive(A.msg3))then
			vanish(A.msg3);
		end
		if( 1 <= viewHead+3 and viewHead+3 <= #data)then
			A.msg3   = createTextActor( F.font1, data[viewHead+3], viewX, viewY-0*32-32/2, 11 );
		end
		
		if(isAlive(A.msg4))then
			vanish(A.msg4);
		end
		if( 1 <= viewHead+4 and viewHead+4 <= #data)then
			A.msg4   = createTextActor( F.font1, data[viewHead+4], viewX, viewY+1*32-32/2, 11 );
		end
		
		if(isAlive(A.msg5))then
			vanish(A.msg5);
		end
		if( 1 <= viewHead+5 and viewHead+5 <= #data)then
			A.msg5   = createTextActor( F.font1, data[viewHead+5], viewX, viewY+2*32-32/2, 11 );
		end
    end

    ::endFunc::
end

function v6_OnClose ()
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
