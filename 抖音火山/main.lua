require("TSLib")
require("tsp")
require("dyui")

dyappid = 'com.ss.iphone.ugc.Aweme'


t = {}

t['直播间']={ 0xf2054e, "-10|-6|0xffc0c4,-25|-6|0xfc2176,-26|-24|0xfe4a94,-5|-32|0xf32f76", 90, 476, 1230, 551, 1307 } --多点找色
t['火山直播间']={ 0xff2f4b, "-13|-6|0xf8d1ac,-22|-3|0xff6041,-22|-23|0xfb7b44,-1|-34|0xf61941", 90, 489, 1247, 539, 1300 } --多点找色
t['发送']={ 0xfbfdff, "-45|-4|0xffffff,-96|-22|0x007aff,37|22|0x007aff,43|-20|0x007aff", 90, 567, 1233, 748, 1333 } --多点找色





function douyin()
	waittimez = tonumber(UI_v.waitz)
	waittime1 = tonumber(UI_v.wait1)
	waittime2 = tonumber(UI_v.wait2)
	waittime3 = tonumber(UI_v.wait3)
	waittime4 = tonumber(UI_v.wait4)
	waittime5 = tonumber(UI_v.wait5)
	waittime6 = tonumber(UI_v.wait6)
	waittime11 = tonumber(UI_v.wait11)
	waittime22 = tonumber(UI_v.wait22)
	waittime33 = tonumber(UI_v.wait33)
	waittime44 = tonumber(UI_v.wait44)
	waittime55 = tonumber(UI_v.wait55)
	waittime66 = tonumber(UI_v.wait66)
	timeline = waittimez
	time_out = os.time()
	while os.time() - time_out < timeline do
		if os.time() - time_out > waittime6 and os.time() - time_out < waittime66 then
			toast('执行第6段')
			if d('发送') then
				log(sub6)	
				inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b')
				delay(1)
				input[1](sub6[math.random(1,#sub6)])
				delay(1)
				d('发送',true)
			elseif d('直播间') or d('火山直播间') then
				click(145,1274)
			else
				click(352,203)
			end		
			
		elseif os.time() - time_out > waittime5 and os.time() - time_out < waittime55 then
			toast('执行第5段')
			if d('发送') then
				log(sub5)	
				inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b')
				delay(1)
				input[1](sub5[math.random(1,#sub5)])
				delay(1)
				d('发送',true)
			elseif d('直播间') or d('火山直播间') then
				click(145,1274)
			else
				click(352,203)
			end		
		elseif os.time() - time_out > waittime4 and os.time() - time_out < waittime44 then
			toast('执行第4段')
			if d('发送') then
				log(sub4)	
				inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b')
				delay(1)
				input[1](sub4[math.random(1,#sub4)])
				delay(1)
				d('发送',true)
			elseif d('直播间') or d('火山直播间') then
				click(145,1274)
			else
				click(352,203)
			end		
		elseif os.time() - time_out > waittime3 and os.time() - time_out < waittime33 then
			toast('执行第3段')
			if d('发送') then
				log(sub3)	
				inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b')
				delay(1)
				input[1](sub3[math.random(1,#sub3)])
				delay(1)
				d('发送',true)
			elseif d('直播间') or d('火山直播间') then
				click(145,1274)
			else
				click(352,203)
			end		
		elseif os.time() - time_out > waittime2 and os.time() - time_out < waittime22 then
			toast('执行第2段')
			if d('发送') then
				log(sub2)	
				inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b')
				delay(1)
				input[1](sub2[math.random(1,#sub2)])
				delay(1)
				d('发送',true)
			elseif d('直播间') or d('火山直播间') then
				click(145,1274)
			else
				click(352,203)
			end		
		elseif os.time() - time_out > waittime1 and os.time() - time_out < waittime11 then
			toast('执行第1段')
			if d('发送') then
				log(sub1)	
				inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b')
				delay(1)
				input[1](sub1[math.random(1,#sub1)])
				delay(1)
				d('发送',true)
			elseif d('直播间') or d('火山直播间') then
				click(145,1274)
			else
				click(352,203)
			end
		else
			toast('暂无任务')
		end
		delay(1)
	end
	return true
end





while (true) do
	local ret,errMessage = pcall(douyin)
	if ret then
	else
		log(errMessage)
		dialog(errMessage, 10)
		mSleep(2000)
	end
end





