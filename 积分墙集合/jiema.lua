
require("TSLib")
require("tsp")

--get函数
--function get_lx(url)
--	local sz = require("sz")
--	local http = require("szocket.http")
--	local res, code = http.request(url);
--	delay(2)
--	if code == 200 then
--		return res
--	end
--end
function get_lx(url)
	local sz = require("sz")	
	local res = httpGet(url);
--	log(res)
	if res~= nil or res~= '' then
		return res
	end
end

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
				RetStr = get_lx('http://sms.wenfree.cn/public/?service=App.Sms.GetPhone'.."&imei="..phone_imei.."&phonename="..phone_name)
				local sz = require('sz')
				local cjson = sz.json
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



--有信
function _vCode_yx() --有信
--	local User = 'api-18190-rKpL6bd'
--	local Pass = '135246'
--	local PID = '1770'
    local token,number = "a8e7f1b50254cbb57f210491c6f484ad7cbd604d",""
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = 'http://api.cafebay.cn/api/do.php?action=loginIn&name='..User..'&password='..Pass
				log(lx_url)
                RetStr = get_lx(lx_url)
				if RetStr then
					RetStr = strSplit(RetStr,"|")
					if RetStr[1] == 1 or RetStr[1] == '1' then
						token = RetStr[2]
						log('token='..token,true)
						break
					end
				else
					log(RetStr)
				end
			end
			return RetStr;
        end), 
		getPhone=(function()
            local RetStr=""
			local url___ = "http://api.cafebay.cn/api/do.php?action=getPhone&sid="..PID.."&token="..token
			log(url___)
			RetStr = get_lx(url___)
			if RetStr ~= "" and  RetStr ~= nil then
				log(RetStr)
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1] == 1 or RetStr[1]== '1' then
				number = RetStr[2]
				log(number)
				local phone_title = (string.sub(number,1,3))
--				local blackPhone = {'144','141','142','143','144','145','146','147','199','161','162','165','167','170','171'}
				local blackPhone = {}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	'http://api.cafebay.cn/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
						get_lx(lx_url);
						log("拉黑->"..number)
						return false
					end
				end
				return number
			end
        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
				mSleep(3000)
				RetStr = get_lx("http://api.cafebay.cn/api/do.php?action=getMessage&sid="..PID.."&token="..token.."&phone="..number)
				log(RetStr);
				if RetStr then
					local arr = strSplit(RetStr,"|") 
					if arr[1] == '1' then 
						Msg = arr[2]
						local i,j = string.find(Msg,"%d+")
						Msg = string.sub(Msg,i,j)
					end
					if type(tonumber(Msg))== "number" then log(Msg); return Msg end
				end
				toast(tostring(RetStr).."\n"..i.."次共25次")
            end
            return false
        end),
        addBlack=(function()
			local lx_url =	'http://api.cafebay.cn/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
			log("拉黑"..number..'\n'..lx_url);
            return get_lx(lx_url);
        end),
    }
end





--马大帅平台
function _vCode_ma() --马大帅
--	local User = 'zhangvsqaz'
--	local Pass = '135246'
--	local PID = '7761'
    local token,number = "4b885afa6d87b114098187518b25d196",""
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = 'http://61.160.195.26:81/logon/username='..User..'&password='..Pass
				log(lx_url)
                RetStr = get_lx(lx_url)
                RetStr = urlDecoder(RetStr)
				if RetStr then
					RetStr = strSplit(RetStr,"|")
					if RetStr[1] == 1 or RetStr[1] == '1' then
						token = RetStr[2]
						log('token='..token,true)
						break
					end
				else
					log(RetStr)
				end
			end
			return RetStr;
        end), 
		getPhone=(function()
            local RetStr=""
			local url___ = "http://61.160.195.26:81/Getnumber/id="..PID.."&token="..token
			log(url___)
			RetStr = get_lx(url___)
			RetStr = urlDecoder(RetStr)
			if RetStr ~= "" and  RetStr ~= nil then
				log(RetStr)
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1] == 1 or RetStr[1]== '1' then
				number = RetStr[2]
				log(number)
				local phone_title = (string.sub(number,1,3))
				local blackPhone = {'144','141','142','143','144','145','146','147','199','161','162','165','167','170','171'}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	'http://61.160.195.26:81/Addblacklist/id='..PID..'&phone='..number..'&token='..token
						log(lx_url)
						get_lx(lx_url);
						log("拉黑->"..number)
						return false
					end
				end
				return number
			end
        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
				mSleep(3000)
				RetStr = get_lx("http://61.160.195.26:81/Getsms/id="..PID.."&token="..token.."&phone="..number)
				RetStr = urlDecoder(RetStr)
				log(RetStr);
				if RetStr then
					local arr = strSplit(RetStr,"|") 
					if arr[1] == '1' then 
						Msg = arr[2]
						local i,j = string.find(Msg,"%d+")
						Msg = string.sub(Msg,i,j)
					end
					if type(tonumber(Msg))== "number" then log(Msg); return Msg end
				end
				toast(tostring(RetStr).."\n"..i.."次共25次")
            end
            return false
        end),
        addBlack=(function()
			local lx_url =	'http://61.160.195.26:81/Addblacklist/id='..PID..'&phone='..number..'&token='..token
			log("拉黑"..number..'\n'..lx_url);
            return get_lx(lx_url);
        end),
    }
end


--致敬平台
function _vCode_zj() --致敬
--	local User = 'zhangvsqaz'
--	local Pass = '135246'
--	local PID = '10203'
    local token,number = "6klqv7mnkm50knvwmqkbwbkq6l6anw0p",""
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = 'http://api.myzjxl.com:8080/Login/?username='..User..'&password='..Pass
				log(lx_url)
                RetStr = get_lx(lx_url)
				if RetStr then
					RetStr = strSplit(RetStr,"|")
					if RetStr[1] == 1 or RetStr[1] == '1' then
						token = RetStr[2]
						log('token='..token,true)
						break
					end
				else
					log(RetStr)
				end
			end
			return RetStr;
        end), 
		getPhone=(function()
            local RetStr=""
			local url___ = "http://api.myzjxl.com:8080/GetPhone/?id="..PID.."&token="..token
			log(url___)
			RetStr = get_lx(url___)
			if RetStr ~= "" and  RetStr ~= nil then
				log(RetStr)
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1] == 1 or RetStr[1]== '1' then
				number = RetStr[2]
				log(number)
				local phone_title = (string.sub(number,1,3))
				local blackPhone = {'144','141','142','143','144','145','146','147','199','161','162','165','167','170','171'}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	'http://api.myzjxl.com:8080/Addblack/?id='..PID..'&phone='..number..'&token='..token
						get_lx(lx_url);
						log("拉黑->"..number)
						return false
					end
				end
				return number
			end
        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
				mSleep(3000)
				RetStr = get_lx("http://api.myzjxl.com:8080/GetMsg/?id="..PID.."&token="..token.."&phone="..number)
				log(RetStr);
				if RetStr then
					local arr = strSplit(RetStr,"|") 
					if arr[1] == '1' then 
						Msg = arr[2]
						local i,j = string.find(Msg,"%d+")
						Msg = string.sub(Msg,i,j)
					end
					if type(tonumber(Msg))== "number" then log(Msg); return Msg end
				end
				toast(tostring(RetStr).."\n"..i.."次共25次")
            end
            return false
        end),
        addBlack=(function()
			local lx_url =	'http://api.myzjxl.com:8080/Addblack/?id='..PID..'&phone='..number..'&token='..token
			log("拉黑"..number..'\n'..lx_url);
            return get_lx(lx_url);
        end),
    }
end


	
function _vCode_yl() --月亮
--	local User = 'zhangvsqaz'
--	local Pass = '135246'
--	local PID = '10203'
    local token,number = "6klqv7mnkm50knvwmqkbwbkq6l6anw0p",""
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = 'http://www.ylsmspt.com/yhapi.ashx?act=login&ApiName='..User..'&PassWord='..Pass
				log(lx_url)
                RetStr = get_lx(lx_url)
				if RetStr then
					RetStr = strSplit(RetStr,"|")
					if RetStr[1] == 1 or RetStr[1] == '1' then
						token = RetStr[2]
						log('token='..token,true)
						break
					end
				else
					log(RetStr)
				end
			end
			return RetStr;
        end), 
		getPhone=(function()
            local RetStr=""
			local url___ = "http://www.ylsmspt.com/yhapi.ashx?act=getPhone&iid="..PID.."&token="..token.."&did="..User
			log(url___)
			RetStr = get_lx(url___)
			if RetStr ~= "" and  RetStr ~= nil then
				log(RetStr)
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1] == 1 or RetStr[1]== '1' then
				number = RetStr[5]
				number_pid = RetStr[2]
				log(number)
				log(number_pid)
				log(number)
				local phone_title = (string.sub(number,1,3))
				local blackPhone = {'144','141','142','143','144','145','146','147','199','161','162','165','167','170','171'}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	'http://www.ylsmspt.com/yhapi.ashx?iid='..PID..'&phone='..number..'&token='..token
						get_lx(lx_url);
						log("拉黑->"..number)
						return false
					end
				end
				return number
			end
        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
				mSleep(3000)
				RetStr = get_lx("http://www.ylsmspt.com/yhapi.ashx?act=getPhoneCode&pid="..number_pid.."&token="..token)
				log(RetStr);
				if RetStr then
					local arr = strSplit(RetStr,"|") 
					if arr[1] == '1' then 
						Msg = arr[3]
						local i,j = string.find(Msg,"%d+")
						Msg = string.sub(Msg,i,j)
					end
					if type(tonumber(Msg))== "number" then log(Msg); return Msg end
				end
				toast(tostring(RetStr).."\n"..i.."次共25次")
            end
            return false
        end),
        addBlack=(function()
			local lx_url =	'http://www.ylsmspt.com/yhapi.ashx?id='..PID..'&phone='..number..'&token='..token
			log("拉黑"..number..'\n'..lx_url);
            return get_lx(lx_url);
        end),
    }
end

function _vCode_wzy() --万众云
--	local User = 'zhangvsqaz'
--	local Pass = '135246'
--	local PID = '10203'
    local token,number = "",""
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = 'http://dev.wanzhongma.com/open/api/login?userName='..User..'&password='..Pass..'&json=2'
				log(lx_url)
                RetStr = get_lx(lx_url)
				if RetStr then
					RetStr = strSplit(RetStr,"|")
					if RetStr[1] == 0 or RetStr[1] == '0' then
						token = RetStr[3]
						log('token='..token,true)
						break
					end
				else
					log(RetStr)
				end
			end
			return RetStr;
        end), 
		getPhone=(function()
            local RetStr=""
			local url___ = "http://dev.wanzhongma.com/open/api/getPhone?sid="..PID.."&token="..token..'&json=2'
			log(url___)
			RetStr = get_lx(url___)
			if RetStr ~= "" and  RetStr ~= nil then
				log(RetStr)
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1] == 0 or RetStr[1]== '0' then
				number = RetStr[3]
				log(number)
				local phone_title = (string.sub(number,1,3))
				local blackPhone = {'144','141','142','143','144','145','146','147','199','161','162','165','167','170','171'}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	'http://api.myzjxl.com:8080/Addblack/?iid='..PID..'&phone='..number..'&token='..token
						get_lx(lx_url);
						log("拉黑->"..number)
						return false
					end
				end
				return number
			end
        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
				mSleep(3000)
				RetStr = get_lx("http://dev.wanzhongma.com/open/api/getMessage?sid="..PID.."&token="..token.."&phone="..number..'&json=2')
				log(RetStr);
				if RetStr then
					local arr = strSplit(RetStr,"|") 
					if arr[1] == '0' then 
						Msg = arr[3]
						local i,j = string.find(Msg,"%d+")
						Msg = string.sub(Msg,i,j)
					end
					if type(tonumber(Msg))== "number" then log(Msg); return Msg end
				end
				toast(tostring(RetStr).."\n"..i.."次共25次")
            end
            return false
        end),
        addBlack=(function()
			local lx_url =	'http://dev.wanzhongma.com/open/api/addBlacklist?sid='..PID..'&phone='..number..'&token='..'&json=2'
			log("拉黑"..number..'\n'..lx_url);
            return get_lx(lx_url);
        end),
    }
end


function _vCode_lh() --蓝狐
--	local User = 'zhangvsqaz'
--	local Pass = '135246'
--	local PID = '10203'
    local token,number = "A1F1A9C385F7F5A01B763A80BA545F94",""
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = 'http://www.huli667.com:81/sms/api/login?username='..User..'&password='..Pass
				log(lx_url)
                RetStr = get_lx(lx_url)
				local sz = require('sz')
				local cjson = sz.json
				RetStr = cjson.decode(RetStr)
				log(RetStr)
				if RetStr then
					if RetStr.msg == success or RetStr.msg == 'success' then
						token = RetStr.token
						log('token='..token,true)
						break
					end
				else
					log(RetStr)
				end
			end
			return RetStr;
        end), 
		getPhone=(function()
            local RetStr=""
			local url___ = "http://www.huli667.com:81/sms/api/getPhone?token="..token.."&sid="..PID
			log(url___)
			RetStr = get_lx(url___)
			if RetStr ~= "" and  RetStr ~= nil then
				local sz = require('sz')
				local cjson = sz.json
				RetStr = cjson.decode(RetStr)
				log(RetStr)
			end
			if RetStr.msg == success or RetStr.msg== 'success' then
				number = RetStr.phone
				log(number)
				local phone_title = (string.sub(number,1,3))
--				local blackPhone = {'144','141','142','143','144','145','146','147','199','161','162','165','167','170','171'}
				local blackPhone = {}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	'http://www.huli667.com:81/sms/api/Addblack/?iid='..PID..'&phone='..number..'&token='..token
						get_lx(lx_url);
						log("拉黑->"..number)
						return false
					end
				end
				return number
			end
        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
				mSleep(3000)
				RetStr = get_lx("http://www.huli667.com:81/sms/api/getMessage?sid="..PID.."&token="..token.."&phone="..number)
				log(RetStr);
				if RetStr ~= "" and  RetStr ~= nil then
					local sz = require('sz')
					local cjson = sz.json
					RetStr = cjson.decode(RetStr)
					log(RetStr)
				end
				if RetStr then
					if RetStr.msg == success or RetStr.msg== 'success' then
						Msg = RetStr.sms
						local i,j = string.find(Msg,"%d+")
						Msg = string.sub(Msg,i,j)
					end
					if type(tonumber(Msg))== "number" then log(Msg); return Msg end
				end
				toast(tostring(RetStr).."\n"..i.."次共25次")
            end
            return false
        end),
        addBlack=(function()
			local lx_url =	'http://www.huli667.com:81/sms/api/addBlacklist?sid='..PID..'&phone='..number..'&token='..'&json=2'
			log("拉黑"..number..'\n'..lx_url);
            return get_lx(lx_url);
        end),
    }
end

