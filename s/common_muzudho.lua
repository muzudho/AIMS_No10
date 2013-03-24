-- タイトル　：むずでょのコモン関数
-- 作者　　　：むずでょ
-- ライセンス：修正ＢＳＤライセンスとしてください。

--
-- 0 ～ 4 の数字を取るとします。
-- 3 のとき、 2 を加えると 1 になります。
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
-- ページを 1、2、3…と 1 から数えるとし、
-- 0 ～ 4 の番地をカーソルが動くとき、
-- カーソルが 10番地 のデータを指しているときは 3 ページにあると言えます。
-- 3 == currentPage( 1, 4, 10 )
--
function currentPage( pageFirst, viewLast, dataCursor )
	return math.floor( dataCursor / (viewLast + 1) ) + pageFirst
end

--
-- 0 ～ 4 の番地をカーソルが動くとき、
-- 10 のアイテムがある場合は、合計 2 ページ と言えます。
-- 2 == totalPage( 4, 10 )
--
function totalPage( viewLast, items )
	return math.ceil( items / (viewLast + 1) )
end
