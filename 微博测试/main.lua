--toast("我是main")
init('0',0)
require("TSLib")
require("lib")
require("page")

--当前页面=获取当前界面(界面列表);
--nLog("获取到的页面"..当前页面)



账号 ={};
--function 读取账号()
--local 账号角标=1;
--for line in io.lines(userPath().."/1.txt") do
--	toast(line);
----	nLog(line);
--	账号[账号角标] = line;
--	账号角标=账号角标+1;
--end
--end
	
local 账号角标 = 3
function 读取账号()
local tab = readFile("/User/Media/TouchSprite/lua/1.txt")
	账号 = tab[账号角标]
	nLog(账号)
	账号角标 = 账号角标 + 1
	if 账号 == nil or 账号 == '' then
		dialog('账号取完或当前账号为空',2)----
	end	
end

function 登录账号()
输入账号和密码=function ()
--dialog(账号[1],2);
	账号和密码= strSplit(账号,"-");
--dialog("账号"..账号和密码[2],1);
	toast("账号"..账号和密码[1],1)
	账号=trim(账号和密码[1]);
	密码=trim(账号和密码[2]);
	点击(253,  523);
	mSleep(1000);
	inputText(账号);
	mSleep(2000);
	点击(210,412);
	mSleep(2000);
	点击(251,  622);
	mSleep(2000);
	inputText(密码);
	mSleep(2000);
	点击(373,  803);
	mSleep(1000);
end
检测是否进入转发=function ()
	return true;
end

流程={
	{主界面,主界面.页面登录};
	{登录界面,登录界面.短信或账号登录};
	{登录界面,登录界面.用登录};
	{登录界面,登录界面.登录,nil,检测是否进入转发,输入账号和密码};
}
运行(流程);
end

function 转发()
toast("开始转发",1)
local 搜索点击后输入内容=function()
	inputText("凉凉丶凉到心里");
	mSleep(2000);
	点击( 658, 1288);
	mSleep(1000)
end
local 搜索点击后输入寻找内容=function ()
	inputText("不好玩啊");
	mSleep(2000);
	点击( 658, 1280);
	mSleep(2000);
	点击(549,  270);
end
local 转发点击前输入内容=function ()
	inputText("你好啊");
	mSleep(1000);
end
local 转发后点击=function ()
	toast("点击返回返回",1);
	mSleep(2000);
	tap (83,84)
end

local 转发后点击2=function ()

	toast("点击返回返回2",1);
	mSleep(2000);
	tap (83,84);
	mSleep(1000);
	tap (32,97);
	mSleep(1000);
	tap (74, 1302)
end
local 检测是否退出=function ()
	return true;
end
流程={
	{主界面,主界面.发现按钮};
	{发现界面,发现界面.搜索点击,nil,搜索点击后输入内容};
	{搜索后界面,搜索后界面.综合界面};
	{分组界面,分组界面.暂不分组};
	{筛选界面,筛选界面.点击搜索文,nil,搜索点击后输入寻找内容};
	{微博正文,微博正文.点击转发};
	{转发微博,转发微博.点击发送,nil,转发后点击,转发点击前输入内容};
	{取消界面,取消界面.取消点击,nil,转发后点击2};
	{主界面,主界面.页面红包,nil,检测是否退出};

}
运行(流程);
end







function 退出账号()

点击后滑动 = function ()
	--	dialog("点击滑动",1);
	mSleep(2000)
	moveTo( 451,663,465, 420);
end
检测是否退出=function ()
	return true;
end

流程={
	{主界面,主界面.人头按钮};
	{我的界面,我的界面.我的设置,nil,点击后滑动};
	{设置界面,设置界面.点击设置};
	{退出界面,退出界面.点击设置退出,nil,检测是否退出};
}
运行(流程);
end
function 登录游戏()
读取账号();
登录账号();
end
登录游戏()
--转发()
--发原创()
--转发()
--退出账号();
--touchDown(187,  142);    
--mSleep(30);
--touchMove(257,  142);    
--mSleep(30);
--touchUp(257,  142);
--tap (83,   84)

