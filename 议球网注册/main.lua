require("TSLib")
require("tsp")
require("AWZ")
require("alz")

function upidfa(name,other)
	local url = 'http://wenfree.cn/api/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or getDeviceName()
	idfalist.phoneimei = phoneimei or getDeviceType(); 
	idfalist.phoneos = phoneos or getOSType(); 
	idfalist.name = name or '议球网'
	idfalist.idfa = idfa or phone 
	idfalist.ip = ip() or "192.168.1.1" 
	idfalist.account = account
	idfalist.password = password
	idfalist.phone = phone
	idfalist.other = other
	return post(url,idfalist)
end

function getdate()
	local sz = require("sz")
	local json = sz.json
	local url = "http://news.wenfree.cn/phalapi/public/?"
	local arr = {}
    arr['service'] = 'App.Site.Idcard'
	local data = post(url,arr)
	if data then
--		log(data)
		return data
	end
end

--inf = getdate()
--log(inf)




init(0)

var = ''
appbid = 'com.fpnativeapp.nspoc'
url = 'https://171tiyu.com/download/android?channelCode=Web_Landing_Page'
--url = 'https://y346df.openinstall.io/ulink/c/eyJjIjoiV2ViX0xhbmRpbmdfUGFnZSIsIm0iOiJoMFo5OEw3QjlFOEFBQUZ1WThpeDlHaDR3TEhYYnNRU3M5OURadzg1VTBGSHRQRDNPZzNBTklvTjk5djQzMjVGa1BRUm92ZjIifQ=='



t = {}
t['yqw_注册界面']={ 0x3979b7, "-63|20|0xc92d40,-88|15|0x091421,-128|15|0xc92d40,-142|13|0x091421", 90, 164, 166, 490, 290 } --多点找色
t['yqw_注册界面_验证']={ 0xffffff, "-66|-18|0xc3232a,29|6|0xc3232a", 90, 479, 383, 599, 432 } --多点找色
t['yqw_注册界面_Done']={ 0x0b0a0a, "-23|-2|0x000000,-30|-3|0x000000,-65|1|0x000000", 90, 539, 634, 626, 686 } --多点找色
t['yqw_注册界面_登录']={ 0xffffff, "-167|-21|0xd9362e,94|20|0xd9362e,126|62|0x091421", 90, 118, 607, 549, 731 } --多点找色
t['yqw_tips_登录失败']={ 0x007aff, "-41|-1|0x007aff,-1|-107|0x000000", 90, 278, 491, 367, 674 } --多点找色
t['yqw_选择你感兴趣的']={ 0x000000, "47|-8|0xffffff,164|121|0xe93838,189|85|0x142233", 90, 110, 54, 532, 236 } --多点找色
t['yqw_选择你感兴趣的_储存进入']={ 0xe93838, "-150|-6|0xffffff,-298|-43|0xe93838,5|-40|0xe93838", 90, 96, 1028, 549, 1131 } --多点找色
t['打开']={ 0x007aff, "-9|0|0xffffff,-18|2|0x007aff,-140|2|0x007aff", 90, 339, 604, 550, 668 } --多点找色
function openU()
	local timeline = os.time()
	local outtime = 30
	openURL(url)
	while os.time()-timeline < outtime do
		if d('打开',true) then
			delay(15)
			return true
		end
	end
	return false
end

function checkphone()
	local url = 'http://wenfree.cn/api/Public/idfa/?service=Ip.Checkphone&name=掌门1对1辅导注册&phone='..phone
	local getdata = get(url)
	if getdata ~= nil then
		local data = getdata
		log(data or "nil")
		if data.data.state == "ok" then
			log("手机号可以用:OK.",true)
			return true
		else
			log("手机重复, 排重失败",true)
			return false
		end
	end
end



function reg()
	jiema = _vCode_lx2()
	jiema.login()
	account = myRand(4,8)
	password = myRand(4,9)
	local 取号 = true
	local 短信 = false
	local 提交 = false
	local 杀掉一次app = true
	
	local timeline = os.time()
	local outtime = math.random(120,180)
	while os.time() - timeline < outtime do
		if active(appbid,5) then
			if 杀掉一次app then
				delay(7)
				click(306,409)
				closeApp(appbid)
				杀掉一次app = false
				delay(3)
			elseif d('yqw_注册界面') then
				if 取号 then
					phone = jiema.getPhone()
					if phone ~= nil or phone ~= '' then
							if checkphone() then
								click(306,409)
								delay(2)
								inputword(phone)
								取号 = false
								短信 = true
							else
								return false
							end
					end
				elseif 短信 then
					if d('yqw_注册界面_验证',true) then
						delay(4)
					else	
						sms = jiema.getMessage()
						if sms ~= nil or sms ~= '' then	
--							phone = phone
--							phone_again = jiema.getPhone_again()
--							if phone_again ~= nil or phone_again ~= '' then
--								sms = jiema.getMessage()
--								if sms_again ~= nil or sms_again ~= '' then		
									click(286,539)
									delay(3)
									inputword(sms)
									短信 = false
									提交 = true
								end	
--							end		
--						end
					end
				elseif 提交 then
					if d('yqw_注册界面_Done',true) then
					
					elseif d('yqw_注册界面_登录',true) then
						upidfa()
						return true
					end	
				end	
			elseif d('yqw_选择你感兴趣的') then
				if d('yqw_tips_登录失败',true) then
				else
				end
					
			else
				if d('yqw_tips_登录失败',true) then
				end	
			end	
		end	
		delay(1)
		log('休息1秒')
	end	
	return false
end





--[[]]

function main()
	vpnx()
	if vpn() then
		openU()
		if awzNew() then
			tb = get_curren()
			idfa = strSplit(tb[8],':')[2]
			if reg() then
			end	
		end
	end
end


--]]
--[[]]


while true do
	local ret,errMessage = pcall(main)
	if ret then
		log(errMessage)
	end
end	

--]]







