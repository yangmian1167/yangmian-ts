require("TSLib")
require("tsp")
require("AWZ")
--[[]]
appbid = "com.baihe.online"


function getId()
	local url = 'http://idfa888.com/Public/dyid/?service=dyid.getfix'
	local idfalist ={}
	return post(url,idfalist)
end
function backfix(id)
	local url = 'http://idfa888.com/Public/dyid/?service=dyid.backfix&id='..id
	local idfalist ={}
	return post(url,idfalist)
end




t = {}
t['注册界面点登录'] = {0x555555, "-47|16|0x555555,-238|32|0xff665c,-219|-11|0xff970a", 90, 120, 74, 476, 167}
t['登录界面'] = {0xff9300, "7|-14|0xff9300,-19|33|0xff6956,-91|40|0xff7d45,-254|-11|0x555555,-215|13|0x555555", 90, 145, 76, 532, 166}
t['点击登录'] = {0xffffff, "5|12|0xff655a,-179|-11|0xff7a48,239|16|0xff4a70,237|42|0xff4a70", 90, 47, 365, 591, 681}
t['封号不存在'] = {0x4c2416, "-14|53|0x4c2416,371|2|0x4c1721,373|53|0x4c1721", 90, 60, 459, 578, 663}
t['登录成功_本地相册'] = {0xfc6e27, "-15|111|0xffffff,-45|-409|0xff8000,-279|-479|0xffeace", 90, 43, 161, 582, 951}
function login()
	local timeline = os.time()
	local timeout = math.random(150,180)
	local logintimes = 0
	local 完成数量 = 1
	local 任务数量 = 100
	while os.time() - timeline < timeout do
		if active(appbid,5) then
			if d('注册界面点登录',true) then
			elseif d('登录界面') then
				click(136,247)
				input(bhdata.data.phone)
				click(114,223)
				input(bhdata.data.password)
				d('点击登录',true)
				if d('封号不存在',true) then
					return true
				elseif d('点击登录',true) then
					logintimes = logintimes + 1
					if logintimes > 20 then
						return true
					end
				end
			elseif d('登录成功_本地相册') then
				if 任务数量 == 完成数量 then
					toast("任务量完成")
					lua_exit()
					delay(1)
				else
					完成数量 = 完成数量 + 1
					delay(2)
					return true
				end	
			end	
		end	
		delay(1)
	end
	
end
--[[]]
while true do
	bhdata = (getId())
	if bhdata ~= nil then
		if bhdata.data == "获取失败" then
			dialog("全部完成",60)
			delay(2)
		else
			if vpn() then
				if awzNew() then
					if login()then
						backfix(bhdata.data.id)
					end
				end
			end
			vpnx()
			delay(2)
		end
	end
end
--]]--







