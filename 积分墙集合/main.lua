require("TSLib")
require("tsp")
require("nameStr")
require("AWZ")


-- 总的脚本, 用渠道名来区分脚本
function get_task()
	local sz = require("sz")
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.gettask'
	local postArr = {}
	postArr.phonename = phonename or getDeviceName()
	postArr.imei = phoneimei or sz.system.serialnumber()
	local taskData = post(url,postArr)
	
	if taskData ~= nil then
		print_r(taskData)
		if taskData.data == "新增手机" or taskData.data == "暂无任务" then
			nLog(taskData.data)
			delay(30)
			return false
		else
			return taskData.data
		end
	end
end

function task_callback(task_id,success)
	local url = 'http://wenfree.cn/api/Public/idfa/?service=Task.Task_callback'
	local postarr_ = {}
	postarr_['idfa'] = idfa
	local postArr = {}
	postArr.id = task_id
	postArr.success = success
	postArr.arr = json.encode(postarr_)
	nLog("wenfree")
	post(url,postArr)
	nLog("上传一次")
end

function checkip()
	local url = 'http://wenfree.cn/api/Public/idfa/?service=ip.checkip'
	local getdata = get(url)
	if getdata ~= nil then
		data = getdata
		print_r(data or "nil")
		if data.data.state == "ok" then
			ip = data.data.ip or get_ip()
			nLog("ip可以用:OK.",true)
			return true
		else
			nLog("ip, 排重失败",true)
		end
	else
		nLog("ip服务器故障")
	end
end

function ends()
	closeApp(frontAppBid())
	vpnx()
	mSleep(2000)
end

function atexit(callback) -- 参数为一个函数，使用 atexit(一个函数) 注册一个函数在脚本结束时执行，建议不要耗时太长
	____atexit_guard____ = ____atexit_guard____ or {}
	if type(____atexit_guard____) == 'table' then
		if not getmetatable(____atexit_guard____) then
			setmetatable(____atexit_guard____, {
					__gc = function(self)
						if type(self.callback) == 'function' then
							pcall(self.callback)
						end
					end
				})
		end
		____atexit_guard____.callback = callback
	else
		error('别用 `____atexit_guard____` 命名你的变量。')
	end
end
atexit(function() 
		toast('脚本结束了！')
		vpnx()
		local appbids = frontAppBid()
		if appbids ~= "com.apple.springboard" then
--			app.quit(appbids)
			closeX(appbids)
		end
		mSleep(500)
	end)
function all()
	local TaskDate = ( get_task() )
	if TaskDate then
		for i,v in ipairs(TaskDate) do
			
			if v.note == "ios12" then
				osList = {
					"12.3",	"12.3",	"12.3","12.3","12.3","12.3","12.3",
					"12.3.1","12.3.1","12.3.1",
					"12.3","12.3",
					"12.2","12.1.4",
				}
			elseif v.note == "ios11" then
				osList = {
					"11.4","11.4","11.4","11.4","11.4","11.4","11.4","11.4",
					"11.4.1","11.4.1","11.4.1","11.4.1","11.4.1","11.4.1","11.4.1",
					"11.3.1","11.3.1",
					"11.3",
				}
			else
				osList = {
					"12.3.1","12.3.1","12.3.1",
					"12.3","12.3",
					"12.2","12.1.4",
					"11.4","11.4","11.4","11.4","11.4","11.4","11.4","11.4",
					"11.4.1","11.4.1","11.4.1","11.4.1","11.4.1","11.4.1","11.4.1",
					"11.3.1","11.3.1",
					"11.3",
				}
			end
			---设置系统完成
			
			if v.way == "金龙鱼" then
				package.loaded['jry'] = nil
				require("jry")
				main(v)
			elseif v.way == "王丹丹-四叶草" then
				package.loaded['wdd-syc'] = nil
				require("wdd-syc")
				main(v)
			elseif v.way == "王丹丹" then
				package.loaded['wdd'] = nil
				require("wdd")
				main(v)
			elseif v.way == "杨州" then
				package.loaded['yzdd'] = nil
				require("yzdd")
				main(v)
			elseif v.way == "深圳鱼-热云" then
				package.loaded['szry'] = nil
				require("szry")
				main(v)
			elseif v.way == "安徽-聪明钱" then
				package.loaded['cmq'] = nil
				require("cmq")
				main(v)
			elseif v.way == "深圳鱼-爱钱进" then
				package.loaded['aqj'] = nil
				require("aqj")
				main(v)			
			elseif v.way == "wdd-趣玩" then
				package.loaded['quwang'] = nil
				require("quwang")
				main(v)			
			elseif v.way == "河北-巨掌" then
				package.loaded['juzhang'] = nil
				require("juzhang")
				main(v)
			elseif v.way == "刷td" then
				package.loaded['std'] = nil 
				require("std")
				main(v)
			else
				package.loaded[v.way]=nil
				require(v.way)
				main(v)
			end
			
		end
	end
	------------------------------------
	ends()
	
end

--[[]]
while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		nLog(errMessage)
--		sys.alert(errMessage, 3)
		delay(5)
	end
end
--]]


