
require('TSLib')
require('tsp')
--for var= 1, 30 do
--	local header_unm = math.random(100,2400)
--	local imgUrl = 'https://img.wenfree.cn/baihe/img-'.. header_unm ..'.jpg';
--	downFile(imgUrl,"/User/Media/TouchSprite/res/"..header_unm..".jpg");
--	saveImageToAlbum(header_unm .. ".jpg")
--end

--openURL('https://v.douyin.com/X1d3SF/')



---- 元类
--Shape = {area = 0}

---- 基础类方法 new
--function Shape:new (o,side)
--  o = o or {}
--  setmetatable(o, self)
--  self.__index = self
--  side = side or 0
--  self.area = side*side;
--  return o
--end

---- 基础类方法 printArea
--function Shape:printArea ()
--  print("面积为 ",self.area)
--end

---- 创建对象
--myshape = Shape:new(nil,10)

--myshape:printArea()

--sys = {
--	clear_bid = (function(bid)
--		closeApp(bid)
--		delay(1)
--		os.execute("rm -rf "..(appDataPath(bid)).."/Documents/*") --Documents
--		os.execute("rm -rf "..(appDataPath(bid)).."/Library/*") --Library
--		os.execute("rm -rf "..(appDataPath(bid)).."/tmp/*") --tmp
--		clearPasteboard()
--		--[[
--		local path = _G.const.cur_resDir
--		os.execute(
--			table.concat(
--				{
--					string.format("mkdir -p %s/keychain", path),
--					'killall -SIGSTOP SpringBoard',
--					"cp -f -r /private/var/Keychains/keychain-2.db " .. path .. "/keychain/keychain-2.db",
--					"cp -f -r /private/var/Keychains/keychain-2.db-shm " .. path .. "/keychain/keychain-2.db-shm",
--					"cp -f -r /private/var/Keychains/keychain-2.db-wal " .. path .. "/keychain/keychain-2.db-wal",
--					'killall -SIGCONT SpringBoard',
--				},
--				'\n'
--			)
--		)
		
--		]]
--		clearAllKeyChains()
--		clearIDFAV() 
--		--clearCookies()
--		delay(2)
--		return true
--	end)
--}
--ceshi = clearIDFAV() 
--log(ceshi)





--url = 'http://www.ylsmspt.com/yhapi.ashx?act=getPhone&iid=1283&token=ad83d006f68c32e237a955f8d90f9ed1_10216&did=51135893913'
--url = 'http://sms.wenfree.cn/public/?service=App.Sms.GetPhone&imei=459c7c073e14ddd7d00be24ef241cf41&phonename=%E7%99%BE%E5%90%881'
--RetStr = httpGet(url)
--log(RetStr) 
--				local sz = require('sz')
--				local cjson = sz.json
-- RetStr= cjson.decode(RetStr)
--log(RetStr) 




--服务器对接取号
function _Server_get()
	phone_name = getDeviceName()
	phone_imei = getDeviceID()
	log(phone_name)
	log(phone_imei)
	return{
		login=(function()
			return	
		end),
		getPhone = (function()
				RetStr = httpGet('http://sms.wenfree.cn/public/?service=App.Sms.GetPhone'.."&imei="..phone_imei.."&phonename="..phone_name)
				local sz = require('sz')
				local cjson = sz.json
				log(RetStr)
				RetStr = cjson.decode(RetStr)
				log(RetStr)
				if RetStr then
					if RetStr.data.meg == success or RetStr.data.meg == 'success' then
						number = RetStr.data.phone
						log(number)
						local phone_title = (string.sub(number,1,3))
--						local blackPhone = {'144','141','142','143','144','145','146','147','199','161','162','165','167','170','171'}
						local blackPhone = {'144','141','142','143','144','145','146','147'}
--						local blackPhone = {}
						for k,v in ipairs(blackPhone) do
							if phone_title == v then
								local lx_url =	'http://api.cafebay.cn/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
								get_lx(lx_url);
								log("拉黑->"..number)
								return false
							end
						end
					end
				else
					log(RetStr)
				end
				mSleep(3000)
				return number
		end),
		 getMessage=(function()
			local Msg
            for i=1,25,1 do
				mSleep(3000)
				RetStr = get_lx("http://sms.wenfree.cn/public/?service=App.Sms.GetMessage".."&imei="..phone_imei.."&phonename="..phone_name)
				local sz = require('sz')
				local cjson = sz.json
				RetStr = cjson.decode(RetStr)
				log(RetStr);
				if RetStr then
					if RetStr.data.meg == success or RetStr.data.meg == 'success' then
						Msg = RetStr.data.sms
						if type(tonumber(Msg))== "number" then log(Msg); return Msg 
						else
							Msg = RetStr.data.sms
							log(Msg)
							local i,j = string.find(Msg,"%d+")
							Msg = string.sub(Msg,i,j)
							if type(tonumber(Msg))== "number" then log(Msg); return Msg end
						end
					end
				end
				toast(tostring(RetStr).."\n"..i.."次共25次")
				mSleep(3000)
            end
            return false
        end),
	
	
	}
	
end




dxcode = _Server_get()

dxcode.getPhone()



function dxcode_getPhone()
	phone_name = getDeviceName()
	phone_imei = getDeviceID()
--	log(phone_name)
--	log(phone_imei)
--	delay(2)
	RetStr = httpGet('http://sms.wenfree.cn/public/?service=App.Sms.GetPhone'.."&imei="..phone_imei.."&phonename="..phone_name)
	local sz = require('sz')
	local cjson = sz.json
	log(RetStr)
	RetStr = cjson.decode(RetStr)
	log(RetStr)
	if RetStr then
		if RetStr.data.meg == success or RetStr.data.meg == 'success' then
			number = RetStr.data.phone
			log(number)
			local phone_title = (string.sub(number,1,3))
--						local blackPhone = {'144','141','142','143','144','145','146','147','199','161','162','165','167','170','171'}
			local blackPhone = {'144','141','142','143','144','145','146','147'}
--						local blackPhone = {}
			for k,v in ipairs(blackPhone) do
				if phone_title == v then
					local lx_url =	'http://api.cafebay.cn/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
					get_lx(lx_url);
					log("拉黑->"..number)
					return false
				end
			end
		end
	else
		log(RetStr)
	end
	mSleep(3000)
	return number
end
--	dxcode_getPhone()







--	phone_name = getDeviceName()
--	phone_imei = getDeviceID()
--	log(phone_name)
--	log(phone_imei)

--	delay(2)
--	pphone = httpGet('http://sms.wenfree.cn/public/?service=App.Sms.GetPhone'.."&imei="..phone_imei.."&phonename="..phone_name)
----	pphone = httpGet("http://sms.wenfree.cn/public/?service=App.Sms.GetPhone&imei=459c7c073e14ddd7d00be24ef241cf41&phonename=百合1")
--	log(pphone)

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	





