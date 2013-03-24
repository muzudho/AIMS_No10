function v1_OnStart ()
	-- 1.��
	VIEW_FIRST= 0		-- �J�[�\���ړ��͈͂̐擪�̔Ԓn�B
	viewCursor= 0		-- �J�[�\��������Ԓn�B
	VIEW_LAST = 3		-- �J�[�\���ړ��͈̖͂����̔Ԓn�B
	-- 2.���e�̕\���ʒu
						-- viewHead �� 0�Œ�Ȃ̂ŏȗ��B
	-- 3.���e
	data = { "�`", "�a", "�b", "�c" }
	-- 4.���̕\���ʒu
	viewX     = 3* 32
	viewY     = 4* 32
	viewWidth = 4* 32
	viewHeight= 5* 32

	-- 1.�܂��摜��ǂݍ���
	G.background   = loadGraphic("gfx/Bg_v1.png");
	G.frame1       = loadGraphic("gfx/Window1.png");

	-- 1.5.�t�H���g��ǂݍ���
	F.font1    = createTextureFont("font/font.lfd", ".png", false);

	-- 2.�A�N�^�[��\������B
	--     ���C���[�ԍ���0����11�܂ł�12���ŁA�������傫���قǏ�ɂȂ�܂��B
	--     �ォ��ǉ������V�[���́A�O�ɒǉ������V�[��������ɂȂ�܂��B
	A.background   = createActor(G.background, 640/2,   480/2,  8);
	A.frame1       = createActor(G.frame1    , viewX, viewY  , 11);
	
	-- 2.5.�A�N�^�[�� 9patch ���Z�b�g���܂��B
   	--�^�C�g�����j���[
	setv( A.frame1, 64, 5 )
	--����̕��E�����A�E���̕��E�������w�肷��ꍇ�B
	--     cut9PatchGraphic2(        g, x, y,  w,  h, w_left, h_top, w_right, h_bottom)
	tbl1 = cut9PatchGraphic2( G.frame1, 0, 0, 64, 64,      8,     8,       8,        8)
	set9patchGraphic( A.frame1, tbl1 )
   	addMover( A.frame1, -1, 50, MOVER_SETZOOM, viewWidth, viewHeight )
   	
	A.cursor1= createTextActor( F.font1, "��"   , viewX- 1*32, viewY-2*32, 11 );
	A.msg1   = createTextActor( F.font1, data[1], viewX      , viewY-2*32, 11 );
	A.msg2   = createTextActor( F.font1, data[2], viewX      , viewY-1*32, 11 );
	A.msg3   = createTextActor( F.font1, data[3], viewX      , viewY+0*32, 11 );
	A.msg4   = createTextActor( F.font1, data[4], viewX      , viewY+1*32, 11 );
end

function v1_OnStep ()

    -- 1.�{�^�����蕔

    if( 1 == getJoyPressCount( BUTTON_DOWN ) ) then
    	--���{�^���i���Α��֏o��j
    	--���E���`�F�b�N
    	if( viewCursor < VIEW_LAST  )then
	    	viewCursor = viewCursor + 1
    	else
    		viewCursor = VIEW_FIRST
    	end
   		flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_UP ) ) then
    	--���{�^���i���Α��֏o��j
    	--���E���`�F�b�N
    	if( VIEW_FIRST < viewCursor )then
	    	viewCursor = viewCursor - 1
    	else
    		viewCursor = VIEW_LAST
    	end
    	flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --�P�{�^���i���̉�ʂցj
	    changeScene("v2")
	    goto endFunc
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --�Q�{�^���i�O�̉�ʂցj
	    changeScene("v0")
	    goto endFunc
    end

	-- 2.�A�N�^�[���암

    if( flg_Cursor==1 )then
    	addMover( A.cursor1, -1, 1, MOVER_SETPOSITION, viewX - 1*32, viewY-6*32+(viewCursor + 4)*32 )
    end

    ::endFunc::
end

function v1_OnClose ()
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
