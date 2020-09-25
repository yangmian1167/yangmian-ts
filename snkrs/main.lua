require("TSLib")
require("tsp")
require("nameStr")
--require("AWZ")


var = {}
var.appbid = "com.nike.onenikecommerce";
var.phone = ''
var.password = ''
t={}



t['加入']={ 0x111111, "-29|7|0x111111,-31|7|0x7f7f7f,-97|-29|0xffffff,-307|-2|0xfdfdfd,-183|45|0xffffff", 90, 18, 1065, 594, 1206 } --多点找色
t['注册界面and继续']={ 0xffffff, "-7|2|0xffffff,-287|-21|0x000000,297|32|0x000000,312|-40|0xffffff", 90, 24, 493, 727, 1176 } --多点找色
t['注册界面and继续_发送验证码']={ 0x111111, "-38|-1|0x111111,-116|-27|0xe5e5e5,44|19|0xe5e5e5,46|-28|0xe5e5e5", 90, 477, 336, 713, 472 } --多点找色

t['键盘_完成']={ 0x007aff, "14|-7|0x007aff,-36|-6|0x007aff,-13|-9|0x007aff", 90, 551, 712, 727, 882 } --多点找色

t['tips_操作失败']={ 0x111111, "-18|0|0x595959,-224|-258|0x969696,101|-172|0x757575,-120|-122|0x757575", 90, 150, 522, 617, 837 } --多点找色



function reg()
	local timeline = os.time()
	local outTimes = 60 * 1
	local 手机号 = true
	local 短信 = false
	local 提交 = false
	var.password  = "AaDd112211"
	local fix_info = false
	
	while os.time()-timeline < outTimes do
		if active(var.appbid,5) then
			if d('注册界面and继续') or d('键盘_完成') then
				if 手机号 then
--					var.phone = dxcode.getPhone()
--					if #var.phone == 11 then
						delay(2)
						click(229,462)
--						input[3](var.phone)
						input[3]('18129871166')
						手机号 = false
						短信 = true
--					end
				elseif 短信 then	
					if d('注册界面and继续_发送验证码',true) then
					else	
--						var.sms = dxcode.getMessage()
--						if #var.sms == 5 then
--							input[3](var.sms)
							click(137,516)
--							input[3](sms)
							input[3]('111111')
--							up('点击注册')
							短信 = false
							提交 = true
							
--						else
--							return false
--						end	
					end
				elseif 提交 then
					if d('注册界面and继续',true) then
					else
	--					up('填写资料')
						toast('注册结束',1)
						return true
					end
				end
			else
				if d('加入',true) then
				elseif	d('tips_操作失败',true) then
				end
			end	
		end
		delay(1)
	end
end


--reg()
t['填资料界面and加入']={ 0xffffff, "-8|0|0x0d0d0d,-18|-10|0x5e5e5e,-269|-36|0x000000,329|26|0x000000", 90, 15, 878, 731, 1271 } --多点找色

function 填资料()
	local timeline = os.time()
	local outTimes = 60 * 4
	local 填资料姓 = true
	local 填资料名 = true
	local 密码 = true
	local 日期 = true

	while os.time()-timeline < outTimes do
		if active(var.appbid,5) then
			if d('填资料界面and加入') or d('键盘_完成') then
				
				
				
				
			end	
		end
		delay(1)
	end
end


res111 = (first_names[math.random(1,#first_names)])
print_r(street_addrs[1])
inputText('中文')




























