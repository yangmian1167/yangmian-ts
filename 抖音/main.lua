require("TSLib")
require("tsp")
require("dyui")

dyappid = 'com.ss.iphone.ugc.Aweme'


t = {}

t['直播间']={ 0xf2054e, "-10|-6|0xffc0c4,-25|-6|0xfc2176,-26|-24|0xfe4a94,-5|-32|0xf32f76", 90, 476, 1230, 551, 1307 } --多点找色
t['火山直播间']={ 0xff2f4b, "-13|-6|0xf8d1ac,-22|-3|0xff6041,-22|-23|0xfb7b44,-1|-34|0xf61941", 90, 489, 1247, 539, 1300 } --多点找色
t['发送']={ 0xfbfdff, "-45|-4|0xffffff,-96|-22|0x007aff,37|22|0x007aff,43|-20|0x007aff", 90, 567, 1233, 748, 1333 } --多点找色

function douyin()
	time_line = math.random(times1,times2)
	time_out = os.time()
	toast('间隔时间'..time_line..'秒')
	neirong = (tostring(sublist[math.random(1,15)]))
	while (true) do
	if os.time() - time_out > time_line then
			
			if d('发送') then
				log(neirong)	
				inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b')
				delay(1)
				input[1](neirong)
				delay(1)
				d('发送',true)
				return true
			elseif d('直播间') or d('火山直播间') then
				click(145,1274)
			else
				click(352,203)
			end
		end
		delay(2)
	end
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





