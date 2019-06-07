require("TSLib")
require("AWZ")
require("tsp")

var = ''
appbid = 'com.sdmishu.msyangchengji'


t = {}
t['注册界面']={{574,270,0xe5bac4},{537,232,0x9d9fb8},{381,219,0xa1a1b9},{54,131,0x608cb8},{109,75,0x3880bb},{603,66,0x2d80bc},}  --多点取色
	t['注册界面_快捷注册']={ 0xffffff, "-104|-5|0x352818,-122|-51|0xb88d67,47|18|0x352818", 90, 389, 705, 604, 797 } --多点找色
	t['注册界面_点击注册']={ 0xffffff, "-250|-19|0xb88d67,205|31|0xb88d67,-253|-41|0x352818,-261|-73|0xfcfcfa", 90, 49, 640, 558, 783 } --多点找色
	t['注册界面_登录']={ 0xffffff, "-113|-17|0x84c436,33|14|0x5db613,36|-17|0x7fd71f", 90, 186, 991, 454, 1069 } --多点找色
t['游戏主界面']={ 0xd359ff, "-48|2|0xc5b19d,-182|4|0x52775f,127|4|0xc5ab96", 90, 283, 0, 638, 55 } --多点找色
	t['游戏主界面_任务_完成']={ 0x43b221, "", 90, 72, 928, 334, 953 } --多点找色
	t['游戏主界面_任务_未完成']={ 0xe40b0b, "", 90, 66, 926, 331, 958 } --多点找色
t['店铺窗口']={ 0x715736, "-25|-15|0xf3db8a,21|10|0xa18655,28|-9|0xd7c177", 90, 520, 112, 618, 166 } --多点找色
	t['店铺窗口_没有钱']={ 0xf44b4b, "", 90, 270, 792, 391, 828 } --多点找色
t['tips_访问照片']={ 0x007aff, "-277|-5|0x1786ff,-238|-2|0x007aff,-21|13|0x007aff,-391|-30|0xfcfcfa", 90, 62, 617, 527, 730 } --多点找色
t['tips_创建提示']={ 0xdbdbdb, "-5|89|0xdcdcdc,-1|197|0xd7d7d7", 90, 134, 800, 501, 1095 } --多点找色
t['tips_创建接受']={ 0xffffff, "-71|-14|0x81c430,33|16|0x6dc113,45|-37|0xe3e2df", 90, 371, 805, 553, 930 } --多点找色
t['tips_赚钱卡']={ 0x6f5535, "-39|-11|0xeed789,19|13|0xa48656,19|-2|0xc4ad6a", 90, 530, 245, 619, 297 } --多点找色
function game()
	while true do 
		if active(appbid,5) then
			x,y = findMultiColorInRegionFuzzy( 0xffff93, "8|8|0xfdf885,15|18|0xffff84", 85, 0, 0, 639, 1135)
			if x > 0 and y > 0	 then
				nLog(x..y)
				click(x-50,y+10,0)
				click(x-50,y+50,0)
			end	
			x,y = findMultiColorInRegionFuzzy( 0xd8c24c, "0|4|0xd5c04c,-118|32|0xffff41,-116|36|0xffff47", 70, 0, 0, 639, 1135)
			if x > 0 and y > 0	 then
				nLog(x..y)
				click(x-50,y+10,0)
				click(x-50,y+50,0)
			end
			x,y = findMultiColorInRegionFuzzy( 0xffff4b, "6|4|0xffff4f,12|10|0xffff67,19|19|0xffff65,15|14|0xffff64", 80, 0, 0, 639, 1135)
			if x > 0 and y > 0	 then
				nLog(x..y)
				click(x-50,y+10,0)
				click(x-50,y+50,0)
			end	
			x,y = findMultiColorInRegionFuzzy( 0xd3d376, "19|12|0xdedd7a,27|20|0xe3e27b", 90, 66, 926, 331, 958)
			if x > 0 and y > 0	 then
				nLog(x..y)
				click(x-50,y+10,0)
				click(x-50,y+50,0)
			end
		
			if d('注册界面') then
				if d('注册界面_快捷注册',true) then
				elseif d('注册界面_点击注册',true) then
				elseif d('注册界面_登录',true) then
				
				end
			elseif d('游戏主界面') then
				if d('游戏主界面_任务_完成',true) then
				elseif d('游戏主界面_任务_未完成',true) then
				end	
			elseif d('店铺窗口') then
				
				for i = 1,20 do
					click(323,811,0.2)
				end
				d('店铺窗口',true)
			else
				if d('tips_访问照片',true) then
--				elseif d('tips_创建提示',true) then
				elseif d('tips_创建接受',true) then
				elseif d('tips_赚钱卡',true) then
				else
					click(175,946,0.1)
				end	
			end
			
		end
--		delay(1)
	end
	
end	




t['链接打开']={ 0x007aff, "31|1|0x007aff,-142|-2|0x007aff,-100|-4|0x007aff", 90, 335, 605, 547, 657 } --多点找色







function openU()
	openURL(url)
	while true do
		if d('链接打开',true) then
			delay(20)
			return true
		else
			
		end	
	end
end

