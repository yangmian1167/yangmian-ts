

function yiji_other()
	上兵统计 =  上兵统计 or 0

	if UI('新手','战斗界面中',false,1)then
		if UI_pic('新手','战斗准备',false,1)then
			
			预设位置={{1045,162,0x0a0c04},{1220,166,0x0d0e08},{1041,257,0x060c07},
				{1220,252,0xffffff},{1048,350,0xdbdbdb},{1227,348,0x090c08},{1044,442,0x0d0f05},{1222,443,0x111609},}
			--values.yiji_arm 预设编号(0,1,2,3)设置1,设置2,设置3,全上
			if tonumber(values.yiji_arm) == 8 then
				if c_p(aoc['新手']['超出队伍'],'超出队伍',false)then
					click(178,31)		--撤回
					click(1238,673)		--攻击
					delay(2)
				else
					上兵统计 = 上兵统计 + 1
					if 上兵统计 >= 18 then
						if UI('战斗','可以出战',true,1)then
							delay(2)
						else
							return '战斗失败'
						end
					else
						if UI_pic('战斗','受伤英雄',false)then
							return '战斗失败'
						else
							click(1086,663,0.2) 	--点英雄
						end
					end
				end
			else
				if d('战斗界面_预设未展开',true,1)then
				elseif d('战斗界面_预设已展开')then
					click(预设位置[tonumber(values.yiji_arm)+1][1],预设位置[tonumber(values.yiji_arm)+1][2])
					delay(3)
					d('战斗界面_可以开战',true,1)
				end
			end
			
		elseif UI_pic('新手','寻找英雄',false)then
			if x < 700 and y > 250 then
				log('英雄位置正常')
				--[[
				if UI_pic('战斗','英勇跳跃',true) or UI_pic('战斗','箭雨',true) then
					if UI_pic('战斗','攻击目标',false)then
						click(x-50,y+20)
					end
					UI_pic('战斗','取消',true)
				end
				--]]
			elseif x > 700 then
				moveTo(450,300,300,300,20,20)
			elseif y < 250 then
				moveTo(300,300,300,450,20,20)
			end

		else
--			moveTo(500,600,400,700,20,20)
--			delay(3)
		end

	elseif UI('other','取消战斗',true,1)then		--战斗
		上兵统计 = 0
		delay(5)	
	elseif UI('other','不能直接扫荡_打',true,1)then		--战斗
	elseif UI_pic('other','直接扫荡',true,1)then		--战斗
		上兵统计 = 0
		delay(5)
	elseif UI('other','误点水泉',true,1)then
	elseif UI('other','恢复药',true,1)then
	elseif UI('other','体力药',true,1)then
	elseif UI('新手','招英雄确定',true,1)then
	elseif UI('新手','英雄升级',true,1)then
	elseif UI('新手','英雄结算画面',true,1)then
	elseif UI('other','暂停界面',true,1)then		--误点暂停,继续开始
	elseif setting[4] and UI('other','死伤较重',true,1)then
	elseif setting[4] and UI('新手','战斗胜利',true,1)then
	elseif UI('新手','战斗胜利',false,1)then
		vibrator()
		delay(5)
	elseif UI('other','战斗失败',true,2)then
		delay(1)
		if UI('other','取消战斗',true,3)then --取消战斗
			return '战斗失败'
		end
	elseif UI('新手','招兵确定',true,1)then
	elseif UI('other','运送矿点',true,1)then
	elseif UI('other','成功抢车',true,1)then
	elseif UI('other','取消战斗',true,1)then
		delay(3)
	elseif UI('other','被点确认',true,1)then
	elseif UI_pic('other','蓝红按钮_',true,1)then
	elseif UI_pic('战斗','取消',true)then	--取消技能
	elseif UI('other','战争学院胜利',true,1)then	--取消技能	
	elseif UI('other','战力不足',true,1)then	--取消技能
		return '战斗失败'
	else
		return true
	end
	delay(0.2)
end


function touch_move_look()
	touchDown(1, h/2,w/2+160)
	mSleep(100)
	touchMove(1, h/2,w/2-155)
	mSleep(100)
	touchDown(1, h/2,w/2-155)
	mSleep(500)
	if c_p(aoc['返回']['任务蓝色'],'任务蓝色',false)then
		touchUp(1, h/2,w/2-155)
		return true
	end
	touchUp(1, h/2,w/2-155)
end


function find_kuang()
	
	if setting[2] and  UI_pic('新手','领取奖励',true)then
	end
	
	aoc['返回']['感叹号'][7] = 670
	aoc['返回']['感叹号'][5] = 93

	for i=1,4 do
		if UI_pic('返回','感叹号')then
			
			keepScreen(true)
			log('第'..i..'个感叹号'..x..","..y,false,2)
			aoc['返回']['感叹号'][7] = y - 120
			aoc['返回']['感叹号'][5] = aoc['返回']['感叹号'][7] - 180
			
			local cx,cy = x,y
			--设置区域
			f_x = 180
			f_y = -39
			f_x_x = 712
			f_x_y = 47
			aoc['资源']={}
			aoc['资源']['水']={ 0x00cbe1, "-23|2|0xeceaee,-17|1|0xa5fefa", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
			aoc['资源']['金']={ 0xe7e376, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
			aoc['资源']['木']={ 0xc78b59, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
			aoc['资源']['血钻']={ 0xd7121a, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
			aoc['资源']['水晶']={ 0xe240d3, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
			aoc['资源']['密银']={ 0x50f7ec, "14|-4|0xafffb0,19|8|0xb9ffa2", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}

			aoc['返回']['指向目标地']={ 0x9ea495, "1|29|0x999f82", 90, x+686, y-54, x+841, y+29}
			
			if setting[21] then
				aoc['资源']['魔镜']={ 0xf7f9fa, "1|0|0x15425a,3|0|0xd9e0e4,-3|0|0xe3e8eb,-3|7|0xe3e8eb", 90, x+75, y-17, x+558, y+26}
			end
			
			zy_mun = 0
			for k,v in pairs(aoc['资源'])do
				if k == '水' or k == '密银' or k == '魔镜' then
					if c_pic(v,k,false)then
						if kuang_setting[0] and k == '水' then
							zy_mun = zy_mun + 2
							log('水跳过')
						elseif kuang_setting[7] and k == '密银' then
							zy_mun = zy_mun + 2
							log('密银跳过')
						else
							zy_mun = zy_mun + 1
						end
					end
				else
					if c_p(v,k,false)then
						if kuang_setting[1] and k == '金' then
							zy_mun = zy_mun + 2
						elseif kuang_setting[2] and k == '木' then
							zy_mun = zy_mun + 2
						elseif kuang_setting[6] and k == '血钻' then
							zy_mun = zy_mun + 2
							log('血钻跳过')						
						elseif kuang_setting[8] and k == '水晶' then
							zy_mun = zy_mun + 2
							log('水晶跳过')
						else
							zy_mun = zy_mun + 1
						end
					end
				end
			end
			keepScreen(false)
			
			if setting[20] and zy_mun >= 2 then
				log("准备找遗迹")
				nLog(cx+979 ..",".. cy-25)
				if c_pic(aoc['返回']['指向目标地'],'指向目标地',true)then
					delay(2)
					return true
				end
			elseif zy_mun == 1 then
				nLog(cx+979 ..",".. cy-25)
				if c_pic(aoc['返回']['指向目标地'],'指向目标地',true)then
					delay(2)
					return true
				end
			else
				log("没有矿")
			end
		end
	end
	
	log('上滑动一次')
	--moveTo(h/2,w/2+320-(math.random(1,100)),h/2,w/2-155,20)
	if touch_move_look() then
		log('还有任务')
	else
		return '没有任务'
	end
	delay(0.5)
end


function auto_get()
	local 计时 = os.time()
	local 超时 = 60*15
	轮换 = 1
	点矿 = false
	采矿数量 = 0
	查找次数 = 0
	找图失败次数 = 0
	倒着找矿 = true
	开一次地图 = true
	魔镜设置 = true
	公会领取_ = true
	
	while (os.time()-计时< 60 * 15 ) do
		if active(app,10)then
		elseif setting[14] and 开一次地图 and UI('在地图中','在地图界面',true,3)then
			delay(2)
			开一次地图 = false
		elseif UI('在地图中','在地图界面',false,3,80)then
			log('----采矿路上----')
			delay(1)
			if 公会领取_ and UI_pic('在地图中','城市奖励' ,true,1)then
			elseif d('在地图界面_声望奖励提示',true,1)then
				delay(2)
			elseif UI('在地图中','战争结束',true,2)then
			else
				map_time = os.time()
				while (点矿 and (os.time()-map_time < 40)) do
					keepScreen(true)
--					if UI_pic('地图','正在跑路',false)or UI_pic('地图','正在跑路小',false)then
					if UI_pic('地图','正在跑路',false) then
						delay(3)
					else
						keepScreen(false)
						break
					end
					keepScreen(false)
				end
				轮换 = 轮换 + 1
				
				倒着找矿 = true
				if 点矿 and UI_pic('在地图中','矿点顶部',false)then
					click(x,y+150)
					点矿 = false
				elseif 点矿 and UI_pic('在地图中','发现矿点',false)then
					click(x,y+150)
					点矿 = false
				else
					--缩小地图()
					四个方向位置={{507,412,0xd8dfe1},{515,252,0xdcedef},{668,183,0x9aa9cb},{806,246,0xd8e5f1},{806,384,0xb1b098},}
					if 点矿 then
						click(四个方向位置[(轮换%5+1)][1],四个方向位置[(轮换%5+1)][2])
						点矿 = false
					end
					轮换 = 轮换 + 1
					UI_pic('地图','探索',true)
					UI('返回','返回图标',true,1)
					UI('在地图中','在地图界面',true,4,80)
				end
			end
		elseif UI('返回','返回图标',false,1) and not(UI('新手','战斗界面中',false,1)) then
			if d('返回_任务界面')then
				
				if d('返回_任务界面_活跃激活')then
					if UI_pic('返回','活跃点击',true,1)then
					elseif UI_pic('返回','活跃领取',true,1)or UI_pic('返回','活跃领取-银宝箱',true,1)then
					else
						moveTo(820,193,473,193,20)
						moveTo(820,193,473,193,20)
						delay(1)
						if UI_pic('返回','活跃领取',true,1)or UI_pic('返回','活跃领取-银宝箱',true,1)then
						else
							UI('返回','返回图标',true,1)
						end
					end
				elseif UI('返回','签到界面',false,1)then
					if c_pic(aoc['返回']['可以签到'],'可以签到',true)then
					elseif c_pic(aoc['返回']['可领龙币'],'可领龙币',true)then
					else
						UI('返回','返回图标',true,1)
					end
				elseif UI_pic('返回','有任务下的红点',true)then
				else
					if find_kuang() == '没有任务' then
						return false
					end
				end
			elseif UI_pic('声望','声望界面',false)then
				
				if UI_pic('返回','可领龙币_钱袋',true)then
				elseif UI_pic('声望','未开奖励',true)then
				else
					UI('返回','返回图标',true,1)
				end
				
			elseif UI('返回','魔镜中')then
				
				if UI('返回','自动前进')then
					if 魔镜设置 and UI('返回','自动前进',true,1)then
						魔镜设置 = false
						魔镜计时 = os.time()
					else
						if os.time()-魔镜计时 > 45 then
							click(40,40)		--点击进入下一层
						end
					end
				else
					UI('返回','返回图标',true,1)
				end
			elseif d('返回_世界地图界面')then
				log('准备采矿')
				if UI('car','误点城堡') == false then
					if UI('城堡','在城堡中',false,1) or UI('other','公会信息',false,1)then
						UI('返回','返回图标',true,1)
					elseif setting[14] and 找图失败次数 <= 4 and 找金币()then
						delay(1)
						if map_one()==false then
							找图失败次数 = 找图失败次数 + 1
						end
					elseif UI_pic('返回','前往',true)then
						delay(1)
						点矿 = true
					else
						UI('返回','返回图标',true,1)
					end
				else
					UI('返回','返回图标',true,1)
				end
			elseif d('返回_公会界面')then
				if UI_pic('返回','城市界面')then
					if UI_pic('返回','全部领取',true)then
					elseif not(UI_pic('返回','全部领取灰',false))then
						公会领取_ = false
						UI('返回','返回图标',true,1)
					else
						UI('返回','返回图标',true,1)
					end
				elseif UI_pic('返回','赠品领取',true)then
				elseif UI_pic('返回','公会奖励红点',true)then
					delay(2)
				else
					UI('返回','返回图标',true,1)
				end
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('other','运送矿点',true,1)then
			采矿数量 = 采矿数量 + 1
			log('矿'.. 采矿数量)
			点矿 = false
		else
			nLog('-other-')
			if setting[20] then
				nLog('--other--')
				if yiji_other()then
					other()
				end
			else
				other()
			end
		end
	end
end


function 有车()
	--设置一个初始区域,分5次扩大
	aoc['car']['有车']={ 0xeb0000, "0|-4|0xfb0000", 90, 608,295,808,484}--95,44
	--aoc['car']['有车']={ 0xfb2727, "0|1|0xf22727", 70, 117, 15, 1191, 730}
	if UI_pic('car','人物定位',false)then
		aoc['car']['有车'][4]=x-10
		aoc['car']['有车'][5]=y-5
		aoc['car']['有车'][6]=x+10
		aoc['car']['有车'][7]=y+5
	end
	for i = 1,30 do
		if UI_pic('car','有车',true)then
			if UI_pic('car','前往',true)then
				return true
			end
		end
		aoc['car']['有车'][4] = aoc['car']['有车'][4] - 25
		aoc['car']['有车'][5] = aoc['car']['有车'][5] - 10
		aoc['car']['有车'][6] = aoc['car']['有车'][6] + 25
		aoc['car']['有车'][7] = aoc['car']['有车'][7] + 10
		log('第几圈->'..i)
	end
	lun = lun or 0
	lun = lun + 1
	if lun%4 >= 2 then
		moveTo(1069,350,722,350,40,30)
		delay(1)
	else
		moveTo(722,350,1069,350,40,30)
		delay(1)
	end
end

function 缩小地图()
	地图计时 = 地图计时 or 0
	if os.time()-地图计时 > 60 * 10 then
		for i = 1,5 do
			log('滑动一次')
			touchDown(1, 800,100)
			touchDown(2, 450,500)
			mSleep(100)
			touchMove(1, 760,120)
			touchMove(2, 480,480)
			mSleep(100)
			touchUp(1, 760,120)
			touchUp(2, 480,480)
			mSleep(200)
		end

		地图计时 = os.time()
	end
end

function car()
	while ((os.time()-计时<超时 )) do
		if active(app,5)then
			地图计时 = 0
		elseif UI('在地图中','在地图界面',true,3)then
		elseif UI('返回','返回图标',false,1)then
			if d('返回_世界地图界面')then
				缩小地图()
				if 有车()then
					delay(2)
					out_time = os.time()
					while os.time()-out_time < 15 do
						keepScreen(true)
						if UI_pic('地图','正在跑路',false)or UI_pic('地图','正在跑路小',false)then
							mSleep(1000)
						else
							keepScreen(false)
							for k,v in pairs(aoc['car']['点车子']) do
								if c_p(v,k..'方向车子拦截',false)then
									click(x+50,y+150)
									if UI('car','拦截',true,1)then
										writeFile(day,劫车统计,"w")
										return false
									elseif UI('car','无体力劫车',false,1)then
										UI_pic('car','展开',true)
										UI_pic('car','技能',true)
										UI_pic('car','回城',true)
										if UI_pic('car','使用',true)then
											delay(60*60*2*1)
										end
									end
								end
							end
							return false
						end
						keepScreen(false)
						if UI('返回','返回图标',true,1)then
							return false
						end
						mSleep(200)
					end
				else
					if UI('car','误点城堡')then
						UI('返回','返回图标',true,1)
					elseif UI('返回','在城堡中',false,1)then
						UI('返回','返回图标',true,1)
					end
				end
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('car','封号')then
			return true
		else
			if other()then
				劫车统计 = 劫车统计 + 1
				writeFile(day,劫车统计,"w")
				boxshow(劫车统计)
			end
		end
		mSleep(100)
	end
end

function 劫车()
	
	day = '/var/mobile/Media/TouchSprite/lua/' ..os.date("%Y-%B-%d-").. '剑与家园劫车统计.txt'
	劫车统计 = 0
	if file_exists(day) then
		劫车统计 = tonumber(readFile(day)[1])
		boxshow(劫车统计)
		delay(2)
	else
		writeFile(day,0,"w")
	end
	计时 = os.time()
	超时 = 60*25
	
	while (os.time()-计时<超时 ) do
		if car()then
			return false
		end
	end
end



function 战争学院()
	计时 = os.time()
	超时 = 60*25
	while ((os.time()-计时<超时 )) do
		if active(app,5)then
		elseif UI_pic('返回','战争学院界面_选择',true)then
		elseif UI_pic('返回','战争学院界面')then
			if UI('返回','战争打完')then
				if UI('返回','战争打完',false,1)then
					if UI_pic('返回','下一章',true,1)then
					else
						return true
					end
				end
			else
				click(1130,680)
			end
		elseif UI('在地图中','在地图界面',true,2)then
		elseif UI('返回','返回图标',false,1) and not(UI('新手','战斗界面中',false,1)) then
			if UI('城堡','在城堡中',false,1)then
				click(933,186)
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('other','战斗失败',true,2)then
			return true
		else
			f_yiji = yiji_other()
			if f_yiji == '战斗失败' then
				return true
			elseif f_yiji then
				other()
				nLog('other')
			end
		end
		mSleep(600)
	end
end







