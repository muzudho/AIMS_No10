-- A.I.M.S. 用汎用関数群ファイル

--------------------------------------------------------------------------------
-- 定義定数一覧


-- addMover()で使うアクション定数

MOVER_SETANGLE=1		 	-- 方角指定
MOVER_SETSPEED=2		 	-- 速度指定
MOVER_TURN=3			 	-- 旋回
MOVER_ACCEL=4			 	-- 加減速
MOVER_SETFACE=5			 	-- キャラクタ切り替え
MOVER_SETPOSITION=6		 	-- 座標指定
MOVER_SETPOS=6			 	-- 座標指定
MOVER_SETVECTOR=7		 	-- ベクトル指定
MOVER_ADDVECTOR=8		 	-- ベクトル加算
MOVER_SETHITRADIUS=9	 	-- 当たり判定サイズ変更
MOVER_SETZOOM=10		 	-- 拡大率設定
MOVER_ADDZOOM=11		 	-- 拡大率加減算
MOVER_SETBLEND=12		 	-- 描画時のブレンド法変更
MOVER_SETALPHA=13		 	-- α値定義
MOVER_ADDALPHA=14		 	-- α値加減算
MOVER_SETIMMORTALTIME=15 	-- 無敵(壁抜け)時間の設定
MOVER_SETUNHARMFULTIME=16	-- 無害時間の設定
MOVER_VANISH=17				-- 消滅指示
MOVER_LASEREFFECTFLAG=18	-- レーザーにのみ適用可能。レーザーの根元のエフェクトの設定
MOVER_SETWAIT=19			-- 処理停止時間の設定
MOVER_SETANIMEPLAY=20		-- アニメ動作フラグ
MOVER_SETHEADING=21			-- 見た目方角指定
MOVER_TURNHEADING=22		-- 見た目旋回
MOVER_SETHEADSYNC=23		-- 見た目と移動方角の同期設定
MOVER_SETCOLOR=24			-- 色設定
MOVER_SETZ=25				-- Z値設定
MOVER_MOVETO_L=26			-- 指定座標へ移動(線形)
MOVER_MOVETO_A=27			-- 指定座標へ移動(加速)
MOVER_MOVETO_B=28			-- 指定座標へ移動(ブレーキ)
MOVER_MOVETO_C=29			-- 指定座標へ移動(両方)
MOVER_MOVETO_F=30			-- 指定座標へ移動(イージング関数使用)
MOVER_ZOOMTO_L=31			-- 指定拡大率に変化(線形)
MOVER_ZOOMTO_A=32			-- 指定拡大率に変化(加速)
MOVER_ZOOMTO_B=33			-- 指定拡大率に変化(ブレーキ)
MOVER_ZOOMTO_C=34			-- 指定拡大率に変化(両方)
MOVER_ZOOMTO_F=35			-- 指定拡大率に変化(イージング関数使用)
MOVER_INVERT_OBCHECK=36		-- 画面外判定処理をレイヤー設定と逆にする
			-- (自動消滅設定のあるレイヤーだとOFF、ないレイヤーだとON)
MOVER_LINK=37				-- リンク設定
MOVER_UNLINK=38				-- リンク設定解除
MOVER_SETVAR=39				-- 値スロットに数値を設定
MOVER_ADDVAR=40				-- 値スロットに数値を加算(減算)
MOVER_SETOBCHECK=41			-- 画面外判定処理を強制設定
MOVER_SETSPECULAR=42		-- スペキュラ色設定
MOVER_COLORTO_L=43			-- 指定RGB値に描画色をフェード(線形)
MOVER_COLORTO_A=44			-- 指定RGB値に描画色をフェード(加速)
MOVER_COLORTO_B=45			-- 指定RGB値に描画色をフェード(ブレーキ)
MOVER_COLORTO_C=46			-- 指定RGB値に描画色をフェード(両方)
MOVER_COLORTO_F=47			-- 指定RGB値に描画色をフェード(イージング関数使用)
MOVER_SPECULARTO_L=48		-- 指定RGB値にスペキュラ色をフェード(線形)
MOVER_SPECULARTO_A=49		-- 指定RGB値にスペキュラ色をフェード(加速)
MOVER_SPECULARTO_B=50		-- 指定RGB値にスペキュラ色をフェード(ブレーキ)
MOVER_SPECULARTO_C=51		-- 指定RGB値にスペキュラ色をフェード(両方)
MOVER_SPECULARTO_F=52		-- 指定RGB値にスペキュラ色をフェード(イージング関数使用)
MOVER_ALPHATO_L=53			-- 指定値にαをフェード(線形)
MOVER_ALPHATO_A=54			-- 指定値にαをフェード(加速)
MOVER_ALPHATO_B=55			-- 指定値にαをフェード(ブレーキ)
MOVER_ALPHATO_C=56			-- 指定値にαをフェード(両方)
MOVER_ALPHATO_F=57			-- 指定値にαをフェード(イージング関数)
MOVER_ROTATETO_L=58			-- 指定角度に回転(線形)
MOVER_ROTATETO_A=59			-- 指定角度に回転(加速)
MOVER_ROTATETO_B=60			-- 指定角度に回転(ブレーキ)
MOVER_ROTATETO_C=61			-- 指定角度に回転(両方)
MOVER_ROTATETO_F=62			-- 指定角度に回転(イージング関数)
MOVER_HEADTO_L=63			-- 指定の見た目角度に回転(線形)
MOVER_HEADTO_A=64			-- 指定の見た目角度に回転(加速)
MOVER_HEADTO_B=65			-- 指定の見た目角度に回転(ブレーキ)
MOVER_HEADTO_C=66			-- 指定の見た目角度に回転(両方)
MOVER_HEADTO_F=67			-- 指定の見た目角度に回転(イージング関数)

-- MOVER_CHANGEBLEND などで valueに与えるブレンディング定数

BLEND_NONE=0    	-- アルファブレンド無効
BLEND_NORMAL=1		-- 通常ブレンディング
BLEND_ADD=2     	-- 加算ブレンディング
BLEND_MUL=3     	-- 乗算ブレンディング
BLEND_REVERSE=4 	-- 反転ブレンディング

-- MOVER_SETOBCHECK で valueに与える定数
OB_DEFAULT=0		-- レイヤーの設定に従う
OB_FORCE_ON=1		-- レイヤーの設定にかかわらず画面外消滅ON
OB_FORCE_OFF=2		-- レイヤーの設定にかかわらず画面外消滅OFF
OB_INVERT=3			-- レイヤーの設定の反対（MOVER_INVERT_OBCHECKと同じ）

-- OnVanish の引数で与えられる消去原因の値

KILL_ORDERED=0		-- スクリプトorMoverで消去を指示された
KILL_ALLDELETE=1	--
KILL_OUTOFSCREEN=2	-- 画面外に出て自動消去が働いた

-- isJoyPressedの引数に与えるボタン定数

BUTTON_RIGHT = 0
BUTTON_DOWN  = 1
BUTTON_LEFT  = 2
BUTTON_UP    = 3
BUTTON_TRIG1 = 4
BUTTON_TRIG2 = 5
BUTTON_TRIG3 = 6
BUTTON_TRIG4 = 7
BUTTON_TRIG5 = 8
BUTTON_TRIG6 = 9
BUTTON_TRIG7 = 10
BUTTON_TRIG8 = 11
BUTTON_TRIG9 = 12
BUTTON_TRIG10= 13
BUTTON_TRIG11= 14
BUTTON_TRIG12= 15

MOUSE_LEFT    = 0
MOUSE_RIGHT   = 1
MOUSE_CENTER  = 2
MOUSE_BUTTON4 = 3
MOUSE_BUTTON5 = 4

-- setGraphicCenterの座標指定の対象

GCENTER_ZOOM = 0 		-- 拡大のみ
GCENTER_ROTATION = 1 	-- 回転のみ
GCENTER_BOTH = 2 		-- 両方(これが規定値)

-- mapSetWrapModeの画面外処理定義

OUTSIDE_NONE 		= 0	-- 何も描画しない
OUTSIDE_FILLWITHEND = 1	-- マップの端のチップで埋める
OUTSIDE_WRAP 		= 2	-- 反対端にループ

-- createTextActorの文字列整列方法定義

ALIGN_LEFT   = 0 -- 左寄せ。表示座標にテキストの左上を合わせる。
ALIGN_CENTER = 1 -- センタリング。表示座標にテキストの中央を合わせる。
ALIGN_RIGHT  = 2 -- 右寄せ。表示座標にテキストの右上を合わせる。

-- createTextActorの縦方向文字列整列方法定義

VALIGN_TOP		= 0; --上端揃え
VALIGN_CENTER	= 1; --センタリング
VALIGN_BOTTOM	= 2; --下端揃え

-- inkey関数用キーコード

DIK_ESCAPE		= 1;
DIK_1			= 2;
DIK_2			= 3;
DIK_3			= 4;
DIK_4			= 5;
DIK_5			= 6;
DIK_6			= 7;
DIK_7			= 8;
DIK_8			= 9;
DIK_9			= 10;
DIK_0			= 11;
DIK_MINUS		= 12;
DIK_EQUALS		= 13;
DIK_BACK		= 14;
DIK_TAB			= 15;
DIK_Q			= 16;
DIK_W			= 17;
DIK_E			= 18;
DIK_R			= 19;
DIK_T			= 20;
DIK_Y			= 21;
DIK_U			= 22;
DIK_I			= 23;
DIK_O			= 24;
DIK_P			= 25;
DIK_LBRACKET	= 26;
DIK_RBRACKET	= 27;
DIK_RETURN		= 28;
DIK_LCONTROL	= 29;
DIK_A			= 30;
DIK_S			= 31;
DIK_D			= 32;
DIK_F			= 33;
DIK_G			= 34;
DIK_H			= 35;
DIK_J			= 36;
DIK_K			= 37;
DIK_L			= 38;
DIK_SEMICOLON	= 39;
DIK_APOSTROPHE	= 40;
DIK_GRAVE		= 41;
DIK_LSHIFT		= 42;
DIK_BACKSLASH	= 43;
DIK_Z			= 44;
DIK_X			= 45;
DIK_C			= 46;
DIK_V			= 47;
DIK_B			= 48;
DIK_N			= 49;
DIK_M			= 50;
DIK_COMMA		= 51;
DIK_PERIOD		= 52;
DIK_SLASH		= 53;
DIK_RSHIFT		= 54;
DIK_MULTIPLY	= 55;
DIK_LMENU		= 56;
DIK_SPACE		= 57;
DIK_CAPITAL		= 58;
DIK_F1			= 59;
DIK_F2			= 60;
DIK_F3			= 61;
DIK_F4			= 62;
DIK_F5			= 63;
DIK_F6			= 64;
DIK_F7			= 65;
DIK_F8			= 66;
DIK_F9			= 67;
DIK_F10			= 68;
DIK_NUMLOCK		= 69;
DIK_SCROLL		= 70;
DIK_NUMPAD7		= 71;
DIK_NUMPAD8		= 72;
DIK_NUMPAD9		= 73;
DIK_SUBTRACT	= 74;
DIK_NUMPAD4		= 75;
DIK_NUMPAD5		= 76;
DIK_NUMPAD6		= 77;
DIK_ADD			= 78;
DIK_NUMPAD1		= 79;
DIK_NUMPAD2		= 80;
DIK_NUMPAD3		= 81;
DIK_NUMPAD0		= 82;
DIK_DECIMAL		= 83;
DIK_OEM_102		= 86;
DIK_F11			= 87;
DIK_F12			= 88;
DIK_F13			= 100;
DIK_F14			= 101;
DIK_F15			= 102;
DIK_KANA		= 112;
DIK_ABNT_C1		= 115;
DIK_CONVERT		= 121;
DIK_NOCONVERT	= 123;
DIK_YEN			= 125;
DIK_ABNT_C2		= 126;
DIK_NUMPADEQUALS = 141;
DIK_PREVTRACK	= 144;
DIK_AT			= 145;
DIK_COLON		= 146;
DIK_UNDERLINE	= 147;
DIK_KANJI		= 148;
DIK_STOP		= 149;
DIK_AX			= 150;
DIK_UNLABELED	= 151;
DIK_NEXTTRACK	= 153;
DIK_NUMPADENTER	= 156;
DIK_RCONTROL	= 157;
DIK_MUTE		= 160;
DIK_CALCULATOR	= 161;
DIK_PLAYPAUSE	= 162;
DIK_MEDIASTOP	= 164;
DIK_VOLUMEDOWN	= 174;
DIK_VOLUMEUP	= 176;
DIK_WEBHOME		= 178;
DIK_NUMPADCOMMA	= 179;
DIK_DIVIDE		= 181;
DIK_SYSRQ		= 183;
DIK_RMENU		= 184;
DIK_PAUSE		= 197;
DIK_HOME		= 199;
DIK_UP			= 200;
DIK_PRIOR		= 201;
DIK_LEFT		= 203;
DIK_RIGHT		= 205;
DIK_END			= 207;
DIK_DOWN		= 208;
DIK_NEXT		= 209;
DIK_INSERT		= 210;
DIK_DELETE		= 211;
DIK_LWIN		= 219;
DIK_RWIN		= 220;
DIK_APPS		= 221;
DIK_POWER		= 222;
DIK_SLEEP		= 223;
DIK_WAKE		= 227;
DIK_WEBSEARCH	= 229;
DIK_WEBFAVORITES = 230;
DIK_WEBREFRESH	= 231;
DIK_WEBSTOP		= 232;
DIK_WEBFORWARD	= 233;
DIK_WEBBACK		= 234;
DIK_MYCOMPUTER	= 235;
DIK_MAIL		= 236;
DIK_MEDIASELECT	= 237;

--
-- 別名定義。
--

DIK_BACKSPACE	= DIK_BACK;
DIK_NUMPADSTAR	= DIK_MULTIPLY;
DIK_LALT		= DIK_LMENU;
DIK_CAPSLOCK	= DIK_CAPITAL;
DIK_NUMPADMINUS	= DIK_SUBTRACT;
DIK_NUMPADPLUS	= DIK_ADD;
DIK_NUMPADPERIOD = DIK_DECIMAL;
DIK_NUMPADSLASH	= DIK_DIVIDE;
DIK_RALT		= DIK_RMENU;
DIK_UPARROW		= DIK_UP;
DIK_PGUP		= DIK_PRIOR;
DIK_LEFTARROW	= DIK_LEFT;
DIK_RIGHTARROW	= DIK_RIGHT;
DIK_DOWNARROW	= DIK_DOWN;
DIK_PGDN		= DIK_NEXT;


--------------------------------------------------------------------------------
--[[定義関数一覧

	リソース関連
setLayerSetting(layer_params)
setGraphicAnimeLoop (himages,delay,looppoint)
setGraphicAnimeSequence (himages,delay)
deleteAllGraphic(g)
setAllGraphicHit(g,a,b,c,d)
deleteAllSound(s)
stopSounds(s)

	Actorの(ang,speed)-Vectorの変換命令
makevector(ang,spd)
getFromVector(actor)
getAngleFromVector(actor)
getSpeedFromVector(actor)

	Actor動作
inbound(uID,x,y,wid,hei)
inbound2(uID,x,y,x2,y2)
move_invprop(px,py,a,limit)
move_invprop_id(uID,px,py,a,limit)
rotateTo(angle,delta)

	ある座標からある座標を狙う場合の数値計算
aimNPlayerX(X1,Y1,X2,Y2)
aimStoP(x,y)
distPtoP(x1,y1,x2,y2)
distStoP(x,y)

	パッド入力検出
ojInit()
ojStep()
ojGet(id)

	あるActorを中心に対称Actorを回転させる命令　取得にはaimやdistを使う
setAltPosLotDeg(uidMaster,uidSlave,x,y)
setAltPosLotVec(uidMaster,uidSlave,x,y)
setAltPos(uidMaster,uidSlave,x,y)

	ステージ制御関連
HideTimerGauge()
wait(n)
inKey()

	Actorの残像を作成
createAura(time,startAlpha,Blend,layer)

]]
--------------------------------------------------------------------------------



-- 以下ユーティリティ関数

----------------------------------------
--
----------------------------------------

function setLayerSetting(layer_params)
 local i,p
 for i=0,11,1 do
  p=i*4+1
  setLayerAutoVanish(i,layer_params[p])
  setLayerUseFastDraw(i,layer_params[p+1])
  if layer_params[p+1]==true then
   setLayerUseAutoYSort(i,layer_params[p+2])
   setLayerGraphicForFastDraw(i,layer_params[p+3])
  end
 end
end

function setGraphicAnimeLoop (himages,delay,looppoint)
  if(type(himages) ~= "table") then
	error("setGraphicAnimeLoop:第一引数はテーブルでなければなりません。",2);
  end
  local i=0
  for i=1,#(himages),1 do
    if i==(#(himages)) then
      setGraphicAnime(himages[i],himages[looppoint],delay)
    else
      setGraphicAnime(himages[i],himages[i+1],delay)
    end
  end
  return himages[1]
end

function setGraphicAnimeSequence (himages,delay)
  if(type(himages) ~= "table") then
	error("setGraphicAnimeLoop:第一引数はテーブルでなければなりません。",2);
  end
  local i=0
  for i=1,#(himages),1 do
    if i==(#(himages)) then
      setGraphicAnime(himages[i],-1,delay)
    else
      setGraphicAnime(himages[i],himages[i+1],delay)
    end
  end
  return himages[1]
end

--
-- テーブル g 内の画像を全消去。
--
function deleteAllGraphic(g)
  local hchip;
  if(g==nil)then
    return;
  end
  
  for index, hchip in pairs(g) do
    if(type (hchip) == "table") then
      deleteAllGraphic(hchip)
    else --if(type (hchip) == "number") then
      deleteGraphic(hchip)
    end
  end
end

function safe_vanish(a)
	if(a==nil)then
		_dm("actor not found.");
		_dm(debug.traceback());
		return false;
	end
	if(isAlive(a))then vanish(a); end
end

function vanish_table(g)
  if(g==nil)then
    g = {};
    return;
  end
  
  for index, a in pairs(g) do
    if(type (a) == "table") then
      vanish_table(a)
    else
      safe_vanish(a);
    end
  end
  g = {};
end

--
-- テーブル g 内のグラフィックの当たり判定を一括設定
--
function setAllGraphicHit(g,a,b,c,d)
	if type(g) == "table" then
		for index, hchip in pairs(g) do
			if(type (hchip) == "table") then
				setAllGraphicHit(hchip,a,b,c,d);
			else
				addGraphicHit(hchip,a,b,c,d);
			end
		end
		g = {};
	end
end

--
-- テーブル g 内のグラフィックの当たり判定をそのグラフィック全体に一括設定
--
function setAllGraphicHitClip(g)
	if type(g) == "table" then
		for index, hchip in pairs(g) do
			if(type (hchip) == "table") then
				setAllGraphicHitClip(hchip);
			else
				local a,b,c,d = getGraphicClipRect(hchip)
				addGraphicHit(hchip,0,0,c-1,d-1);
			end
		end
		g = {};
	end
end

function setAllGraphicCenter(g,x,y)
	if type(g) == "table" then
		for index, hchip in pairs(g) do
			if(type (hchip) == "table") then
				setAllGraphicCenter(hchip,x,y);
			else
				local a,b,c,d = getGraphicClipRect(hchip)
				local w = c*x;
				local h = d*y;
				if(x==1)then w=w-1; end
				if(y==1)then h=h-1; end
				setGraphicCenter(hchip,w,h);
			end
		end
		g = {};
	end
end

function setAllGraphicCenterAbs(g,x,y)
	if type(g) == "table" then
		for index, hchip in pairs(g) do
			if(type (hchip) == "table") then
				setAllGraphicCenterAbs(hchip,x,y);
			else
				local a,b,c,d = getGraphicClipRect(hchip)
				setGraphicCenter(hchip,x,y);
			end
		end
		g = {};
	end
end

--
-- テーブル s 内の音声を全消去。
--
function deleteAllSound(s)
	if type(s) == "table" then
		for index, hchip in pairs(s) do
			if(type (hchip) == "table") then
				deleteAllSound(hchip)
			else
				deleteSound(hchip)
			end
		end
		s = {};
	end
end

function stopSounds(s)
	if type(s) == "table" then
		for index, hchip in pairs(s) do
			if(type (hchip) == "table") then
				stopSounds(hchip)
			else
				stopSound(hchip)
			end
		end
	end
end

function deleteAllBMEffect(g)
  local hchip;
  if(g==nil)then
    return;
  end
  
  for index, hchip in pairs(g) do
    if(type (hchip) == "table") then
      deleteAllBMEffect(hchip)
    else --if(type (hchip) == "number") then
      deleteBMEffect(hchip)
    end
  end
end

--
-- ang,spdからベクトル生成。戻り値2個。
--
function makevector(ang,spd)
  local x,y
  x=math.cos(math.rad(ang))*spd
  y=math.sin(math.rad(ang))*spd
  return x,y
end

--
-- ベクトルからang,spdを取得
-- 存在しない場合はnilが返るお
--
function getFromVector(actor)
  if actor == nil then  actor = iSelf()  end
  if isAlive(actor) == false then  return nil  end

  local vx, vy, ang, spd
  vx=getVX(actor)
  vy=getVY(actor)

  -- 角度取得
  ang=math.deg(math.atan(vy/vx))
  if vx < 0 and vy > 0 then  ang = ang + 180  end	-- 第2象限
  if vx < 0 and vy <= 0 then  ang = ang + 180  end	-- 第3象限
  if vx >= 0 and vy < 0 then  ang = ang + 360  end	-- 第4象限

  -- 速度取得
  spd = math.sqrt((vx*vx) + (vy*vy))

  return ang,spd
end

function getAngleFromVector(actor)
  if actor == nil then  actor = iSelf()  end

  local ang,spd = getFromVector(actor)
  return ang
end

function getSpeedFromVector(actor)
  if actor == nil then  actor = iSelf()  end

  local ang,spd = getFromVector(actor)
  return spd
end

--

function inbound(uID,x,y,wid,hei)
  local px=getX(uID)
  local py=getY(uID)

  if(px<x) then
    return false
  end
  if(px>x+wid) then
    return false
  end
  if(py<y) then
    return false
  end
  if(py>y+hei) then
    return false
  end
  return true
end

function inbound2(uID,x,y,x2,y2)
  local px=getX(uID)
  local py=getY(uID)

  if(px<x) then
    return false
  end
  if(px>x2) then
    return false
  end
  if(py<y) then
    return false
  end
  if(py>y2) then
    return false
  end
  return true
end

function rotateTo(angle,delta)
  local dl=0
  local dr=0
  local ret=false

  dl=angle-getAngle()
  if dl<0 then
    dl=0-dl
    dr=360-dl
    if (dl>dr and dr<=delta) or (dl<dr and dl<=delta) then
      --1フレームで届くなら書き換え、ダメなら回転
      setAngle(angle)
      ret=true
    else
      if dr<dl then
        turn(delta)
      else
        turn(-delta)
      end
    end
  else
    dr=360-dl
    if (dl>dr and dr<=delta) or (dl<dr and dl<=delta) then
      --1フレームで届くなら書き換え、ダメなら回転
      setAngle(angle)
      ret=true
    else
      if dr>dl then
        turn(delta)
      else
        turn(-delta)
      end
    end
  end
  return ret
end

--引数を4つ取る型。4つの引数からaimする。
function aimPtoP(X1,Y1,X2,Y2)
  local AimRad = -math.atan2(X2 - X1 , Y2 - Y1)
  return math.deg(AimRad)+90
end

function aimStoP(x,y)
  return aimPtoP(getX(),getY(),x,y)
end

function distPtoP(x1,y1,x2,y2)
  return math.sqrt(math.pow(x2-x1,2)+math.pow(y2-y1,2))
end

-- 呼び出し元キャラから指定地点への距離を返す。

function distStoP(x,y)
  return distPtoP(getX(),getY(),x,y)
end



function _common_OnLoad()
end

function _common_OnVanish()
end

function debugString(str, printable)
	if(printable==nil)then printable = true end
	debugOut(tostring( str ), printable);
end

function dm(str, printable)
	debugString(str, printable);
end

--------------------------------------------------------------------------------
-- wait(n)
--------------------------------------------------------------------------------

-- スレッドルーチン内で、一定時間idleする
-- startThread("functionname") によって起動される関数内で使用する事
-- 引数：1
	-- n : 待機時間(frame)
-- 返値：0


function wait(n)
	for i = 1,n,1 do
		coroutine.yield()
	end
end

--------------------------------------------------------------------------------
-- printnode(n)
--------------------------------------------------------------------------------

-- nに指定したテーブルを丸々debugOutする。

function printnode(n, indent)
	--_dm(debug.traceback());

	if(indent == nil)then
		indent = 0;
	end
	if indent == 0 then
		debugOut("printnode: {");
	end
	if type(n) == "table" then
		for k , v in pairs(n) do
			if(type (v) == "table") then
				debugOut(string.rep("　", indent)..k.." = {");
				printnode(v, indent+2);
				debugOut(string.rep("　", indent).."}");
			elseif type(v) == "string" then
				debugOut(string.rep("　", indent)..k.." = \""..v.."\"");
			else
				debugOut(string.rep("　", indent)..k.." = "..tostring(v));
			end
		end
	elseif(type(n)=="string")then
		debugOut(n);
	elseif(type(n)=="boolean")then
		debugOut("boolean:"..tostring(n));
	elseif(type(n)=="number")then
		debugOut("number:"..tostring(n));
	else
		debugOut("Error : "..type(n));
	end
	if indent == 0 then
		debugOut("}");
	end
end

function getnode(n, indent)
	local str = "";

	if(indent == nil)then
		indent = 0;
	end
	if indent == 0 then
		str = str..("getnode: {");
	end
	if type(n) == "table" then
		for k , v in pairs(n) do
			if(type (v) == "table") then
				str = str..(string.rep("　", indent)..k.." = {");
				str = str..getnode(v, indent+2);
				str = str..(string.rep("　", indent).."}");
			elseif type(v) == "string" then
				str = str..(string.rep("　", indent)..k.." = \""..v.."\"");
			else
				str = str..(string.rep("　", indent)..k.." = "..tostring(v));
			end
		end
	elseif(type(n)=="string")then
		str = str..(n);
	else
		str = str..("Error : "..type(n));
	end
	if indent == 0 then
		str = str..("}");
	end

	return str;
end


--------------------------------------------------------------------------------
-- serialize(n)
--------------------------------------------------------------------------------

-- nに指定したテーブルを丸々ひとつの文章にする。

function serialize(n, indent)
	if(n == nil)then
		return nil;
	end
	if(type(n) ~= "table")then
		return n;
	end

	local rtn = "";
	local table_code = "";
	local stack = {};
	if(indent == nil)then
		rtn = "N={};";
		table_code = "N";
	else
		rtn = indent.."={};";
		table_code = indent;
	end

	if type(n) == "table" then
		for k , v in pairs(n) do
			if(type (v) == "table") then
				-- テーブルなのでスタックして後で処理する

				-- 添え字が数字外かチェック
				if type(k) == "string" then
					k = "\""..k.."\"";
				end
				k = table_code .. "["..k.."]";
				table.insert(stack, {value=v, index=k});
			else
				-- 添え字があるなら準備する
				if k ~= nil then
					if type(k) == "string" then
						k = "\""..k.."\"";
					end
					rtn = rtn .. table_code .. "["..k.."]=";
				end

				-- 実際の値を記述
				if type(v) == "string" then
					v = string.format('%q', v);
				elseif type(v) == "boolean" then
					--_dm("serialize boolean");
					v = tostring(v);
				elseif type(v) == "function" then
					--_dm("serialize function");
					v="";
					--v = tostring(v);
				end
				rtn = rtn .. v .. ";";
			end
		end
	end

	-- スタックしておいたテーブルを順番に処理していく
	for i=1,#stack,1 do
		rtn = rtn .. serialize(stack[i].value, stack[i].index);
	end

	-- 展開したデータを戻すためのreturnを記載
	if(indent == nil)then
		rtn = rtn.."return N;";
	end

	return rtn;
end

function deserialize(n)
	result, res = pcall(_deserialize, n);
	--_dp("result:"..tostring(result).."\n");
	--_dp("res:"..tostring(res).."\n");
	
	if(not result)then
		return "";
	elseif(not res)then
		return "";
	else
		return res;
	end
end

function _deserialize(n)
	if(n == nil)then
		return false;
	end

	return assert(loadstring(n))();
end

function type2byte(n)
	local nt = type(n);
	if(nt ~= "string")then
		return nt;
	end
	
	nt = string.gsub(n, "[%w%c%p]", "");
	if(nt == "")then
		return "string";
	else
		return "mbyte";
	end
end

-- パッケージの正当性を返す関数
function isPackageCheck(file, mtime, md5)
	if(_DEBUG)then
		return true;
	end
	
	if(type(file)~="string")then
		return false;
	end
	if(type(mtime)~="number")then
		mtime = os.time();
	end
	if(type(md5)~="string")then
		md5 = "";
	end
	
	-- パッケージの正当性検証
	local create, modify, access = getFileTimeStamp(file);
	if(mtime ~= modify)then
		-- ファイルがタイムスタンプと異なるので調査する
		local c = md5file(file):upper();
		if(c:upper() ~= md5:upper())then
			return false, nil, nil;
		end
	end
	return true, modify, c;
end


--------------------------------------------------------------------------------
-- trig = getTrigID()
--------------------------------------------------------------------------------

-- 押されたボタンのIDに対応した文字列を返す。
_TRIG = {
		{ BUTTON_UP,	"up"	};
		{ BUTTON_DOWN,	"down"	};
		{ BUTTON_LEFT,	"left"	};
		{ BUTTON_RIGHT,	"right"	};
		{ BUTTON_TRIG1,	"trig1"	};
		{ BUTTON_TRIG2,	"trig2"	};
		{ BUTTON_TRIG3,	"trig3"	};
-- 【改変】追加。ここから。
		{ BUTTON_TRIG4,	"trig4"	}; --Y
		{ BUTTON_TRIG5,	"trig5"	}; --L
		{ BUTTON_TRIG6,	"trig6"	}; --R
		{ BUTTON_TRIG7,	"trig7"	}; --S
		{ BUTTON_TRIG8,	"trig8"	}; --P
-- 【/改変】追加。ここまで。
}
function getTrigID(PadID)
	if( PadID == nil )then
		PadID = 0;
	end

	for i=1,#(_TRIG) do
		if( getJoyPressCount(PadID, _TRIG[i][1]) == 1 )then
			return _TRIG[i][2];
		end
	end

	return nil;

end

--------------------------------------------------------------------------------
-- rtrim / ltrim / trim
--------------------------------------------------------------------------------

function rtrim(str)
	if( type(str) ~= "string" )then
		return str;
	end
	
	local t = str:sub(-1);
	local bt = str:sub(-2,-2);
	if(not isSJISLeadByte(bt) and string.match(t, "[%c \r\n\t\v]")~=nil)then
		return rtrim( str:sub(1,-2) );
	end
	return str;
end

function ltrim(str)
	if( type(str) ~= "string" )then
		return str;
	end
	local t = str:sub(1,1);
	if(string.match(t, "[%c \r\n\t\v]")~=nil)then
		return ltrim( str:sub(2,-1) );
	end
	return str;
end

function trim(str)
	local s = ltrim(rtrim(str));
	return s;
end

--デバッグ用関数。文字列のバイト表現をデバッグに返す
function string_dump(prefix,target)
	if(type(target) ~= "string" )then 
		_dm( prefix.. " : " .. target .. "は文字列ではありません" );
		return 
	end
	local out = ""
	for i=1,#target do
		out = out .. string.format("%x, ",string.byte(target,i));
	end
	out = out .. "[EOT]";
	_dm( prefix.. " : " .. out );
end

function isSJISLeadByte(char)
	local i = string.byte(char);
	if(i==nil)then
		return false;
	end
	return( i>=0x81 and i<=0x9f ) or (i>=0xe0 and i<=0xef);
end


------------------------------------------------------------------------
-- 9Patchサポート
------------------------------------------------------------------------

--元画像 g から、下記のように9patch画像を切り出す。
--x,y が画像の左上座標
--w1,w2,w3はそれぞれ左端幅、w2が中央の幅、w3が右端幅
--h1,h2,h3はそれぞれ上端高さ、w2が中央の高さ、w3が下端高さ
--戻り値はdraw9Patchなどで使えるテーブル。

function cut9PatchGraphic(g,x,y,w1,w2,w3,h1,h2,h3)
	local t = {};

	t[1] = cutGraphic( g, x      , y, w1, h1 );
	t[2] = cutGraphic( g, x+w1   , y, w2, h1 );
	t[3] = cutGraphic( g, x+w1+w2, y, w3, h1 );
		
	t[4] = cutGraphic( g, x      , y+h1, w1, h2);
	t[5] = cutGraphic( g, x+w1   , y+h1, w2, h2);
	t[6] = cutGraphic( g, x+w1+w2, y+h1, w3, h2);
	
	t[7] = cutGraphic( g, x      , y+h1+h2, w1, h3);
	t[8] = cutGraphic( g, x+w1   , y+h1+h2, w2, h3);
	t[9] = cutGraphic( g, x+w1+w2, y+h1+h2, w3, h3);
	
	return t;
end

--元画像 g から、下記のように9patch画像を切り出す
--x,y,w,hは9patch画像の全体を指す左上座標とサイズ。
--w_left,h_topで左上部分の幅、高さを、
--w_right,h_bottomで右下部分の幅、高さを指定。
function cut9PatchGraphic2(g,x,y,w,h,w_left,h_top,w_right,h_bottom)
	local w1,w2,w3,h1,h2,h3 
		= w_left, w-w_left-w_right, w_right,
		  h_top, h-h_top-h_bottom, h_bottom;

	
	return cut9PatchGraphic(g,x,y,w1,w2,w3,h1,h2,h3);
end

-- アクターに9patch用の画像を割り当てる。
-- テーブルで指定。cut9PatchGraphicで作ったテーブルがそのまま使える
-- VAR[64]の指定はセルフサービス
function set9patchGraphic(hActor,tbl)
	setv(hActor,65,tbl[1]);
	setv(hActor,66,tbl[2]);
	setv(hActor,67,tbl[3]);
	setv(hActor,68,tbl[4]);
	addMover(hActor,-1,1,MOVER_SETFACE,tbl[5]);
	setv(hActor,69,tbl[6]);
	setv(hActor,70,tbl[7]);
	setv(hActor,71,tbl[8]);
	setv(hActor,72,tbl[9]);
end


------------------------------------------------------------------------
-- MOVER_***TO_Fで使うイージング関数 ※jQueryの関数を元に作成
------------------------------------------------------------------------
-- イージング関数の引数について
-- x = 経過時間(0～1の実数に正規化したもの、0=開始時、1=終了時)
-- t = 経過時間(単位ミリ秒、1000msec=60フレーム)
-- b = 初期値(与えられるのは０固定)
-- c = 目標値(与えられるのは１固定)
-- d = イージングの長さ（MOVERの継続時間、ミリ秒の単位で渡す）

function easeInBounce (x, t, b, c, d)
	return c - easeOutBounce (x, d-t, 0, c, d) + b;
end

function easeOutBounce(x,t,b,c,d)
	t= t/d;
	if ((t) < (1/2.75)) then
		return c*(7.5625*t*t) + b;
	elseif (t < (2/2.75)) then
		t=t-(1.5/2.75);
		return c*(7.5625*t*t + .75) + b;
	elseif (t < (2.5/2.75)) then
		t=t-(2.25/2.75);
		return c*(7.5625*t*t + .9375) + b;
	else
		t=t-(2.625/2.75);
		return c*(7.5625*t*t + .984375) + b;
	end
end

function easeInOutBounce(x,t,b,c,d)
	if (t < d/2) then return easeInBounce (x, t*2, 0, c, d) * .5 + b; end
	return easeOutBounce (x, t*2-d, 0, c, d) * .5 + c*.5 + b;
end

function easeInBack(x,t,b,c,d,s)
	if (s == nil) then s = 1.70158; end
	t=t/d
	return c*t*t*((s+1)*t - s) + b;
end

function easeOutBack(x,t,b,c,d,s)
	if (s == nil) then s = 1.70158; end
	t=t/d-1;
	return c*(t*t*((s+1)*t + s) + 1) + b;
end

function easeInOutBack(x,t,b,c,d,s)
	if (s == nil) then s = 1.70158; end 
	t=t/(d/2);
	s=s*(1.525);
	if (t < 1) then return c/2*(t*t*((s+1)*t - s)) + b; end
	t=t-2;
	return c/2*(t*t*((s+1)*t + s) + 2) + b;
end

function easeInCirc(x,t,b,c,d)
	t=t/d;
	return -c * (math.sqrt(1 - t*t) - 1) + b;
end

function easeOutCirc(x,t,b,c,d)
	t=t/d-1;
	return c * math.sqrt(1 - t*t) + b;
end

function easeInOutCirc(x,t,b,c,d)
	t=t/(d/2);
	if (t < 1) then return -c/2 * (math.sqrt(1 - t*t) - 1) + b; end
	t=t-2;
	return c/2 * (math.sqrt(1 - t*t) + 1) + b;
end

function easeInElastic(x,t,b,c,d)
	local s,p,a=1.70158,0,c;
	if (t==0) then return b; end
	t=t/d;
	if (t==1) then return b+c; end
	if (p==0) then p=d*0.3; end
	if (a < math.abs(c)) then
		a=c;
		s=p/4;
	else 
		s = p/(2*math.pi) * math.asin (c/a);
	end
	t=t-1;
	return -(a*math.pow(2,10*t) * math.sin( (t*d-s)*(2*math.pi)/p )) + b;	
end

function easeOutElastic(x,t,b,c,d)
	local s,p,a=1.70158,0,c;
	if (t==0) then return b; end
	t=t/d;
	if (t==1) then return b+c; end
	if (p==0) then p=d*0.3; end
	if (a < Math.abs(c)) then
		a=c; 
		s=p/4;
	else 
		s = p/(2*math.pi) * math.asin (c/a);
	end
	return a*math.pow(2,-10*t) * math.sin( (t*d-s)*(2*math.pi)/p ) + c + b;
end

function easeInOutElastic(x,t,b,c,d)
	local s,p,a=1.70158,0,c;
	if (t==0) then return b; end
	t=t/(d/2);
	if (t==2) then return b+c; end
	if (p==0) then p=d*(0.3*1.5); end
	if (a < math.abs(c)) then
		a=c; 
		s=p/4;
	else 
		s = p/(2*math.pi) * math.asin (c/a);
	end
	if (t < 1) then 
		t=t-1;
		return -0.5*(a*math.pow(2,10*t) * math.sin( (t*d-s)*(2*math.pi)/p )) + b;
	end
	t=t-1;
	return a*math.pow(2,-10*t) * math.sin( (t*d-s)*(2*math.pi)/p )*0.5 + c + b;
end

function easeInExpo(x,t,b,c,d)
	if (t==0) then return b; else return c * math.pow(2, 10 * (t/d - 1)) + b; end
end

function easeOutExpo(x,t,b,c,d)
	if (t==d) then return b+c; else return c * (-math.pow(2, -10 * t/d) + 1) + b; end
end

function easeInOutExpo(x,t,b,c,d)
	if (t==0) then return b; end
	if (t==d) then return b+c; end
	t=t/(d/2);
	if (t < 1) then return c/2 * math.pow(2, 10 * (t - 1)) + b; end
	return c/2 * (-math.pow(2, -10 * (t-1)) + 2) + b;
end

function easeInSine(x,t,b,c,d)
	return -c * math.cos(t/d * (math.pi/2)) + c + b;
end

function easeOutSine(x,t,b,c,d)
	return c * math.sin(t/d * (math.pi/2)) + b;
end

function easeInOutSine(x,t,b,c,d)
	return -c/2 * (math.cos(math.pi*t/d) - 1) + b;
end

function easeInQuint(x,t,b,c,d)
	t=t/d;
	return c*t*t*t*t*t + b;
end

function easeOutQuint(x,t,b,c,d)
	t=t/d-1;
	return c*(t*t*t*t*t + 1) + b;
end

function easeInOutQuint(x,t,b,c,d)
	t=t/(d/2);
	if (t < 1) then return c/2*t*t*t*t*t + b; end
	t=t-2;
	return c/2*(t*t*t*t*t + 2) + b;
end

function easeInQuart(x,t,b,c,d)
	t=t/d;
	return c*t*t*t*t + b;
end

function easeOutQuart(x,t,b,c,d)
	t=t/d-1;
	return -c * (t*t*t*t - 1) + b;
end

function easeInOutQuart(x,t,b,c,d)
	t=t/(d/2);
	if (t < 1) then return c/2*t*t*t*t + b; end
	t=t-2;
	return -c/2 * (t*t*t*t - 2) + b;
end

function easeInCubic(x,t,b,c,d)
	t=t/d;
	return c*t*t*t + b;
end

function easeOutCubic(x,t,b,c,d)
	t=t/d-1;
	return -c * (t*t*t - 1) + b;
end

function easeInOutCubic(x,t,b,c,d)
	t=t/(d/2);
	if (t < 1) then return c/2*t*t*t + b; end
	t=t-2;
	return -c/2 * (t*t*t - 2) + b;
end

function easeInQuad(x,t,b,c,d)
	t=t/d;
	return c*t*t + b;
end

function easeOutQuad(x,t,b,c,d)
	t=t/d;
	return -c * t*(t-2) + b;
end

function easeInOutQuad(x,t,b,c,d)
	t=t/(d/2);
	if (t < 1) then return c/2*t*t + b; end
	t=t-1;
	return -c/2 * (t*(t-2) - 1) + b;
end

function easeLinear(x,t,b,c,d)
	return b+(c-b)*(t/d);
end
