nLog('iphone6')

function orch(name,dj,order,logTxt,stayTime)
	local dj = dj or false
	local order = order or 1
	local arr = {}
	if type(name) == 'table' then
		if #name == 2 then
			arr = t[name[1]][name[2]]
		elseif #name == 3 then
			arr = t[name[1]][name[2]][name[3]]
		end
	else
		arr = t[name]
	end
	x1,y1 = findMultiColorInRegionFuzzy(arr[1],arr[2],arr[3],arr[4],arr[5],arr[6],arr[7])
	if x1 > 0 and y1 > 0 then
		if dj then
			local new_arr2 = split(arr[2],',')
			for i,v in pairs(new_arr2)do
				new_arr2[i]=split(v,'|')
			end
			print_r(new_arr2)
			if order == 1 then
				click(x1,y1)
			else
				click(x+new_arr2[order-1][1],y+new_arr2[order-1][2])
			end
			if type(name) ~= 'table' then
				log("点击-->( "..order..' )->'..name)
			end
		else
			if type(name) ~= 'table' then
				log("找到-->( "..order..' )->'..name)
			end
		end
		log(logTxt)
		return true
	end
end

t={}



--首页菜单
t['首页红绿']={{415,1284,0xff2c55}, {333,1272,0x17eee8}, {415,1295,0xff2c55}, }
t['首页菜单']={{50,1285,0xa4a4a4},{245,1285,0xa3a3a3},{505,1287,0xa1a2a2},{668,1279,0xa1a2a2},
		{415,1288,0xff2c55},{335,1294,0x17eee8},{333,1275,0x17eee8},}







----弹窗
t['弹窗_允许']={ 0x007aff, "-5|-17|0x007aff,-253|-5|0x007aff,-327|-19|0x007aff", 90, 149, 730, 607, 803}
t['弹窗_位置允许']={ 0x292b37, "-263|-9|0x2a2c38,37|-426|0xf783c9,-302|-364|0x3bc8f6", 90, 110, 469, 639, 967}


















































