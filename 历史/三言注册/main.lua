require('TSLib')
require('tsp')
require('AWZ')
require('ALZ')
require('yzm')





------main

appbid = 'com.tongzheng.sylife'
id = '15180'

var = {}

----上传api

function upidfa()
	local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or getDeviceName()
	idfalist.phoneimei = phoneimei 
	idfalist.phoneos = phoneos or getOSType()
	idfalist.name = name or '三言注册'
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

t['三言_主界面']={ 0xff9900, "29|42|0x000000,254|27|0xff9901,527|5|0x999999", 90, 5, 1041, 637, 1128 } --多点找色
t['三言_登录界面']={ 0xffa900, "-503|322|0xcccccc,9|413|0xcccccc,19|413|0xffffff", 90, 36, 59, 619, 624 } --多点找色
t['三言_注册界面']={ 0x696969, "33|331|0xcccccc,544|420|0xcccccc,549|420|0xffffff", 90, 18, 53, 613, 529 } --多点找色
t['三言_注册界面_邀请码']={ 0xc7c7cd, "-212|8|0x6d6d6d,-125|5|0xc7c7cd,-42|8|0xffffff", 90, 44, 599, 475, 687 } --多点找色
t['三言_注册界面_获取验证码']={ 0xffffff, "-48|-1|0x424242,65|-1|0x424242", 90, 421, 533, 581, 586 } --多点找色
t['三言_注册界面_提交']={ 0xffffff, "-151|-38|0xff7400,164|23|0xff7400", 90, 89, 696, 575, 862 } --多点找色

t['tips_立即进入']={ 0xffffff, "-37|-7|0xffaa31,92|-14|0xffffff,-86|22|0xffffff", 90, 157, 936, 488, 1081 } --多点找色
t['tips_定位取消']={ 0x007aff, "50|-1|0x007aff,280|1|0x007aff", 90, 83, 610, 537, 693 } --多点找色
t['tips_同意']={ 0xff2600, "-37|-8|0xffffff,-176|-4|0xff2600,-222|-9|0xff2600", 90, 98, 846, 535, 980 } --多点找色

t['注册完成']={ 0xff5b7e, "-170|-32|0x2be99d,270|25|0xfdd54b", 90, 23, 715, 613, 952 } --多点找色

function tips()
	if d('tips_定位取消',true) then
	elseif d('tips_立即进入',true) then
	elseif d('tips_同意',true) then
	
	else
		moveTo(495,643,114,672)
	end
end



function reg()
	local 好友邀请码 = true
	local 取号 = false
	local 打码 = false
	local 验证码 = false
	local 取号 = false
	local timeline = os.time()
	local timeout = 60 * (math.random(2,3))
	
	while os.time() - timeline < timeout do
		if active(appbid,5) then
			
			
			if d('三言_主界面') then	
				click(311,1083)
			elseif d('三言_登录界面',true) then	
			elseif d('三言_注册界面') then	
				if 好友邀请码 then
					if d('三言_注册界面_邀请码',true) then	
						yqm = '325907'
						input(yqm)
						好友邀请码 = false
						取号 = true
					end	
				elseif 取号 then
					if GET_Phone(id) then
						click(170,379)
						input(phone)
						取号 = false
						打码 = true						
					end	
				elseif 打码 then
					yzmzoom ={ 420, 450, 581, 503 }
					imgfile = lzScreen(420, 450, 581, 503 ,1.0)
					if lz_yzm()then
						click(163,476)
						inputword(apple_yzm)
						打码 = false
						验证码 = true
					end	
				elseif 验证码 then
					if d('三言_注册界面_获取验证码',true) then
					
					elseif getMessage(id,phone) then
						click(172,563)
						input(sms)
						验证码 = false
						提交 = true
					else
						delay(3)
					end	
				elseif 提交 then
					if d('三言_注册界面_提交',true) then
					else
						click(315,168)
					end
				end	
			elseif d('注册完成') then	
				upidfa()
				return true
			else
				tips()
			end
		end
		delay(1)
	end

end


while true do
	vpnx()
	if vpn() then
		if awzNew() then
			if reg() then
				reName(phone)
			end	
		end	
	end
end








































































