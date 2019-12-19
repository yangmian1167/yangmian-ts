require('TSLib')
require('tsp')
require('AWZ')
require('ALZ')
require('yzm')
require('5s_11系统取色库')




-----------主要参数和变量---------------
var = {}




id = '11904'
safari = 'com.apple.mobilesafari'
url = 'https://m.changyoyo.com/partner/index.html#shareTo?inviteCode=8229c9506ab6120303800a652963f909'



function upwenfree(reg)
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Hbcy.reg'
	local tb = {}
	tb.phone = var.phone
	tb.password = var. password
	tb.pay = var.pay
	tb.reg = reg or '未支付'
	log(post(url,tb))
end

--取色--



t = {}

--main--
t['正在加载中']={ 0x007aff, "0|1|0x007aff", 90, 24, 98, 614, 125 } --多点找色
t['注册界面']={ 0xffe9a4, "-134|2|0xffc922,-127|-1|0xffc922,-132|23|0xffc922,-1|23|0xffcd31", 90, 386, 148, 601, 640 } --多点找色
t['注册界面1']={ 0xffd85f, "3|23|0xfff5d4,161|-2|0xfff4d1,164|23|0xfffbec,126|13|0xffffff", 90, 386, 148, 601, 640 } --多点找色
	t['注册界面_获取验证码']={ 0xffc922, "-64|-11|0xfff3cc,-64|0|0xffe9a2,-62|11|0xfff8e2,71|-12|0xffe9a4,64|12|0xfff1c3", 90, 396, 167, 595, 606 } --多点找色
	t['注册界面_点击准备输入验证码']={ 0xbcbcbc, "471|2|0xffc922", 90, 12, 214, 594, 604 } --多点找色
	t['注册界面_点击准备输入密码']={ 0xd3d3d3, "513|-5|0x979797,511|-16|0x989898", 90, 24, 318, 614, 748 } --多点找色
	t['注册界面_确认注册']={ 0xffffff, "-161|-33|0xffc922,191|29|0xffc922,-48|-2|0xffc922", 90, 78, 354, 547, 967 } --多点找色
t['购买会员界面']={ 0x000000, "-134|-25|0xffc922,-507|0|0x000000,81|32|0xffc922", 90, 6, 965, 630, 1129 } --多点找色	
	t['购买会员界面_点击头像']={ 0xe9c487, "-33|-30|0xe9c487,-62|0|0xe9c487", 90, 35, 173, 136, 309 } --多点找色
	
t['我的界面']={ 0xffc922, "-222|42|0x000000,304|22|0x2e2d2d,61|49|0xffc922,335|18|0xfbfbfb", 90, 6, 936, 634, 1043 } --多点找色	
t['我的界面_设置']={ 0x000000, "-59|-5|0x888888,-69|-8|0x868686,-60|-19|0x939393", 90, 22, 712, 172, 941 } --多点找色

t['账户设置界面']={ 0x000000, "38|-2|0x010101,105|22|0x000000,-2|22|0xa3a3a3", 90, 20, 158, 588, 200 } --多点找色
	t['账户设置界面_密码管理']={ 0xadadad, "4|-18|0xffffff,-60|-92|0x666666,43|-96|0x666666", 90, 19, 531, 190, 941 } --多点找色

t['密码管理界面']={ 0x464646, "2|23|0x444444,71|-2|0x181818,108|23|0xe8e8e8", 90, 22, 147, 560, 204 } --多点找色
	t['密码管理界面_支付密码']={ 0xe50303, "-408|-7|0x000000,-407|-134|0x000000", 90, 21, 246, 599, 586 } --多点找色
	
t['支付设置界面']={ 0x7b7b7b, "0|20|0x535353,106|-3|0xfcfcfc,108|22|0xc5c5c5", 90, 17, 151, 636, 214 } --多点找色	
	
t['设置支付密码界面']={ 0xb0b0b0, "-2|8|0x4f4f4f,2|25|0x868686,187|-1|0x000000,188|25|0x8d8d8d", 90, 216, 154, 431, 209 } --多点找色	
	t['设置支付密码界_请输入6位数密码']={ 0xa9a9a9, "-136|-14|0xd4d4d4,-134|9|0xd4d4d4,158|-14|0xdcdcdc,158|9|0xdfdfdf", 90, 17, 334, 332, 576 } --多点找色
	t['设置支付密码界_确认密码']={ 0xacacac, "-98|-13|0xf5f5f5,-98|0|0xe5e5e5,-96|9|0xebebeb,67|-10|0xcfcfcf", 90, 18, 394, 205, 674 } --多点找色
	t['设置支付密码界_获取验证码']={ 0xddbc7f, "-106|-2|0xdebd81,58|11|0xddbc7f,38|3|0xffffff", 90, 375, 501, 597, 792 } --多点找色
	t['设置支付密码界_点击准备输入验证码']={ 0xa9a9a9, "384|23|0xddbc7f,500|-5|0xddbc7f", 90, 29, 562, 626, 805 } --多点找色
	t['设置支付密码界_点击准备输入验证码_确认提交']={ 0xffffff, "-280|-36|0xd8be79,-233|31|0xd8be79,242|-15|0xd8be79", 90, 30, 251, 606, 983 } --多点找色
---no interface ----
t['noi_立即开通']={ 0x181218, "-251|-28|0xe8664b,-269|49|0xdd4e31,329|49|0xd3b37d", 90, 17, 957, 630, 1129 } --多点找色
t['noi_密码登录界面点注册']={ 0x666666, "-415|162|0x000000,-378|655|0xffedb2,-1|683|0xffffff", 90, 12, 153, 627, 906 } --多点找色
---tips----
t['tip_使用密码登录']={ 0x030303, "-72|61|0xffedb2,-90|-358|0xffffff,48|-373|0x000000", 90, 105, 238, 526, 910 } --多点找色
t['tip_键盘上的完成']={ 0x007aff, "31|3|0x007aff,36|-10|0x007aff", 90, 527, 551, 633, 722 } --多点找色
t['tip_打码界面']={ 0xa8a8a8, "-438|149|0xffffff,-251|281|0xffffff,-438|276|0xffc922,-33|282|0xffc922", 90, 22, 228, 589, 840 } --多点找色

t['tips_成功界面']={ 0xd3b669, "22|-8|0xd3b669,23|-104|0x000000,30|-101|0x000000,235|-165|0xfbfbfb,-232|-166|0xfbfbfb", 90, 64, 486, 584, 706 } --多点找色



function tips()
	if d('tip_使用密码登录',true) then
	elseif d('tip_打码界面') then
		yzmzoom ={ 302, 547, 484, 620 }
		imgfile = lzScreen(302, 547, 484, 620,1.0)
		if lz_yzm()then
			d('tip_打码界面',true,2)
			inputword(jiegou)
			delay(2)
			d('tip_键盘上的完成',true)
			d('tip_打码界面',true,3)
		else
			d('tip_打码界面',true,1)
		end
	end
end

function noi()
	if d('noi_立即开通',true) then
	elseif d('noi_密码登录界面点注册',true) then
	end
end


function 设置支付密码()
	if d('tips_成功界面',true)then
		upwenfree('成功')
		return true
	elseif d('购买会员界面') then
		d('购买会员界面_点击头像',true)
	elseif d('我的界面') then
		if d('我的界面_设置',true) then
		else
			moveTo(436,786,437,605,3)
		end
	elseif d('账户设置界面') then
		d('账户设置界面_密码管理',true)
	elseif d('密码管理界面') then
		d('密码管理界面_支付密码',true)
	elseif d('支付设置界面') then
		click(209,331)
	elseif d('设置支付密码界面') then
		if d('设置支付密码界_请输入6位数密码',true) then
			input('666888')
			var.pay = '666888'
			d('tip_键盘上的完成',true)
		elseif d('设置支付密码界_确认密码',true) then
			input('666888')
			d('tip_键盘上的完成',true)
		elseif d('设置支付密码界_获取验证码',true) then
			if get_agen then
				if GET_Phone_again(id,phone,token)then
					get_agen = false
				end
			elseif getMessage(id,phone) then
				d('设置支付密码界_点击准备输入验证码',true)
				input(sms)
				delay(1)
				d('tip_键盘上的完成',true)
				d('设置支付密码界_点击准备输入验证码_确认提交',true)
				writeFile({var.phone,var.password,"\n"},'a')
				upwenfree()
				delay()
			end
		end
	end
end



function reg()
	local 获取手机号 = true
	local 获取验证码 = false
	local 注册提交 = false
	local timeline = os.time()
	local timeout = rd(3,5)*60
		get_agen = true
	
	while os.time() - timeline < timeout do
		if active(safari,5) then
			if d('正在加载中')then
			elseif d('注册界面') or d('注册界面1')then
				if 获取手机号 then	
					if GET_Phone(id) then
						click(79,423)
						inputword(phone)
						var.phone = phone
						d('tip_键盘上的完成',true)
						delay(2)
						if d('注册界面_点击准备输入密码',true) then
							input(password)
							d('tip_键盘上的完成',true)
							获取手机号 = false
							获取验证码 = true
							var.password = password
						end	
					end	
				elseif 获取验证码 then
					if d('注册界面_确认注册',true) then
					elseif d('注册界面_获取验证码',true) then
					elseif getMessage(id,phone)then
							d('注册界面_点击准备输入验证码',true) 
							inputword(sms)
							delay(2)
							d('tip_键盘上的完成',true)
					end		
				
				end	
			elseif 设置支付密码() then
				return true
			else
				if noi() then
				elseif tips() then
				end
			end
		end
		delay(2)
	end
	return true
end	
	

while true do	
	password = myRand(4,rd(8,10))
	if vpn() then
		awzNew()
		openURL(url)
		delay(5)
		reg()
	end
	vpnx()
end
















