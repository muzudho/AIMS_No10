function h2_OnStart ()
	-- 1.��
	VIEW_FIRST= 0		-- �J�[�\���ړ��͈͂̐擪�̔Ԓn�B
	viewCursor= 0		-- �J�[�\��������Ԓn�B
	VIEW_LAST = 3		-- �J�[�\���ړ��͈̖͂����̔Ԓn�B
	-- 2.���e�̕\���ʒu
	viewHead  = 0		-- ���̐擪�Ԓn�ɕ\������Ă���f�[�^�̔Ԓn�B
	-- 3.���e
	data = { "�`", "�a", "�b", "�c", "�d", "�e", "�f" }
	-- 4.���̕\���ʒu
	viewX     = 15  * 32
	viewY     =  9  * 32
	viewWidth =  5  * 32
	viewHeight=  3.5* 32

	-- 1.�܂��摜��ǂݍ���
	G.background   = loadGraphic("gfx/Bg_h2.png");
	G.frame1       = loadGraphic("gfx/Window1.png");

	-- 1.5.�t�H���g��ǂݍ���
	F.font1    = createTextureFont("font/font.lfd", ".png", false);

	-- 2.�A�N�^�[��\������B
	--     ���C���[�ԍ���0����11�܂ł�12���ŁA�������傫���قǏ�ɂȂ�܂��B
	--     �ォ��ǉ������V�[���́A�O�ɒǉ������V�[��������ɂȂ�܂��B
	A.background   = createActor(G.background, 640/2, 480/2,  8);
	A.frame1       = createActor(G.frame1    , viewX, viewY, 11);
	
	-- 2.5.�A�N�^�[�� 9patch ���Z�b�g���܂��B
   	--�^�C�g�����j���[
	setv( A.frame1, 64, 5 )
	--����̕��E�����A�E���̕��E�������w�肷��ꍇ�B
	--     cut9PatchGraphic2(        g, x, y,  w,  h, w_left, h_top, w_right, h_bottom)
	tbl1 = cut9PatchGraphic2( G.frame1, 0, 0, 64, 64,      8,     8,       8,        8)
	set9patchGraphic( A.frame1, tbl1 )
   	addMover( A.frame1, -1, 50, MOVER_SETZOOM, viewWidth, viewHeight )
   	
	A.cursor1= createTextActor( F.font1, "��"   , -2*32+viewX,  -1*32+viewY  , 11 );
	A.msg1   = createTextActor( F.font1, data[1], -2*32+viewX,   0*32+viewY  , 11 );
	A.msg2   = createTextActor( F.font1, data[2], -1*32+viewX,   0*32+viewY  , 11 );
	A.msg3   = createTextActor( F.font1, data[3],  0*32+viewX,   0*32+viewY  , 11 );
	A.msg4   = createTextActor( F.font1, data[4],  1*32+viewX,   0*32+viewY  , 11 );
end

function h2_OnStep ()

    -- 1.�{�^�����蕔

    if( 1 == getJoyPressCount( BUTTON_RIGHT ) ) then
    	--���{�^���i�[�~�܂�^�X�N���[���j
    	--���E���`�F�b�N
    	if( viewCursor < VIEW_LAST )then
	    	viewCursor = viewCursor + 1
	   		flg_Cursor = 1
	    else
	    	--�[�~�܂�
	    	if( viewHead < #data - VIEW_LAST - 1 )then
	    		--�X�N���[��
		    	viewHead = viewHead + 1
		    	flg_Head = 1
		    end
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_LEFT ) ) then
	    --���{�^���i�[�~�܂�^�X�N���[���j
    	--���E���`�F�b�N
    	if( VIEW_FIRST < viewCursor )then
	    	viewCursor = viewCursor - 1
	   		flg_Cursor = 1
	    else
	    	--�[�~�܂�
	    	if( 0 < viewHead )then
	    		--�X�N���[��
		    	viewHead = viewHead - 1
		    	flg_Head = 1
		    end
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --�P�{�^���i���̉�ʂցj
	    changeScene("h3")
	    goto endFunc
    end
    
    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --�Q�{�^���i�O�̉�ʂցj
	    changeScene("h1")
	    goto endFunc
    end

	-- 2.�A�N�^�[���암

    if( flg_Cursor==1 )then
    	addMover( A.cursor1, -1, 1, MOVER_SETPOSITION, (viewCursor-2)*32+viewX, -1*32+viewY )
    end

    if( flg_Head==1 )then
		vanish(A.msg1);
		A.msg1   = createTextActor( F.font1, data[viewHead+1], -2*32+viewX,  0*32+viewY, 11 );
		vanish(A.msg2);
		A.msg2   = createTextActor( F.font1, data[viewHead+2], -1*32+viewX,  0*32+viewY, 11 );
		vanish(A.msg3);
		A.msg3   = createTextActor( F.font1, data[viewHead+3],  0*32+viewX,  0*32+viewY, 11 );
		vanish(A.msg4);
		A.msg4   = createTextActor( F.font1, data[viewHead+4],  1*32+viewX,  0*32+viewY, 11 );
    end
    
    ::endFunc::
end

function h2_OnClose ()
	-- 3.�\�������摜����������
	vanish(A.frame1);
	vanish(A.cursor1);
	vanish(A.msg1);
	vanish(A.msg2);
	vanish(A.msg3);
	vanish(A.msg4);
	vanish(A.background);

	-- 4.�摜���J������
	deleteGraphic(G.frame1);
	deleteGraphic(G.background);
	deleteTextureFont(F.msg1);	-- �t�H���g�폜
end
