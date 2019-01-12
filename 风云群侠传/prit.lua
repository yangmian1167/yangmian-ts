local function encodeBase64(source_str)
    local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    local s64 = ''
    local str = source_str
 
    while #str > 0 do
        local bytes_num = 0
        local buf = 0
 
        for byte_cnt=1,3 do
            buf = (buf * 256)
            if #str > 0 then
                buf = buf + string.byte(str, 1, 1)
                str = string.sub(str, 2)
                bytes_num = bytes_num + 1
            end
        end
 
        for group_cnt=1,(bytes_num+1) do
            local b64char = math.fmod(math.floor(buf/262144), 64) + 1
            s64 = s64 .. string.sub(b64chars, b64char, b64char)
            buf = buf * 64
        end
 
        for fill_cnt=1,(3-bytes_num) do
            s64 = s64 .. '='
        end
    end
    return s64
end
 
local function decodeBase64(str64)
    local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    local temp={}
    for i=1,64 do
        temp[string.sub(b64chars,i,i)] = i
    end
    temp['=']=0
    local str=""
    for i=1,#str64,4 do
        if i>#str64 then
            break
        end
        local data = 0
        local str_count=0
        for j=0,3 do
            local str1=string.sub(str64,i+j,i+j)
            if not temp[str1] then
                return
            end
            if temp[str1] < 1 then
                data = data * 64
            else
                data = data * 64 + temp[str1]-1
                str_count = str_count + 1
            end
        end
        for j=16,0,-8 do
            if str_count > 0 then
                str=str..string.char(math.floor(data/math.pow(2,j)))
                data=math.fmod(data,math.pow(2,j))
                str_count = str_count - 1
            end
        end
    end
 
    local last = tonumber(string.byte(str, string.len(str), string.len(str)))
    if last == 0 then
        str = string.sub(str, 1, string.len(str) - 1)
    end
    return str
end

--[[
print(encodeBase64('wenhong'))
print(decodeBase64('d2VuaG9uZw=='))
--]]

nLog(appBundlePath(frontAppBid()))
nLog(appDataPath(frontAppBid()))

--深度打印一个表
function print_r(t)
	local print_r_cache={}
	local function sub_print_r(t,indent)
		if (print_r_cache[tostring(t)]) then
			nLog(indent.."*"..tostring(t))
		else
			print_r_cache[tostring(t)]=true
			if (type(t)=="table") then
				for pos,val in pairs(t) do
					if (type(val)=="table") then
						nLog(indent.."['"..pos.."'] = ".." {--"..tostring(t))
						sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
						nLog(indent..string.rep(" ",string.len(pos)+6).."},")
					elseif (type(val)=="string") then
						nLog(indent..'["'..pos..'"] = "'..val..'",')
					else
						nLog(indent..'["'..pos..'"] = "'..tostring(val)..'"')
					end
				end
			else
				nLog(indent..tostring(t))
			end
		end
	end
	if (type(t)=="table") then
		nLog(" {--"..tostring(t))
		sub_print_r(t,"  ")
		nLog("}")
	elseif (type(t)=="string") then
		nLog(t)
	end
end



--读取键值
local sz = require("sz")
local plist = sz.plist
local plfilename = "/private/var/mobile/Containers/Data/Application/5E7BBE83-966B-4541-95D5-AE4D5D19A0CD/Documents/ifkc.plist" --设置 plist 路径
local tmp2 = plist.read(plfilename)           --读取 PLIST 文件内容并返回一个 table
--print_r(tmp2)  --显示 ProductBuildVersion 的键值

nLog("----------------------")
local sz = require("sz")
local json = sz.json
local token_ = json.encode(tmp2)
print_r(token_)
























