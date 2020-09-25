-- 世纪佳缘-mac
-- sjjy.lua  

-- Create By TouchSpriteStudio on 21:25:52   
-- Copyright © TouchSpriteStudio . All rights reserved.
	
	




require("TSLib")
require("tsp")
require("AWZ")
require("jiema")



var = {}
var.appbid = "com.jiayuan.jiayuaniphone";
var.phone = ''
var.password = ''
t={}

sys = {
	clear_bid = (function(bid)
		closeApp(bid)
		delay(1)
		os.execute("rm -rf "..(appDataPath(bid)).."/Documents/*") --Documents
		os.execute("rm -rf "..(appDataPath(bid)).."/Library/*") --Library
		os.execute("rm -rf "..(appDataPath(bid)).."/tmp/*") --tmp
		clearPasteboard()
		--[[
		local path = _G.const.cur_resDir
		os.execute(
			table.concat(
				{
					string.format("mkdir -p %s/keychain", path),
					'killall -SIGSTOP SpringBoard',
					"cp -f -r /private/var/Keychains/keychain-2.db " .. path .. "/keychain/keychain-2.db",
					"cp -f -r /private/var/Keychains/keychain-2.db-shm " .. path .. "/keychain/keychain-2.db-shm",
					"cp -f -r /private/var/Keychains/keychain-2.db-wal " .. path .. "/keychain/keychain-2.db-wal",
					'killall -SIGCONT SpringBoard',
				},
				'\n'
			)
		)
		
		]]
		clearAllKeyChains()
		clearIDFAV() 
		--clearCookies()
		delay(2)
		return true
	end)
}

function start()
	local info = getOnlineName()
--	local info = get_curren()
	print_r(info)
	jfq.idfa = strSplit(info[8],":")[2]
	jfq.os_version = strSplit(info[3],":")[2]
	jfq.device = strSplit(info[3],":")[2]
	jfq.udid = strSplit(info[4],":")[2]
end

function jm_key()
	if bid[work]['adid'] == 'lx' then
		log('来信平台')
		User = 'api-18190-rKpL6bd'
		Pass = '135246'
	--	PID = '2099'
		PID = '57'
		dxcode = _vCode_lx()
	elseif bid[work]['adid'] == 'ma' then
		log('马大帅平台')
		User = 'zhangvsqaz'
		Pass = '135246'
		PID = '7886'
		dxcode = _vCode_ma()
	elseif bid[work]['adid'] == 'zj' then
		log('致敬平台')
		User = 'zhangvsqaz'
		Pass = '135246'
		PID = '10078'
		dxcode = _vCode_zj()
	end
	dxcode.login()
end

function rdclicks(x,y,n)
	if n == 0 then
		return false
	end
	for i=1,n do
		click(x,y,0.5)
	end
end



function up(other)
	local url = 'http://hb.wenfree.cn/api/Public/idfa/'
	local postdate = {}
	postdate.service = 'Idfa.Idfa'
	postdate.name = '世纪佳缘'
	postdate.idfa = var.phone
	postdate.password = var.password
	postdate.other = other
	log(post(url,postdate))
	-- body
end


function back_pass(task_id,success)
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.backpass'
	local postArr = {}
	postArr.task_id = task_id
	postArr.success = success
	nLog( post(url,postArr) )
end
function reg()
	local timeline = os.time()
	local outTimes = 60 * 1
	local 手机号 = true
	local 短信 = false
	local 提交 = false
	var.password  = "AaDd112211"
	local fix_info = false
	
	while os.time()-timeline < outTimes do
		if active(var.appbid,5) then
			if d('填写资料') or d('上传头像_跳过') then
				return true
			elseif d('手机号注册界面') then
				if 手机号 then
					var.phone = dxcode.getPhone()
					if #var.phone == 11 then
						delay(2)
						click(354,326)
						input[3](var.phone)
						手机号 = false
						短信 = true
					end
				elseif 短信 then	
					if d('手机号注册界面_获取验证码',true) then
					else	
						var.sms = dxcode.getMessage()
						if #var.sms == 5 then
							input[3](var.sms)
							click(187,437)
							input[3](sms)
							up('点击注册')
							短信 = false
							提交 = true
							
						else
							return false
						end	
					end
				end
			elseif 提交 then
--				if d('填写资料') then
--					up('填写资料')
					return true
--				end
			end	
		end
		delay(2)
	end

end

--[[]]
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
	jm_key()
--	model = tostring(readFile("/var/mobile/model.txt")[1])
--	nLog(model)
--	callback_key = false
--	ip = get_ip()
	----------------------------------
	vpnx()
	delay(3)
	if false or vpn() then
		delay(3)
--		if false or checkip()then
--			if v.json == "回调" then
--				callback_key = true
--			end
			other_txt = ''
			if sys.clear_bid(var.appbid)then
--			if awzNew() then
				if reg()then
						back_pass(task_id,"ok")
					end
--					if 填资料ios10() then
--						back_pass(task_id,"ok")
--					end	
				end
			end	
--		end
		delay(2)
	end
end
--]]





