
--tips无用弹窗	
function tips弹窗()
	if d('tips_招募英雄弹窗',true) then
		return true
	elseif d('tips_造兵缺少资源',true) then
		delay(1)
		d('建筑升级界面',true) 
		return true
	elseif d('tips_邮件不可重复领取',true) then
		return true
	elseif d('tips_新的工程车弹窗') then
		click(687,1289)
		delay(1)
		click(687,1289)
		领取_timeline = 0
		jyzs_timeline = 0
		yszc_timeline = 0
		qjsj_timeline = 0
		jzkd_timeline = 0
		tfjz_timeline = 0
		yskd_timeline = 0
		return true
	elseif d('tips_丰收仓库上限确定',true) then
		return true
	elseif d('tips_用户协议同意',true) then
		return true
	elseif d('tips_基地升级8级确定',true) then
		return true
	elseif d('tips_科研中心等级不足跳转',true) then
		return true
	elseif d('tips_以后不在提示弹窗',true) then
		click(326,815)
		return true
	end	
end


--找箭头合集
function 找箭头合集()
	if(d("tip_向下箭头"))then
		click(x+20,y+70)
		return true	
	elseif(d("tip_向上箭头",true,1))then
		click(x,y-60);
		return true
	elseif d('tip_右下箭头',true)then
		click(x+60,y+60)
		return true	
	elseif d('tip_左上箭头',true)then
		click(x-60,y-60)
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
	elseif 造兵按钮key and d('主界面下_城内_训练按钮',true)or 造兵按钮key and d('主界面下_城内_闪光训练按钮',true) then
		造兵按钮key = false
	elseif 运输按钮key and d('主界面下_城内_运输按钮',true) or 运输按钮key and d('主界面下_城内_运输按钮1',true)then
		运输按钮key = false
	elseif d('主界面下_城内_升级按钮',true) or d('主界面下_城内_升级按钮2',true)  then
		return true
	elseif d('主界面下_城内_闪光升级按钮',true) or d('主界面下_城内_闪光升级按钮晚上',true) then
		return true
	elseif d('主界面下_城内_闪光升级按钮2',true) or d('主界面下_城内_闪光升级按钮3',true) then
		return true
--	elseif d('主界面下_城内_详情升级按钮',true) then
	elseif d('主界面下_城内_加速按钮',true) or d('主界面下_城内_加速按钮晚上',true) then
		优升主城_timeline = 0
	elseif d('主界面下_城内_主城升级按钮',true) then
	elseif d('主界面下_城内_主城详情升级增益装扮按钮',true) then
	elseif d('主界面下_城内_独立详情按钮') then
		弹出主城 = true
		return true
	elseif d('主界面下_城内_修路确定按钮',true) then
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
	elseif d('城内提示图标_修路',true) then
		return true
	elseif d('城内提示图标_建造',true) then
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
	elseif 升级电仓key and d('主界面下_城内_仓库电',true) or 升级电仓key and d('主界面下_城内_仓库电1',true) then 
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

t['gametips_返回箭头下_科研中心']={ 0x85735e, "-1|17|0x988670,5|25|0xa3907a,113|6|0x42382c,110|24|0x5b4b39,109|24|0x9e8a73", 90, 264, 29, 397, 64 } --多点找色
t['gametips_返回箭头下_基地发展']={ 0x494033, "-5|4|0x948169,-4|27|0xaa967f,109|2|0x96826a,112|27|0x635341", 90, 309, 26, 442, 69 } --多点找色
t['gametips_返回箭头下_基地发展_可升级1']={ 0xe9d4b7, "2|1|0xe2ceb1,2|10|0xe1cdb1,10|3|0xe7d2b5,20|7|0xe7d2b5", 90, 28, 119, 704, 1206 } --多点找色
t['gametips_返回箭头下_基地发展_可升级2']={ 0xe9d4b7, "3|1|0xe9d4b7,3|9|0xe9d4b7,11|4|0xe9d4b7,20|4|0xe9d4b7", 90, 28, 119, 704, 1206 } --多点找色
t['gametips_研究']={ 0xfbfaf9, "-9|0|0xf9f8f6,5|12|0xf3f1ec,-62|-6|0x68461b,62|29|0x88632f,-243|-8|0x3c512f,160|-783|0xcaad91", 90, 65, 181, 712, 1152 } --多点找色
t['gametips_返回箭头下_福利中心_末日博览会红色标点']={ 0xb6350f, "26|2|0x9e1d08,29|-26|0xb7360f", 90, 4, 533, 702, 576 } --多点找色
t['gametips_返回箭头下_福利中心_天数红色标点']={ 0xa22109, "-29|0|0xb5340e,-31|-29|0xa6250a", 90, 11, 464, 748, 504 } --多点找色
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
			弹出主城 = true
			if d('gametips_英雄招募界面_免费招募',true) then
			elseif d('gametips_英雄招募界面_免费1次',true) then
			elseif d('gametips_返回箭头下',true) then
			end	
			return true
		elseif d('gametips_返回箭头下_福利中心') then
			if d('gametips_返回箭头下_福利中心_每日补给领取',true) then
			elseif d('gametips_返回箭头下_福利中心_登录有礼领取',true) then
			elseif d('gametips_返回箭头下_福利中心_幸存者庆典领取',true) then
			elseif d('gametips_返回箭头下_福利中心_末日博览会红色标点',true) then
			elseif d('gametips_返回箭头下_福利中心_天数红色标点',true) then
			else
				d('gametips_返回箭头下',true)
			end
			return true
		elseif d('gametips_返回箭头下_活动中心') then
			if d('gametips_返回箭头下_活动中心_红点',true) then
			else
				d('gametips_返回箭头下',true)
			end
		elseif d('gametips_返回箭头下_任务界面') then
			
			if d('gametips_返回箭头下_任务界面_领取',true) then
			elseif d('gametips_返回箭头下_任务界面_宝箱领取',true) then
			else
				click(476,1259)
				d('gametips_返回箭头下',true)	
			end
		elseif d('gametips_返回箭头下_一键入盟',true) then
		elseif d('gametips_返回箭头下_联盟礼物界面') then
			if d('gametips_返回箭头下_联盟礼物界面_一键领取',true) then
				return true
			elseif d('gametips_返回箭头下_联盟礼物界面_领取',true) then
				return true
			else
				d('gametips_返回箭头下',true)
			end	
		elseif d('gametips_返回箭头下_建筑建造中界面') then
			qjsj_timeline = 0
			yszc_timeline = 0
--			yskd_timeline = 0
			d('gametips_返回箭头下',true)
			return true
		elseif 科技key and d('gametips_返回箭头下_科研中心') then
			click(278,291)
			科技key = false
			return true
		elseif d('gametips_返回箭头下_基地发展') then
			if d('gametips_返回箭头下_基地发展_可升级1',true) then
			elseif d('gametips_返回箭头下_基地发展_可升级2',true) then
			else
				d('gametips_返回箭头下',true)
			end	
			if d('tips_科研中心等级不足跳转',true) then
			else
				d("gametips_研究",true) 
				click(53,45)
				delay(1)
				click(53,45)
				delay(1)
				click(53,45)
			end
			return true
		elseif d('邮件界面') then
			if d('邮件界面_一键已读',true) then
				return true
			elseif d('邮件界面_主界面') then
				if d('邮件界面_主界面_有邮件',true) then	
					return true
				end	
			else
				click(62,42)
				return true
			end
		else
			if d('gametips_返回箭头下',true) then
				弹出主城 = true
				return true
			end
		end	
	elseif d("gametips_研究",true)then
		click(53,45)
		delay(1)
		click(53,45)
		delay(1)
		click(53,45)
	elseif d("资源运输")then
		moveTo(127,755,527,758)	
		click(372,850)
		return true
	elseif d('gametips_资源运输界面运输粮水') then
		moveTo(127,758,531,757)
		moveTo(125,852,527,854)
		d('gametips_资源运输界面运输粮水',true)
		return true
	elseif d('gametips_丰收界面使用',true) then
		弹出主城 = true
	elseif d('gametips_新的工程车弹窗',true) then
		click(687,1289)
		return true
	elseif d('gametips_工程车界面通用') or d('gametips_工程车界面') or d('gametips_工程车界面1') or d('gametips_工程车界面3队列') then
		if d('gametips_工程车界面_派遣',true) then
			弹出主城 = true
			return true
		elseif d('gametips_工程车界面',true) then
		end	
	elseif d('建筑升级界面') then
		if d('建筑升级界面_造兵界面') then
			if d('建筑升级界面_造兵界面_训练',true) then
				造兵按钮key = false
				return true
			else
				d('建筑升级界面',true)
			end	
		elseif d('建筑升级界面_基地升级界面') then
			if d('建筑升级界面_跳转',true) then
			end	
		elseif d('建筑升级界面_跳转',true) or d('建筑升级界面_跳转2',true) then
			logs('缺少条件')
			return true
		else
			if d('建筑升级界面_缺少资源') then
				logs('缺少资源,统计中...')
					qjsj_timeline = 0
					yszc_timeline = 0
					yskd_timeline = 0
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
				弹出主城 = true
			else
				if d('建筑升级界面_升级',true) then
					if d('建筑升级界面_当前建筑列队满') then
						领取_timeline = 0
						jyzs_timeline = 0
						yszc_timeline = 0
						qjsj_timeline = 0
						jzkd_timeline = 0
						tfjz_timeline = 0
						yskd_timeline = 0
						return true
					else	
						弹出主城 = true
						return true
					end	
				else 
					if d('建筑升级界面',true) then
					end	
				end	
			end	
		end	
	end	
end	















