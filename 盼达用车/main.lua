require("TSLib")
require("tsp")
require("AWZ")
require("ALZ")




---主要参数
var = {}

safari_bid = 'com.apple.mobilesafari'
url = 'https://act.pand-auto.com//h5sharePage/?code=0G6874'

t = {}
t['加载中']={ 0x007aff, "", 90, 29, 106, 616, 124 } --多点找色 
t['主页面1']={ 0x3c2710, "-6|59|0x544425,562|-28|0x049082,560|80|0xf0f0f0", 90, 0, 0, 639, 1135 } --多点找色
t['主页面2']={ 0x86d0ab, "-219|-32|0x27282d,235|35|0x27282d,236|-37|0x27282d", 90, 31, 89, 617, 1134 } --多点找色
	t['主页面_获取验证码']={ 0xa6d4ae, "-87|-39|0xa6d4ae,72|31|0xa6d4ae", 90, 299, 100, 602, 1086 } --多点找色
	t['主页面_点击输入验证码']={ 0xa9a9a9, "262|-43|0xcccccc,419|24|0xcccccc,-8|-1|0xffffff", 90, 35, 762, 632, 1032 } --多点找色


t['注册完成']={ 0xffffff, "-124|-98|0xffffff,-117|-157|0x000000,131|-202|0x000000", 90, 82, 154, 564, 491 } --多点找色

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



id = '15255'

function reg()
	local 取号 = true
	local 验证码 = false
	local 取短信 = false
	local 提交 = false
	
	while true do
		if active(safari_bid,5) then
			if d('加载中') then
			elseif d('主页面1') or d('主页面2') then
				if 取号 then
					if GET_Phone(id) then
						delay(3)
						click(182, 861)
						input(phone)
						取号 = false
						验证码 = true
					end	
				elseif 验证码 then
					if d('主页面_获取验证码',true) then
						验证码 = false
						取短信 = true
					end	
				elseif 取短信 then
					if getMessage(id,phone) then
						if d('主页面_点击输入验证码',true) then
							input(sms)
							delay(2)
							d('主页面2',true)
						end
					end					
				end
			elseif d('注册完成') then	
				up('盼达用车','注册完成')
				return true
			end
		end	
		delay(1)
    end
end	


vpnx()
if vpn() then
	openURL(url)

	delay(5)
	reg()
end












