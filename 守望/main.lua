require("TSLib")
require("tsp")
require("ip6color")
require("module")
require("newplayer")
--require("ui")
--log(UI_v)
init(0)
var = ''
appbid = 'com.more.dayzsurvival.ios'




function 领取()
	领取_timeline = 2*60
	领取_timeout = os.time()
	打开菜单key = true
	打开邮件key = true
	打开背包key = true
	打开联盟key = true
	任务key = true
	邮件key = true
	while os.time() - 领取_timeout < 领取_timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then 
					if 找箭头合集() then
					elseif 城内按钮集合() then
					elseif 任务key and d('主界面下_城内_任务绿字',true) then
					elseif d('主界面下_城内_福利红点',true) then
					elseif 打开菜单key and d('主界面下_城内_打开菜单',true) then
						打开菜单key = false		
					elseif 打开邮件key and d('主界面下_城内_打开邮件',true) then
						打开邮件key = false
					elseif 打开背包key and d('主界面下_城内_打开背包',true) then
						打开背包key = false
					elseif 打开联盟key and d('主界面下_城内_打开联盟',true) then					
						打开联盟key = false			
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
end

领取()



d('邮件界面')

d('gametips_返回箭头下')










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


升级铁仓key = true
升级木仓key = true
升级电仓key = true
升级粮仓key = true
升级水仓key = true
升级油仓key = true
升级绿箭头key = true
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





--[[
while true do
	if 优升主城() then
		 if 全局升级() then
			nextgame()
		 end
	end	 
end

--]]













