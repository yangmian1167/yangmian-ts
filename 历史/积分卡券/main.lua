require("TSLib")
require("tsp")
require("AWZ")
require("ALZ")
--require("iphone6ios9")
--require("iphone6ios11")
require("5sios11")




----------------------封装---------------------




function movet(x,y,x1,y1,time)
	local time = time or 2
	touchDown(x, y);    --在坐标 (150, 550)按下
	mSleep(30);
	touchMove(x1, y1);    --移动到坐标 (150, 600)，注意一次滑动的坐标间隔不要太大，不宜超过 50 像素
	mSleep(30);
	touchUp(x1, x1);
	delay(time)
end




function phoneKey(phone)
	for i =1,string.len(phone) do
		local phone_mun = tonumber(string.sub(phone,i,i))
		click(phonekeyArr[phone_mun][1],phonekeyArr[phone_mun][2],0.3)
	end
end

function ocr(x1,y1,x2,y2)
	return ocrText(x1,y1,x2,y2, 0) or 0
end

--[[
function orcText(t)
	local res={}
	for k,v in pairs(t)do
		local text = ocr(v[1],v[2],v[3],v[4])
		res[k]=text
		log(text)
	end
	res['pwd']=res.ka1mima1..res.ka1mima2
	
	var.name = "京东E卡"
	var.idfa = res.ka1
	var.password = res.pwd
	var.phone = var.phone
	idfaupdate()
	return res
end

function orcText_(t)
	keepScreen(true)
	local res={}
	for k,v in pairs(t)do
		local text = ocr(v[1],v[2],v[3],v[4])
		res[k]=text
		log(text)
	end
	var.name = "积分卡券"
	var.idfa = res.ka
	var.ip = res.pwd
	var.phone = var.phone
	idfaupdate()
	keepScreen(false)
	return res
end
--]]--
local res={}
------------82元扫描-------------
res.ka1={136, 529,461, 561}
res.ka1mima1={530, 530,701, 560}
res.ka1mima2={79, 575,240, 602}
------------21元扫描-------------
res_={}
res_.ka={135, 533,416, 560}
res_.pwd={488, 532,586, 560}

------------------上传idfa888----------------------
function idfaupdate()
	local url = "http://idfa888.com/Public/idfa/?service=idfa.idfa"
	local tb={}
	tb.name = '畅享家充值'
	tb.idfa = var.idfa or var.account.login
	tb.ip = var.ip
	tb.phonename = var.phonename or getDeviceName()
	tb.other = var.other 
	tb.password = var.account.pwd
	tb.phone = var.account.login
	tb.account = var.account.login or var.awz_name
	return post(url,tb)
end


function idfaupdate_2()
	local url = "http://idfa888.com/Public/idfa/?service=idfa.idfa"
	local tb={}
	tb.name = '积分卡券'
	tb.idfa = var.idfa or var.account.login
	tb.ip = var.ip
	tb.phonename = var.phonename or getDeviceName()
	tb.other = var.other 
	tb.password = var.account.pwd
	tb.phone = var.account.login
	tb.account = var.account.login or var.awz_name
	return post(url,tb)
end



------------------------从wenfree获取-------------------------
function getjfkj()
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Hbcy.getjfkj'
	return get(url)
end
-----返回当前ID激活-------
function backjfkj(account,jfkj)
	local url = "http://wenfree.cn/api/Public/tjj/?service=Hbcy.backjfkj"
	local tc={
		['account']=account,
		['jfkj']= jfkj,
	}
	log( post(url,tc))
end

function get_task()
	local sz = require("sz")
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.gettask'
	local postArr = {}
	postArr.phonename = phonename or getDeviceName()
	postArr.imei = phoneimei or sz.system.serialnumber()
	local taskData = post(url,postArr)
	
	if taskData ~= nil then

		if taskData.data == "新增手机" or taskData.data == "暂无任务" then
			log(taskData.data,'all')
			delay(30)
			return taskData.data
		else
--			log(taskData.data)
			return taskData.data
		end
	end

end

function back_pass(task_id,success)
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.backpass'
	local postArr = {}
	postArr.task_id = task_id
	postArr.success = success
	log( post(url,postArr) )
end



---------------主要参数---------------------
var = {}

var.account={}





--url = 'https://m.changyoyo.com/partner/index.htm#shareTo?inviteCode=224b0406e0761ddbae80458ea5c116d1'
--url = 'https://m.changyoyo.com/partner/index.htm#shareTo?inviteCode=8cd4d82d628ce0f3b3a9b5129a9db76a'
url = 'https://m.changyoyo.com/partner/index.html#/shareTo?inviteCode=bf1e517d4c3f9194b07580abd035bae6'

safaribid = 'com.apple.mobilesafari'
zhifubao = 'com.alipay.iphoneclient'

----支付密码----
tihot001 = '199555'
local phonenamelist = {}
phonenamelist['百合网']='123124'
phonenamelist['iPhone41']='123124'
phonenamelist['iPhone42']='123124'
phonenamelist['iPhone43']='123124'
phonenamelist['iPhone44']='520000'
phonenamelist['iPhone45']='520000'
phonenamelist['iPhone52']='520000'
phonenamelist['iPhone53']='051268'
phonenamelist['iPhone54']='024290'
phonenamelist['iPhone55']='024290'


if phonenamelist[getDeviceName(str)] then
	tihot001 = phonenamelist[getDeviceName(str)]
end


--初始化帐号体系
if fileExists() then
	log('true')
else
	writeFile({},'w')
	delay(2)
end


function readLocalAccount()
	local res = readFile()
	local tb = {}
	if #res >= 2 then
		for i,v in ipairs(res) do
			local vlist = split(v,":")
			tb[vlist[1]] = vlist[2]
		end
		log(tb)
		return tb
	end
end

function initdata()
	if readLocalAccount()then
		local localaccount = readLocalAccount()
		var.account.login = localaccount['account']
		var.account.pwd = localaccount['password']
		var.account.id = localaccount['id']
		log('本地数据')
		return true
	else
		local serviceData = getjfkj()['data']
		log(serviceData)
		var.account.login = serviceData['account']
		var.account.pwd = serviceData['password']
		var.account.id = serviceData['id']
		writeFile(serviceData)
		log('网络数据')
		return true
	end
end


function update()
	delay(1)
	var.idfa = readPasteboard()
	if var.idfa == '' or var.idfa == nil then
		var.idfa = var.account.login
	end
	delay(2)
	var.other = var.other
	writeFile({},"w")
	idfaupdate_2()
	backjfkj(var.account.login,var.idfa)
	back_pass(task_id,"ok")
end
--------积分卡券---------


function rec积分卡券()
	local 京东30元key = true
	local 未购买的号key = false
	initdata()
	while true do
		if frontAppBid() == safaribid or frontAppBid() == zhifubao then
		--------------safari------------------
			if d('正在加载中')then
				delay(1)
			elseif d("立即开通",true) then
			elseif d("密码登录界面") or d("登录") then
				if d("密码登录界面or登录_点手机号",true) then
					delay(2)
					input(var.account.login)
					delay(2)
				elseif d("密码登录界面or登录_点手密码",true) then
					delay(2)
					input(var.account.pwd)
					delay(2)
					d("密码登录界面or登录_完成",true)
				elseif d("密码登录界面or登录_完成",true) then
				else
					if d("登录",true)then
						idfaupdate()
						delay(3)
					end
				end
			elseif d("立即加入") then
				未购买的号key = true
				if d("立即加入_点击月卡",true) then
				else
					d("立即加入",true) 
				end
			elseif d("收银台界面") then
				if d('收银台界面_右侧有积分')then
					
					moveTo(554,577,41,578,5)-------5s11系统
					delay(2)
				else
					if d("收银台界面_选择支付宝",true) then
					elseif d("收银台界面_确认支付",true) then
					end
				end
			elseif d("会员专属权益界面") then
				if 未购买的号key then
					d('会员专属权益界面_加油卡',true) 
				else
					var.other = '开过会员'
					writeFile({},"w")
					idfaupdate()
					return true
				end
			elseif d("本月券包已领取") then
				d("返回箭头",true)
			elseif d("立即领取_会员礼包",true) then

			elseif d("我的票券界面") then
				if d("我的票券电子券",true) then
				elseif d("我的票券点击积分卡券",true) then
				end
			
			elseif d("卡券详情领取页面") then
				if d("一键复制",true) then
					update()
					return true
				end
			elseif d("卡券详情界面1") then
				if d("卡券详情界面1_复制成功",true) then
					update()
					return true
				end	
			elseif d("查看券码",true) then
			elseif d("卡券包界面")then
				if d("卡券包界面_电子券",true) then
				elseif d("卡券包界面_1000积分",true) then
				
				end
			elseif d("收银台界面_支付成功查看订单",true) then
				京东30元key = false
			elseif d("首页_钱包",true) then
			elseif d("钱包_我的票券",true) then
			elseif d("领取成功_去查看",true) then
		--------------支付宝------------------	
			elseif frontAppBid() == zhifubao then
				if d("支付宝_立即付款",true) then
				elseif d("支付宝_请输入付款密码") then
					phoneKey(tihot001)
					delay(10)
--					closeApp(zhifubao)
					active(safaribid,5)
					var.other = '21付款成功'
					idfaupdate()
					delay(3)
				else
					d("tips_打开",true)	
				end
			else
				if d("tips_打开",true)then
				elseif d("tips_使用账号密码登录",true)then
				else
					log('--')
				end
			end
			log('last')
		else
			active(safaribid,5)
		end		
		delay(2)
	end
end	


while (true) do
	local urltalbe = get_task()
	log(urltalbe)
	if type(urltalbe) == "table" then
		task_id = urltalbe[1].task_id
		url = urltalbe[1].work
		vpnx()
		delay(3)
		if vpn()then
			awzNew(safaribid)
			delay(2)
			openURL(url)
			delay(5)
			 rec积分卡券()
		end

	end
end



















