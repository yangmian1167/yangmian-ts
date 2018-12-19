require("TSLib")

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
						nLog(indent.."["..pos.."] => "..tostring(t).." {")
						sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
						nLog(indent..string.rep(" ",string.len(pos)+6).."}")
					elseif (type(val)=="string") then
						nLog(indent.."["..pos..'] => "'..val..'"')
					else
						nLog(indent.."["..pos.."] => "..tostring(val))
					end
				end
			else
				nLog(indent..tostring(t))
			end
		end
	end
	if (type(t)=="table") then
		nLog(tostring(t).." {")
		sub_print_r(t,"  ")
		nLog("}")
	elseif (type(t)=="string") then
		nLog(t)
	end
end

main_path = '/var/mobile/awzdata/com.lilithgame.sgame/'
--遍历文件
function getList(path)
    local a = io.popen("ls "..path);
    local f = {};
    for l in a:lines() do
        table.insert(f,l)
    end
    a:close()
    return f
end

list = getList(main_path)	--文件夹例表
sonlist={
	'/Library/Caches/',
	'/Documents/blocktexcache/tower_03_1001/',
	'/Documents/blocktexcache/tower_02_1001/',
	'/Documents/blocktexcache/tower_01_1001/',
	'/Documents/blocktexcache/gvg_03_1001/',
	'/tmp/',
	'/Documents/head/',
	}




function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end

function 清理()
	for i,v in ipairs(sonlist) do
		for k,vv in pairs(list)do
			all = main_path..vv..v
			nLog(all)
			delFile(all)
		end
	end
end


--清理()
--[[

清理()
path = 'private/var/module/Library/Caches/'
function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end
delFile(path)

--]]


--[[
for k,v in ipairs(list) do
	local new_path = main_path .. v .."/Documents/"
	nLog(new_path)
	txtlist = getList(new_path)
	for i,vv in ipairs(txtlist) do
		local i,j = string.find(vv, '.txt')
		if i ~= nil and j ~= nil then
			nLog(vv)
			local all = new_path..vv
			nLog(all)
			delFile(all)
		end
	end
end
--]]
















