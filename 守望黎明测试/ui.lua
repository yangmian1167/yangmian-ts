require("TSLib")
require("tsp")
local sz = require("sz")
local json = sz.json
w,h = getScreenSize();
MyTable = {
    ["style"]        = "default",
    ["rettype"]      = "table",
    ["width"]        = w,
    ["height"]       = h,
    ["config"]       = "aoc.dat",
    ["timer"]        = 60,
    ["orient"]       = 0,
    ["pagetype"]     = "multi",
    ["titles"]        = "守望黎明第一页,守望黎明第二页,守望黎明第三页,",
    ["cancelname"]   = "取消",
    ["okname"]       = "开始",
    pages            =
    {
		{
            {
                ["type"] = "Label",
                ["text"] = "主键设置",
                ["size"] = 30,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
			{
                ["type"] = "Label",
                ["text"] = "主选项",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },
			{
                ["id"] = "main",
                ["type"] = "CheckBoxGroup",
				["list"] = "新手,升堡,采矿,福利中心,活动中心,建造,英雄,联盟,邮件,设置",
				["size"] = 20,
                ["select"] = "1@2@3@4@5@6@7@8@9@10",
			},

		},
		{
            {
                ["type"] = "Label",
                ["text"] = "升堡详细设置",
                ["size"] = 30,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },            
			{
                ["type"] = "Label",
                ["text"] = "全局扫描范围",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },		
			{
				["id"] = "sbxx",
                ["type"] = "RadioGroup",
                ["text"] = "",
                 ["list"] = "1级范围,2级范围,3级范围", 
            },			
			{
                ["type"] = "Label",
                ["text"] = "升堡选项",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },		
			{
				["id"] = "sbxx3",
                ["type"] = "Edit",
                ["align"] = "center",
                ["prompt"] = "111",
                ["text"] = "FDSFDS",
            },
			{
                ["type"] = "Label",
                ["text"] = "仓库选项",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },
			{
				["id"] = "ckxx",
                ["type"] = "CheckBoxGroup",
                ["text"] = "",
                ["list"] = "铁仓,木仓,粮仓,水仓,油仓,电仓", 
				["select"] = "1@2@3@4@5@6", 
            },
			
		},	
		{
            {
                ["type"] = "Label",
                ["text"] = "采矿详细设置",
                ["size"] = 30,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },

		}
    }   
}

local MyJsonString = json.encode(MyTable);
UIret,UI_v = showUI(MyJsonString)
if UIret == 1 then
--	nLog('功能选择:'..UI_v.main)
--	nLog('所有者:'..UI_v.whos)
else
	lua_exit()
end

nLog(UI_v.sbxx3)



