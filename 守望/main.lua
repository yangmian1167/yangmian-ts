require("TSLib")
require("tsp")
require("ip6color")
require("module")
require("newplayer")
require("ui")

init(0)
var = ''
appbid = 'com.more.dayzsurvival.ios'



function 领取()
	领取_timeline = 2*60
	领取_timeout = os.time()
	打开菜单key = true
	造兵按钮key = true
	超时计数key = 1
	while os.time() - 领取_timeout < 领取_timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then 
					if 找箭头合集() then
					elseif 城内按钮集合() then
					elseif 任务key and d('主界面下_城内_任务绿字',true) then
					elseif 福利中心key and d('主界面下_城内_福利红点',true) then
					elseif 联盟礼物key and d('主界面下_城内_联盟礼物',true) then
						联盟礼物key = false
					elseif 打开菜单key and d('主界面下_城内_打开菜单',true) then
						打开菜单key = false		
					elseif 打开邮件key and d('主界面下_城内_打开邮件',true) then
						打开邮件key = false
					elseif 打开背包key and d('主界面下_城内_打开背包',true) then
						打开背包key = false
					elseif 打开联盟key and d('主界面下_城内_打开联盟',true) then					
						打开联盟key = false			
					elseif 造兵提示按钮key and d('主界面下_城内_造兵提示按钮',true) then
						造兵提示按钮key = false
					elseif 粮水缺少按钮key and d('主界面下_城内_粮水缺少按钮',true) then
						粮水缺少按钮key = false
					elseif 超时计数key > 5 then
						return true
					else	
						超时计数key = 超时计数key + 1
					end
				else
					click(687,1289)
				end
			else
				if game_tips() then
				elseif tips弹窗() then
				else
					click(687,1289)
				end	
			end	
		end
	delay(1)
	end
	return true
end





----以主城为索引升级
function 优升主城()
	local 点主城 = true
	local 城内查询超时key = 0
	优升主城_timeline = 2*60
	优升主城_timeout = os.time()
	while os.time() - 优升主城_timeout < 优升主城_timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then 
					if 找箭头合集() then
					elseif 城内按钮集合() then
					elseif d('主界面下_城内_主城天黑了') then
						logs('天黑了升城休息,准备采矿')
						delay(3)
						return true
					elseif d('主界面下_城内_主城') or d('主界面下_城内_主城位置2') then
						click(x+270,y)
					else
						城内查询超时key = 城内查询超时key + 1
						if 城内查询超时key > 3 then
							click(687,1289)
							城内查询超时key = 0
						end
					end
				else
					click(687,1289)
				end
			else
				if game_tips() then
				elseif tips弹窗() then
				else
					click(687,1289)
				end	
			end	
		end
		delay(1)
	end
	return true
end	




--城内全局扫描
function 全局升级()
	弹出主城 = true
	local timeline = 5*60
	local timeout = os.time()
	while os.time() - timeout < timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then
					if 弹出主城 then
						if d('主界面下_城内_主城天黑了') then	
							return true
						elseif d('主界面下_城内_主城') then
							弹出主城 = false
							logs('主城定位')
							key = 2
						elseif d('主界面下_城内_主城位置2') then
							弹出主城 = false
							logs('主城定位')
							key = 1
						else
							logs('主城偏离')
							click(687,1289)
						end
					elseif 找箭头合集() then
					elseif 城内按钮集合() then
					elseif 城内建筑集合() then
					else
						move(movelist[key])
						if key < #movelist then
							key = key + 1
						else
--							弹出主城 = true
							return true
						end
					end
				else
					click(687,1289)
				end
			else
				if game_tips() then
				elseif tips弹窗() then
				else
					click(687,1289)
				end	
			end
		end	
		mSleep(300)
	end	
	return true
end





--[[]]
while true do
	if 领取key and 领取() then 
	end
	造兵按钮key = false
	if 优升主城key and 优升主城() then end
	if 全局升级key and 全局升级() then end
	nextgame()	 
end
--]]













