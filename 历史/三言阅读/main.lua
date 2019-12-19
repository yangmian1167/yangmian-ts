require("TSLib")
require("AWZ")
require("tsp")


------main
var ={}
appbid = {}
appbid.sy = 'com.tongzheng.sylife'
appbid.wb = 'com.sina.weibo'
 







sylist = {
	"三言很不错",
	"三言支持一下",
	"支持三言",
	"很喜欢三言",
	"三言不错",

	}







t = {}

t['三言首页']={ 0xff9900, "11|40|0x000000,283|15|0xff9900", 90, 13, 1041, 637, 1134 } --多点找色
	t['三言首页_找到文章']={ 0x000000, "-5|0|0x000000", 90, 31, 241, 610, 1033 } --多点找色
t['详情界面']={{33,83,0xaaaaaa},{292,89,0x333333},{605,67,0xfefefe},}  --多点取色
	t['详情界面_点赞']={ 0xffffff, "-10|4|0x969696,16|-7|0xa7a7a7", 90, 487, 1066, 534, 1108 } --多点找色
	t['详情界面_发送']={ 0xffffff, "-83|-18|0x007aff,31|23|0x007aff", 90, 479, 1042, 627, 1128 } --多点找色
t['微博_转发发送']={ 0xffffff, "-55|-18|0xff8200,20|19|0xff8200,3|-36|0xf9f9f9", 90, 520, 37, 629, 122 } --多点找色
t['tips_完成']={ 0x007aff, "514|236|0x007aff", 90, 11, 47, 613, 391 } --多点找色
t['tips_广告界面']={ 0x222222, "-77|-17|0x222222,-78|17|0x222222", 90, 27, 46, 214, 113 } --多点找色
t['tips_弹窗访问位置']={ 0x007aff, "282|9|0x5ba8fd,274|-23|0xf9f9f9", 90, 73, 594, 541, 691 } --多点找色
t['tips_分享微博']={ 0xf56362, "-21|0|0xe9eff2,-30|-39|0xea5d5c,41|18|0xea5d5c", 90, 16, 705, 627, 1054 } --多点找色
t['tips_隐私政策']={ 0xffffff, "54|36|0xffb800,-327|-27|0xffffff", 90, 102, 879, 514, 982 } --多点找色
t['tips_立即进入']={ 0xff9900, "-82|-15|0xffffff,112|32|0xffe395", 90, 212, 976, 428, 1063 } --多点找色
function tips()
	if d('tips_完成',true) then
	elseif d('tips_广告界面',true) then
	elseif d('tips_弹窗访问位置',true) then
	elseif d('tips_分享微博',true) then
	elseif d('tips_隐私政策',true) then
	elseif d('tips_立即进入',true) then
	else
		click(49,84)
		moveTo(480,714,113,807)
	end
end


function rea()
	
	local 阅读 = true
	local 点赞 = 1
	local 评论 = 1
	local 分享 = 1
	local 阅读开关 = false
	local worktimeline = 15*60
	local worktimeout = os.time()
	local rea_timeline = math.random(25,30)
	local rea_timeout = os.time()
	
	while os.time() - worktimeout < worktimeline do
		if frontAppBid() == appbid.sy or frontAppBid() == appbid.wb then
			if frontAppBid() == appbid.sy  then	
				if d('三言首页') then
					moveTo(302,775,317,469)
					delay(2)
					if d('三言首页_找到文章',true) then
						阅读开关 = true
					else
						moveTo(302,775,317,469)
					end
				elseif d('详情界面') then
					if 分享 < 6 then
						click(601,1086)
						分享 = 分享 + 1
					elseif 阅读开关 then	
						if 阅读 then
							while os.time() - rea_timeout < rea_timeline do
								for i=1,6 do
									moveTo(316,264,320,597)
									delay(3)
								end
								for i=1,8 do
									moveTo(320,597,316,264)
									delay(2)
								end	
							end	
							rea_timeout = os.time()
						end	
						if 点赞 < 12 and d('详情界面_点赞',true)then
							点赞 = 点赞 + 1
						end	
						if 评论 < 10 then
							三言评语 = sylist [math.random(1,#sylist)]
							click(134,1092)
							delay(2)
							input(三言评语)
							d('详情界面_发送',true)
							评论 = 评论 + 1
						end
							
						d('详情界面',true)	
						阅读开关 = false
					else
						d('详情界面',true)
					end
				else
					tips()
				end	
			elseif  frontAppBid() == appbid.wb then
				delay(10)
				if d('微博_转发发送',true) then
				end	
				active(appbid.sy,5)	
			end
		else
			active(appbid.sy,5)
		end
		delay(1)
	end
	return true
end

--while true do
--	vpnx()
--	if vpn() then
--		rea()
--		awz_next()	
--	end
--end



main_path = '/var/mobile/awzdata/com.tongzheng.sylife/'
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
	'/Library/Caches/default',
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

openURL("https://act-m.wandafilm.com/1708/8173/?cinemaCode=198")




















