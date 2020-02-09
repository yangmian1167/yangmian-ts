
--tips无用弹窗	
function tips弹窗()
	if d('tips_招募英雄弹窗',true) then
		return true
	end
	return false
end


--找箭头合集
function 找箭头合集()
	if(d("tip_向下箭头",true,1))then
		click(x,y+50)
		return true	
	elseif(d("tip_向上箭头",true,1))then
		click(x,y-50);
		return true
	elseif d('tip_右下箭头',true)then
		click(x+50,y+50)
		return true	
	elseif d('tip_左上箭头',true)then
		click(x-50,y-50)
		return true	
--	elseif d('tip_左下角感叹号',true)then
--		return true	
--	elseif d('tip_左下角感叹号2',true)then
--		return true
	end
end


--城内按钮集合
function 城内按钮集合()
	keepScreen(true)
	if d('主界面下_城内_驻扎详情升级急速按钮',true) then
	elseif d('主界面下_城内_升级按钮',true) then
		return true
	elseif d('主界面下_城内_闪光升级按钮',true) then
		return true
	elseif d('主界面下_城内_详情升级按钮',true) then
	elseif d('主界面下_城内_主城升级按钮',true) then
	elseif d('主界面下_城内_独立详情按钮') then
		弹出主城 = true
		return true
--	elseif d('城内提示图标',true) then
	elseif d('城内提示图标_造兵完成',true) then
		return true
	elseif d('城内提示图标_新闻',true) then
		return true
	elseif d('城内提示图标_收货',true) then
		return true
	elseif d('城内提示图标_英雄',true) then
		return true
	end
	keepScreen(false)
end	
--城内建筑集合
function 城内建筑集合()
	if 升级铁仓key and d('主界面下_城内_仓库铁',true) then
			升级铁仓key = false
			return true
	elseif 升级木仓key and d('主界面下_城内_仓库木',true) then 
			升级木仓key = false
			return true
	elseif 升级粮仓key and d('主界面下_城内_仓库粮',true) then 
			升级粮仓key = false
			return true	
	elseif 升级水仓key and d('主界面下_城内_仓库水',true) then 
			升级水仓key = false
			return true
	elseif 升级油仓key and d('主界面下_城内_仓库油',true) then 
			升级油仓key = false
			return true
	elseif 升级电仓key and d('主界面下_城内_仓库电',true) then 
			升级电仓key = false
			return true
--	elseif 升级绿箭头key and d('主界面下_城内_升级小绿标1',true) then 
--		升级绿箭头key = false
--		return true
	elseif 升级绿箭头key and d('主界面下_城内_升级小绿标',true) then 
--		升级绿箭头key = false
		return true
	end
end


--与主城内挂钩tips
function game_tips()
	if d('gametips_返回箭头下') then
		if d('gametips_驻扎管理界面') then
			if d('gametips_驻扎管理界面_驻扎',true) then
--				return true
			elseif d('gametips_返回箭头下',true) then
			end		
		elseif d('gametips_联盟工资界面') then
		if d('gametips_联盟工资界面_红点',true) then
			d('gametips_联盟工资界面_出勤宝箱',true)
			elseif d('gametips_返回箭头下',true) then
--				return true
			end
		elseif d('gametips_英雄招募界面') then
			if d('gametips_英雄招募界面_免费招募',true) then
			elseif d('gametips_英雄招募界面_免费1次',true) then
			elseif d('gametips_返回箭头下',true) then
			end	
		else
			if d('gametips_返回箭头下',true) then
				弹出主城 = true
			end
		end	
	elseif d('gametips_丰收界面使用',true) then
		弹出主城 = true
	elseif d('gametips_新的工程车弹窗',true) then
		click(687,1289)
		return true
	elseif d('gametips_工程车界面') then
		if d('gametips_工程车界面_派遣',true) then
			弹出主城 = true
			return true
		elseif d('gametips_工程车界面',true) then
		end	
	elseif d('建筑升级界面') then
		if d('建筑升级界面_基地升级界面') then
			if d('建筑升级界面_跳转',true) then
				delay(3)
			end	
		elseif d('建筑升级界面_跳转',true) then
			logs('缺少条件')
			delay(2)
			return true
		else
			if d('建筑升级界面_缺少资源') then
				logs('缺少资源,统计中...')
				if d('建筑升级界面_缺粮') then
					升级粮仓key = true
				end						
				if d('建筑升级界面_缺电') then
					logs('缺少资源电')
					升级电仓key = true
				end						
				if d('建筑升级界面_缺铁') then
					升级铁仓key = true
				end	
				if d('建筑升级界面',true) then
					return true
				end	
			else
				if d('建筑升级界面_升级',true) then
						return true
				else 
					d('建筑升级界面',true)
				end	
			end	
		end
	end	
end	