function t4_OnStart ()
	-- 1.��
	VIEW_COLUMNS    = 3		-- �J�[�\���ړ��͈̗͂񐔁B
	VIEW_ROWS       = 3		-- �J�[�\���ړ��͈͂̍s���B
	viewCursorColumn= 0		-- �J�[�\���������Ԓn�B
	viewCursorRow   = 0		-- �J�[�\��������s�Ԓn�B
	VIEW_LAST       = VIEW_ROWS*VIEW_COLUMNS-1
	-- 2.���e�̕\���ʒu
							-- viewHeadColumn �� 0�Œ�Ȃ̂ŏȗ��B
							-- viewHeadRow    �� 0�Œ�Ȃ̂ŏȗ��B
	viewHeadPage   = 0		-- ���̐擪�Ԓn�ɕ\������Ă���f�[�^�̃y�[�W�Ԓn�B
	-- 3.���e
	data = {
			 --�y�[�W1
			 "�`", "�a", "�b",
			 "�c", "�d", "�e",
			 "�f", "�g", "�h",
			 --�y�[�W2
			 "�i", "�j", "�k",
			 "�l", "�m", "�n",
			 "�o", "�p", "�q",
			 --�y�[�W3
			 "�r", "�s", "�t",
			 "�u", "�v", "�w",
			 "�x", "�y"
			}

	-- 1.�܂��摜��ǂݍ���
	G.background   = loadGraphic("gfx/Bg_t4.png");
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
	--�y�[�W��
		local dataCursor = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + viewCursorRow*VIEW_COLUMNS + viewCursorColumn
		str = currentPage( 1, VIEW_LAST, dataCursor ) .."�^".. totalPage( VIEW_LAST, #data)
		strw= getTextWidth(F.font1, str, false);
		A.msg10   = createTextActor( F.font1, str    , 640/2-strw/2,  8*32  , 11 );
end

function t4_OnStep ()

    -- 1.�{�^�����蕔

    if( 1 == getJoyPressCount( BUTTON_RIGHT ) ) then
    	--���{�^���i���Α��ɏo��j
    	--���E���`�F�b�N
    	if( viewCursorColumn < VIEW_COLUMNS-1 )then
	    	viewCursorColumn = viewCursorColumn + 1
    	else
    		viewCursorColumn = viewCursorColumn - (VIEW_COLUMNS-1)
    	end
   		flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_DOWN ) ) then
    	--���{�^���i���Α��ɏo��j
    	--���E���`�F�b�N
    	if( viewCursorRow < VIEW_ROWS-1 )then
	    	viewCursorRow = viewCursorRow + 1
	   	else
			viewCursorRow = 0
    	end
   		flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_LEFT ) ) then
	    --���{�^���i���Α��ɏo��j
    	--���E���`�F�b�N
    	if( 0 < viewCursorColumn )then
	    	viewCursorColumn = viewCursorColumn - 1
    	else
    		viewCursorColumn = VIEW_COLUMNS-1
    	end
    	flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_UP ) ) then
    	--���{�^���i���Α��ɏo��j
    	--���E���`�F�b�N
    	if( 0 < viewCursorRow )then
	    	viewCursorRow = viewCursorRow - 1
    	else
    		viewCursorRow = VIEW_ROWS - 1
    	end
    	flg_Cursor = 1
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG1 ) ) then
	    --�P�{�^���i���̉�ʂցj
	    changeScene("t5")
	    goto endFunc
    end
    
    if( 1 == getJoyPressCount( BUTTON_TRIG2 ) ) then
	    --�Q�{�^���i�O�̉�ʂցj
	    changeScene("t3")
	    goto endFunc
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG3 ) ) then
	    --�R�{�^���i�O�y�[�W�E�[�~�܂�j
    	--���E���`�F�b�N
    	local dataCursor = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + viewCursorRow*VIEW_COLUMNS+viewCursorColumn
    	if( 1 < currentPage( 1, VIEW_LAST, dataCursor ) )then
    		viewHeadPage = viewHeadPage - 1
		else
			--�J�[�\���͓��������A�y�[�W�����𓮂����̂��R�c�B
		
			viewHeadPage = math.ceil(#data / (VIEW_ROWS*VIEW_COLUMNS)) - 1
    	end
		flg_Head = 1
    end

    if( 1 == getJoyPressCount( BUTTON_TRIG4 ) ) then
	    --�S�{�^���i���y�[�W�E�[�~�܂�j
    	--���E���`�F�b�N
    	local dataCursor = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + viewCursorRow*VIEW_COLUMNS+viewCursorColumn
    	if( currentPage( 1, VIEW_LAST, dataCursor ) < totalPage( VIEW_LAST, #data) )then
    		viewHeadPage = viewHeadPage + 1
		else
    		viewHeadPage = 0
    	end
		flg_Head = 1
    end

	-- 2.�A�N�^�[���암

    if( flg_Cursor==1 )then
    	addMover( A.cursor1, -1, 1, MOVER_SETPOSITION, (viewCursorColumn+8.5)*32, (2*viewCursorRow+2)*32 )
    end

    if( flg_Head==1 )then
		if(isAlive(A.msg1))then
			vanish(A.msg1);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 1
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg1   = createTextActor( F.font1, data[dataNumber],  8.5*32,  3*32, 11 );
		end

		if(isAlive(A.msg2))then
			vanish(A.msg2);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 2
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg2   = createTextActor( F.font1, data[dataNumber],  9.5*32,  3*32, 11 );
		end
		
		if(isAlive(A.msg3))then
			vanish(A.msg3);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 3
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg3   = createTextActor( F.font1, data[dataNumber], 10.5*32,  3*32, 11 );
		end
		
		if(isAlive(A.msg4))then
			vanish(A.msg4);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 4
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg4   = createTextActor( F.font1, data[dataNumber],  8.5*32,  5*32, 11 );
		end
		
		if(isAlive(A.msg5))then
			vanish(A.msg5);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 5
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg5   = createTextActor( F.font1, data[dataNumber],  9.5*32,  5*32, 11 );
		end
		
		if(isAlive(A.msg6))then
			vanish(A.msg6);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 6
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg6   = createTextActor( F.font1, data[dataNumber], 10.5*32,  5*32, 11 );
		end
		
		if(isAlive(A.msg7))then
			vanish(A.msg7);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 7
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg7   = createTextActor( F.font1, data[dataNumber],  8.5*32,  7*32, 11 );
		end
		
		if(isAlive(A.msg8))then
			vanish(A.msg8);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 8
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg8   = createTextActor( F.font1, data[dataNumber],  9.5*32,  7*32, 11 );
		end
		
		if(isAlive(A.msg9))then
			vanish(A.msg9);
		end
		dataNumber = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + 9
		if( 1 <= dataNumber and dataNumber <= #data)then
			A.msg9   = createTextActor( F.font1, data[dataNumber], 10.5*32,  7*32, 11 );
		end
		
		--�y�[�W��
		if(isAlive(A.msg10))then
			vanish(A.msg10);
		end
    	local dataCursor = viewHeadPage*VIEW_ROWS*VIEW_COLUMNS + viewCursorRow*VIEW_COLUMNS+viewCursorColumn
		str = currentPage( 1, VIEW_LAST, dataCursor ) .."�^".. totalPage( VIEW_LAST, #data)
		strw= getTextWidth(F.font1, str, false);
		A.msg10   = createTextActor( F.font1, str    , 640/2-strw/2,  8*32  , 11 );
    end
    
    ::endFunc::
end

function t4_OnClose ()
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
	vanish(A.msg10);
	vanish(A.background);

	-- 4.�摜���J������
	deleteGraphic(G.frame1);
	deleteGraphic(G.background);
	deleteTextureFont(F.msg1);	-- �t�H���g�폜
end
