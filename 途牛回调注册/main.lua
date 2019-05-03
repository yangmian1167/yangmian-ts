require("TSLib")
require("AWZ")
require("tsp")












var ={}
appbid = {}
appbid.tn = 'com.tuniu.app'






function up_idfa888()
local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or getDeviceName()
--	idfalist.phoneimei = phoneimei or sys.mgcopyanswer("SerialNumber")
	idfalist.phoneos = phoneos or getOSVer()
	idfalist.name = name
	idfalist.idfa = idfa
	idfalist.ip = ip or ip() or '192.168.1.1'
	idfalist.account = keyword or account
	idfalist.password = password
	idfalist.phone = phone
	idfalist.other = other
	return post(url,idfalist)
end

function checkidfa(name)
	local url = "http://api.refanqie.com/1/hlw-coreapi/channel/checkIdfa.json"
	local postArr = {}
	postArr.appid =bid[name]['appid']
	postArr.idfa=idfa
	postArr.ip=ip or get_ip() or rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)
	postArr.channel = var.channel
	postArr.keyword = bid[name]['keyword']

	index = 0
	post_data = ''
	
	for k,v in pairs(postArr)do
		index = index + 1
		if index == #postArr then
			post_data = post_data..k..'='..v
		else
			post_data = post_data..k..'='..v..'&'
		end
	end
	url = url..'?'..post_data
	log(url)
	log(postArr)
	local getdata = get(url)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		if data[idfa] == 0 then
			log("idfa: OK.",true)
			return true
		else
			log("idfa------排重失败",true)
		end
	end
end



for i = 1, 600 do
	log(myRand(4,math.random(8,12)))

	mSleep(1000)
end











