require('TSLib')
require('tsp')
require('AWZ')
require('ALZ')
 
function up(name,other)
	local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or getDeviceName()
	idfalist.phoneimei = phoneimei or getDeviceType(); 
	idfalist.phoneos = phoneos or getOSType(); 
	idfalist.name = '爱钱进注册'
	idfalist.idfa = idfa or phone
	idfalist.ip = ip() or "192.168.1.1" 
	idfalist.account = account
	idfalist.password = password
	idfalist.phone = phone
	idfalist.other = other
	return post(url,idfalist)
end
var = ''
appbid = 'com.iqianjin.iqianjinplus'

id = '13185'
t = {}
t['注册登录手机号界面'] = { 0xa2a2a4, "-4|55|0x8e8e90,467|57|0x989899,469|51|0xd3d3d4,458|-1|0xb5b5b6", 90, 33, 152, 540, 247}
t['注册登录手机号界面_下一步'] = {  0xffffff, "-263|21|0xff8f00,-261|-25|0xff8f00,228|20|0xff6e00,241|-24|0xff6c00", 90, 24, 500, 617, 620}
t['输入验证码界面'] = { 0xa9a9aa, "-8|48|0x949495,8|59|0xb0b0b1,429|2|0xc1c1c2,428|57|0xbcbcbd", 90, 31, 161, 491, 237}
t['设置密码界面'] = { 0xd1d1d2, "-3|4|0x3a3a3d,0|54|0xdededf,367|54|0x8c8c8e,366|1|0xc1c1c2", 90, 31, 157, 430, 244}
t['设置密码界面_完成'] = {0xff7b00, "-273|-10|0xff8e00,227|0|0xff6c00,235|-10|0xff6b00", 90, 34, 666, 608, 701}
t['主页注册完成'] = {0xc5bae1, "-5|-27|0x940ea8,-139|-38|0x72bcff,-272|-41|0xffd75d,-522|-49|0xeb49ee", 90, 38, 1032, 615, 1124}
t['tips_三重好礼'] = { 0xdadada, "-24|12|0xacacac,22|15|0xdedede,-2|20|0x414141", 90, 278, 909, 355, 946}
t['tips_开始使用开前进'] = { 0xffffff, "-62|-112|0xff9100,-229|-32|0xff8c00,209|35|0xff6e00,-29|-69|0x1a1e2b", 90, 62, 812, 586, 987}
function reg()
	local 获取手机号 = true
--	local 打码 = false
	local 验证码 = false
	local 取号 = false
	local 提交 = false
	local 上传 = false
	local timeline = os.time()
	local timeout = 60 * (math.random(2,3))
	while os.time() - timeline < timeout do 
		if active(appbid,5) then
			if d('注册登录手机号界面') then
				if d('注册登录手机号界面_下一步',true) then
				elseif 获取手机号 then
					if GET_Phone(id) then
						click(100,418)
						inputword(phone)						
						获取手机号 = false
						验证码 = true					
					end
				end
			elseif d('输入验证码界面') then	
				if 验证码 then
					if getMessage(id,phone) then	
						inputword(sms)
						delay(15)
						验证码 = false
						提交 = true
					end	
				end	
			elseif d('设置密码界面') then
				if d('设置密码界面_完成',true) then
				elseif 提交 then
					password = myRand(4,8)
					inputword(password)
					提交 = false
					上传 = true
				end	
			elseif 上传 then
				if d('主页注册完成') then
					up('爱钱进福利版','初次注册')
					delay(3)
					return true
				end
			else
				if d('tips_三重好礼',true) then
				elseif d('tips_开始使用开前进',true) then
				end
			end
		end
		delay(1)
	end	
	reName('超时')
end


for i = 1 , 300 do
	vpnx()
	if  vpn() then
		if awzNew() then
			if reg() then
			end	
		end	
	end
end



