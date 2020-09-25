--require("TSLib")
--require("tsp")





function up(name,other)
	local url = 'http://wenfree.cn/api/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or getDeviceName()
	idfalist.phoneimei = phoneimei or getDeviceType(); 
	idfalist.phoneos = phoneos or getOSType(); 
	idfalist.name = name
	idfalist.idfa =	idfa or 'ceshizhunebi2'
	idfalist.ip = ip or get_ip() or "192.168.1.1" 
	idfalist.account = bid[name]['keyword'] or account
	idfalist.password = password
	idfalist.appid = bid[name]['appid']
	idfalist.phone = phone
	idfalist.other = other
	return post(url,idfalist)
end



function back_pass(task_id,success)
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.backpass'
	local postArr = {}
	postArr.task_id = task_id
	postArr.success = success
	nLog( post(url,postArr) )
end



function checkidfa(name)
	nLog("准备查询->checkidfa")
	local url = "http://wenfree.cn/api/Public/idfa/"
	local postArr = {}
	postArr.service = 'Idfas.Distinct'
	postArr.uid = bid[name]['adid']
--	postArr.uid = '2106'
	postArr.source = 'meizh'
	postArr.appid = bid[work]['appid']
	postArr.idfa = idfa
	postArr.device = model
	postArr.os = os_version
	postArr.ip =ip or get_ip() or rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)
--	postArr.keyword = e:escape(keyword)
	postArr.keyword = bid[name]['keyword']
	postArr.udid = udid

	local postdata = ""
	for k,v in pairs(postArr)do
		postdata = postdata .."&" ..k.."="..v
	end

	url = url.."?"..postdata
	nLog(url)
	local getdata = get(url)
	if  getdata ~= nil then
		local data = getdata
		nLog(data or "nil")
		if tonumber(data.data[idfa]) == 0 then 
			nLog("idfa: OK.",true)
			return true
		else
			nLog("idfa------排重失败",true)
		end
	end
end


function clickidfa(name)
	nLog("准备点击")
	local url = "http://wenfree.cn/api/Public/idfa/"
	local postArr = {}
	postArr.service = 'Idfas.Click'
	postArr.uid = bid[name]['adid']
--	postArr.uid = '2106'
	postArr.source = 'meizh'
	postArr.appid = bid[work]['appid']
	postArr.idfa = idfa
	postArr.device = model
	postArr.os = os_version
	postArr.ip =ip or get_ip() or rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)
--	postArr.keyword = e:escape(keyword)
	postArr.keyword = bid[name]['keyword']
	postArr.udid = udid
--	if callbackKey then
--		postArr.callback  = e:escape("http://idfa888.com/Public/idfa/?service=idfa.callback&idfa="..idfa)
----		postArr.callback  = "http"
--	end
	
	local post_data = ''
	for k,v in pairs(postArr)do
		post_data = post_data..k..'='..v..'&'
	end
	
	url = url..'?'..post_data
	nLog("url----------------\n" .. url)
	nLog(postArr)

	local getdata = get(url)
	if getdata ~= nil then
		local data = getdata
		nLog(data or "nil")
		if  data.data.msg == 'success' then
			nLog("点击成功: OK.",true)
			return true
		else
			nLog("idfa-点击失败",true)
		end
	else
		nLog("点击返回空")
	end
end


function activeidfa(name)
	nLog("准备点击-上报")
	local url = "http://wenfree.cn/api/Public/idfa/"
	local postArr = {}
	postArr.service = 'Idfas.Report'
	postArr.uid = bid[name]['adid']
	postArr.source = 'meizh'
	postArr.appid = bid[work]['appid']
	postArr.idfa = idfa
	postArr.device = model
	postArr.os = os_version
	postArr.ip = ip or get_ip() or rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)..'.'..rd(1,255)
	postArr.keyword = bid[name]['keyword']
	postArr.udid = udid
--	if callbackKey then
--		postArr.callback  = e:escape("http://wenfree.cn/api/Public/idfa/?service=Idfa.Callbackname&idfa="..idfa.."&name="..name)
----		postArr.callback  = "http"
--	end

	local post_data = ''
	for k,v in pairs(postArr)do
		post_data = post_data..k..'='..v..'&'
	end

	url = url..'?'..post_data
	nLog("url----------------\n" .. url)
	nLog(postArr)

	local getdata = get(url)
	if getdata ~= nil then
		local data = getdata
		nLog(data or "nil")
		if tonumber(data["code"]) == 200 or data.data.msg == 'success' then
			nLog("激活成功: OK.",true)
			back_pass(task_id,"ok")
			return true
		else
			nLog("idfa-激活失败",true)
		end
	else
		nLog("点击返回空")
	end
end


--排重-点击-end
function callbackapi(name)
	if awz() then
		tb = get_curren()
		idfa = strSplit(tb[8],':')[2]
		model = model
		os_version = strSplit(tb[3],':')[2]
		udid = strSplit(tb[4],':')[2]
		
		local dtassss = up(name,bid[name]['keyword'])
		if dtassss ~= nil then
			callbackid = json.decode(dtassss)['data']['id']
			if callbackid ~= nil then
				if checkidfa(name)then
					if clickidfa(name,true)then
						delay(rd(60,65))
						newidfa(name,1)
					end
				end
			end
		end
	end
end

function activeapi(name)
	log("name->" .. name)
	if awz() then
		tb = get_curren()
		idfa = strSplit(tb[8],':')[2]
		model = model
		os_version = strSplit(tb[3],':')[2]
		udid = strSplit(tb[4],':')[2]
--		if checkidfa(name)then
--			if clickidfa(name)then
--				delay(rd(60,65))
--				vkey = rd(100,100)
--				nLog(vkey)
--				if vkey > 40 then
					nLog('准备激活')
					newidfa(name)
--				elseif vkey <= 40 then
--					nLog('准备试玩')
--					newplayer(name)
--				end
--				if activeidfa(name)then
--					up(name,bid[name]['keyword'].."-激活成功")
					up(name,bid[name]['keyword'].."-awz测试")
--				end
--			end
--		end
	end
end

t = {}
t['游客登录']={ 0xf7663a, "-31|-5|0xf7663a,-129|-59|0xff8433,-181|-118|0xfb7037,-223|-400|0xf96a3b,-249|-452|0xf87446", 90, 232, 298, 618, 821 } --多点找色
t['进入游戏']={ 0xfefcfa, "-118|-28|0xfa6839,81|27|0xff8433,100|-40|0xfc7736", 90, 191, 717, 485, 833 } --多点找色
t['角色进入游戏']={ 0x674618, "-60|-22|0xf2eaa2,-106|-54|0xccaf33,8|-29|0x795b1f", 90, 255, 949, 423, 1029 } --多点找色
t['实名认证']={ 0x515151, "7|-8|0x515151,-9|-9|0x515151,-320|-11|0xf8663d,-286|2|0xf8663d,-280|7|0xffffff", 90, 252, 310, 613, 361 } --多点找色

function newidfa(name)
	local TIMEline = os.time()
	local OUTtime = rd(25,28)
	while os.time()- TIMEline < OUTtime do
		if active(bid[name]['appbid'],4)then
			nLog('进入循环')
				moveTo(600,300,100,100,30,50)
				delay(1)
				click(321, 978)
				delay(1)
				click(462, 666)
				delay(1)
				delay(1)
				click(324,903)
--				click(324,876)
--				click(463,664)
--				click(541,839)
		end
		delay(1)
	end
	return true
end

function newplayer(name)
	local TIMEline = os.time()
	local OUTtime = rd(180,240)
	while os.time()- TIMEline < OUTtime do
		if active(bid[name]['appbid'],4)then
			nLog('进入循环')
			if d('实名认证',true) then
			elseif d('游客登录',true) then
				delay(10)
				vpnx()
				closeApp(bid[name]['appbid'])
			elseif d('进入游戏',true) then
			elseif d('角色进入游戏',true) then
			else
				delay(1)
				click(324,903)
--				click(324,876)
--				click(463,664)
--				click(541,839)
			end
		end
		delay(1)
	end
	return true
end



function main(v)
	----------------------------------
	if false or vpn() then
		if true or checkip()then
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
--			model = tostring(readFile("/var/mobile/model.txt")[1])
			model = 'iPhone10,2'
			nLog(model)
			callback_key = false
			ip = get_ip()
			if v.json == "回调" then
				callback_key = true
			end
			activeapi(work)
		end
		vpnx()
		delay(2)
	end
end



















