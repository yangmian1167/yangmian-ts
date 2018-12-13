require("TSLib")
require("tsp")
require("AWZ")
require("ALZ")
require("iphone6s9系统放大")
--require("iphone6ios11系统")

bid = {}
bid.pdd = "com.xunmeng.pinduoduo"
id= '10691'

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

t = {}
t['首页'] ={ 0xacacac, "-519|-15|0xf76ead,-523|40|0xeb7973,-257|15|0x666666", 90, 12, 1044, 615, 1127 } --多点找色
t['点击登录'] = { 0xe02e24, "-82|-18|0xf4afac,0|35|0xe1342a,122|-5|0xffffff,123|-5|0xed847e", 90, 176, 130, 422, 229}
t['使用其他方式登录'] = { 0x077eff, "-7|-1|0xffffff,131|-5|0xffffff,120|2|0x077eff", 90, 184, 666, 456, 713}
t['个人中心']={ 0xf0447e, "0|-6|0xef3c7d,-28|45|0xe8645c,30|49|0xe02e24", 90, 523, 1051, 621, 1133 } --多点找色
t['个人中心_注册完成']={ 0x7ad6f9, "-1|1|0x7ad6f9,22|28|0x7ad6f9", 90, 385, 157, 470, 208 } --多点找色
----tips------------------
t['tips_手机号登录'] = { 0xa0de3f, "12|-2|0xffffff,-16|-1|0xa0de3f,3|19|0xa0de3f,3|-13|0xffffff", 90, 129, 717, 498, 1132}

t['手机登录界面'] = { 0x333333, "-13|-2|0x8e8e8e,-6|24|0x333333,115|22|0x333333,116|6|0xcbcbcb", 90, 248, 60, 390, 107}
	t['手机登录界面_发送验证码'] = { 0xe02e24, "16|10|0xffffff,-63|1|0xe02e24", 90, 443, 262, 608, 314}
	t['手机登录界面_登录'] = { 0xfef9f9, "7|0|0xe02e24,44|14|0xf5bebb,47|14|0xe02e24", 90, 259, 366, 401, 455}

t['tips开启消息'] = { 0xb6b6b6, "-11|8|0xe0e0e0,-170|268|0xffffff,-161|628|0xe02e24,-280|148|0xfde459", 90, 252, 136, 625, 881}
t['tips红包'] = { 0xffffff, "-143|159|0xff4743,-193|243|0xffec7e,-102|498|0xf6d86d,-81|540|0xeb1b3b", 90, 351, 147, 602, 794}
t['tips神秘宝箱']={ 0xffffff, "-297|161|0xf35514,-351|716|0xffa8a9,-100|721|0xeb2e2e", 90, 234, 206, 704, 1002 } --多点找色




function reg()
	取号 = true
	发送验证码 = true
	取短信 = true
	提交 = true
	timeline = os.time()
	timeout = (math.random(3))*60
	
	while os.time() - timeline < timeout do
		if active(bid.pdd,5) then
			if d('首页',true) then
				
			elseif d('点击登录',true) then
			elseif d('使用其他方式登录',true) then
			
			elseif d('手机登录界面') then
				if 取号 then		
					if GET_Phone(id) then	
						click(268,  199)
						delay(2)
						inputStr(phone)
						取号 = false
						发送验证码 = true
					end
				elseif 发送验证码 then
					if d("手机登录界面_发送验证码",true) then
					else
						发送验证码 = false
						取短信 = true
					end
				elseif 取短信 then
					if getMessage(id,phone) then
						click(245,  289)
						delay(2)
						inputStr(sms)
						取短信 = false
						提交 = true
					end
				elseif 提交 then
					if d("手机登录界面_登录",true) then
					
					end
				end
			elseif d("个人中心") then
				if d("个人中心_注册完成") then
					up("拼多多","初次注册")
					delay(3)
					return true
				end
			elseif d("tips开启消息",true) then
			elseif d("tips红包",true) then
			elseif d("tips神秘宝箱",true) then
			else
				d('tips_手机号登录',true)
			end
	
		end
		delay(1)
	end
end



--[[]]
index = 0
while (true) do
	vpnx()
	delay(3)
	if vpn() then
		if awzNew() then
			if reg()then
				reName(phone)
				delay(3)
				index = index + 1
				if index > 50 then
					return
				end
			end

		end
	end
end

--]]

















