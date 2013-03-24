--[[

  prototype boot.lua
  これはAIMSで新規にゲームを作成する際の
  プロトタイプとなるファイルです。
  適当に書き換えてご利用ください。

]]

-------------------------------------------
-- common呼び出し
-------------------------------------------

-- AIMSのファイルは全てprequire関数で読み込んでください。
-- ビルトインのrequireも使えますが、
-- requireではパッケージファイルの中をスキャンしてくれません。
prequire("common.lua");

-------------------------------------------
-- 定数初期化
-------------------------------------------

G = {}; -- グラフィックハンドルはこの下にぶら下げる
--【改変】追加
F = {}; -- フォントハンドルはこの下にぶら下げる
--【/改変】
S = {}; -- サウンドハンドルはこの下に略
A = {}; -- 全体から扱いたいアクターのハンドルはこの下に

-- こうやってテーブルの下に分けておくと色々楽です

-------------------------------------------
-- 共有関数呼び出し
-------------------------------------------
--ゲーム中で共有する関数をprequireします。
--【改変】追加
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
--【/改変】

-------------------------------------------
-- ゲームシーン呼び出し
-------------------------------------------
--ゲームのシーンスクリプトをprequireします。

-------------------------------------------
-- OnLoad　起動直後に呼ばれる
-------------------------------------------
function OnLoad()

end

-------------------------------------------
-- OnStart
-------------------------------------------

-- 起動直後はbootシーンが呼ばれます。
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
-- OnVanish アプリ終了直前に呼ばれる
-------------------------------------------
function OnVanish()
	deleteAllGraphic(G);	-- グラフィック削除
	deleteAllSound(S);	-- サウンド削除
end
