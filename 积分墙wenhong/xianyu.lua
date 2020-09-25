-- 积分墙对接
-- xtjfq.lua  

-- Create By TouchSpriteStudio on 16:26:24   
-- Copyright © TouchSpriteStudio . All rights reserved.
	
	
	

	
	
	
	
-- 积分墙对接
-- xiaoq.lua  

-- Create By TouchSpriteStudio on 13:15:24   
-- Copyright © TouchSpriteStudio . All rights reserved.




package.loaded['AWZ'] = nil
require("TSLib")
require("AWZ")
--require("ALS")
require("tsp")

local var={}
local jfq={}


jfq.url = 'http://ad.masaike2018.com/ad/'
jfq.model = ''
jfq.adid = '1185'
jfq.appid = '1487600417'
jfq.keyword	= '花束'
jfq.idfa = ''
jfq.os_version = ''
jfq.device = 'iPhone10,2'
jfq.udid = ''
jfq.callback = true
jfq.name = '聊天话术神器'
jfq.source = 'hbmh'
jfq.channel = 'mz'
jfq.bid = 'com.mei.kingkong'


function start()
	local info = getOnlineName()
--	local info = get_curren()
	print_r(info)
	jfq.idfa = strSplit(info[8],":")[2]
	jfq.os_version = strSplit(info[3],":")[2]
	jfq.device = strSplit(info[3],":")[2]
	jfq.udid = strSplit(info[4],":")[2]
end

function idfa_idfaPc()
	jfq.model = 'idfaRepeat'
	local service = jfq.url..jfq.model
	local postArr = {}
	postArr.appid = jfq.appid
	postArr.source = jfq.source
	postArr.idfa = jfq.idfa
--	log(postArr)
	local postdata = ''
	for k,v in pairs(postArr) do
		postdata = postdata .. '&'..k..'='..v
	end
	local service = service .."?"..postdata
	log(service);
	local res = get(service)
	if res and (res['status'] == 1) then
		log(res);
		jfq.token = res.token
		log("排重成功","all")
		return true
	end
end

function idfa_click()
	jfq.model = 'click'
	local service = jfq.url..jfq.model
	local postArr = {}
	postArr.appid = jfq.appid
	postArr.source = jfq.source
	postArr.device = jfq.device
	postArr.idfa = jfq.idfa
	postArr.os = jfq.os_version

	if jfq.callback then
		postArr.callback = urlEncoder("http://wenfree.cn/api/Public/idfa/?service=Idfa.Callback&idfa="..jfq.idfa.."&appid="..jfq.appid)
	end
	
	local postdata = ''
	for k,v in pairs(postArr) do
		postdata = postdata .. '&'..k..'='..v
	end
	local service = service .."?"..postdata
	log(service)
	local res = get(service)
	log(res)
	if res and (res['status']) == 1 then
		log("点击成功","all")
		return true
	end
end

function up(name,other)
	local url = 'http://wenfree.cn/api/Public/idfa/'
	local idfalist ={}
	idfalist.service = 'Idfa.Idfa'
	idfalist.phonename = getDeviceName()
--	idfalist.phoneimei = getIMEI()
	idfalist.phoneos = jfq.os_version
	idfalist.idfa = jfq.idfa
	idfalist.ip = get_ip()
	idfalist.account = jfq.kid
	idfalist.password = var.password
	idfalist.phone = var.phone
	idfalist.appid = jfq.appid
	idfalist.name = name
	idfalist.other = other
	log( post(url,idfalist) )
end

t={}
local degree = 85
t['agree']={0xff5100,"-196|-35|0xff7f00,-507|24|0xf2f2f2",degree,48,1124,707,1274}
t['skip']={0xf2f2f2,"506|-8|0xff4800,-17|-45|0xf2f2f2",degree,43,1190,713,1319}

function app()
	local timeLine = os.time()
	while os.time() - timeLine < rd(12,15) do
		if active(jfq.bid,1)then
			if d("agree",true,2)then
			elseif d("skip",true,2)then
			end
		end
		delay(1)
	end
	return true
end





function back_pass(task_id,success)
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.backpass'
	local postArr = {}
	postArr.task_id = task_id
	postArr.success = success
	nLog( post(url,postArr) )
end





function main(v)
	nLog(v)
	work = v.work
	task_id = v.task_id
	bid={}
	bid[work]={}
	bid[work]['adid']=v.adid
	bid[work]['keyword']=v.keyword
	bid[work]['appbid']=v.appbid
	bid[work]['appid']=v.appid
	nLog("act")
--	model = tostring(readFile("/var/mobile/model.txt")[1])
--	nLog(model)
--	callback_key = false
--	ip = get_ip()
	----------------------------------
	vpnx()
	delay(3)
	if vpn() then
		delay(3)
--		if false or checkip()then
--			if v.json == "回调" then
--				callback_key = true
--			end
			other_txt = ''
			if awzNew() then
				delay(4)
				start()
				if (idfa_idfaPc())then
					up(jfq.name,'排重成功')
					if(idfa_click())then
						up(jfq.name,'点击成功')
						if app() then
--							back_pass(task_id,"ok")
						end
					end
				end
			end	
--		end
		delay(2)
	end
end
function reg()
	vpnx()
	delay(3)
	if vpn() then
		delay(3)
--		if false or checkip()then
--			if v.json == "回调" then
--				callback_key = true
--			end
			other_txt = ''
			if awzNew() then
				delay(4)
				start()
				if (idfa_idfaPc())then
					up(jfq.name,'排重成功')
					if(idfa_click())then
						up(jfq.name,'点击成功')
						if app() then
--							back_pass(task_id,"ok")
						end
					end
				end
			end	
--		end
		delay(2)
	end
end

nLog(frontAppBid())
info = getOnlineName()
print_r(info)

for i = 1 , 250 do
	local ret,errMessage = pcall(reg)
	if ret then
	else
		nLog(errMessage)
--		sys.alert(errMessage, 3)
		delay(5)
	end
end
