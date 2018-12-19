require("TSLib")
require("tsp")
require("AWZ")

--init('0',1)
--aocbid = "com.lilithgame.sgame"

--t = {}


--t['打开左侧功能栏']={
--	{   10,  372, 0x1dad94},
--}

--t['技能']={
--	{   55,  378, 0x7a7650},
--}

--t['回城']={
--	{  303,  266, 0xbbffee},
--}

--t['使用']= {0x2a96bc, "99|3|0x1d89b2,45|-6|0xffffff", 90, 880, 451, 1079, 551}

--t['在主城里']={
--	{ 1302,   92, 0xeeae24},
--}
--t['回城CD中']={
--	{  313,  183, 0x14142e},
--}

--function 回城()
--	在主城 = false
--	while true do
--		if active(aocbid,6) then
--			if d('打开左侧功能栏',true) then
--			elseif d('技能',true) then
--			elseif d('回城',true) then
--			elseif d('回城CD中',true) then
--				return true
--			elseif d('使用',true) then
--				在主城 = true
			
--			elseif 在主城 then
--				if d('在主城里',true) then
--					return true
--				end
--			else
--				click(27,24)
--			end
--		end	
--		delay(2)
--	end
--end	


--while true do
--回城()
--awz_next()
--end



--function back_pass(task_id,success)
--	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.backpass'
--	local postArr = {}
--	postArr.task_id = task_id
--	postArr.success = success
--	log( post(url,postArr) )
--end

--task_id = '6'
--success = '6'
--back_pass(task_id,success)






function get_task()
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.gettask'
	local postArr = {}
	postArr.phonename = phonename or getDeviceName()
	postArr.imei = phoneimei or sys.mgcopyanswer("SerialNumber")
	local taskData = post(url,postArr)
	
	if taskData ~= nil then
		taskData = json.decode(taskData)
		log(taskData)
		
		if taskData.data == "新增手机" or taskData.data == "暂无任务" then
			log(taskData.data,true)
			delay(30)
			return false
		else
			return taskData.data
		end
	end
end



get_task()











