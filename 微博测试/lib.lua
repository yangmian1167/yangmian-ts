--toast("我是框架库")

function 获取当前界面(界面列表)
for k,v in pairs(界面列表) do
	x,y = findMultiColorInRegionFuzzy( v.界面特征[2],v.界面特征[3], v.界面特征[4], v.界面特征[5], v.界面特征[6], v.界面特征[7], v.界面特征[8]);
	if x>-1 or y>-1 then
		return v.界面特征[1];
	end
end
return "未知页面";
end
function 点击(x,y)
touchDown(1, x, y)
mSleep(50)
touchMove(1, x, y)
mSleep(50)
touchUp(1, x, y)
end
function trim(s) -----去除空格
	return (s.gsub(s, "^%s*(.-)%s*$", "%1"))
end
function string.split(str, delimiter)----分割
	if str==nil or str=='' or delimiter==nil then
		return nil
	end

	local result = {}
	for match in (str..delimiter):gmatch("(.-)"..delimiter) do
		table.insert(result, match)
	end
	return result
end
function 运行(流程)
local 是否运行=true
while ( 是否运行) do
	local 获取当前界面=获取当前界面(界面列表)
	toast("当前页面"..";".. 获取当前界面)
	for k,v in pairs(流程) do
		if 获取当前界面==v[1].界面特征[1] then
			x,y = findMultiColorInRegionFuzzy( v[2][2],v[2][3], v[2][4], v[2][5], v[2][6], v[2][7], v[2][8]);
			if x>-1 or y>-1 then
				if v[5]~= nil then
					v[5]();
				end
				if v[2].tap then
					toast(v[2].tap[1],v[2].tap[2],1)
					点击(v[2].tap[1],v[2].tap[2]);
				else
					点击(x, y)
				toast(v[2][1],1)
					end
				if v[4]~=nil then
					是否退出运行=v[4]();
					if 是否退出运行 then
						是否运行 = false;
					end
				end
			end
		end
		mSleep(2000)
	end
end
end




































