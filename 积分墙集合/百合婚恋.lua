



require("TSLib")
require("tsp")
require("jiema")



var = {}
var.appbid = "com.baihe.online";
var.phone = '15033485259'
var.password = 'AaDd112211'
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


function jm_key()
	if bid[work]['adid'] == 'lx' then
		log('来信平台')
		User = 'api-18190-fElSmFlZyTiG'
		Pass = '199555'
		PID = '1770'
		dxcode = _vCode_lx()
	elseif bid[work]['adid'] == 'ma' then
		log('马大帅平台')
		User = 'zhangvsqaz'
		Pass = '135246'
		PID = '20206'
		dxcode = _vCode_ma()
	elseif bid[work]['adid'] == 'zj' then
		User = 'zhangvsqaz'
		Pass = '135246'
		PID = '10203'
		dxcode = _vCode_zj()
	
	elseif bid[work]['adid'] == 'lh' then
		log('蓝狐')
--		User = 'api-SMuo3byY'
--		Pass = '199555'		
		User = 'api-1pj8gnHT'
		Pass = 'wq000000'	
		PID = '839'
		dxcode = _vCode_lh()
	end	
	dxcode.login()
end

t['登录界面——注册']={0xff676f, "-317|3|0xff7272,-254|8|0xffffff,-474|10|0xffffff,172|6|0xfffcfc",90,15,48,735,200} --多点找色
t['注册界面']={0xff6c6b, "-1|-1|0xffeaea,-201|-33|0xffffff,-202|0|0xf34252,-491|-38|0xffffff,-536|2|0xffffff",90,16,53,736,241} --多点找色
	t['注册界面——手机号']={0xcacacf, "43|-13|0xffffff,41|-26|0xc7c7cc",90,233,352,508,426} --多点找色
	t['注册界面——立即注册']={0xffffff, "284|-49|0xff2e6d,-317|44|0xff7330,-19|-4|0xff514f",90,30,563,720,734} --多点找色
t['输入验证码界面']={0xfc6e27, "92|-10|0xf9f9f9,94|-12|0xfc6e27,92|13|0xfc6e27,434|3|0xeeeeee,435|3|0x000000,432|8|0x000000",90,11,52,481,116} --多点找色
t['基本信息界面']={0xfc6e27, "15|-18|0xfc6e27,15|15|0xf9f9f9,390|-9|0xdedede,391|-9|0x000000,389|-6|0x161616,389|-5|0xf9f9f9",90,14,48,714,672} --多点找色
t['基本信息界面ios10']={ 0x9a9a9a, "1|27|0xe7e7e7,115|-3|0x787878,128|-1|0x6b6b6b,124|27|0x606060", 90, 302, 65, 445, 105 } --多点找色
	t['基本信息界面-随机昵称']={0xff5f5e, "-62|-29|0xff5f5e,56|30|0xff5f5e,86|0|0xff5f5e,5|-2|0xffffff",90,523,140,734,227} --多点找色
	t['基本信息界面-随机男女']={0x7ba2fe, "405|3|0xff7d5e,-49|-47|0x809efe,539|43|0xff615e",90,35,383,708,629} --多点找色
t['完善信息界面']={0xfc6e27, "156|-11|0xf9f9f9,158|1|0xfc6e27,379|7|0xf9f9f9,382|4|0x000000,382|2|0xf9f9f9",90,5,51,476,115} --多点找色
t['完善信息界面ios10']={ 0x9c9c9c, "-12|3|0xa1a1a1,-12|30|0x8f8f8f,103|0|0x787878,112|30|0x606060", 90, 297, 62, 451, 108 } --多点找色
	t['完善信息界面-完成注册']={0xffffff, "-315|-43|0xfe7d46,270|42|0xff4971",90,59,1085,711,1252} --多点找色




t['tips_协议更新提示']={ 0x037aff, "-37|-4|0x037aff,-44|-4|0xffffff,-163|-187|0x268dff,-35|-301|0x000000,-24|-300|0x000000", 90, 139, 477, 618, 854 } --多点找色
--错误信息
t['已经注册-世纪侍缘']={0xff7e6a, "-444|-308|0xff4e56,-107|-170|0xfef6fb,-293|-141|0xff8989",90,4,43,659,503} --多点找色
t['已经注册-免费打招呼']={0xff6e1d, "-251|-40|0xff6e1d,242|-36|0xff6e1d,249|41|0xff6e1d,-76|2|0xffffff,250|-869|0xffffff",90,62,96,669,1132} --多点找色
t['已经注册-上传头像']={0xffffff, "-488|558|0xfc6e27,-9|642|0xfc6e27,6|727|0xfc6e27,-503|715|0xffffff,-505|715|0xfc6e27",90,78,209,686,1054} --多点找色

function rdclicks(x,y,n)
	if n == 0 then
		return false
	end
	for i=1,n do
		click(x,y,0.5)
	end
end

function reg()
	local timeline = os.time()
	local outTimes = 60 * 3
	
	var.password  = "AaDd112211"
	local fix_info = false
	
	while os.time()-timeline < outTimes do
		if active(var.appbid,5) then
			if d('登录界面——注册',true) then
			elseif d('注册界面')then
				if d('注册界面——手机号')then
					var.phone = dxcode.getPhone()
					if var.phone then
						d('注册界面——手机号',true)
						input[3](var.phone)
					end
				elseif d('注册界面——立即注册',true)then
				end
			elseif d('输入验证码界面')then
				var.sms = dxcode.getMessage()
				if var.sms then
					input[3](var.sms)
				else
					return false
				end
			elseif d('完善信息界面') or d('完善信息界面ios10')then
				local fix____ ={{657,432,0xffffff},{650,541,0xffffff},{653,646,0xd9d9d9},{561,759,0xffffff},
					{524,870,0xffffff},{429,972,0xcccccc},}  --多点取色
				for i,v in ipairs(fix____) do
					if i == 1 then
						click(v[1],v[2],2)
						rdclicks(119,1201,rd(2,5))
						rdclicks(378,1146,rd(2,5))
						rdclicks(625,1147,rd(2,5))
						click(687,778)--确定
					elseif i == 2 then
						click(v[1],v[2],3)
						click(687,778)--确定
					elseif i == 3 then
						click(v[1],v[2])
						click(rd(70,667),rd(876,1276))
						click(687,778)--确定
					elseif i == 4 or i ==5 then
						rdclicks(v[1],v[2],rd(2,4))
					elseif i == 6 then
						click(v[1],v[2],1)
					end
					
				end
				if d('完善信息界面-完成注册',true)then
					fix_info = true
					up('点击提交')
--					return true
				end
				
			
			elseif d('基本信息界面') or d('基本信息界面ios10')then
				d('基本信息界面-随机昵称',true,1)
				click(633,292)
				input[1](var.password)
				d('基本信息界面-随机男女',true,rd(1,2),3)
			elseif fix_info and (d('已经注册-免费打招呼',true,1,rd(2,5)) or d('已经注册-上传头像',true)) then
				log("完成注册",true)
				return true
			elseif d('已经注册-世纪侍缘') or d('已经注册-免费打招呼') or d('已经注册-上传头像',true) then
				dxcode.addBlack()
				up('注册过拉黑')
				return false
			else
				d('tips_协议更新提示',true)
			end
		end
		
		delay(2)
	end

end


function up(other)
	local url = 'http://hb.wenfree.cn/api/Public/idfa/'
	local postdate = {}
	postdate.service = 'Idfa.Idfa'
	postdate.name = '百合婚恋'
	postdate.idfa = var.phone
	postdate.password = var.password
	postdate.other = other
	log(post(url,postdate))
	-- body
end
--function up(other)
--	local url = 'http://wenfree.cn/api/Public/idfa/'
--	local postdate = {}
--	postdate.service = 'Idfa.Idfa'
--	postdate.name = '百合婚恋'
--	postdate.idfa = var.phone
--	postdate.password = var.password
--	postdate.other = other
--	log(post(url,postdate))
--	-- body
--end

--require("AWZ")


--function all()
--	while true do
--		vpn.off()
--		if  false or vpn.on() then
--			delay(3)
--			dxcode.login()
--			if sys.clear_bid(var.appbid)then
--				if reg()then
--					up('完整注册')
--				end
--			end

--		end

--	end
--end

--while (true) do
--	local ret,errMessage = pcall(all)
--	if ret then
--	else
--		log(errMessage)
--		dialog(errMessage, 10)
--		mSleep(2000)
--	end
--end

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
	jm_key()
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
			if sys.clear_bid(var.appbid)then
				if reg()then
					up('完整注册')
					back_pass(task_id,"ok")
				end
			end
--		end
		delay(2)
	end
end






