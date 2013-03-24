function v5_OnStart ()
	-- 1.��
	VIEW_CURSOR= 2		-- �J�[�\��������Ԓn�B�Œ�B
	-- 2.���e�̕\���ʒu
	viewHead   = 0		-- ���̐擪�Ԓn�ɕ\������Ă���f�[�^�̔Ԓn�B
	-- 3.���e
	data = { "�`", "�a", "�b", "�c", "�d", "�e", "�f" }
	-- 4.���̕\���ʒu
	viewX     = 17*32
	viewY     = 5* 32
	viewWidth =  4    * 32
	viewHeight=  5.5  * 32

	-- 1.�܂��摜��ǂݍ���
	G.background   = loadGraphic("gfx/Bg_v5.png");
	G.frame1       = loadGraphic("gfx/Window1.png");

	-- 1.5.�t�H���g��ǂݍ���
	F.font1    = createTextureFont("font/font.lfd", ".png", false);

	-- 2.�A�N�^�[��\������B
	--     ���C���[�ԍ���0����11�܂ł�12���ŁA�������傫���قǏ�ɂȂ�܂��B
	--     �ォ��ǉ������V�[���́A�O�ɒǉ������V�[��������ɂȂ�܂��B
	A.background   = createActor(G.background, 640/2,   480/2     ,  8);
	A.frame1       = createActor(G.frame1    , viewX, viewY, 11);
	
	-- 2.5.�A�N�^�[�� 9patch ���Z�b�g���܂��B
   	--�^�C�g�����j���[
	setv( A.frame1, 64, 5 )
	--����̕��E�����A�E���̕��E�������w�肷��ꍇ�B
	--     cut9PatchGraphic2(        g, x, y,  w,  h, w_left, h_top, w_right, h_bottom)
	tbl1 = cut9PatchGraphic2( G.frame1, 0, 0, 64, 64,      8,     8,       8,        8)
	set9patchGraphic( A.frame1, tbl1 )
   	addMover( A.frame1, -1, 50, MOVER_SETZOOM, viewWidth, viewHeight )
   	
	A.cursor1= createTextActor( F.font1, "��"   , viewX - 1*32,  viewY-32/2, 11 );
	A.msg1   = createTextActor( F.font1, data[1], viewX       ,  viewY-2*32-32/2  , 11 );
	A.msg2   = createTextActor( F.font1, data[2], viewX       ,  viewY-1*32-32/2  , 11 );
	A.msg3   = createTextActor( F.font1, data[3], viewX       ,  viewY+0*32-32/2  , 11 );
	A.msg4   = createTextActor( F.font1, data[4], viewX       ,  viewY+1*32-32/2  , 11 );
	A.msg5   = createTextActor( F.font1, data[5], viewX       ,  viewY+2*32-32/2  , 11 );
end

function v5_OnStep ()

    -- 1.�{�^�����蕔

    if( 1 == getJoyPressCount( BUTTON_DOWN ) ) then
    	--���{�^���i�h�������[�������~�܂�j
    	--���E���`�F�b�N
    	if( viewHead < #data - VIEW_CURSOR - 1 )then
	    	viewHead = viewHead + 1
	   		flg_Head = 1
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_UP ) ) then
	    --���{�^���i�h�������[���擪�~�܂�j
    	--���E���`�F�b�N
    	if( 0 - VIEW_CURSOR < viewHead )then
	    	viewHead = viewHead - 1
	   		flg_Head = 1
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --�P�{�^���i���̉�ʂցj
	    changeScene("v6")
	    goto endFunc
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --�Q�{�^���i�O�̉�ʂցj
	    changeScene("v4")
	    goto endFunc
    end

	-- 2.�A�N�^�[���암

    if( flg_Head==1 )then
		if(isAlive(A.msg1))then
			vanish(A.msg1);
		end
		if( 1 <= viewHead+1 and viewHead+1 <= #data)then
			A.msg1   = createTextActor( F.font1, data[viewHead+1], viewX       ,  viewY-2*32-32/2  , 11 );
		end

		if(isAlive(A.msg2))then
			vanish(A.msg2);
		end
		if( 1 <= viewHead+2 and viewHead+2 <= #data)then
			A.msg2   = createTextActor( F.font1, data[viewHead+2], viewX       ,  viewY-1*32-32/2  , 11 );
		end
		
		if(isAlive(A.msg3))then
			vanish(A.msg3);
		end
		if( 1 <= viewHead+3 and viewHead+3 <= #data)then
			A.msg3   = createTextActor( F.font1, data[viewHead+3], viewX       ,  viewY+0*32-32/2  , 11 );
		end
		
		if(isAlive(A.msg4))then
			vanish(A.msg4);
		end
		if( 1 <= viewHead+4 and viewHead+4 <= #data)then
			A.msg4   = createTextActor( F.font1, data[viewHead+4], viewX       ,  viewY+1*32-32/2  , 11 );
		end
		
		if(isAlive(A.msg5))then
			vanish(A.msg5);
		end
		if( 1 <= viewHead+5 and viewHead+5 <= #data)then
			A.msg5   = createTextActor( F.font1, data[viewHead+5], viewX       ,  viewY+2*32-32/2  , 11 );
		end
    end

    ::endFunc::
end

function v5_OnClose ()
	-- 3.�\�������摜����������
	vanish(A.frame1);
	vanish(A.cursor1);
	vanish(A.msg1);
	vanish(A.msg2);
	vanish(A.msg3);
	vanish(A.msg4);
	vanish(A.msg5);
	vanish(A.background);

	-- 4.�摜���J������
	deleteGraphic(G.frame1);
	deleteGraphic(G.background);
	deleteTextureFont(F.msg1);	-- �t�H���g�폜
end
