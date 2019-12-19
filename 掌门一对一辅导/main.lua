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
	idfalist.name = name or '掌门1对1辅导注册'
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
appbid = 'com.zmlearn.ZMClient'
url = 'https://apps.apple.com/cn/app/id1087718769'



t = {}
t['手机号界面']={ 0x309fec, "-63|-12|0x309fec,-75|-11|0x309fec,-77|-11|0xffffff,-233|-18|0x309fec,-291|-25|0xffffff", 90, 274, 1037, 616, 1090 } --多点找色
t['手机号界面_下一步']={ 0xef4c4f, "-99|-13|0xffffff,-100|-18|0xef4c4f,-246|-44|0xef4c4f,43|1|0xef4c4f", 90, 159, 605, 504, 742 } --多点找色
t['验证码界面']={ 0x4b4b4b, "289|51|0xc1c1c1,282|-1|0xa6a6a6,5|47|0x696969,54|51|0xcccccc", 90, 72, 171, 387, 245 } --多点找色
t['tips_立即开始']={ 0xef4c4f, "0|-5|0xffffff,-116|-47|0xf04f52,94|51|0xef4c4f,91|12|0xffffff", 90, 169, 936, 494, 1083 } --多点找色
t['注册完成']={ 0xef4c4f, "-125|-28|0xffffff,-143|-29|0xffffff,-277|-63|0xef4c4f,13|1|0xef4c4f,42|-54|0xef4c4f", 90, 101, 972, 526, 1104 } --多点找色

function openU()
	local timeline = os.time()
	local outtime = 30
	openURL(url)
	delay(15)
	return true
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
	jiema = _vCode_lx()
	jiema.login()
	account = myRand(4,8)
	password = myRand(4,9)
	local 取号 = true
	local 短信 = false
	local 提交 = false
	
	local timeline = os.time()
	local outtime = math.random(120,180)
	while os.time() - timeline < outtime do
		if active(appbid,5) then
			if d('手机号界面') then
				if d('手机号界面_下一步',true) then
				elseif 取号 then
					phone = jiema.getPhone()
					if phone ~= nil or phone ~= '' then
							if checkphone() then
								click(132,457)
								delay(2)
								inputword(phone)
								delay(2)
								click(580,657)
								短信 = true
								取号 = false
								
							else
								return false
							end
					end
				end	
			elseif d('验证码界面') then
				if 短信 then
					sms = jiema.getMessage()
					if sms ~= nil or sms ~= '' then					
						input(sms)
						提交 = true
						短信 = false
						
					end
				end	
			elseif d('注册完成') then
				if 提交 then
					upidfa()
					return true
				end	
			else
				d('tips_立即开始',true)
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















