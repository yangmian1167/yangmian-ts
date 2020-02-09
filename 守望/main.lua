require("TSLib")
require("tsp")
require("ip6color")
require("module")
require("ui")
log(UI_v)
init(0)
var = ''
appbid = 'com.more.dayzsurvival.ios'

	升级铁仓key = true
	升级木仓key = true
	升级电仓key = true
	升级粮仓key = true
	升级水仓key = true
	升级油仓key = true
	升级绿箭头key = true
----以主城为索引升级
function game()
	local 点主城 = true
	local 城内查询超时key = 0
	while true do
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
			elseif game_tips() then
			else
				tips弹窗()
			end
		end
		delay(1)
	end
end	



--城内全局扫描
function 全局升级()
	
	弹出主城 = true
	while true do
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
end

全局升级() 






















