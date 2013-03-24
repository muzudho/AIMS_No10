-- �^�C�g���@�F�ނ��ł�̃R�����֐�
-- ��ҁ@�@�@�F�ނ��ł�
-- ���C�Z���X�F�C���a�r�c���C�Z���X�Ƃ��Ă��������B

--
-- 0 �` 4 �̐��������Ƃ��܂��B
-- 3 �̂Ƃ��A 2 ��������� 1 �ɂȂ�܂��B
-- 1 == rotateAdd( 0, 4, 3, 2 )
--
function rotateAdd( min, max, cur, offset )
	size = max - min + 1
	next = cur + offset
	if( next < min ) then
	  next = next + size
	end
	return next % size
end

--
-- �y�[�W�� 1�A2�A3�c�� 1 ���琔����Ƃ��A
-- 0 �` 4 �̔Ԓn���J�[�\���������Ƃ��A
-- �J�[�\���� 10�Ԓn �̃f�[�^���w���Ă���Ƃ��� 3 �y�[�W�ɂ���ƌ����܂��B
-- 3 == currentPage( 1, 4, 10 )
--
function currentPage( pageFirst, viewLast, dataCursor )
	return math.floor( dataCursor / (viewLast + 1) ) + pageFirst
end

--
-- 0 �` 4 �̔Ԓn���J�[�\���������Ƃ��A
-- 10 �̃A�C�e��������ꍇ�́A���v 2 �y�[�W �ƌ����܂��B
-- 2 == totalPage( 4, 10 )
--
function totalPage( viewLast, items )
	return math.ceil( items / (viewLast + 1) )
end
