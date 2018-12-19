
function backhome()
	local outTime = os.time()
	while (os.time()-outTime <= 60 ) do
		if active(app,10)then
		elseif UI('在地图中','在地图界面')then
			click(11,370)
		elseif UI_pic('回城','回城展开')then
			UI_pic('回城','回城展开_技能',true)
		elseif UI_pic('回城','弹窗回城',true)then
			delay(1)
			click(983,499)
			delay(10)
			return true
		end
		delay(1)
	end
end


function ad()
	out_time = os.time()
	doing = 0
	发送ad = false
	
	while (os.time()-out_time < 60*3) do
		if active(app,10)then
		elseif UI('聊天','聊天界面')or UI('聊天','聊天界面2')then
			if UI_pic('聊天','聊天界面_世界频道',true)then
			elseif UI('聊天','聊天界面_世界频道_界面')then
				if UI_pic('聊天','聊天界面_世界频道_界面_发送',true)then
					delay(30)
					return true
				elseif UI_pic('聊天','聊天界面_世界频道_界面_发言位置')then
					click(x+200,y)
					input(values.ad)
					click(675,712)
				end
			end
		elseif UI('在地图中','在地图界面')then
			log("准备发广告")
			UI_pic('换服','聊天按钮',true)
		else
			if  UI('返回','返回图标',true,1)then 
			else
				other()
			end
		end
		mSleep(1000)
	end
	
end

--[[
function change()
	out_time = os.time()
	doing = 0
	
	while (os.time()-out_time < 90) do
		if active(app,10)then
		elseif UI('换服','在地图上')then
			if UI_pic('地图','王国',true)then
			elseif UI('地图','侧边',true,1)then
			end
		elseif UI('返回','返回图标',false,1)then
			
			
	--		if UI('返回','纯白之帆利萨姆')then
			if UI('返回','银翼之国桑多瑞')then
				if UI_pic('地图','移民按钮',true)then
				else
					return true
				end
			elseif UI('返回','转国界面')then
				click(1236,39)
				--纯白之帆利萨姆 click(1174,115)
				click(1184,446)
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('other','移民按钮',true,1)then
			doing = doing + 1
			if doing == 2 then
				return true
			end
		else
			other()
		end
		mSleep(1000)
	end
	
end
--]]








