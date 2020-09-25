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
    ["timer"]        = 300,
    ["orient"]       = 0,
    ["pagetype"]     = "multi",
    ["titles"]        = "抖音脚本",
    ["cancelname"]   = "取消",
    ["okname"]       = "开始",
    pages            =
    {
		{
            {
                ["type"] = "Label",
                ["text"] = "发言间隔时间设置(秒数单位)",
                ["size"] = 20,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
			{
                ["type"] = "Label",
				["size"] = 20,
				["align"] = "center",
                ["text"] = "总时间周期",
            },
            {
                ["id"] = "waitz",
                ["type"] = "Edit",
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
            },	
			{
                ["type"] = "Label",
				["size"] = 20,
				["align"] = "center",
                ["text"] = "分段设置",
            },
			{
                ["type"] = "Label",
                ["text"] = "1段时间:",
                ["width"] = 150,
                ["nowrap"] = 1,
            },
            {
                ["id"] = "wait1",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
				["nowrap"] = 1,
            },        
			{
                ["id"] = "wait11",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
            },         
			{
                ["id"] = "sub1",
                ["type"] = "Edit",
                ["width"] = 700,
                ["prompt"] = "请输入内容以@符号分段",
                ["text"] = "你好",
            },			
			{
                ["type"] = "Label",
                ["text"] = "2段时间:",
                ["width"] = 150,
                ["nowrap"] = 1,
            },
			{
                ["id"] = "wait2",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
				["nowrap"] = 1,
            }, 
            {
                ["id"] = "wait22",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
            },         
			{
                ["id"] = "sub2",
                ["type"] = "Edit",
                ["width"] = 700,
                ["prompt"] = "请输入内容以@符号分段",
                ["text"] = "你好",
            },			{
                ["type"] = "Label",
                ["text"] = "3段时间:",
                ["width"] = 150,
                ["nowrap"] = 1,
            },
			{
                ["id"] = "wait3",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
				["nowrap"] = 1,
            }, 
			{
                ["id"] = "wait33",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
            },         
			{
                ["id"] = "sub3",
                ["type"] = "Edit",
                ["width"] = 700,
                ["prompt"] = "请输入内容以@符号分段",
                ["text"] = "你好",
            },			{
                ["type"] = "Label",
                ["text"] = "4段时间:",
                ["width"] = 150,
                ["nowrap"] = 1,
            },
			{
                ["id"] = "wait4",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
				["nowrap"] = 1,
            }, 
		   {
                ["id"] = "wait44",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
            },         
			{
                ["id"] = "sub4",
                ["type"] = "Edit",
                ["width"] = 700,
                ["prompt"] = "请输入内容以@符号分段",
                ["text"] = "你好",
            },			{
                ["type"] = "Label",
                ["text"] = "5段时间:",
                ["width"] = 150,
                ["nowrap"] = 1,
            },
            {
                ["id"] = "wait5",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
				["nowrap"] = 1,
            }, 
			{
                ["id"] = "wait55",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
            },         
			{
                ["id"] = "sub5",
                ["type"] = "Edit",
                ["width"] = 700,
                ["prompt"] = "请输入内容以@符号分段",
                ["text"] = "你好",
            },			{
                ["type"] = "Label",
                ["text"] = "6段时间:",
                ["width"] = 150,
                ["nowrap"] = 1,
            },
            {
                ["id"] = "wait6",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
				["nowrap"] = 1,
            }, 
			{
                ["id"] = "wait66",
                ["type"] = "Edit",
                ["width"] = 200,
                ["prompt"] = "请输入秒数",
                ["text"] = "150",
            },         
			{
                ["id"] = "sub6",
                ["type"] = "Edit",
                ["width"] = 700,
                ["prompt"] = "请输入内容以@符号分段",
                ["text"] = "你好",
            }, 
				
		}
    }   
}

local MyJsonString = json.encode(MyTable);
UIret,UI_v = showUI(MyJsonString)
if UIret == 1 then
--	print_r(UI_v)
	
	
else
	lua_exit()
end

--log(UI_v)

	sub1 = strSplit(UI_v.sub1,'@')
	sub2 = strSplit(UI_v.sub2,'@')
	sub3 = strSplit(UI_v.sub3,'@')
	sub4 = strSplit(UI_v.sub4,'@')
	sub5 = strSplit(UI_v.sub5,'@')
	sub6 = strSplit(UI_v.sub6,'@')
	



--for k , v in  pairs(sublist) do
--	log(v)
--	sublist = sublist
--end

--sublist = sublist[(math.random(1,15))]
--while true do
--	sublist = sublist[(math.random(1,15))]
--	log(sublist)
--	if sublist == Null or sublist == 'Null' or sublist == 'nil' then
--		log('111111')
--		sublist = sublist[(math.random(1,15))]
--	else
		
--	end	
--	delay(2)
--end









