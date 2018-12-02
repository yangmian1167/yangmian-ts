require("TSLib")
require("tsp")
require("AWZ")
require("ALZ")
require("phonelisttable1")
require("phonelisttable2")
bid = {}
bid.pdd = "com.huanshou.taojiji"


function up(name,other)
	local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or getDeviceName()
	idfalist.phoneimei = phoneimei or getDeviceType(); 
	idfalist.phoneos = phoneos or getOSType(); 
	idfalist.name = name
	idfalist.idfa = idfa or phone
	idfalist.ip = ip() or "192.168.1.1" 
	idfalist.account = account
	idfalist.password = password
	idfalist.phone = phone
	idfalist.other = other
	return post(url,idfalist)
end

phonekeyArr = --取色列表
{
	{112,744,0x000000},
	{321,748,0x000000},
	{541,743,0x000000},
	{116,862,0x000000},
	{316,848,0x000000},
	{539,868,0x000000},
	{110,963,0x000000},
	{320,957,0x000000},
	{540,962,0x000000},
[0]=	{320,1083,0xffffff},
}

function phoneKey(phone)
	for i =1,string.len(phone) do
		local phone_mun = tonumber(string.sub(phone,i,i))
		click(phonekeyArr[phone_mun][1],phonekeyArr[phone_mun][2],0.4)
	end
end





t = {}
t['tips提现红包'] = {  0xc78a42, "78|-5|0xfed19f,-65|-222|0xee0000,161|-93|0xff675b", 90, 246, 532, 565, 862}
t['主界面首页'] = { 0xfc5528, "11|22|0xf8431d,9|49|0xfebea8,114|11|0xd8d8d8,501|20|0xd8d8d8,497|56|0x999999", 90, 24, 1048, 615, 1138}
t['主界面点我的'] = { 0xd8d8d8, "-10|10|0xd8d8d8,19|25|0xe1e1e1,8|29|0xfcfcfc,-15|49|0xaeaeae,19|64|0xc0c0c0", 90, 549, 1053, 600, 1132}
t['主界面我的界面'] = { 0xfb4d23, "6|19|0xf9461e,-17|53|0xff7546,-142|25|0xd8d8d8,-149|53|0x9a9a9a", 90, 421, 1054, 613, 1133}
t['登录'] = { 0xffffff, "-37|11|0xb0b0b0,6|-20|0x383838,30|11|0xaaaaaa,-34|-21|0xcacaca", 90, 145, 160, 221, 207}
t['选择其他方式登录'] = { 0x179aee, "-111|-10|0x219eee,95|-12|0x46aef1,99|9|0x179aee,29|12|0xb7dff9,16|10|0x229fee", 90, 207, 421, 432, 462}
t['手机号登录'] = { 0x191919, "28|11|0xa4a4a4,77|15|0x919191,101|4|0x686868,101|-2|0xa3a3a3,72|-4|0x898989", 90, 20, 922, 149, 964}
t['手机号登录界面'] = { 0x191919, "-2|26|0x191919,44|3|0x686868,78|4|0x7f7f7f,113|14|0x191919,139|27|0xb6b6b6", 90, 221, 61, 391, 105}
	t['手机号登录界面_获取验证码'] = { 0xff6632, "-36|-23|0xff6733,57|22|0xff845a,30|4|0xffffff", 90, 494, 312, 618, 387}
	t['手机号登录界面_点击登录'] = { 0xfc572a, "-89|57|0xfe6431,455|2|0xed1501,456|65|0xf04230", 90, 28, 535, 621, 650}


function reptjj()
	取号 = true
	获取验证码 = false
	取短信 = false
	提交 = false
	登录成功 = false
	timeline = os.time()
	timeout = math.random(120,125)
	
	while os.time() - timeline < timeout do
		if active(bid.pdd,5) then
			if 登录成功 and d("主界面我的界面") then
				up("淘集集复购","登录成功")
				reName(phone)
--				lua_exit()
				delay(3)	
				return true
			elseif d("手机号登录界面") then
				if 取号 then
					if GET_Phone_again(id,phonelist[index]) then
						delay(3)
						click(122,242,2)
						phoneKey(phone)
						取号 = false
						获取验证码 = true			
					end
				elseif 获取验证码 then
					if d("手机号登录界面_获取验证码",true) then
						获取验证码 = false
						取短信 = true
					end	
				elseif 取短信 then
					if getMessage(id,phone) then
						click(137,355)
						phoneKey(sms)
						取短信 = false
						提交 = true
					end	
					
				elseif 提交 then
					if d("手机号登录界面_点击登录",true) then
					end
					up("淘集集复购","正在登陆")
					提交 = false
					登录成功 = true
			
				end
			elseif d("tips提现红包",true) then
			elseif d("主界面点我的",true) then
			elseif d("登录",true) then
			elseif d("选择其他方式登录",true) then
			elseif d("手机号登录",true) then
				
			end
		end
		delay(2)
	end
end	




--[[]]
vpnx()
delay(3)


id = "14294"
--lua_exit()
KFY()

index = 100
phonelist = phonelist1
while true do
	log("index->"..index)
	if  awzNew() then
		if  vpn() then
			delay(2)
			reptjj()
			index = index + 1
		end
	end
end
--]]




--idfa = "15087003660"
--phone = "15087003660"
--up("淘集集复购","登录成功")

--reName(phone)




































