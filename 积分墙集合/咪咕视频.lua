require("TSLib")
require("tsp")
require("AWZ")
--require("jiema")


--User = 'yangmian'
--Pass = 'yangmian121'
--PID = '52650'

User = 'api-32182-rLPZxzn'
Pass = 'yangmian121'
PID = '8859'

--get函数
function get_lx(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		return res
	end
end
--来信平台
function _vCode_lx() --来信
--	local User = 'api-18190-rKpL6bd'
--	local Pass = '135246'
--	local PID = '1770'
    local token,number = "",""
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = 'http://api.banma1024.net/api/do.php?action=loginIn&name='..User..'&password='..Pass
				log(lx_url)
                RetStr = get_lx(lx_url)
				if RetStr then
					RetStr = strSplit(RetStr,"|")
					if RetStr[1] == 1 or RetStr[1] == '1' then
						token = RetStr[2]
						log('token='..token,true)
						break
					end
				else
					log(RetStr)
				end
			end
			return RetStr;
        end), 
		getPhone=(function()
            local RetStr=""
			local url___ = "http://api.banma1024.net/api/do.php?action=getPhone&sid="..PID.."&token="..token.."&vno=0"
			log(url___)
			RetStr = get_lx(url___)
			if RetStr ~= "" and  RetStr ~= nil then
				log(RetStr)
				RetStr = strSplit(RetStr,"|")
			end
			mSleep(3000)
			if RetStr[1] == 1 or RetStr[1]== '1' then
				number = RetStr[2]
				log(number)
				local phone_title = (string.sub(number,1,3))
--				local blackPhone = {'144','141','142','143','144','145','146','147','199','161','162','165','167','170','171'}
--				local blackPhone = {"130","131","132","145","155","156","166","171","175","176","185","186","134","135","136","137","138","139","147","150","151","152","157","158","159","178","182","183","184","187","188","198"}
				local blackPhone = {"134","135","136","137","138","139","147","150","151","152","157","158","159","178","182","183","184","187","188","198"}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	'http://api.banma1024.net/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
						get_lx(lx_url);
						log("拉黑->"..number)
						mSleep(3000)
						return false
					end
				end
				return number
			end
        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
				mSleep(3000)
				RetStr = get_lx("http://api.banma1024.net/api/do.php?action=getMessage&sid="..PID.."&token="..token.."&phone="..number)
				log(RetStr);
				if RetStr then
					local arr = strSplit(RetStr,"|") 
					if arr[1] == '1' then 
						Msg = arr[2]
						local i,j = string.find(Msg,"%d+")
						Msg = string.sub(Msg,i,j)
					end
					if type(tonumber(Msg))== "number" then log(Msg); return Msg end
				end
				toast(tostring(RetStr).."\n"..i.."次共25次")
            end
            return false
        end),
        addBlack=(function()
			local lx_url =	'http://api.banma1024.net/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
			log("拉黑"..number..'\n'..lx_url);
            return get_lx(lx_url);
        end),
    }
end



--致敬平台
function _vCode_zj() --致敬
--	local User = 'zhangvsqaz'
--	local Pass = '135246'
--	local PID = '10203'
    local token,number = "",""
    return {
	    login=(function() 
            local RetStr
			for i=1,5,1 do
				toast("获取token\n"..i.."次共5次")
                mSleep(1500)
				local lx_url = 'http://api.myzjxl.com:8080/Login/?username='..User..'&password='..Pass
				log(lx_url)
                RetStr = get_lx(lx_url)
				if RetStr then
					RetStr = strSplit(RetStr,"|")
					if RetStr[1] == 1 or RetStr[1] == '1' then
						token = RetStr[2]
						log('token='..token,true)
						break
					end
				else
					log(RetStr)
				end
			end
			return RetStr;
        end), 
		getPhone=(function()
            local RetStr=""
			local url___ = "http://api.myzjxl.com:8080/GetPhone/?id="..PID.."&token="..token.."&isp=3"
			log(url___)
			RetStr = get_lx(url___)
			if RetStr ~= "" and  RetStr ~= nil then
				log(RetStr)
				RetStr = strSplit(RetStr,"|")
			end
			if RetStr[1] == 1 or RetStr[1]== '1' then
				number = RetStr[2]
				log(number)
				local phone_title = (string.sub(number,1,3))
				local blackPhone = {'144','141','142','143','144','145','146','147','199','161','162','165','167','170','171'}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	'http://api.myzjxl.com:8080/Addblack/?id='..PID..'&phone='..number..'&token='..token
						get_lx(lx_url);
						log("拉黑->"..number)
						return false
					end
				end
				return number
			end
        end),
	    getMessage=(function()
			local Msg
            for i=1,25,1 do
				mSleep(3000)
				RetStr = get_lx("http://api.myzjxl.com:8080/GetMsg/?id="..PID.."&token="..token.."&phone="..number)
				log(RetStr);
				if RetStr then
					local arr = strSplit(RetStr,"|") 
					if arr[1] == '1' then 
						Msg = arr[2]
						local i,j = string.find(Msg,"%d+")
						Msg = string.sub(Msg,i,j)
					end
					if type(tonumber(Msg))== "number" then log(Msg); return Msg end
				end
				toast(tostring(RetStr).."\n"..i.."次共25次")
            end
            return false
        end),
        addBlack=(function()
			local lx_url =	'http://api.myzjxl.com:8080/Addblack/?id='..PID..'&phone='..number..'&token='..token
			log("拉黑"..number..'\n'..lx_url);
            return get_lx(lx_url);
        end),
    }
end






local var={}
local jfq={}
var.appbid = "com.wondertek.hecmccmobile";
var.phone = ''
var.password = ''

jfq.idfa = ''


function start()
	local info = getOnlineName()
--	local info = get_curren()
	print_r(info)
	jfq.idfa = strSplit(info[8],":")[2]
	jfq.os_version = strSplit(info[3],":")[2]
	jfq.device = strSplit(info[3],":")[2]
	jfq.udid = strSplit(info[4],":")[2]
end

function up(other)
	local url = 'http://wenfree.cn/api/Public/idfa/'
	local postdate = {}
	postdate.service = 'Idfa.Idfa'
	postdate.name = '咪咕视频'
	postdate.idfa = jfq.idfa
	postdate.password = var.password
	postdate.phone = var.phone
	postdate.other = other
	log(post(url,postdate))
	-- body
end







t = {}
t['tips_开始体验']={ 0xffffff, "-28|-2|0xffffff,-101|-22|0xe11e50,134|13|0xe63491", 90, 195, 1011, 544, 1152 } --多点找色
t['tips_我知道了']={ 0xffffff, "27|3|0xfafdff,-98|-23|0x33b1ff,139|18|0x37b3fe", 90, 201, 930, 541, 1031 } --多点找色
t['tips_已注册更换号码']={ 0x007aff, "40|2|0x007aff,291|-2|0x007aff,373|-5|0x007aff", 90, 164, 718, 583, 762 } --多点找色
t['登录or注册']={ 0x1d1d1d, "30|3|0x000000,69|6|0x000000,64|12|0xffffff,-154|21|0xa3a3a3", 90, 17, 170, 348, 254 } --多点找色
t['登录界面点注册']={ 0x31363e, "24|1|0x31363e,-339|185|0xd60419,-402|709|0x3778ff,-529|1079|0x4dafea,-390|1131|0x1bb935", 90, 49, 52, 722, 1220 } --多点找色
t['同意并继续']={ 0xffffff, "-167|-35|0x3778ff,157|19|0x3778ff,168|-69|0xffffff,81|44|0xffffff", 90, 91, 903, 669, 1062 } --多点找色

t['注册界面']={ 0x84878c, "-2|30|0xf3f3f4,62|1|0xa1a3a7,61|31|0xa2a4a8,36|32|0xc4c5c8", 90, 331, 56, 414, 103 } --多点找色
t['注册界面_输入手机号界面']={ 0x3778ff, "-398|-50|0x3778ff,5|-60|0x3778ff", 90, 34, 664, 715, 801 } --多点找色
t['注册界面_输入手机号界面_手机号文字']={ 0xb0b3b5, "-48|-13|0xc3c5c7,-65|15|0xe5e6e7,15|-12|0xe0e1e1,12|15|0xcecfd1", 90, 61, 569, 154, 607 } --多点找色
t['注册界面_输入手机号界面_下一步']={ 0xffffff, "-236|-23|0x3778ff,218|25|0x3778ff", 90, 30, 667, 720, 791 } --多点找色
t['注册界面_设置登录密码界面']={ 0x4e5259, "1|34|0x767a7f,233|0|0xbfc0c2,230|35|0x94979b,200|1|0x919397", 90, 245, 258, 497, 320 } --多点找色

t['注册成功']={ 0x335481, "49|0|0x2e4057,12|-12|0x4b96dd,12|-26|0xffffff,44|-44|0x62affa,116|-25|0x000000", 90, 32, 156, 390, 248 } --多点找色
function reg()
	local timeline = os.time()
	local outTimes = 60 * 2
	local 手机号 = true
	local 短信 = false
	local 提交 = false
	var.phone = false
	var.password  = myRand(4,8,2)
	local fix_info = false
	
	while os.time()-timeline < outTimes do
		if active(var.appbid,5) then
			if d('tips_开始体验',true) then
			elseif d('tips_我知道了',true) then
			elseif d('登录or注册',true) then
			elseif d('登录界面点注册',true) then
			elseif d('同意并继续',true) then
			elseif d('tips_已注册更换号码',true) then
				click(680,590)
				手机号 = true
				短信 = false
			elseif d('注册界面') then
				if d('注册界面_设置登录密码界面') then
					if d('注册界面_输入手机号界面_下一步',true) then
					else
						click(91,607)
						input[3](var.password)
					end
				elseif d('注册界面_输入手机号界面') then
					if d('注册界面_输入手机号界面_下一步',true) then
					elseif 手机号 then
						var.phone = dxcode.getPhone()
							if var.phone then
								if #var.phone == 11 then
									click(103,593)
									input[3](var.phone)
									手机号 = false
									短信 = true
								end
							end
					end
				elseif 短信 then	
						var.sms = dxcode.getMessage()
						if #var.sms == 6 then
							input[3](var.sms)
							up('点击注册')
							短信 = false
							提交 = true
						end	
				end
			elseif 提交 then
				if d('注册成功') then
					up('注册成功')
					return true
				end	
				
			else
				click(678,1306)
			end	
		end
		delay(1)
	end
	return false
end

dxcode = _vCode_lx()
dxcode.login()
--while true do
--dxcode.getPhone()
--delay(3)
--end

function main()
	vpnx()
	delay(3)
	if vpn() then
		if awzNew() then
			delay(3)
			start()
			if reg() then
				reName('注册成功')
			end	
		end
	end
end




while (true) do
	local ret,errMessage = pcall(main)
	if ret then
	else
		nLog(errMessage)
--		sys.alert(errMessage, 3)
		delay(5)
	end
end









