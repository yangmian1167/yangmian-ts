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
                ["text"] = "发言间隔时间设置(区间随机秒数)",
                ["size"] = 20,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
			{
                ["type"] = "Label",
                ["text"] = "最小间隔:",
                ["width"] = 150,
                ["nowrap"] = 1,
            },
            {
                ["id"] = "times1",
                ["type"] = "Edit",
                ["width"] = 400,
                ["prompt"] = "请输入秒数",
                ["text"] = "20",
            }, 			{
                ["type"] = "Label",
                ["text"] = "最大间隔:",
                ["width"] = 150,
                ["nowrap"] = 1,
            },
            {
                ["id"] = "times2",
                ["type"] = "Edit",
                ["width"] = 400,
                ["prompt"] = "请输入秒数",
                ["text"] = "30",
            },   
         {
                ["type"] = "Label",
                ["text"] = "发言内容编辑",
                ["size"] = 20,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
			{
                ["id"] = "sub1",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "1",
            }, 
			{
                ["id"] = "sub2",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "2",
            },
			{
                ["id"] = "sub3",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "3",
            }, 
			{
                ["id"] = "sub4",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "4",
            }, 
			{
                ["id"] = "sub5",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "5",
            }, 
			{
                ["id"] = "sub6",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "6",
            }, 
			{
                ["id"] = "sub7",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "7",
            }, 
			{
                ["id"] = "sub8",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "8",
            }, 
			{
                ["id"] = "sub9",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "9",
            }, 
			{
                ["id"] = "sub10",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "10",
            }, 
			{
                ["id"] = "sub11",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "11",
            }, 
			{
                ["id"] = "sub12",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "12",
            }, 
			{
                ["id"] = "sub13",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "13",
            }, 			{
                ["id"] = "sub14",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "14",
            }, 			{
                ["id"] = "sub15",
                ["type"] = "Edit",
                ["width"] = 600,
                ["prompt"] = "请输入内容",
				["text"] = "15",
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
times1 = tonumber(UI_v.times1)
times2 = tonumber(UI_v.times2)
--log(times1)
--log(times2)
	sub1 = UI_v.sub1
	sub2 = UI_v.sub2
	sub3 = UI_v.sub3
	sub4 = UI_v.sub4
	sub5 = UI_v.sub5
	sub6 = UI_v.sub6
	sub7 = UI_v.sub7
	sub8 = UI_v.sub8
	sub9 = UI_v.sub9
	sub10 = UI_v.sub10
	sub11 = UI_v.sub11
	sub12 = UI_v.sub12
	sub13 = UI_v.sub13
	sub14 = UI_v.sub14
	sub15 = UI_v.sub15
 sublist = {
	sub1,
	sub2,
	sub3,
	sub4,
	sub5,
	sub6,
	sub7,
	sub8,
	sub9,
	sub10,
	sub11,
	sub12,
	sub13,
	sub14,
	sub15,
}


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









