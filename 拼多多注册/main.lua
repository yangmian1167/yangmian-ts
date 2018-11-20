require("TSLib")
require("tsp")
require("AWZ")
require("ALZ")

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
t['首页'] = { 0xe02e24, "18|19|0xe02e24,118|29|0x969696,392|28|0x666666,516|20|0xffffff", 90, 8, 1042, 628, 1133}
t['点击登录'] = { 0xe02e24, "-82|-18|0xf4afac,0|35|0xe1342a,122|-5|0xffffff,123|-5|0xed847e", 90, 176, 130, 422, 229}
t['使用其他方式登录'] = { 0x077eff, "-7|-1|0xffffff,131|-5|0xffffff,120|2|0x077eff", 90, 184, 666, 456, 713}

----tips------------------
t['tips_手机号登录'] = { 0xa0de3f, "12|-2|0xffffff,-16|-1|0xa0de3f,3|19|0xa0de3f,3|-13|0xffffff", 90, 129, 717, 498, 1132}



t['手机登录界面'] = { 0x333333, "-13|-2|0x8e8e8e,-6|24|0x333333,115|22|0x333333,116|6|0xcbcbcb", 90, 248, 60, 390, 107}
	t['手机登录界面_发送验证码'] = { 0xe02e24, "16|10|0xffffff,-63|1|0xe02e24", 90, 443, 262, 608, 314}
	t['手机登录界面_登录'] = { 0xfef9f9, "7|0|0xe02e24,44|14|0xf5bebb,47|14|0xe02e24", 90, 259, 366, 401, 455}

t['tips开启消息'] = { 0xb6b6b6, "-11|8|0xe0e0e0,-170|268|0xffffff,-161|628|0xe02e24,-280|148|0xfde459", 90, 252, 136, 625, 881}
t['tips红包'] = { 0xffffff, "-143|159|0xff4743,-193|243|0xffec7e,-102|498|0xf6d86d,-81|540|0xeb1b3b", 90, 351, 147, 602, 794}

function reg()
	取号 = true
	发送验证码 = true
	取短信 = true
	提交 = true
	timeline = os.time()
	timeout = (math.random(3,5))*60
	
	while os.time() - timeline < timeout do
		if active(bid.pdd,5) then
			if d('首页') then
				click(579, 1098)
			elseif d('点击登录',true) then
			elseif d('使用其他方式登录',true) then
			
			elseif d('手机登录界面') then
				if 取号 then		
					if GET_Phone(id) then	
						click(268,  199)
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
						inputStr(sms)
						取短信 = false
						提交 = true
					end
				elseif 提交 then
					d("手机登录界面_登录",true)
					up("拼多多","初次注册")
					return true
				end
			elseif d("tips开启消息",true) then
			elseif d("tips红包",true) then
			else
				d('tips_手机号登录',true)
			end
	
		end
		delay(2)
	end
end

KFY()


index = 0
while (true) do
	if awzNew() then
		if vpn()then
			if reg()then
				reName(phone)
				delay(3)
				index = index + 1
				if index > 50 then
					return
				end
			end
			vpnx()
			delay(3)
		end
	end
end





