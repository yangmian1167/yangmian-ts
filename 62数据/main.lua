--function getData() --获取数据
--    local getList = function(path)
--        local a = io.popen("ls "..path)
--        local f = {};
--        for l in a:lines() do
--            table.insert(f,l)
--        end
--        return f
--    end
--    local Wildcard = getList("/var/mobile/Containers/Data/Application")
--    for var = 1,#Wildcard do
--        local file = io.open("/var/mobile/Containers/Data/Application/"..Wildcard[var].."/Library/WechatPrivate/wx.dat","rb")
--        if file then
--            local str = file:read("*a")
--            file:close()
--            --[[
--            require"sz"
--            local str = string.tohex(str) --16进制编码
--            ]]
--            return str
--        end
--    end
--end


--function writeData(data) --写入数据（62数据）
--    local getList = function(path)
--        local a = io.popen("ls "..path)
--        local f = {};
--        for l in a:lines() do
--            table.insert(f,l)
--        end
--        return f
--    end
--    local Wildcard = getList("/var/mobile/Containers/Data/Application")
--    for var = 1,#Wildcard do
--        local file = io.open("/var/mobile/Containers/Data/Application/"..Wildcard[var].."/Library/WechatPrivate/wx.dat","w+")
--        if file then
--            file:write(data)
--            file:close()
--            return true
--        end
--    end
--end




require("TSLib")
--深度打印一个表,可以单独调用
function print_r(t)
	local print_r_cache={}
	local function sub_print_r(t,indent)
		if (print_r_cache[tostring(t)]) then
			nLog(indent.."*"..tostring(t))
		else
			print_r_cache[tostring(t)]=true
			if (type(t)=="table") then
				for pos,val in pairs(t) do
					if type(pos) == "string" then
						pos = "'"..pos.."'"
					end
					if (type(val)=="table") then
						nLog(indent.."["..pos.."] = {   --"..tostring(t))
						sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
						nLog(indent..string.rep(" ",string.len(pos)+6).."},")
					elseif (type(val)=="string") then
						nLog(indent.."["..pos.."] = ".."'"..val.."',")
					else
						nLog(indent.."["..pos.."] = "..tostring(val)..",")
					end
				end
			else
				nLog(indent..tostring(t))
			end
			mSleep(50)
		end
	end
	if (type(t)=="table") then
		nLog("{  --"..tostring(t))
		sub_print_r(t,"	")
		nLog("}")
	elseif (type(t)=="string") then
		nLog(t)
	end
end

function get(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		local json = sz.json
		return json.decode(res)
	end
end

--version =string.split(getOSVer(),".")[1]

version = '12'

if version == "10" then 
 dyjit = require("dyjit") 
elseif version == "11" then 
 dyjit = require("dyjit") 
elseif version == "12" then 
 dyjit = require("mt") 
end 

res  = get("http://127.0.0.1:8080/api/reportInfo")
print_r(res)
--_appBid = 'com.nike.onenikecommerce'
--dyjit.run(_appBid,[==[
--  local manager = runtime.NikeInfoManager:alloc():init()
--  manager:reportInfo()
-- ]==])










