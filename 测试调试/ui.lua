require("TSLib")
local ts = require("ts")
local cjson = ts.json
w,h = getScreenSize();
MyTable = {
    ["style"]  = "default",            --  选填，默认样式，控件排列类型
    ["rettype"] = "table",              
    --  选填，旧版，shoui返回值格式
    ["width"] = w,          
    --  选填，安卓默认全屏,iOS默认，showui宽度
    ["height"] = h,             --  选填，安卓默认全屏,iOS默认，shoWui高度
    ["config"] = "showuiTest.txt",  --  选填，无，配置文件保存文件
    ["timer"] = 99,                 --  选填，无，自动执行倒计时
    ["orient"] = 0,                 --  选填，竖屏，显示方向(仅支持iOS)
    ["pagetype"]= "multi",                  
    --  选填，单页，单页/多页 (多页显示时必填,否则无法正确显示showui)
    ["title"] = "触动精灵脚本UI演示",--  选填，脚本配置，showUI标题
    ["titles"] = "第一页,第二页,第三页", 
    --  选填，无，多页howui标题(尽在多页下有效)
    ["cancelname"] = "取消",      --  选填，取消，左下角按钮名称
    ["okname"] = "开始",          --  选填，确认，右下角按钮名称
    ["selpage"] = 1,              --  选填， 无，多页模式下指定默认停留的页面
    ["btnbkcolor"] = "255,255,255",         
    --  选填，255,255,255，底部按钮背景色(仅支持iOS)
    ["bgcolor"] = "255,255,255",  --  选填，255,255,255，界面背景色(仅支持iOS)
    ["pagenumtype"] = "number",  --  选填，无，分页指示样式    
    pages            =
    {
        {
            {
                ["type"] = "Label",
                ["text"] = "点击右上角闹钟关闭倒计时↗",
                ["size"] = 20,
                ["align"] = "center",
                ["color"] = "255,0,0",
            },
            {
                ["type"] = "Label",             -- 必填，控件类型，标签
                ["text"] = "第一页设置",        
                -- 选填，无，显示内容(内容为空,仍然占用一行)
                ["size"] = 25,                  -- 选填，15，字号
                ["align"] = "center",           -- 选填，居左，对齐样式
                ["color"] = "0,0,0",            -- 选填 ，0,0,0，字体颜色
            },
            {
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "单选框-RadioGroup",
                ["size"] = 20,
            },
            {
                ["type"] = "RadioGroup",            
                -- 必填，控件类型，单选框
                ["id"] = "rg",                      
                -- 选填，无，控件ID，以table格式返回返回值时必填,否则无法获取返回值
                ["list"] = "小学,初中,高中,大学",     -- 必填，无，单选框内容
                ["select"] = "1",                   -- 选填，0，默认选中项id
                ["images"] = "showui_test_a.png,showui_test_b.png,showui_test_c.png,showui_test_d.png", 
                -- 选填，无， 单选框选项显示图片
                ["scale"] = "0.4",                  -- 选填，1，图片缩放比例
            },
            {
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "输入框-Edit",
                ["size"] = 20,
            },
            {
                ["type"] = "Edit",               
                -- 必填，控件类型，输入框
                ["id"] = "edit",                  
                -- 选填，无，控件ID 以table格式返回返回值时必填,否则无法获取返回值
                ["prompt"] = "年",                -- 选填，无，提示文字
                ["text"] = "1989",                -- 选填，无，默认文字
                ["kbtype"] = "number",            -- 选填，标准键盘，键盘类型
                ["color"] = "0,0,0",              -- 选填，黑色，字体颜色
                ["size"] = 15,                    -- 选填，15，字体大小
                ["align"] = "center",             -- 选填，居左，对齐方式
            },
            {
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "单级下拉框-ComboBox",
                ["size"] = 20,
            },
            {
                ["type"] = "ComboBox",                             
                -- 必填，控件类型，下拉框
                ["id"] = "cb1",                                     
                -- 选填，无，控件ID以table格式返回返回值时必填,否则无法获取返回值
                ["list"] = "鼠,牛,虎,兔,龙,蛇,马,羊,猴,鸡,狗,猪",
                -- 必填，无，下拉框内容
                ["select"] = "1",                                   
                -- 选填，0，默认选中项id
            },
            {
                ["type"] = "Label",
                ["text"] = "二级下拉框-ComboBox",
                ["size"] = 20,
            },
            {
                ["type"] = "ComboBox",          -- 必填，控件类型，下拉框
                ["id"] = "cb2",                             
                -- 选填，无，控件ID 以table格式返回返回值时必填,否则无法获取返回值
                ["list"] = "北京,上海,广州,深圳",-- 必填，无，下拉框内容
                ["select"] = "0",               -- 选填，0，默认选中项id
                ["data"] = "北京1,北京2,北京3,北京4#"..
                "上海1,上海2,上海3,上海4#"..
                "广州1,广州2,广州3,广州4#"..
                "深圳1,深圳2,深圳3,深圳4",   --必填，无，下拉框子选项内容
                ["source"] = "这里必须一致"                      
                --  必填，无，主选项下拉框控件 source 属性必须与子选项下拉框的dataSource属性一致
            },
            {
                ["type"] = "ComboBox",                      -- 必填，控件类型，下拉框
                ["id"] = "cb3",                             
                -- 选填，无控件 ID，以 table 格式返回返回值时必填,否则无法获取返回值
                ["select"] = "0",                           
                -- 选填，无，子选项下拉框默认选中项
                ["dataSource"] = "这里必须一致"             
                --必填，无，主选项下拉框控件 source 属性必须与子选项下拉框的 dataSource 属性一致
            },
            },{
            {
                ["type"] = "Label",
                ["text"] = "第二页设置",
                ["size"] = 25,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
            {
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "多行文本框-TextArea",
                ["size"] = 20,
            },
            {
                ["type"] =  "TextArea",         -- 必填，控件类型，输入框
                ["id"] = "ta",                  
                -- 选填，无，控件ID 以 table格式返回返回值时必填,否则无法获取返回值
                ["text"] =  "定制脚本担保人员：\r\n"..
                "2885869964\r\n"..
                "触动精灵脚本交易群\r\n"..
                "384123108\r\n"..
                "官方工作人员都是使用288开头的企业QQ\r\n"..
                "交易需谨慎,谨防上当受骗!",       -- 选填，无，默认文字
                ["prompt"] =  "我是hint",       -- 选填，无，提示文字
                ["size"] =  15,                 -- 选填，15，字体大小
                ["align"] =  "center",          -- 选填，居左，对齐方式
                ["height"] =  250,              -- 选填，75，空间高度(仅支持 iOS)
                ["color"] =  "255,0,0",         -- 选填，黑色，字体颜色
                ["kbtype"] = "number",          -- 选填，标准键盘，键盘类型
            },
            {
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "多选框-CheckBoxGroup",
                ["size"] = 20,
            },
            {
                ["type"] = "CheckBoxGroup",     --必填，控件类型，单选框
                ["id"] = "cbg",                             
                -- 选填，无，控件 ID  以 table 格式返回返回值时必填,否则无法获取返回值
                ["list"] = "电影,读书,跑步,吃饭,"..
                "运动,睡觉,旅行,打豆豆,听歌,电影",   -- 必填，无 ，单选框内容
                ["select"] = "3@5@7",           -- 选填，0，默认选中项 id
                ["images"] = "showui_test_a.png,showui_test_b.png,"..
                "showui_test_c.png,showui_test_d.png,showui_test_e.png,"..
                "showui_test_f.png,showui_test_g.png,showui_test_h.png,"..
                "showui_test_i.png,showui_test_j.png",
                -- 选填，无，单选框选项显示图片
                ["scale"] = "0.3",         -- 选填，1，图片缩放比例
            },
            },{
            {
                ["type"] = "Label",
                ["text"] = "第三页设置",
                ["size"] = 25,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
            {
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "图片-Image",
                ["size"] = 20,
            },
            {
                ["type"] = "Image",                 -- 必填，控件类型，图片
                ["src"] = "http://mrw.so/4wbrDw",                                                           --必填，无，图片路径(可填写资源目录下相对路径,绝对路径,网址)
                ["scale"] = 0.4,                     -- 选填，无，图片缩放比例
            },
            {
                ["type"] = "Image",
                ["src"] = "http://mrw.so/4wbrDw",
                ["scale"] = 0.6,                     -- 选填，无，图片缩放比例
                ["align"] = "left"                     -- 选填，居左，对齐方式
            },
            {
                ["type"] = "Image",
                ["src"] = "http://mrw.so/4wbrDw",
                ["scale"] = 0.8,                     -- 选填，无，图片缩放比例
                ["align"] = "center"                     -- 选填，居左，对齐方式
            },
            {
                ["type"] = "Image",
                ["src"] = "http://mrw.so/4wbrDw",
                ["scale"] = 1,                     -- 选填，无，图片缩放比例
                ["align"] = "right"                     -- 选填，居左，对齐方式
            },
        }
    }   
}
local MyJsonString = cjson.encode(MyTable);
UIret,values = showUI(MyJsonString)
if UIret == 1 then
    local rg =  values.rg
    local edit =  values.edit
    local cb1 =  values.cb1
    local cb2 =  values.cb2
    local cb3 =  values.cb3
    local ta =  values.ta
    local cbg =  values.cbg
    dialog("单选:"..rg..",\r\n单行输入框:"..edit..",\r\n一级下拉框:"..cb1..",\r\n二级下拉框主选项:"..cb2..",\r\n二级下拉框子选项:"..cb3..",\r\n多行文本框:"..ta..",\r\n多选框:"..cbg..",")
end
