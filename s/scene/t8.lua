function t8_OnStart ()
	-- 1.��
	VIEW_COLUMNS    = 3		-- �J�[�\���ړ��͈̗͂񐔁B
	VIEW_ROWS       = 3		-- �J�[�\���ړ��͈͂̍s���B
	viewCursorColumn= 1		-- �J�[�\���������Ԓn�B
	viewCursorRow   = 1		-- �J�[�\��������s�Ԓn�B
	-- 2.���e�̕\���ʒu
	viewHeadColumn = 0		-- ���̐擪�Ԓn�ɕ\������Ă���f�[�^�̗�Ԓn�B
	viewHeadRow    = 0		-- ���̐擪�Ԓn�ɕ\������Ă���f�[�^�̍s�Ԓn�B
	-- 3.���e
	DATA_COLUMNS   = 5		-- �f�[�^�̗񐔁B
	DATA_ROWS      = 5		-- �f�[�^�̍s���B
	data = {
			 --�y�[�W1
			 "�`", "�a", "�b", "�c", "�d",
			 "�e", "�f", "�g", "�h", "�i",
			 "�j", "�k", "�l", "�m", "�n",
			 "�o", "�p", "�q", "�r", "�s",
			 "�t", "�u", "�v", "�w", "�x"
			}

	-- 1.�܂��摜��ǂݍ���
	G.background   = loadGraphic("gfx/Bg_t8.png");
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

   	--�J�[�\��
		A.cursor1= createTextActor( F.font1, "��"   ,  (viewCursorColumn+8.5)*32, (2*viewCursorRow+2)*32  , 11 );
	
	A.msg1   = createTextActor( F.font1, data[ 1],  8.5*32,  3*32  , 11 );
	A.msg2   = createTextActor( F.font1, data[ 2],  9.5*32,  3*32  , 11 );
	A.msg3   = createTextActor( F.font1, data[ 3], 10.5*32,  3*32  , 11 );
	A.msg4   = createTextActor( F.font1, data[ 6],  8.5*32,  5*32  , 11 );
	A.msg5   = createTextActor( F.font1, data[ 7],  9.5*32,  5*32  , 11 );
	A.msg6   = createTextActor( F.font1, data[ 8], 10.5*32,  5*32  , 11 );
	A.msg7   = createTextActor( F.font1, data[11],  8.5*32,  7*32  , 11 );
	A.msg8   = createTextActor( F.font1, data[12],  9.5*32,  7*32  , 11 );
	A.msg9   = createTextActor( F.font1, data[13], 10.5*32,  7*32  , 11 );
end

function t8_OnStep ()

    -- 1.�{�^�����蕔

    if( 1 == getJoyPressCount( BUTTON_RIGHT ) ) then
    	--���{�^���i����h�������[���E�`���҃J�[�\���j
    	
    	--�J�[�\���ƃf�[�^�͓��������A�\�����_�����X�N���[��������̂��R�c�B
    	
    	--�`���Ҕ�яo���`�F�b�N
    	if( viewCursorColumn<1 )then
	    	viewCursorColumn = viewCursorColumn + 1
	   		flg_Cursor = 1
    	else
	    	--���E���`�F�b�N
	    	if( viewHeadColumn < 2 )then
		    	viewHeadColumn = viewHeadColumn + 1
				flg_Head = 1
		    else
		    	--�`���҃J�[�\��
		    	if( viewCursorColumn < VIEW_COLUMNS-1 )then
			    	viewCursorColumn = viewCursorColumn + 1
			   		flg_Cursor = 1
			   	else
			   		--���Α��ɏo��
			   		viewCursorColumn = 0
			   		viewHeadColumn   = 0
			   		flg_Cursor = 1
					flg_Head = 1
		    	end
	    	end
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_DOWN ) ) then
    	--���{�^���i����h�������[���E�`���҃J�[�\���j

    	--�J�[�\���ƃf�[�^�͓��������A�\�����_�����X�N���[��������̂��R�c�B

    	--�`���Ҕ�яo���`�F�b�N
    	if( viewCursorRow<1 )then
	    	viewCursorRow = viewCursorRow + 1
	   		flg_Cursor = 1
    	else
	    	--���E���`�F�b�N
	    	if( viewHeadRow <= 1 )then
		    	viewHeadRow = viewHeadRow + 1
				flg_Head = 1
		    else
		    	--�`���҃J�[�\��
		    	if( viewCursorRow < VIEW_ROWS-1 )then
			    	viewCursorRow = viewCursorRow + 1
			   		flg_Cursor = 1
			   	else
			   		--���Α��ɏo��
			   		viewCursorRow = 0
			   		viewHeadRow   = 0
			   		flg_Cursor = 1
					flg_Head = 1
		    	end
	    	end
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_LEFT ) ) then
	    --���{�^���i����h�������[���E�`���҃J�[�\���j

    	--�J�[�\���ƃf�[�^�͓��������A�\�����_�����X�N���[��������̂��R�c�B

    	--�`���Ҕ�яo���`�F�b�N
    	if( 1<viewCursorColumn )then
	    	viewCursorColumn = viewCursorColumn - 1
	   		flg_Cursor = 1
    	else
	    	--���E���`�F�b�N
	    	if( 1 <= viewHeadColumn )then
		    	viewHeadColumn = viewHeadColumn - 1
				flg_Head = 1
			else
		    	--�`���҃J�[�\��
		    	if( 0 < viewCursorColumn )then
			    	viewCursorColumn = viewCursorColumn - 1
			   		flg_Cursor = 1
			   	else
			   		--���Α��ɏo��
			   		viewCursorColumn = VIEW_COLUMNS-1
			   		viewHeadColumn   = DATA_COLUMNS - VIEW_COLUMNS
			   		flg_Cursor = 1
					flg_Head = 1
		    	end
	    	end
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_UP ) ) then
    	--���{�^���i����h�������[���E�`���҃J�[�\���j

    	--�J�[�\���ƃf�[�^�͓��������A�\�����_�����X�N���[��������̂��R�c�B

    	--�`���Ҕ�яo���`�F�b�N
    	if( 1<viewCursorRow )then
	    	viewCursorRow = viewCursorRow - 1
	   		flg_Cursor = 1
    	else
	    	--���E���`�F�b�N
	    	if( 1 <= viewHeadRow )then
		    	viewHeadRow = viewHeadRow - 1
				flg_Head = 1
		    else
		    	--�`���҃J�[�\��
		    	if( 0 < viewCursorRow )then
			    	viewCursorRow = viewCursorRow - 1
			   		flg_Cursor = 1
			   	else
			   		--���Α��ɏo��
			   		viewCursorRow = VIEW_ROWS-1
			   		viewHeadRow   = DATA_ROWS - VIEW_ROWS
			   		flg_Cursor = 1
					flg_Head = 1
		    	end
	    	end
    	end
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --�P�{�^���i���̉�ʂցj
	    changeScene("t9")
	    goto endFunc
    end
    
    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --�Q�{�^���i�O�̉�ʂցj
	    changeScene("t7")
	    goto endFunc
    end

	-- 2.�A�N�^�[���암

    if( flg_Cursor==1 )then
    	addMover( A.cursor1, -1, 1, MOVER_SETPOSITION, (viewCursorColumn+8.5)*32, (2*viewCursorRow+2)*32 )
    end

    if( flg_Head==1 )then

		--1�i��

		if(isAlive(A.msg1))then
			vanish(A.msg1);
		end
		columnNumber = viewHeadColumn + 1
		rowNumber    = viewHeadRow    + 1
		if(
		    1 <= columnNumber and columnNumber <= 5 and
		    1 <= rowNumber    and rowNumber    <= 5
		   )then
			A.msg1   = createTextActor( F.font1, data[ (rowNumber-1)*DATA_COLUMNS + columnNumber],  8.5*32,  3*32, 11 );
		end

		if(isAlive(A.msg2))then
			vanish(A.msg2);
		end
		columnNumber = viewHeadColumn + 2
		rowNumber    = viewHeadRow    + 1
		if(
		    1 <= columnNumber and columnNumber <= 5 and
   		    1 <= rowNumber    and rowNumber    <= 5
		   )then
			A.msg2   = createTextActor( F.font1, data[ (rowNumber-1)*DATA_COLUMNS + columnNumber],  9.5*32,  3*32, 11 );
		end

		if(isAlive(A.msg3))then
			vanish(A.msg3);
		end
		columnNumber = viewHeadColumn + 3
		rowNumber    = viewHeadRow    + 1
		if(
		    1 <= columnNumber and columnNumber <= 5 and
		    1 <= rowNumber    and rowNumber    <= 5
		   )then
			A.msg3   = createTextActor( F.font1, data[ (rowNumber-1)*DATA_COLUMNS + columnNumber], 10.5*32,  3*32, 11 );
		end

		--2�i��

		if(isAlive(A.msg4))then
			vanish(A.msg4);
		end
		columnNumber = viewHeadColumn + 1
		rowNumber    = viewHeadRow    + 2
		if( 1 <= columnNumber and columnNumber <= 5 and
		    1 <= rowNumber    and rowNumber    <= 5
		   )then
			A.msg4   = createTextActor( F.font1, data[ (rowNumber-1)*DATA_COLUMNS + columnNumber],  8.5*32,  5*32, 11 );
		end
		
		if(isAlive(A.msg5))then
			vanish(A.msg5);
		end
		columnNumber = viewHeadColumn + 2
		rowNumber    = viewHeadRow    + 2
		if( 1 <= columnNumber and columnNumber <= 5 and
		    1 <= rowNumber    and rowNumber    <= 5
		   )then
			A.msg5   = createTextActor( F.font1, data[ (rowNumber-1)*DATA_COLUMNS + columnNumber],  9.5*32,  5*32, 11 );
		end
		
		if(isAlive(A.msg6))then
			vanish(A.msg6);
		end
		columnNumber = viewHeadColumn + 3
		rowNumber    = viewHeadRow    + 2
		if( 1 <= columnNumber and columnNumber <= 5 and
		    1 <= rowNumber    and rowNumber    <= 5
		   )then
			A.msg6   = createTextActor( F.font1, data[ (rowNumber-1)*DATA_COLUMNS + columnNumber], 10.5*32,  5*32, 11 );
		end

		--3�i��
		
		if(isAlive(A.msg7))then
			vanish(A.msg7);
		end
		columnNumber = viewHeadColumn + 1
		rowNumber    = viewHeadRow    + 3
		if( 1 <= columnNumber and columnNumber <= 5 and
		    1 <= rowNumber    and rowNumber    <= 5
		   )then
			A.msg7   = createTextActor( F.font1, data[ (rowNumber-1)*DATA_COLUMNS + columnNumber],  8.5*32,  7*32, 11 );
		end
		
		if(isAlive(A.msg8))then
			vanish(A.msg8);
		end
		columnNumber = viewHeadColumn + 2
		rowNumber    = viewHeadRow    + 3
		if( 1 <= columnNumber and columnNumber <= 5 and
		    1 <= rowNumber    and rowNumber    <= 5
		   )then
			A.msg8   = createTextActor( F.font1, data[ (rowNumber-1)*DATA_COLUMNS + columnNumber],  9.5*32,  7*32, 11 );
		end
		
		if(isAlive(A.msg9))then
			vanish(A.msg9);
		end
		columnNumber = viewHeadColumn + 3
		rowNumber    = viewHeadRow    + 3
		if( 1 <= columnNumber and columnNumber <= 5 and
		    1 <= rowNumber    and rowNumber    <= 5
		   )then
			A.msg9   = createTextActor( F.font1, data[ (rowNumber-1)*DATA_COLUMNS + columnNumber], 10.5*32,  7*32, 11 );
		end
		
    end
    
    ::endFunc::
end

function t8_OnClose ()
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
