

if t == nil then
	t={}
end
t['东方头条_首页']={{613,78,0xffffff}, {621,78,0xf54b50}, {558,76,0xf54b50}, {4,81,0xf54b50}, {602,163,0x222222}, }
	t['东方头条_首页_新闻_x']={ 0xffffff, "85|2|0xc3c3c3,79|-5|0xc3c3c3,87|-5|0xffffff,92|-5|0xc3c3c3,92|8|0xc3c3c3", 90, 285, 370, 618, 1014}

t['东方头条_文章页面']={{597,1092,0xf7514c}, {546,1086,0xf7524b}, {555,1086,0xffffff}, {200,1109,0xe8e8e8}, }
	t['东方头条_文章页面_生产金币']={ 0xfff159, "4|12|0xe63302", 90, 514, 898, 583, 962}
	t['东方头条_文章页面_点一点']={ 0xfddb00, "2|31|0xff4f41,7|15|0xffb200", 90, 448, 37, 630, 130 } --多点找色
	
t['东方头条_任务界面']={{582,1087,0xf44b50}, {572,1071,0xf44b50}, {572,1064,0xffffff}, {559,1059,0xf44b50}, }
	t['东方头条_任务界面_立即签到']={ 0xf54b50, "-1|-19|0xf54b50,-3|-1|0xfff8f9,24|17|0xf54b50", 90, 442, 307, 565, 346}
	t['东方头条_任务界面_签到成功']={ 0xcccccc, "-57|390|0xfb5446,-359|394|0xfa5347,-289|52|0xfff17a", 90, 82, 289, 555, 787}
	t['东方头条_任务界面_放弃']={{239,615,0x999999}, {356,614,0xf54b50}, {436,447,0xffffff}, }
	t['东方头条_任务界面_金币成熟']={{553,226,0xf76b40}, {555,226,0xffde05}, {559,226,0xf54b50}, {565,224,0xfedb08}, {566,224,0xf54b50}, }
	t['东方头条_任务界面_金币已经领取']={{549,186,0xffffff}, {549,192,0xffd566}, {487,852,0xe7e7e7}, }
	t['东方头条_任务界面_继续赚金币']={ 0xff8f3d, "1|-24|0xff8f3d,-60|-22|0xff8f3d,-18|19|0xff8f3d", 90, 398, 287, 596, 369}
	t['东方头条_任务界面_我知道了']={ 0xf54b50, "129|-21|0xf54b50,-128|-21|0xf54b50,-3|-55|0xf54b50,1|-379|0xffd715", 90, 110, 272, 535, 809 } --多点找色
	t['东方头条_任务界面_金币已经成熟']={ 0xff8f3d, "-200|2|0xff8f3d,-31|-28|0xff8f3d,112|34|0xff8f3d,12|-669|0xffe177", 90, 44, 141, 604, 941 } --多点找色
	t['东方头条_任务界面_关闭金币邀请']={ 0xfffffe, "-228|728|0xf54b50,-415|694|0xf54b50,-39|696|0xf54b50,-236|672|0xf54b50", 90, 49, 128, 589, 946 } --多点找色

t['东方头条_个人中心界面']={ 0xfe5e61, "132|15|0xff6f00,319|-8|0x03adff,478|7|0xfeb40b", 90, 40, 279, 625, 409 } --多点找色

t['东方头条_back']={ 0x444444, "-1|-13|0xffffff,-1|-26|0x444444,-14|-14|0x444444", 90, 15, 49, 75, 121}
t['东方头条_弹窗_x']={ 0xdcdcdc, "-146|-180|0xffb01d,154|-177|0xfe7c0c,-16|-351|0xfc4441,1|-259|0xffffff", 90, 94, 273, 550, 1012 } --多点找色
t['东方头条_弹窗_取消']={ 0x007aff, "300|-11|0x007aff,304|-31|0xf9f6f6", 90, 102, 613, 516, 679 } --多点找色
t['东方头条_弹窗_大红包']={{320,964,0xffffff},{262,777,0xd32c34},{489,692,0xdb3438},{220,367,0xffffff},}  --多点取色
t['东方头条_弹窗_新人专享']={ 0xdcdcdc, "-34|-156|0xdb342f,41|-284|0xf7cb4d,129|-491|0xffefa6", 90, 230, 330, 585, 1053 } --多点找色
t['东方头条_弹窗_现金福利红包']={ 0xdcdcdc, "-13|-13|0xdcdcdc,1|-33|0xb3b3b3", 90, 271, 917, 370, 1006 } --多点找色
t['东方头条_弹窗_要闻推送忽略']={ 0x999999, "232|-3|0xf54b50,-57|-420|0xf44b50", 90, 87, 268, 576, 815 } --多点找色
function 东方头条tips()
	if d('东方头条_back',true) then
	elseif d('东方头条_弹窗_x',true) then
	elseif d('东方头条_弹窗_取消',true) then
	elseif d('东方头条_弹窗_大红包',true) then
	elseif d('东方头条_弹窗_新人专享',true) then
	elseif d('东方头条_弹窗_现金福利红包',true) then
	elseif d('东方头条_弹窗_要闻推送忽略',true) then
	else
		return true
	end
end

function dongfangtoutiao()
	local TimeLine_qtt = os.time()
	local outTime_qtt = rd(10,20)*60
	local 签到 = true
	local 签到成功 = false
	local 领取金币 = true
--	local 强行滑动一次 = true
	local other_tips = 0
--	closeX(arr.newsbid['东方头条'])
	delay(2)
	local 文章_key = 1
	
	while (os.time()-TimeLine_qtt < outTime_qtt ) do
		if active(arr.newsbid['东方头条'],8)then
			if d('东方头条_首页')then
--				if 强行滑动一次 then   ----- ym新增
					moveTo(width/2,900,width/2,500,rd(15,30))
					delay(rd(3,5))
--					强行滑动一次 = false        ------ym新增
				if 签到 then
					click(574,1079)
				else
					if 文章_key >= 10 then
						moveTo(width/2,900,width/2,500,rd(15,30))
						delay(rd(3,5))
						文章_key = 1
					elseif d('东方头条_首页_新闻_x',true)then
						文章_key = 1
						delay(3)
					end
				end
			elseif 签到 and d('东方头条_文章页面')then
				click( 40,60)
			elseif d('东方头条_文章页面')then
				if d('东方头条_文章页面_点一点')then
					文章_key = 文章_key + 1
					if 文章_key < 10 then
						moveTo(width/2,900,width/2,500,rd(15,30))
						delay(rd(3,5))
					else 
						moveTo(width/2,300,width/2,600,rd(15,30))
						delay(rd(1,3))
					end
				else
					文章_key = 100
					click( 40,60)
				end
			elseif d('东方头条_任务界面')then
				if d('东方头条_任务界面_立即签到',true)then
				elseif d('东方头条_任务界面_签到成功',true)then
				elseif d('东方头条_任务界面_放弃',true,1)then
				elseif d('东方头条_任务界面_金币成熟',true,1)then
				elseif d('东方头条_任务界面_金币已经成熟',true,1)then
				elseif d('东方头条_任务界面_金币已经领取',true,1)then
				elseif d('东方头条_任务界面_关闭金币邀请',true,1)then
				elseif d('东方头条_任务界面_我知道了',true,1)then
				elseif d('东方头条_任务界面_继续赚金币')then
					arr.dftt.golds = ocr(16, 184, 157, 244)
					arr.dftt.money = ocr(168, 136, 256, 164 )
					api.updftt()
					签到 = false
					click(64,1081,3)
				end
			elseif d('东方头条_个人中心界面')then
				click(603,78)
			else
				if 东方头条tips()then
					click( 40,60)
				end
			end
		end
		delay(2)
	end

end










































