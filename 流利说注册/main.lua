require('TSLib')
require('tsp')
require('AWZ')
require('ALZ')
require('yzm')





------main

appbid = 'com.liulishuo.Telis'
id = '10661'

var = {}

----上传api

function upidfa()
	local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or getDeviceName()
	idfalist.phoneimei = phoneimei 
	idfalist.phoneos = phoneos or getOSType()
	idfalist.name = name or '流利说'
	idfalist.idfa = idfa or phone
	idfalist.ip = ip() or get_ip() or '192.168.1.1'
	idfalist.account = account 
	idfalist.password = password 
	idfalist.phone = phone
	idfalist.other = other or yqm
	return post(url,idfalist)
end
-----reg取色
t = {}
t['流利说主界面'] = { 0xa2a2a2, "-14|20|0x9f9f9f,12|23|0x929292,-449|-14|0xe8524f,-414|-12|0xe8524f,-447|18|0xe8524f", 90, 12, 1043, 612, 1135}
t['我的界面未登录'] = { 0xffffff, "0|7|0x875f6d,-32|-4|0xffffff,42|16|0xe0d6da,42|17|0x9f818d", 90, 262, 335, 378, 381}
t['注册界面'] = {0x77878e, "-2|29|0xc1c8cc,57|30|0xc6cccf,58|1|0xd3d8da,62|13|0x7f8e95", 90, 279, 59, 356, 103}
t['获取验证码'] = { 0x212121, "-53|0|0x212121,-114|-23|0xffffff,38|28|0xffffff", 90, 420, 246, 609, 324}
t['注册'] = {0xe8524f, "-289|-9|0xe8524f,228|6|0xe8524f,236|-10|0xe8524f", 90, 40, 595, 598, 627}
t['我的界面'] = { 0xe8524f, "-4|-27|0xe8524f,-10|-53|0xe8524f,-485|-315|0x7ba8cb,-479|-420|0x7ba8cb,-39|-757|0x796a7a", 90, 20, 245, 610, 1131}


function reg()
	local 取手机号 = true
	local 取验证码 = false
	local 提交 = false
	local 上传 = false
	local timeline = os.time()
	local timeout = 60 * (math.random(1,1))
	while os.time() - timeline < timeout do
		if active(appbid,5) then
			if d('流利说主界面',true) then	
			elseif d('我的界面未登录',true) then	
			elseif d('注册界面') then
				if 取手机号 then
					if GET_Phone(id) then
						click(303,182)
						input(phone)
						取手机号 = false
						取验证码 = true						
					end	
				elseif 取验证码 then
					if d('获取验证码',true) then
					elseif getMessage(id,phone) then
						click(164,290)
						input(sms)
						取验证码 = false
						提交 = true
					else
						delay(3)
					end	
				elseif 提交 then
					if d('注册',true) then
					else
						click(129,  396)
						input('Aa112211')
						delay(2)
						click( 135,  496)
						input(myRand(3,7))	
						上传 = true
					end
				end	
			elseif 上传 and d('我的界面') then	
				upidfa()
				return true
			end
		end
		delay(1)
	end

end


while true do
	delay(3)
	vpnx()
	delay(3)
	if vpn() then
		if awzNew() then
			if reg() then
				reName(phone)
			end	
		end	
	end
end




































































