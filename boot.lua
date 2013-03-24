--[[

  prototype boot.lua
  �����AIMS�ŐV�K�ɃQ�[�����쐬����ۂ�
  �v���g�^�C�v�ƂȂ�t�@�C���ł��B
  �K���ɏ��������Ă����p���������B

]]

-------------------------------------------
-- common�Ăяo��
-------------------------------------------

-- AIMS�̃t�@�C���͑S��prequire�֐��œǂݍ���ł��������B
-- �r���g�C����require���g���܂����A
-- require�ł̓p�b�P�[�W�t�@�C���̒����X�L�������Ă���܂���B
prequire("common.lua");

-------------------------------------------
-- �萔������
-------------------------------------------

G = {}; -- �O���t�B�b�N�n���h���͂��̉��ɂԂ牺����
--�y���ρz�ǉ�
F = {}; -- �t�H���g�n���h���͂��̉��ɂԂ牺����
--�y/���ρz
S = {}; -- �T�E���h�n���h���͂��̉��ɗ�
A = {}; -- �S�̂��爵�������A�N�^�[�̃n���h���͂��̉���

-- ��������ăe�[�u���̉��ɕ����Ă����ƐF�X�y�ł�

-------------------------------------------
-- ���L�֐��Ăяo��
-------------------------------------------
--�Q�[�����ŋ��L����֐���prequire���܂��B
--�y���ρz�ǉ�
prequire("s/common_muzudho.lua");
prequire("s/scene/v0.lua");
prequire("s/scene/v1.lua");
prequire("s/scene/v2.lua");
prequire("s/scene/v3.lua");
prequire("s/scene/v4.lua");
prequire("s/scene/v5.lua");
prequire("s/scene/v6.lua");
prequire("s/scene/h0.lua");
prequire("s/scene/h1.lua");
prequire("s/scene/h2.lua");
prequire("s/scene/h3.lua");
prequire("s/scene/h4.lua");
prequire("s/scene/h5.lua");
prequire("s/scene/h6.lua");
prequire("s/scene/t0.lua");
prequire("s/scene/t1.lua");
prequire("s/scene/t2.lua");
prequire("s/scene/t3.lua");
prequire("s/scene/t4.lua");
prequire("s/scene/t5.lua");
prequire("s/scene/t6.lua");
prequire("s/scene/t7.lua");
prequire("s/scene/t8.lua");
prequire("s/scene/t9.lua");
--�y/���ρz

-------------------------------------------
-- �Q�[���V�[���Ăяo��
-------------------------------------------
--�Q�[���̃V�[���X�N���v�g��prequire���܂��B

-------------------------------------------
-- OnLoad�@�N������ɌĂ΂��
-------------------------------------------
function OnLoad()

end

-------------------------------------------
-- OnStart
-------------------------------------------

-- �N�������boot�V�[�����Ă΂�܂��B
function boot_OnStart()
	cls(); 
	clearLayerSettings();
end

-------------------------------------------
-- OnStep
-------------------------------------------
function boot_OnStep()
	changeScene("v0")
end
-------------------------------------------
-- OnClose
-------------------------------------------
function boot_OnClose()
	cls();
end

-------------------------------------------
-- OnVanish �A�v���I�����O�ɌĂ΂��
-------------------------------------------
function OnVanish()
	deleteAllGraphic(G);	-- �O���t�B�b�N�폜
	deleteAllSound(S);	-- �T�E���h�폜
end
