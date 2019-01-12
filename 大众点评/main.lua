require('TSLib')
require('tsp')
require('AWZ')
require('ALZ')









------main
var = {}


appbid = "com.dianping.dpscope"

id = '12687'


----------------
function upidfa()
	local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or getDeviceName()
	idfalist.phoneimei = phoneimei 
	idfalist.phoneos = phoneos or getOSType()
	idfalist.name = name or '大众点评注册'
	idfalist.idfa = idfa or phone
	idfalist.ip = ip() or get_ip() or '192.168.1.1'
	idfalist.account = account 
	idfalist.password = password 
	idfalist.phone = phone
	idfalist.other = other or yqm
	return post(url,idfalist)
end
------get color
t = {}
t['tips_跳过']={ 0x9a9a9a, "-19|-7|0x999999,62|-4|0x999999", 90, 479, 46, 597, 104 } --多点找色
t['tips_跳过1']={ 0x7d7d7d, "-18|0|0x777777,-56|-7|0x777777,-48|10|0xffffff", 90, 531, 57, 622, 95 } --多点找色
t['tips_身份验证']={ 0xb8b8b8, "-30|1|0xf3f3f3,-261|45|0x111111,-102|84|0x777777", 90, 120, 400, 577, 730 } --多点找色
t['tips_选择位置']={ 0xff6633, "-9|12|0xff6633,115|-79|0xff7d4a,106|-124|0xf8683b", 90, 19, 145, 230, 330 } --多点找色
t['tips_同意']={ 0xff6633, "-180|3|0xffffff,-136|35|0xffffff", 90, 128, 976, 551, 1086 } --多点找色
t['大众点评主界面']={ 0xff7c50, "-83|6|0xffffff,-276|-4|0xff6633", 90, 35, 1052, 383, 1125 } --多点找色
t['大众点评注册界面']={ 0x777777, "-50|-148|0x111111,27|86|0x45698a,44|106|0xffffff", 90, 29, 53, 436, 473 } --多点找色
	t['大众点评注册界面_下一步']={ 0xff6633, "-223|-6|0xff6633", 90, 56, 498, 600, 671 } --多点找色
t['大众点评验证码界面']={ 0x111111, "29|67|0x111111,5|357|0x446889", 90, 39, 63, 103, 496 } --多点找色
	t['大众点评验证码界面_获取验证码']={ 0x111111, "-84|18|0xf1f1f1,40|-16|0xf1f1f1", 90, 437, 325, 592, 409 } --多点找色
	t['大众点评验证码界面_点击登录']={ 0xff6633, "-117|-10|0xff6633", 90, 158, 501, 495, 633 } --多点找色


function tips()
	if d('tips_跳过',true) then
	elseif d('tips_跳过1',true) then
	elseif d('tips_选择位置',true) then
	elseif d('tips_同意',true) then
	elseif d('tips_身份验证') then
		moveTo(139,644,694,636,5,500)
	end
end	

function register()
	local 取号 = true
	local 取短信 = false
	local 提交 = false
	local timeline = 3*60
	local timeout = os.time()
	
	while os.time() - timeout < timeline do 
		if active(appbid,5) then
			if 提交 and d('大众点评主界面') then
				upidfa()
				delay(3)
				return true

			elseif d('大众点评主界面',true) then
			elseif d('大众点评注册界面') then
				if 取号 then
					if d('大众点评注册界面_下一步',true) then
						取号 = false
						取短信 = true
					elseif GET_Phone(id) then
						click(239,355)
						input(phone)
					end
				end
			elseif d('大众点评验证码界面') then		
				if 取短信 then	
					if d('大众点评验证码界面_获取验证码',true) then
					elseif d('大众点评验证码界面_点击登录',true) then
						取短信 = false
						提交 = true
					elseif getMessage(id,phone) then
						click(96,371)
						input(sms)
					end	
				end
			else
				tips()
			end
		end
		delay(2)
	end
end	



while true do
	vpnx()
	if vpn() then
		delay(3)
		if awzNew() then
			register()
			reName(phone)
		end
	end
end





















































