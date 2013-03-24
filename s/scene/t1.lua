function t1_OnStart ()
	-- 1.��
	VIEW_COLUMNS    = 3		-- �J�[�\���ړ��͈̗͂񐔁B
	VIEW_ROWS       = 3		-- �J�[�\���ړ��͈͂̍s���B
	viewCursorColumn= 0		-- �J�[�\���������Ԓn�B
	viewCursorRow   = 0		-- �J�[�\��������s�Ԓn�B
	-- 2.���e�̕\���ʒu
						-- viewHeadColumn �� 0�Œ�Ȃ̂ŏȗ��B
						-- viewHeadRow    �� 0�Œ�Ȃ̂ŏȗ��B
	-- 3.���e
	data = {
			 --�y�[�W1�̂�
			 "�`", "�a", "�b",
			 "�c", "�d", "�e",
			 "�f", "�g", "�h"
			}

	-- 1.�܂��摜��ǂݍ���
	G.background   = loadGraphic("gfx/Bg_t1.png");
	G.frame1       = loadGraphic("gfx/Window1.png");

	-- 1.5.�t�H���g��ǂݍ���
	F.font1    = createTextureFont("font/font.lfd", ".png", false);

	-- 2.�A�N�^�[��\������B
	--     ���C���[�ԍ���0����11�܂ł�12���ŁA�������傫���قǏ�ɂȂ�܂��B
	--     �ォ��ǉ������V�[���́A�O�ɒǉ������V�[��������ɂȂ�܂��B
	A.background   = createActor(G.background, 640/2,     480/2,  8);
	A.frame1       = createActor(G.frame1    , 640/2, 5.5* 32  , 11);
	
	-- 2.5.�A�N�^�[�� 9patch ���Z�b�g���܂��B
   	--�^�C�g�����j���[
	setv( A.frame1, 64, 5 )
	--����̕��E�����A�E���̕��E�������w�肷��ꍇ�B
	--     cut9PatchGraphic2(        g, x, y,  w,  h, w_left, h_top, w_right, h_bottom)
	tbl1 = cut9PatchGraphic2( G.frame1, 0, 0, 64, 64,      8,     8,       8,        8)
	set9patchGraphic( A.frame1, tbl1 )
   	addMover( A.frame1, -1, 50, MOVER_SETZOOM, 176, 256 )
   	
	A.cursor1= createTextActor( F.font1, "��"   ,  8.5*32,  2*32  , 11 );
	A.msg1   = createTextActor( F.font1, data[1],  8.5*32,  3*32  , 11 );
	A.msg2   = createTextActor( F.font1, data[2],  9.5*32,  3*32  , 11 );
	A.msg3   = createTextActor( F.font1, data[3], 10.5*32,  3*32  , 11 );
	A.msg4   = createTextActor( F.font1, data[4],  8.5*32,  5*32  , 11 );
	A.msg5   = createTextActor( F.font1, data[5],  9.5*32,  5*32  , 11 );
	A.msg6   = createTextActor( F.font1, data[6], 10.5*32,  5*32  , 11 );
	A.msg7   = createTextActor( F.font1, data[7],  8.5*32,  7*32  , 11 );
	A.msg8   = createTextActor( F.font1, data[8],  9.5*32,  7*32  , 11 );
	A.msg9   = createTextActor( F.font1, data[9], 10.5*32,  7*32  , 11 );
end

function t1_OnStep ()

    -- 1.�{�^�����蕔

    if( 1 == getJoyPressCount( BUTTON_RIGHT ) ) then
    	--���{�^���i���Α��֏o��j
    	--���E���`�F�b�N
    	if( viewCursorColumn < VIEW_COLUMNS-1 )then
	    	viewCursorColumn = viewCursorColumn + 1
    	else
    		viewCursorColumn = 0
    	end
		flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_DOWN ) ) then
    	--���{�^���i���Α��֏o��j
    	--���E���`�F�b�N
    	if( viewCursorRow < VIEW_ROWS - 1 )then
	    	viewCursorRow = viewCursorRow + 1
	    else
	    	viewCursorRow = 0
    	end
		flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_LEFT ) ) then
	    --���{�^���i���Α��֏o��j
    	--���E���`�F�b�N
    	if( 0 < viewCursorColumn )then
	    	viewCursorColumn = viewCursorColumn - 1
    	else
    		viewCursorColumn = VIEW_COLUMNS-1
    	end
		flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_UP ) ) then
	    --���{�^���i���Α��֏o��j
    	--���E���`�F�b�N
    	if( 0 < viewCursorRow )then
	    	viewCursorRow = viewCursorRow - 1
    	else
    		viewCursorRow = VIEW_ROWS-1
    	end
		flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --�P�{�^���i���̉�ʂցj
	    changeScene("t2")
	    goto endFunc
    end
    
    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --�Q�{�^���i�O�̉�ʂցj
	    changeScene("t0")
	    goto endFunc
    end

	-- 2.�A�N�^�[���암

    if( flg_Cursor==1 )then
    	addMover( A.cursor1, -1, 1, MOVER_SETPOSITION, (viewCursorColumn+8.5)*32, (2*viewCursorRow+2)*32 )
    end
    
    ::endFunc::
end

function t1_OnClose ()
	-- 3.�\�������摜����������
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
	vanish(A.background);

	-- 4.�摜���J������
	deleteGraphic(G.frame1);
	deleteGraphic(G.background);
	deleteTextureFont(F.msg1);	-- �t�H���g�폜
end
