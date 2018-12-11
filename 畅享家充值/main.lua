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
	tb.name = var.name or '畅享家充值'
	tb.idfa = var.idfa or var.phone
	tb.ip = var.ip
	tb.phonename = var.phonename or getDeviceName()
	tb.other = var.other 
	tb.password = var.password
	tb.phone = var.phone
	tb.account = var.account or var.awz_name
	return post(url,tb)
end

function idfaupdate_1()
	local url = "http://idfa888.com/Public/idfa/?service=idfa.idfa"
	local tb={}
	tb.name = var.name or '京东E卡'
	tb.idfa = string
	tb.ip = var.ip
	tb.phonename = var.phonename or getDeviceName()
	tb.other = var.other 
	tb.password = var.password
	tb.phone = var.phone
	tb.account = var.account or var.awz_name
	return post(url,tb)
end

function idfaupdate_2()
	local url = "http://idfa888.com/Public/idfa/?service=idfa.idfa"
	local tb={}
	tb.name = var.name or '积分卡券'
	tb.idfa = string
	tb.ip = var.ip
	tb.phonename = var.phonename or getDeviceName()
	tb.other = var.other 
	tb.password = var.password
	tb.phone = var.phone
	tb.account = var.account or var.awz_name
	return post(url,tb)
end

------------------------从wenfree获取-------------------------
function getwenfree()
	local url = "http://wenfree.cn/api/Public/tjj/?service=hbcy.getNoId"
--	local url = 'http://idfa888.com/Public/idfa/?service=Jfkj.getjfkj'
	local tc={}
	return post(url,tc)
end
-----返回当前ID激活-------
function back()
	local url = "http://wenfree.cn/api/Public/tjj/?service=hbcy.backNoId"
	local tc={
		['id']=var.id
		}
	return post(url,tc)
end


----------------变量----------获取var数据---------------------------
var = {}

---------------主要参数---------------------

--url = 'https://m.changyoyo.com/partner/index.htm#shareTo?inviteCode=224b0406e0761ddbae80458ea5c116d1'
--url = 'https://m.changyoyo.com/partner/index.htm#shareTo?inviteCode=8cd4d82d628ce0f3b3a9b5129a9db76a'
url = 'https://m.changyoyo.com/partner/index.htm#/shareTo?inviteCode=5287915c80651c629439171351553733'
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

-----------------------------------safari--------------------------------------------------------------------


--[[
function rec()
	local 京东E卡key = true
	local 京东30元key = true
	local 京东e卡100元key = true
	local 支付宝21元key = true
	local 支付宝82元key = true
	local 未购买的号key = false
	while true do
		if frontAppBid() == safaribid or frontAppBid() == zhifubao then
		--------------safari------------------
			if d('正在加载中')then
				delay(1)
			elseif d("立即开通",true) then
			elseif d("密码登录界面") or d("登录") then
				if d("密码登录界面or登录_点手机号",true) then
					input(var.phone)
				elseif d("密码登录界面or登录_点手密码",true) then
					input(var.password)
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
					moveTo(681,577,70,574,5)
					delay(2)
				else
					if d("收银台界面_选择支付宝",true) then
					elseif d("收银台界面_确认支付",true) then
					end
				end
			elseif d("会员专属权益界面") then
				if 未购买的号key then
					if 京东E卡key then
						d("会员专属权益界面_京东E卡",true)
					elseif  d("会员专属权益界面_查看",true) then
					end
				else
					back()
					return true
				end
			elseif d("本月券包已领取") then
				京东E卡key = false
				d("返回箭头",true)
			elseif d("立即领取",true) then
				京东E卡key = false
			elseif d("我的票券界面") then
				if 京东30元key  then
					if  d("我的票券界面_京东E卡30元",true) then
					else	
						movet(407,1065,436,867,2)
					end	
--				elseif 京东e卡100元key and d("我的票券界面_京东e卡100元",true) then
--				elseif d("我的票券界面_1000积分",true) then
--				elseif d("我的票券界面_电子券",true) then
				
				end
			elseif d("京东E卡30元立即购买",true) then
			elseif d("京东E卡30元确认下单",true) then
			
			elseif d("卡券详情界面") then
				if 京东e卡100元key then
					if d("卡券详情界面_京东e卡100元",true) then
						delay(2)
					elseif d("卡券详情界面_京东e卡100元复制成功") then
						string = readPasteboard()
						delay(2)
						idfaupdate_1()
						delay(3)
						snapAndSave()
						d("返回箭头",true)
						京东e卡100元key = false
					end	
				elseif d("卡券详情界面_1000积分",true) then
					delay(2)
				elseif d("卡券详情界面_1000积分复制成功") then
					string = readPasteboard()
					delay(2)
					idfaupdate_2()
					delay(3)
					snapAndSave()
					back()
					return true
				end
			elseif d("查看券码",true) then
			elseif d("卡券包界面") then
				if d("卡券包界面_电子券",true) then
				elseif 京东e卡100元key and d("卡券包界面_京东e卡100元",true) then
				elseif d("卡券包界面_1000积分",true) then
				
				end
			elseif d("收银台界面_支付成功查看订单",true) then
				京东30元key = false
			elseif d("首页_钱包",true) then
			elseif d("钱包_我的票券",true) then
				
		--------------支付宝------------------	
			elseif 支付宝21元key then
				if d("支付宝_立即付款",true) then
				elseif d("支付宝_请输入付款密码") then
					phoneKey(tihot001)
					delay(10)
					closeApp(zhifubao)
					var.other = '21付款成功'
					idfaupdate()
					delay(3)
					支付宝21元key = false
				else
					d("tips_打开",true)	
				end
			elseif 支付宝82元key then
				if d("支付宝_立即付款",true) then
				elseif d("支付宝_请输入付款密码") then
					phoneKey(tihot001)
					delay(10)
					closeApp(zhifubao)
					var.account = '82付款成功'
					idfaupdate()
					支付宝82元key = false
				else
					d("tips_打开",true)	
				end
			else
				d("tips_打开",true)
			end
			
		else
			active(safaribid,5)
		end	
		delay(2)
	end
end	


while (true) do
	vpnx()
	if vpn()then
		delay(1)
		account_table = getwenfree()
		var.phone = account_table.data.account
		var.password = account_table.data.password
		var.id = account_table.data.id
		var.ip = ''
		
		awzNew(safaribid)
		delay(2)
		log(url)
		openURL(url)
		delay(5)
		rec()
	end
end

--]]--



--------积分卡券---------




function rec积分卡券()
	local 京东E卡key = true
	local 京东30元key = true
	local 京东e卡100元key = true
	local 支付宝21元key = true
	local 支付宝82元key = false
	local 未购买的号key = false
	while true do
		log("----")
		if frontAppBid() == safaribid or frontAppBid() == zhifubao then
		--------------safari------------------
			log("2----")
			if d('正在加载中')then
				delay(1)
			elseif d("立即开通",true) then
			elseif d("密码登录界面") or d("登录") then
				if d("密码登录界面or登录_点手机号",true) then
					delay(2)
					input(var.phone)
					delay(2)
				elseif d("密码登录界面or登录_点手密码",true) then
					delay(2)
					input(var.password)
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
--					moveTo(681,577,70,574,5) ------6代11系统
					delay(2)
				else
					if d("收银台界面_选择支付宝",true) then
					elseif d("收银台界面_确认支付",true) then
					end
				end
			elseif d("会员专属权益界面") then
				if 未购买的号key then
					if 京东E卡key then
						d("会员专属权益界面",true)
					elseif  d("会员专属权益界面_查看",true) then
					end
				else
					back()
					return true
				end
			elseif d("本月券包已领取") then
				京东E卡key = false
				d("返回箭头",true)
			elseif d("立即领取_会员礼包",true) then
				京东E卡key = false
				delay(3)
			elseif d("我的票券界面") then
				if d("我的票券电子券",true) then
				elseif d("我的票券点击积分卡券",true) then
				end
			
			elseif d("卡券详情领取页面") then
				if d("一键复制",true) then
					delay(1)
					string = readPasteboard()
					delay(2)
					idfaupdate_2()
					delay(3)
					snapAndSave()
					back()
					return true
				end
			elseif d("卡券详情界面1") then
				if d("卡券详情界面1_复制成功",true) then
					delay(1)
					string = readPasteboard()
					delay(2)
					idfaupdate_2()
					delay(3)
					snapAndSave()
					back()
					return true
				end	
			elseif d("查看券码",true) then
			elseif d("卡券包界面")then
				if d("卡券包界面_电子券",true) then
--				elseif 京东e卡100元key and d("卡券包界面_京东e卡100元",true) then
				elseif d("卡券包界面_1000积分",true) then
				
				end
			elseif d("收银台界面_支付成功查看订单",true) then
				京东30元key = false
			elseif d("首页_钱包",true) then
			elseif d("钱包_我的票券",true) then
			elseif d("领取成功_去查看",true) then
		--------------支付宝------------------	
			elseif 支付宝21元key then
				if d("支付宝_立即付款",true) then
				elseif d("支付宝_请输入付款密码") then
					phoneKey(tihot001)
					delay(10)
--					closeApp(zhifubao)
					active(safaribid,5)
					var.other = '21付款成功'
					idfaupdate()
					delay(3)
					支付宝21元key = false
				else
					d("tips_打开",true)	
				end
			elseif 支付宝82元key then
				if d("支付宝_立即付款",true) then
				elseif d("支付宝_请输入付款密码") then
					phoneKey(tihot001)
					delay(10)
					closeApp(zhifubao)
					var.account = '82付款成功'
					idfaupdate()
					支付宝82元key = false
				else
					d("tips_打开",true)	
				end
			else
				if d("tips_打开",true)then
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
	vpnx()
	if vpn()then
		delay(1)
		account_table = getwenfree()
		var.phone = account_table.data.account
		var.password = account_table.data.password
		var.id = account_table.data.id
		var.ip = ''
		
		awzNew(safaribid)
		delay(2)
		log(url)
		openURL(url)
		delay(5)
		rec积分卡券()
	end
end


					

					
			
					
					
					
					
					
					
					
					



