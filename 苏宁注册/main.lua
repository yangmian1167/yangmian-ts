require('TSLib')
require('tsp')
require('AWZ')
require('ALZ')
 

var = ''
appbid = 'SuningEMall'

id = '10072'
t = {}
t['苏宁主界面'] =  {0x686868, "-16|39|0xffffff,-501|37|0xffc30d,-506|7|0xfffcf8,-519|-5|0xffffff", 90, 12, 1041, 625, 1133}
t['登录界面点注册'] =  { 0xff6600, "-10|-1|0xff6804,-249|-2|0x3a3a3a,-552|-1|0x222222", 90, 15, 53, 610, 110}
t['注册协议同意'] =  { 0xffffff, "-52|1|0xff7c00,-215|-35|0xff8d00,333|18|0xff5701", 90, 26, 1031, 615, 1125}
t['注册界面'] =  { 0xd8d8d8, "0|30|0xc8c8c8,59|30|0xc8c8c8,60|1|0x848484", 90, 277, 58, 361, 109}
	t['注册界面_手机号界面'] =  { 0xff6600, "-560|0|0xff6600", 90, 32, 355, 614, 362}
		t['注册界面_手机号界面_注册'] =  { 0xffffff, "-276|-21|0xff7800,233|23|0xff9900", 90, 26, 399, 613, 489}
	t['注册界面_验证码界面'] =  { 0x222222, "80|31|0x868686,192|1|0x828282,193|31|0xe1e1e1", 90, 34, 178, 254, 231}
t['已注册的手机号'] =  { 0xff7920, "-38|1|0xff8534,-42|1|0xff6701,-233|1|0x999999", 90, 63, 583, 560, 657}	
t['新用户注册'] =  { 0xff6600, "-2|34|0xff6600,-84|-108|0xff8500,50|-147|0xff9300", 90, 132, 445, 518, 717}
t['隐私声明同意'] =  { 0xffffff, "-128|-21|0xff8300,99|17|0xff4200,-385|-15|0xf2f2f2", 90, 48, 1026, 593, 1119}
t['电话验证注册界面'] =  { 0xffffff, "-263|-30|0xff8a00,206|21|0xfe5900,200|-328|0xff5500,201|-350|0xff5500", 90, 24, 40, 585, 478}
t['我的易购界面'] = { 0xff9b00, "0|-9|0xffffff,-72|13|0xffffff,-377|-1|0x666666,-530|6|0x666666", 90, 28, 1047, 616, 1129}
t['我的易购界面_注册完成'] ={ 0x48453d, "-17|-1|0x978f74,-58|-6|0xfff0bc,20|10|0xfff0bc,20|8|0xdacda2", 90, 38, 188, 126, 229}
t['设置密码界面'] = { 0xa4a4a4, "-3|11|0x222222,1|30|0x8a8a8a,136|1|0x848484,135|31|0x868686", 90, 29, 180, 192, 235}
t['设置密码界面_提交注册'] ={0xffffff, "-255|-23|0xff7800,195|14|0xff9900,-21|4|0xff8b00", 90, 51, 390, 559, 502}



t['输入手机号界面'] ={ 0xffffff, "-55|-2|0xffffff,-103|-25|0xff8500,52|16|0xfe5a00,-354|5|0xff5500", 90, 33, 339, 600, 584}
t['输入验证码界面'] ={0xff5500, "11|0|0xff5500,103|0|0xff5500,105|0|0xffffff,134|0|0xffffff,136|0|0xdddddd", 90, 62, 378, 582, 387}
t['滑动验证模块'] ={ 0xdddddd, "0|89|0xdddddd,32|56|0x999999,55|45|0x999999,92|83|0xe8e8e8,501|7|0xe8e8e8", 90, 61, 330, 581, 427}
function reg()
	local 获取手机号 = true
--	local 打码 = false
	local 验证码 = false
	local 取号 = false
	local timeline = os.time()
	local timeout = 60 * (math.random(2,3))
	while os.time() - timeline < timeout do 
		if active(appbid,5) then
			if d('已注册的手机号',true) then
			elseif d('我的易购界面') then
				if d('我的易购界面_注册完成') then
					reName(phone)
					return true
				end	
			elseif d('电话验证注册界面') then
				reName('废弃-电话验证')
				return true
			elseif d('隐私声明同意',true) then
			elseif d('新用户注册',true) then
			elseif d('苏宁主界面',true) then
			elseif d('登录界面点注册',true) then
			elseif d('注册协议同意',true) then
			elseif d('输入手机号界面') then
				if d('滑动验证模块') then
					moveTo(114,  392,  541,  360)
				elseif 获取手机号 then
					if GET_Phone(id) then
						click(108,296)
						inputword(phone)						
						获取手机号 = false
						验证码 = true					
					end
				else
					d('输入手机号界面',true)
				end
			elseif d('输入验证码界面') then	
				if 验证码 then
					if getMessage(id,phone) then	
						inputword(sms)
						delay(15)
						验证码 = false
					end	
				end	
--			elseif d('注册界面') then
--				if d('设置密码界面') then
--					if d('设置密码界面_提交注册',true)  then
--					else
--						click(116,327)
--						inputword('Aa112211')
--					end
--				elseif d('注册界面_手机号界面') then
--					if 获取手机号 then
--						if GET_Phone(id) then
--							click(112,319)
--							inputword(phone)
--							获取手机号 = false
--							验证码 = true					
--						end
--					elseif d('注册界面_手机号界面_注册',true) then
--					end
--				elseif d('注册界面_手机号界面_注册',true) then
--				elseif d('注册界面_验证码界面') then
--					if 验证码 then
--						if getMessage(id,phone) then	
--							inputword(sms)
--							delay(15)
--							验证码 = false
--						end	
--					end	
--				end
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
