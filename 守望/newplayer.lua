--require("TSLib")
--require("tsp")
--require("ip6color")
--require("module")
--require("faker")

init(0)
var = ''
appbid = 'com.more.dayzsurvival.ios'
key = key or 1

t['tip_向下小箭头']={ 0xfff9de, "2|-12|0xfcedc4,-17|-22|0xfad97f,27|-24|0xf2d17f", 95, 9, 113, 730, 1324 } --多点找色
t['建造射手训练营']={ 0xd3b123, "8|-6|0xdebc2b,34|-1|0xe9d4b7,3|-142|0x8b5b45,16|-142|0x9f765c,-9|-124|0x7f7c99", 90, 263, 1128, 374, 1318 } --多点找色
t['铺路']={ 0x555555, "-120|-36|0x484848,14|-36|0x464646,-109|10|0x656565,-216|6|0x84602c,-329|-44|0x66421f,-43|49|0xd1bf84", 90, 163, 913, 581, 1047 } --多点找色
t['点任务']={ 0xffd076, "-1|13|0xffe3ac,1|27|0xfff5e5,6|12|0x9d3b16", 90,  18, 1159, 140, 1217 } --多点找色
t['点任务2']={ 0xffcd6c, "-2|11|0xffdb95,-9|11|0x9a3e19,-1|28|0xfff4df", 90,  6, 1193, 191, 1305  } --多点找色
t['建造燃油发电站']={ 0xdabd24, "10|-7|0xb89838,42|-6|0xe9d4b7,62|1|0xe9d4b7,-31|-117|0x883121", 90, 31, 1176, 207, 1312 } --多点找色
t['对号图标']={ 0xfdffff, "-1|-22|0x305f39,-23|-42|0x2f603b,-98|-41|0x6b2a27,-102|-15|0x641a17,-130|-17|0xffffff", 90, 11, 75, 745, 1228 } --多点找色
t['独立对号图标']={ 0xfafdfc, "-41|21|0xfeffff,-56|-12|0x2f6038,-56|35|0x3c6d44,17|-20|0x2e603a", 90, 11, 75, 745, 1228} --多点找色
t['建造油井']={ 0xd1b42c, "-1|-9|0xd8b82d,8|-2|0xf5e54a,36|-7|0xe9d4b7,-9|-114|0x6e6140,-1|-127|0xc1896a", 85, 254, 1141, 368, 1319 } --多点找色
t['资源运输']={ 0xf2ce88, "34|-3|0xfedb96,119|12|0x655133,235|233|0x4c5361,244|222|0x37475b", 90, 304, 338, 675, 705 } --多点找色
t['建造净水处理站']={ 0xcdb333, "-10|-5|0xa78928,37|-7|0xe9d4b7,-36|-137|0x354f6a,10|-147|0x4ea5e3", 85, 25, 1138, 190, 1327 } --多点找色
t['建造民居']={ 0x83b5c2, "36|-10|0x6695a4,18|15|0x63919f,1|159|0xc4a428,54|-1|0x355569", 85, 50, 1109, 178, 1316 } --多点找色
t['建造农田']={ 0xce9b58, "9|-38|0xbb8243,-23|-47|0xfffaca,-30|80|0xc3a52a,-21|90|0xd4b429", 85, 35, 1136, 179, 1327 } --多点找色
t['建造餐车']={ 0xa99771, "31|-21|0xe4a34a,-11|151|0xb39a2d,-16|21|0xd2a546,17|34|0xc7b093", 85, 39, 1127, 196, 1328 } --多点找色
t['资源运输2']={ 0xffd486, "147|-21|0x3c2f1f,77|209|0xffe90d,258|227|0x3b73ad,316|152|0x20201e", 90, 144, 328, 698, 691 } --多点找色
t['升级按钮']={ 0x61401a, "222|49|0x86622d,240|2|0x553714,-360|3|0x3a4a2a,-103|42|0x435d3a", 90, 46, 1210, 708, 1306 } --多点找色
t['领取章节奖励']={ 0xffffff, "26|3|0xfefefe,-129|-12|0x593a14,108|24|0x795724,114|3|0x5f4012", 90, 197, 1079, 536, 1160 } --多点找色
t['建造急救帐篷']={ 0x937468, "-13|18|0xfdd796,-40|138|0xebca31,-28|13|0x6b5d60,15|-10|0xff634a", 85, 37, 1126, 203, 1310 } --多点找色
t['建造车库']={ 0xff7c50, "-63|4|0x3e4154,-8|-25|0x3d3534,-41|-53|0x6b6450,-22|-64|0xffd5ac", 85, 71, 1103, 179, 1223 } --多点找色
t['建造勇士训练营']={ 0xd05f4b, "-16|-7|0xcf5d47,47|-5|0xedad3a,36|-1|0xf7b540,84|25|0xb2a35d", 85, 39, 1133, 177, 1216 } --多点找色
t['建造兵营']={ 0xf0c673, "17|-9|0xffe578,70|11|0xfff673,-2|159|0xbc9a23,-9|151|0xae7b09", 85, 67, 1118, 176, 1314 } --多点找色
t['编队设置界面']={ 0x7e6d58, "-4|25|0xa18e78,110|1|0xb1997d,113|9|0x685a49,113|25|0x887662", 90, 308, 20, 445, 73 } --多点找色
	t['基地出征']={ 0xf6f3ed, "-24|-3|0xffffff,-111|-31|0x583814,86|0|0x7d5825", 90, 422, 1233, 709, 1327 } --多点找色
t['建造雷达']={ 0x6f748d, "0|40|0xb98a49,-14|30|0x7d5b3d,10|66|0x5d6eac,24|59|0xe0664f", 90, 67, 1097, 172, 1223 } --多点找色
t['建造联盟大厅']={ 0xfff857, "3|-2|0xa1e5ed,8|-2|0xff815c,-37|-21|0xfff7e6,12|-4|0xfff7f0", 90, 68, 1125, 186, 1209 } --多点找色




t['建造要求前往']={ 0xf4f0ed, "17|1|0xffffff,-59|-14|0x654311,56|17|0x956c2d,63|-6|0x6b4812", 90, 550, 985, 703, 1042 } --多点找色
t['城外我的基地']={ 0x7af601, "27|2|0x78f001,34|-3|0x7bf800", 85, 335, 671, 414, 688 } --多点找色
t['城外我的基地2']={ 0x7af302, "-34|-1|0x78e507,23|0|0x7cfa00,7|-3|0x7bf701", 85, 329, 665, 419, 692 } --多点找色
t['解锁按钮']={ 0xeff3ed, "-32|5|0xfbfcfb,-148|-10|0x384a2d,88|29|0x4f6a44,106|-18|0x3a4b29", 90, 211, 1221, 567, 1324 } --多点找色
t['解锁该区域弹窗']={ 0xf5f5f6, "-27|0|0xfdfdfd,-87|-21|0x3b4050,100|16|0x324057,219|-13|0x604116", 90, 51, 754, 694, 858 } --多点找色
t['采集按钮']={ 0x78c866, "29|-11|0xbb9c3e,19|-1|0x296d19,7|-7|0x1c2725", 90, 94, 400, 687, 1060 } --多点找色
t['主城箭头加速按钮']={ 0xc6c0b3, "-14|16|0x9a8672,16|-5|0x564840,10|37|0x69553e,-7|30|0x685d55", 90, 404, 833, 492, 907 } --多点找色
t['城外地图坐标键']={ 0xddab75, "0|-10|0xddab75,-14|15|0xe2b484,7|16|0xb88b66", 90, 25, 1042, 78, 1095 } --多点找色
t['第四章节解锁世界地图弹窗']={ 0xfdfcfb, "-27|3|0xfcfbfa,-147|-18|0x56340f,123|23|0x7d5523,-112|-119|0x252424,-90|-197|0xa39987,-78|-179|0xa19785", 90, 176, 563, 563, 858 } --多点找色
t['提示信息_稍后认证']={ 0xf4f2ee, "-9|10|0xfefefd,-92|-14|0x5f3f18,117|24|0x7f5a27,-236|-11|0x5b3c14,-457|21|0x7a5826", 90, 27, 797, 714, 922 } --多点找色
function new_paly()
	new_paly_timeline = 60*60
	new_paly_timeout = os.time()
	logs('新手')
	while os.time() - new_paly_timeout < new_paly_timeline do
		if active(appbid,5) then
			if d("主城箭头加速按钮",true)then
			elseif 城内按钮集合() then
			elseif d("建造要求前往",true)then
			elseif d("建造射手训练营")then
				moveTo(364,1119,373,619)
			elseif d("铺路")then
				moveTo(453,623,290,711)	
			elseif d("建造燃油发电站")then
				moveTo(119,1110,377,671)
			elseif d("建造油井")then
				moveTo(333,1110,228,596)
			elseif d("建造净水处理站")then
				moveTo(124,1079,365,731)	
			elseif d("建造民居")then
				moveTo(124,1079,215,722)	
			elseif d("建造农田")then
				moveTo(119,1079,374,749)
			elseif d("建造餐车")then
				moveTo(175,1097,208,788)
			elseif d("建造急救帐篷")then
				click(557,849)
			elseif d("建造车库")then
				click(655,961)
			elseif d("建造勇士训练营")then
				click(10,897)
			elseif d("建造兵营")then
				click(245,872)
			elseif d("建造雷达")then
				click(452,894)
			elseif d("建造联盟大厅")then
				return true
			elseif d("资源运输")then
				moveTo(127,755,527,758)	
				click(372,850)
			elseif d("资源运输2")then
				moveTo(125,762,526,759)
				moveTo(124,846,528,852)
				click(373,952)
			elseif d("编队设置界面")then
				moveTo(89,913,80,308)
				moveTo(89,913,397,342)
			elseif d("对号图标",true)then
			elseif d("独立对号图标",true)then
--			elseif d("升级按钮",true)then
			elseif d("领取章节奖励",true)then		
			elseif d("解锁按钮",true)then
			elseif d("解锁该区域弹窗",true)then
			elseif d("采集按钮",true)then
			elseif d('基地出征',true) then
			elseif d('提示信息_稍后认证',true) then
			elseif d('第四章节解锁世界地图弹窗') then
				reName('BUG账号')
				return false
			else
				if game_tips() then
				elseif 找箭头合集() then
				elseif d("tip_向下小箭头")then
					click(x+20,y+70)
				elseif tips弹窗() then
				elseif d('城外我的基地') or  d('城外我的基地2') or d('城外地图坐标键') then
					cw__key = cw__key or 0
					cw__key = cw__key + 1
					if cw__key%5 == 0 then
						click(687,1289)
					end	
					delay(2)
				elseif d("点任务") or d("点任务2")then
					click(x+50,y)
				else	
					cl__key = cl__key or 0
					cl__key = cl__key + 1
					if cl__key%3 == 0 then
						click(28,35)
					else
						click(687,1289)
--						delay(2)
					end	
				end
			end
		end
--		mSleep(1000)
	end
end



--new_paly()


--[[]]
	--新手号滑动规则
	movelist开图= {
		{375,1003,368,399}, --向下
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{368,599,375,1203}, --向上
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
	}
	t['开图按钮']={ 0x969bb7, "5|1|0x969bb7,-6|20|0xb6a7a9,10|21|0xb7a8a8,-4|29|0xdec4a7,9|29|0xdec4a7", 90, 7, 340, 657, 1063 } --多点找色
	t['开图按钮1']={ 0x9c8b8d, "16|-1|0x9b8a8e,-7|-13|0x312118,24|2|0x312619", 90, 3, 339, 654, 1064 } --多点找色
	t['开图按钮晚上']={ 0x465384, "17|12|0x566383,3|30|0x454c67,11|32|0x4b5575,6|-18|0x3d4e90,11|-17|0x3d4e8f", 90, 7, 340, 657, 1063 } --多点找色
	
function 开图()
	弹出主城 = true
	kt_timeline = 5*60
	kt_timeout = os.time()
	logs('开图')
	while os.time() - kt_timeout < kt_timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then
					if 找箭头合集() then
					elseif 弹出主城 then
						if d('主界面下_城内_主城天黑了')or d('主界面下_城内_主城')  then	
--							logs('主城定位')
							key = 1
							弹出主城 = false
						elseif d('主界面下_城内_主城天黑了2') or d('主界面下_城内_主城位置2') then
--							logs('主城定位')
							key = 2
							弹出主城 = false
						else
--							logs('主城偏离')
							click(687,1289)
						end
					elseif d("开图按钮",true) or d("开图按钮1",true)then
					elseif d("开图按钮晚上",true)then
					else
--						logs('滑动')
						move(movelist开图[key])
						if key < #movelist开图 then
							key = key + 1
						else
							弹出主城 = true
--							return true
						end
					end	
				else
					click(687,1289)
				end	
			elseif d("解锁按钮",true)then
				弹出主城 = true
			elseif d("解锁该区域弹窗",true) then	
			elseif d('提示信息_稍后认证',true) then
			else
				if game_tips() then
				elseif tips弹窗() then
				else
					click(687,1289)
				end	
			end	
		end
		delay(1)
	end	
end

--开图()
t['资源箱子']={ 0xa46d11, "4|2|0x2c1c10,11|5|0xa46c0f,13|8|0x2d1b0f,17|10|0x9c680f,21|12|0x3b230d", 60, 8, 111, 741, 1238 } --多点找色
t['资源箱子1']={ 0x996208, "-13|-6|0x29160b,-8|-4|0x93610a,2|4|0x251209,9|5|0x98620c,13|8|0x3c230e", 60, 8, 111, 741, 1238 } --多点找色
--t['资源箱子晚上']={ 0x3e3718, "-6|-2|0x151213,-9|-3|0x3c3614,-11|-9|0x171411,10|3|0x3f3712,13|6|0x1b1612", 90, 8, 111, 741, 1238 } --多点找色
t['资源箱子晚上']={ 0x3e3718, "-6|-2|0x151213,-9|-3|0x3c3614,-11|-9|0x171411,10|3|0x3f3712,13|6|0x1b1612", 90, 7, 340, 657, 1063  } --多点找色
function 清箱子()
	弹出主城 = true
	local qxz_timeline = 5*60
	local qxz_timeout = os.time()
	logs('清箱子')
	while os.time() - qxz_timeout < qxz_timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then
					if 找箭头合集() then
					elseif 弹出主城 then
						if d('主界面下_城内_主城天黑了')or d('主界面下_城内_主城')  then	
--							logs('主城定位')
							key = 2
							弹出主城 = false
						elseif d('主界面下_城内_主城天黑了2') or d('主界面下_城内_主城位置2') then
--							logs('主城定位')
							key = 1
							弹出主城 = false
						else
--							logs('主城偏离')
							click(687,1289)
						end
					elseif d("资源箱子晚上",true) or d("资源箱子",true) or d("资源箱子1",true)then
					else
--						logs('滑动')
						move(movelist[key])
						if key < #movelist then
							key = key + 1
						else
							弹出主城 = true
--							return true
						end
					end	
				else
					click(687,1289)
				end	
			elseif d("解锁按钮",true)then
				弹出主城 = true
			elseif d("解锁该区域弹窗",true) then	
			elseif d('提示信息_稍后认证',true) then
			else
				if game_tips() then
				elseif tips弹窗() then
				else
					click(687,1289)
				end	
			end	
		end
		delay(1)
	end	
end


t['建造按钮']={ 0xebb67c, "-24|21|0xe5b785,-21|39|0xe1c5a5", 90, 660, 1120, 733, 1198 } --多点找色
t['建造界面']={ 0xdcca94, "1|6|0x67553a,-16|0|0xd6c590,-15|1|0x8d7c57,28|-2|0xd0bf8c", 90, 200, 127, 544, 148 } --多点找色
--t['粮水油木铁']={{141,430,0x8f470f},{286,441,0x3272ac},{454,444,0x646e7b},{144,561,0xae743d},{300,561,0x383e46},}  --多点取色
t['粮水油木铁']={{144,446,0xffaf05},{287,443,0x3872a9},{443,441,0x485060},{142,560,0x965d2e},{291,560,0x5d624f},{438,678,0x272219},}  --多点取色
t['准备下建筑界面']={ 0xcfb598, "-11|9|0xe2d1b0,-5|-20|0x43382a,19|-6|0x3b3021,10|8|0xe1ceae", 90, 666, 1229, 734, 1302 } --多点找色
t['准备下建筑界面_绿色地标']={ 0xcdff4d, "", 90,  83, 440, 644, 1057} --多点找色
t['准备下建筑界面_绿色地标晚上']={ 0x4d7b4a, "", 90,  83, 440, 644, 1057 } --多点找色
t['准备下建筑界面_占地面积2X2']={ 0x84c874, "0|-4|0x84c874,-6|-13|0x84c874,8|-13|0x84c874,-60|0|0xdcc8ad,-28|0|0xdcc8ad", 90, 169, 1017, 263, 1043 } --多点找色
t['对号灰色图标']={ 0x595959, "-52|-42|0x505050,-68|3|0x595959,-170|-15|0x70211f,-227|-41|0x6b2321", 90, 11, 75, 745, 1228 } --多点找色
t['灰色建筑']={ 0xd1d1d1, "-52|19|0xf1f1f1,-72|12|0xe0e0e0", 90, 54, 1298, 194, 1332 } --多点找色

function 建造矿点()
	弹出主城 = true
	粮水油木铁key = 1
	jzkd_timeline = 5*60
	jzkd_timeout = os.time()
	logs('建造矿点')
	while os.time() - jzkd_timeout < jzkd_timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then
					if 找箭头合集() then
					elseif 弹出主城 then
						if d('主界面下_城内_主城天黑了')or d('主界面下_城内_主城')  then	
--							logs('主城定位')
							key = 2
							弹出主城 = false
						elseif d('主界面下_城内_主城天黑了2') or d('主界面下_城内_主城位置2') then
--							logs('主城定位')
							key = 1
							弹出主城 = false
						else
--							logs('主城偏离')
							click(687,1289)
						end
					elseif 城内按钮集合() then
					elseif d("建造按钮",true) then
					end	
				else
					click(687,1289)
				end	
			elseif d("准备下建筑界面") then
				if d("建造要求前往",true) then
				elseif  d('建筑投放界面_建造上限') or d('准备下建筑界面_占地面积2X2')then
					d("准备下建筑界面",true)
				elseif d("对号图标",true)then
				elseif d("对号灰色图标") or d("灰色建筑")then
					d("准备下建筑界面",true)
				elseif d('准备下建筑界面_绿色地标') then
					click(x+20,y)
				elseif d('准备下建筑界面_绿色地标晚上',true) then
				else
					d("准备下建筑界面",true)
				end	
			elseif d("建造界面") then
				click(t['粮水油木铁'][粮水油木铁key][1],t['粮水油木铁'][粮水油木铁key][2])
				delay(1)
				click(90,1198)
				if 粮水油木铁key >= #t['粮水油木铁'] then
					粮水油木铁key =  1
					return true
				else
					粮水油木铁key = 粮水油木铁key + 1
				end
			else
				if game_tips() then
				elseif tips弹窗() then
				else
					click(687,1289)
				end	
			end	
		end
		delay(1)
	end	
end
--建造矿点()
t['建筑投放界面']={ 0xcdb195, "-20|2|0x3a2e1e,-2|-18|0x413629,27|5|0x3b2e1d", 90, 661, 1225, 740, 1304 } --多点找色
t['建筑投放界面_建造上限']={ 0x5d4f48, "-687|-18|0x574f48,-586|133|0x5b4f43,-81|133|0x5c5545", 90, 0, 848, 733, 1083 } --多点找色
t['区域四个点']={{388,861,0xb99686},{618,970,0x71686a},{166,983,0xaa8165},{388,1098,0x895f49},}  --多点取色
t['建造界面点']={{440,268,0x4a5c26},{147,441,0xba5f04},{311,432,0xc4d5eb},{462,443,0x61707f},{604,430,0xff9b19},{139,555,0xb46d2a},{289,557,0x8a7a5b},{458,562,0xdb8439},{605,566,0xd5b223},{146,866,0x745c34},{300,861,0x72675a},{454,861,0x645b48},{615,866,0xae8e52},{615,866,0xae8e52}}  --多点取色
-- 1车库，2食物，3净水，4燃料，5电力，6木材，7铁，8人口，9金币，10建造，11军事，12联盟，,13职业大厅
t['修路点取消']={ 0x624016, "117|39|0x86622e,130|-3|0x67431b,217|-3|0x3e5130,353|-1|0x394a2a", 90, 104, 832, 630, 1036 } --多点找色
tfjzmovelist = {
		{168,599,175,1203}, --向上
		{168,599,175,1203}, --向上
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{175,1003,168,399}, --向下
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{480,600,240,710}, -- 向右
		{175,1003,168,399}, --向下
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
		{240,710,480,600}, -- 向左
	}
function 投放建筑()
	local 弹出主城 = true
	local 建筑投放界面开关 = true
	local 结束key = false
	local 建造key =  1
	tfjz_timeline = 30*60
	tfjz_timeout = os.time()
	logs('投放建筑')
	while os.time() - tfjz_timeout < tfjz_timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then
					if 找箭头合集() then
					elseif 弹出主城 then
						if d('主界面下_城内_主城天黑了')or d('主界面下_城内_主城')  then	
--							logs('主城定位')
							key = 2
							弹出主城 = false
							建筑投放界面开关 = false
						elseif d('主界面下_城内_主城天黑了2') or d('主界面下_城内_主城位置2') then
--							logs('主城定位')
							key = 1
							弹出主城 = false
							建筑投放界面开关 = false
						else
--							logs('主城偏离')
							click(687,1289)
						end
					--elseif 城内按钮集合() then
					elseif d("建造按钮",true) then
						弹出主城 = true
					end	
				else
					click(687,1289)
				end	
			elseif d("建造界面") then
				if 结束key then
					return true
				end	
				log(建造选项[建造key])
				jz_key = tonumber(建造选项[建造key])
				click(t['建造界面点'][jz_key][1],t['建造界面点'][jz_key][2])
				if 建造key >= #建造选项 then
					建造key =  1
					结束key = true
				else
					建造key = 建造key + 1
				end
			elseif d("建筑投放界面")then
				if d("建造要求前往") or d('建筑投放界面_建造上限') then
					d("建筑投放界面",true)
				elseif 建筑投放界面开关 then
					d("建筑投放界面",true)
				else	
					move(tfjzmovelist[key])
					if key < #tfjzmovelist then
						key = key + 1
					else
						d("建筑投放界面",true)
						弹出主城 = true
					end
					if key > 2 then
						for i = 1, 4 do
							if d('对号图标',true) then
							elseif d('修路点取消',true) then
							end
							区域四个点key = 区域四个点key or 1
							click(t['区域四个点'][区域四个点key][1],t['区域四个点'][区域四个点key][2])
							if 区域四个点key >= #t['区域四个点'] then
								区域四个点key =  1
							else
								区域四个点key = 区域四个点key + 1
							end
						
						end
					end
				end	
			elseif d('提示信息_稍后认证',true) then
			else
				if game_tips() then
				elseif tips弹窗() then
				else
					click(687,1289)
				end	
			end	
		end
		delay(1)
	end	
	return true
end

--投放建筑()



--t['顶部资源点']={{362,23,0x211b16},{494,21,0x85827f},{570,18,0x1d1712},{701,23,0x211b16},{271,22,0x344e70},{59,22,0xffffff},{151,22,0xfeffff},{701,1258,0x32adcf},}  --多点取色
t['顶部资源点']={{478,23,0x211b16},{579,20,0x294568},{375,20,0x83926b},{693,23,0x211b16},{271,22,0x4f6630},{61,22,0x294568},{162,22,0x4f6630},{587,27,0x29456e},}  --多点取色
--木铁电金油粮水铁
t['顶部资源界面']={ 0x3c5a32, "-122|-18|0x394d2d,0|-18|0x3e5331,-2|104|0xc0b594,-3|92|0x807755,-13|103|0x171514", 90, 523, 162, 719, 442 } --多点找色
t['顶部资源界面_前往']={ 0x694613, "-115|-6|0x6a4817,-3|26|0x926a2b,-114|23|0x8c6427", 90, 534, 864, 709, 1195 } --多点找色
t['顶部缺电0']={ 0xff0000, "-51|0|0xff9b18,-9|2|0xfe0000", 90, 323, 3, 420, 41 } --多点找色
function 优升矿点()
	local 弹出主城 = true
	local 顶部资源点key = 1
	yskd_timeline = 2*60
	yskd_timeout = os.time()
	logs('优升矿点')
	while os.time() - yskd_timeout < yskd_timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then
					if 找箭头合集() then
					elseif 城内按钮集合() then
					elseif d('顶部缺电0',true) then
						运输按钮key = true
					else
						click(t['顶部资源点'][顶部资源点key][1],t['顶部资源点'][顶部资源点key][2])
						顶部资源点key = 顶部资源点key + 1
						if 顶部资源点key > #t['顶部资源点'] then
							顶部资源点key =  1
							return true
						end	
					end	
				else
					click(687,1289)
				end	
			elseif d('顶部资源界面') then
				d('顶部资源界面_前往',true)
			elseif d("解锁按钮",true)then
				弹出主城 = true
			elseif d("解锁该区域弹窗",true) then	
			elseif d('提示信息_稍后认证',true) then
			else
				if game_tips() then
				elseif tips弹窗() then
				else
					click(687,1289)
				end	
			end	
		end
		delay(1)
	end	
end

--优升矿点()


















