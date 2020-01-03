



require("TSLib")
require("tsp")



var = {}
var.appbid = "com.jiayuan.jiayuaniphone";
var.phone = ''
var.password = ''
t={}






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
	local User = 'api-18190-rKpL6bd'
	local Pass = '135246'
	local PID = '2099'
    local token,number = "6klqv7mnkm50knvwmqkbwbkq6l6anw0p",""
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
			local url___ = "http://api.banma1024.net/api/do.php?action=getPhone&sid="..PID.."&token="..token
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
				local blackPhone = {'165','144','141','142','143','144','145','146','147'}
				for k,v in ipairs(blackPhone) do
					if phone_title == v then
						local lx_url =	'http://api.banma1024.net/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
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
local dxcode = _vCode_lx()
dxcode.login()



function rdclicks(x,y,n)
	if n == 0 then
		return false
	end
	for i=1,n do
		click(x,y,0.5)
	end
end
t={}
t['手机号注册界面']={ 0x4f98d6, "-199|-445|0x363839,-205|-447|0xfefefe,-571|7|0x4a95d5,-569|14|0xffffff,-569|16|0x4a95d5", 90, 48, 55, 702, 570 } --多点找色
	t['手机号注册界面_获取验证码']={ 0xffffff, "-105|-14|0xffffff,-220|-18|0xf85e74,144|31|0xf83d84", 90, 79, 578, 671, 703 } --多点找色
function reg()
	local timeline = os.time()
	local outTimes = 60 * 3
	
	var.password  = "AaDd112211"
	local fix_info = false
	
	while os.time()-timeline < outTimes do
		if active(var.appbid,5) then
			if d('手机号注册界面') then
				click(354,326)
				input(phone)
				if d('手机号注册界面_获取验证码',true) then
					click(187,437)
					input(sms)
				end
			end	
		end
		
		delay(2)
	end

end


function up()
	local url = 'http://ssffzz.com/api/Public/idfa/'
	local postdate = {}
	postdate.service = 'Idfa.Idfa'
	postdate.name = '世纪佳缘'
	postdate.idfa = var.phone
	postdate.password = var.password
	postdate.other = '注册成功'
	post(url,postdate)
	-- body
end

require("AWZ")



--if awzNew()then
	if reg()then
		up()
	end
--end














