require("TSLib")
require("tsp")
require("ip6color")
require("module")
init(0)
var = ''
appbid = 'com.more.dayzsurvival.ios'

	升级铁仓key = true
	升级木仓key = true
	升级电仓key = true
	升级粮仓key = true
	升级水仓key = false
	升级油仓key = true
----以主城为索引升级
function game()
	升级铁仓key = true
	升级木仓key = true
	升级电仓key = true
	升级粮仓key = true
	升级水仓key = true
	升级油仓key = true
	local 点主城 = true
	local 城内查询超时key = 0
	while true do
		if active(appbid,5) then
			找箭头合集()
			
			if d('主界面下') then
				if d('主界面下_城内') then
					城内按钮集合() 
					if d('主界面下_城内_主城天黑了') then
						logs('天黑了升城休息,准备采矿')
						delay(3)
						return true
					elseif d('主界面下_城内_主城',true) then
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
				return true
			else
				tips弹窗()
			end
		end
		delay(1)
	end
end	



--城内全局扫描，只做城内界面动作并结束
--function 全局升级()
--	key = 1
--	if active(appbid,5) then
--		if game_tips() then
--		elseif d('主界面下') then
--			if d('主界面下_城内') then
--				if 城内按钮集合() then
--				elseif 找箭头合集() then
--				else
--					click(687,1289)
--					delay(1)
--					click(687,1289)
--					move(movelist[key])
--					delay(1)
--					key = key + 1
--				end
--			else
--				click(687,1289)
--			end	
--		else
--			if 找箭头合集() then
--			elseif tips弹窗() then
--			else

--			end
--		end
--		delay(1)
--	end	
--end



function 全局升级()
	key = 1
	弹出主城 = true
	while true do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then
					if 弹出主城 then
						click(687,1289)
						弹出主城 = false
					elseif 找箭头合集() then
					elseif 城内按钮集合() then
						return false
					elseif 城内建筑集合() then
					else
						move(movelist[key])
						key = key + 1
					end
				else
					click(687,1289)
				end
			else
				if game_tips() then
					return true
				elseif tips弹窗() then
				end	
			end
		end	
		delay(1)
	end
end


--gamekey = true
--while true do
--	if gamekey and game() then
--		gamekey = false
--	else
--		全局升级() 
--	end
--end

--d('主界面下')
game()
while true do
--全局升级() 
城内按钮集合()
end

