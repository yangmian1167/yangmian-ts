require("TSLib")
local sz = require("sz")
local json = sz.json
w,h = getScreenSize();
MyTable = {
    ["style"]        = "default",
    ["rettype"]      = "table",
    ["width"]        = w,
    ["height"]       = h,
    ["config"]       = "dy.dat",
    ["timer"]        = 99,
    ["orient"]       = 0,
    ["pagetype"]     = "multi",
    ["title"]        = "抖音工作室",
    ["cancelname"]   = "取消",
    ["okname"]       = "开始",
    pages            =
    {

		{
            {
                ["type"] = "Label",
                ["text"] = "关注选择",
                ["size"] = 16,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
            {
                ["id"] = "setting",
                ["type"] = "CheckBoxGroup",
                ["list"] = "女,男,空白",
                ["images"] = "",
                ["select"] = "",
                ["scale"] = 0.4,
            },
        },
		{
        },
        {
        },
    }   
}

local MyJsonString = json.encode(MyTable);
UIret,values = showUI(MyJsonString)
if UIret == 1 then
	
-------普通设置
	settingArr = strSplit(values.setting,'@')
	setting = {}
	for i=0,#settingArr do
		for k,j in pairs(settingArr)do
			if i == tonumber(j)then
				setting[i] = true
				break
			else
				setting[i] = false
			end
		end
	end
	for k,v in pairs(setting)do
		if v then
			nLog(k..'-true')
		end
	end
else
	lua_exit()
end




