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
                ["text"] = "主功能选项",
                ["size"] = 20,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },
			{
                ["id"] = "main",
                ["type"] = "CheckBoxGroup",
				["list"] = "新手,升堡,采矿,开图,建造,领取",
				["size"] = 20,
                ["select"] = "1@2@3@4@5@6@7@8@9@10",
			},			
			{
                ["type"] = "Label",
                ["text"] = "领取选项",
                ["size"] = 20,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },
			{
                ["id"] = "main1",
                ["type"] = "CheckBoxGroup",
				["list"] = "福利中心,活动中心,邮件,背包,联盟",
				["size"] = 20,
                ["select"] = "1@2@3@4@5@6@7@8@9@10",
			},		
			{
                ["type"] = "Label",
                ["text"] = "综合选项",
                ["size"] = 20,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },
			{
                ["id"] = "main2",
                ["type"] = "CheckBoxGroup",
				["list"] = "任务,送粮,造兵",
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
                ["size"] = 20,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },		
			{
				["id"] = "qjsm",
                ["type"] = "RadioGroup",
                ["text"] = "",
                 ["list"] = "1级范围,2级范围,3级范围", 
            },			
			{
                ["type"] = "Label",
                ["text"] = "升堡选项",
                ["size"] = 20,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },		
			{
				["id"] = "sbxx",
                ["type"] = "CheckBoxGroup",
                ["text"] = "",
                 ["list"] = "优升主城,全局升级", 
            },
			{
				["id"] = "sbxx1",
                ["type"] = "RadioGroup",
                ["text"] = "",
                 ["list"] = "优升仓库,随机升级", 
            },
			{
                ["type"] = "Label",
                ["text"] = "仓库选项",
                ["size"] = 20,
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

log(UI_v)

------第一页------
主要功能 = split(UI_v.main,'@')
领取功能 = split(UI_v.main1,'@')
综合选项 = split(UI_v.main2,'@')
log(领取功能)

--主功能
新手key = false
升堡key = false
采矿key = false
开图key = false
建造key = false
领取key = false
	
if 主要功能[1] == '0' then
	新手key = true
end
if 主要功能[2] == '1' then
	升堡key = true
end
if 主要功能[3] == '2' then
	采矿key = true
end
if 主要功能[4] == '3' then
	开图key = true
end
if 主要功能[5] == '4' then
	建造key = true
end
if 主要功能[6] == '5' then
	领取key = true
end

--领取功能
造兵提示按钮key = true
粮水缺少按钮key = true
造兵按钮key = true
任务key = true
邮件key = true
造兵按钮key = true

福利中心key = false
活动中心key = false
打开邮件key = false
打开背包key = false
打开联盟key = false

if 领取功能[1] == '0' then
	福利中心key = true
end
if 领取功能[2] == '1' then
	活动中心key = true
end
if 领取功能[3] == '2' then
	打开邮件key = true
end
if 领取功能[4] == '3' then
	打开背包key = true
end
if 领取功能[5] == '4' then
	打开联盟key = true
end


--综合功能
任务key = false
粮水缺少按钮key = false
造兵提示按钮key = false
if 综合选项[1] == '0' then
	任务key = true
end
if 综合选项[2] == '1' then
	粮水缺少按钮key = true
end
if 综合选项[3] == '2' then
	造兵提示按钮key = true
end

------第二页------
全局扫描范围 = UI_v.qjsm
--升堡选项 
优升主城or全局升级 = split(UI_v.sbxx,'@')
优升仓库or随机 = UI_v.sbxx1
仓库选项 = split(UI_v.ckxx,'@')

log(优升主城or全局升级)
优升主城key = false
全局升级key = false
升级绿箭头key = false


升级铁仓key = false
升级木仓key = false
升级电仓key = false
升级粮仓key = false
升级水仓key = false
升级油仓key = false

if 全局扫描范围 == '0' then

end
if 优升主城or全局升级[1] == '0' then
	优升主城key = true
end
if 优升主城or全局升级[2] == '1' then
	全局升级key = true
end
if 优升仓库or随机 == '1' then
	升级绿箭头key = true
end

if 仓库选项[1] == '0' then
	升级铁仓key = true
end
if 仓库选项[2] == '1' then
	升级木仓key = true
end
if 仓库选项[3] == '2' then
	升级电仓key = true
end
if 仓库选项[4] == '3' then
	升级粮仓key = true
end
if 仓库选项[5] == '4' then
	升级水仓key = true
end
if 仓库选项[6] == '5' then
	升级油仓key = true
end





































