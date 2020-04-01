require("TSLib")
require("tsp")
require("ui")
require("ip6color")
require("module")
require("newplayer")
require("faker")


init(0)
var = ''
appbid = 'com.more.dayzsurvival.ios'

function 领取()
	领取_timeline = 5*60
	领取_timeout = os.time()
	联盟礼物key = true
	运输按钮key = true
	超时计数key = 1
	logs('领取')
	while os.time() - 领取_timeout < 领取_timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then 
					if 找箭头合集() then
					elseif 城内按钮集合() then
					elseif 科技key and d('主界面下_城内_科技') then
							click(x-70,y)
					elseif 任务key and d('主界面下_城内_任务红点',true) then
						任务key = false
					elseif 福利中心key and d('主界面下_城内_福利红点',true) then
					elseif 联盟礼物key and d('主界面下_城内_联盟礼物',true) then
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
					elseif 超时计数key > 3 then
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

t['交易中心兑换_交易按钮']={ 0xb89925, "-16|-35|0x4c423e,41|2|0x534236,-18|27|0x664f39,-1|2|0xb59a30", 90, 500, 746, 661, 893 } --多点找色
t['交易中心兑换_呼叫按钮']={ 0xbc711f, "-16|3|0x564336,9|-20|0x403d46,11|-42|0x4c403f,30|-16|0x4d3f38", 90, 92, 763, 237, 884 } --多点找色
t['交易中心界面']={ 0x8f7b64, "-10|5|0x766556,-10|24|0x7c6653,84|0|0x544433,91|24|0x6e5847", 80, 311, 57, 437, 110 } --多点找色
t['交易中心界面_出售资源']={ 0x655436, "76|-15|0x87744e,-77|-42|0x8f7d75,4|-195|0xbfb1a9", 90, 123, 964, 334, 1259 } --多点找色
t['交易中心界面_换水']={ 0x429fd3, "-9|-21|0x066bb9,-16|-10|0x3f6bab,-5|26|0x5b788d", 90, 40, 305, 122, 412 } --多点找色
t['tips_呼叫按钮']={ 0xffffff, "-133|-7|0x563713,116|36|0x805c29,139|-5|0x573714,30|-5|0xf2ede9,0|-10|0xffffff", 90, 208, 751, 551, 859 } --多点找色
t['tips_道具不足']={ 0xfdfdfc, "-140|-24|0x573813,118|13|0x7a5524,122|-28|0x553713,2|-206|0x91897a,29|-199|0x989080", 90, 185, 581, 562, 856 } --多点找色
----以主城为索引升级
function 交易中心兑换()
	local 点主城 = true
	local 城内查询超时key = 0
--	运输按钮key = true
	jyzs_timeline = 2*60
	jyzs_timeout = os.time()
	logs('交易中心兑换')
	while os.time() - jyzs_timeline < jyzs_timeout do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then 
					if 找箭头合集() then
					elseif d('交易中心兑换_呼叫按钮',true) then
					elseif d('交易中心兑换_交易按钮',true) then
					elseif 城内按钮集合() then
					elseif d('主界面下_城内_主城') or d('主界面下_城内_主城天黑了')then
						click(x+90,y-150)
					else
--						城内查询超时key = 城内查询超时key + 1
--						if 城内查询超时key > 3 then
							click(687,1289)
--							城内查询超时key = 0
--						end
					end
				else
					click(687,1289)
				end
			elseif d('交易中心界面') then
				if d('交易中心界面_出售资源',true) then
				elseif d('交易中心界面_换水') then
					moveTo(242,379,540,382)
					delay(1)
					click(450,1263)
					click(34,103)
					click(34,103)
					return true
				end	
			elseif d('tips_呼叫按钮',true) then
			elseif d('tips_道具不足',true) then
				return true
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
--	运输按钮key = true
	yszc_timeline = 5*60
	yszc_timeout = os.time()
	logs('优升主城')
	while os.time() - yszc_timeout < yszc_timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then 
					if 找箭头合集() then
					elseif 城内按钮集合() then
					elseif d('主界面下_城内_主城天黑了') or d('主界面下_城内_主城天黑了2') then
						click(x+270,y)
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
	qjsj_timeline = 5*60
	qjsj_timeout = os.time()
	logs('全局升级')
	while os.time() - qjsj_timeout < qjsj_timeline do
		if active(appbid,5) then
			if d('主界面下') then
				if d('主界面下_城内') then
					if 找箭头合集() then
					elseif 弹出主城 then
						if d('主界面下_城内_主城天黑了')or d('主界面下_城内_主城')  then	
--							logs('主城定位')
							key = 2
							弹出主城 = false
						elseif d('主界面下_城内_主城天黑了2') or d('主界面下_城内_主城位置2') then
--							logs('主城定位')
							key = 1
							弹出主城 = false
						else
							logs('主城偏离')
							click(687,1289)
						end
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
					弹出主城 = true
					click(687,1289)
					
				end	
			end
		end	
		delay(1)
	end	
	return true
end

--[[]]
function main()
	-- body
	uikey()
	if 建号key then
		new()
	end	
	if 新手key then
		if new_paly() then
			reName('完成新手')
		end	
		if 建号key then
		else	
			nextgame()
		end	
	else	
		if 开图key and 开图() then end
		if 清箱子key and 清箱子() then end
		if 领取key and 领取() then 	end
		if 新手矿点key and 建造矿点() then end
		if 建造key and 投放建筑() then end
		if 优升矿点key and 优升矿点() then end
		
		
		
		if 交易中心兑换key and 交易中心兑换() then end
		if 优升主城key and 优升主城() then end
		if 全局升级key and 全局升级() then end
		nextgame()	
	end	
	 
end
--]]




--[[]]
while (true) do
	local ret,errMessage = pcall(main)
	if ret then
	else
		nLog(errMessage)
--		sys.alert(errMessage, 3)
		delay(5)
	end
end

--]]





