

require("TSLib")
require("tsp")
require("AWZ")



var = {}
var.appbid = "com.jiayuan.jiayuaniphone";
var.phone = ''
var.password = ''
t={}


function get_lx(url)
	local sz = require("sz")	
	local res = httpGet(url);
--	log(res)
	if res~= nil or res~= '' then
		return res
	end
end
--服务器对接取号
function _Server_get()
	phone_name = getDeviceName()
	phone_imei = getDeviceID()
	log(phone_name)
	log(phone_imei)
	delay(2)
	return{
		login=(function()
			return	
		end),
		getPhone = (function()
				RetStr = get_lx('http://sms.wenfree.cn/public/?service=App.Sms.GetPhone'.."&imei="..phone_imei.."&phonename="..phone_name)
				local sz = require('sz')
				local cjson = sz.json
				RetStr = cjson.decode(RetStr)
				log(RetStr)
				if RetStr then
					if RetStr.data.meg == success or RetStr.data.meg == 'success' then
						number = RetStr.data.phone
						log(number)
						local phone_title = (string.sub(number,1,3))
--						local blackPhone = {'144','141','142','143','144','145','146','147','199','161','162','165','167','170','171'}
						local blackPhone = {'144','141','142','143','144','145','146','147'}
--						local blackPhone = {}
						for k,v in ipairs(blackPhone) do
							if phone_title == v then
								local lx_url =	'http://api.cafebay.cn/api/do.php?action=addBlacklist&sid='..PID..'&phone='..number..'&token='..token
								get_lx(lx_url);
								log("拉黑->"..number)
								return false
							end
						end
					end
				else
					log(RetStr)
				end
				mSleep(3000)
				return number
		end),
		 getMessage=(function()
			local Msg
            for i=1,25,1 do
				mSleep(3000)
				RetStr = get_lx("http://sms.wenfree.cn/public/?service=App.Sms.GetMessage".."&imei="..phone_imei.."&phonename="..phone_name)
				local sz = require('sz')
				local cjson = sz.json
				RetStr = cjson.decode(RetStr)
				log(RetStr);
				if RetStr then
					if RetStr.data.meg == success or RetStr.data.meg == 'success' then
						Msg = RetStr.data.sms
						if type(tonumber(Msg))== "number" then log(Msg); return Msg 
						else
							Msg = RetStr.data.sms
							log(Msg)
							local i,j = string.find(Msg,"%d+")
							Msg = string.sub(Msg,i,j)
							if type(tonumber(Msg))== "number" then log(Msg); return Msg end
						end
					end
				end
				toast(tostring(RetStr).."\n"..i.."次共25次")
				mSleep(3000)
            end
            return false
        end),
	
	
	}
	
end
--dxcode = _Server_get()
--dxcode.getPhone()

sys = {
	clear_bid = (function(bid)
		closeApp(bid)
		delay(1)
		os.execute("rm -rf "..(appDataPath(bid)).."/Documents/*") --Documents
		os.execute("rm -rf "..(appDataPath(bid)).."/Library/*") --Library
		os.execute("rm -rf "..(appDataPath(bid)).."/tmp/*") --tmp
		clearPasteboard()
		--[[
		local path = _G.const.cur_resDir
		os.execute(
			table.concat(
				{
					string.format("mkdir -p %s/keychain", path),
					'killall -SIGSTOP SpringBoard',
					"cp -f -r /private/var/Keychains/keychain-2.db " .. path .. "/keychain/keychain-2.db",
					"cp -f -r /private/var/Keychains/keychain-2.db-shm " .. path .. "/keychain/keychain-2.db-shm",
					"cp -f -r /private/var/Keychains/keychain-2.db-wal " .. path .. "/keychain/keychain-2.db-wal",
					'killall -SIGCONT SpringBoard',
				},
				'\n'
			)
		)
		
		]]
		clearAllKeyChains()
		clearIDFAV() 
		--clearCookies()
		delay(2)
		return true
	end)
}

function start()
	local info = getOnlineName()
--	local info = get_curren()
	print_r(info)
	jfq.idfa = strSplit(info[8],":")[2]
	jfq.os_version = strSplit(info[3],":")[2]
	jfq.device = strSplit(info[3],":")[2]
	jfq.udid = strSplit(info[4],":")[2]
end

function rdclicks(x,y,n)
	if n == 0 then
		return false
	end
	for i=1,n do
		click(x,y,0.5)
	end
end

--t['手机号注册界面']={ 0x4f98d6, "-199|-445|0x363839,-205|-447|0xfefefe,-571|7|0x4a95d5,-569|14|0xffffff,-569|16|0x4a95d5", 90, 48, 55, 702, 570 } --多点找色
t['手机号注册界面2']={ 0x4b96d5, "22|-11|0x4a95d5,507|-20|0x4a95d5,573|-11|0x4a95d5,536|-8|0xfdfeff,568|-13|0xffffff", 90, 65, 508, 692, 558 } --多点找色
t['手机号注册界面']={ 0x4a95d5, "25|-14|0x4e97d6,68|-9|0x4a95d5,484|-15|0x4a95d5,572|-14|0x4b96d5,567|-15|0xffffff", 90, 68, 509, 686, 562 } --多点找色
	t['手机号注册界面_获取验证码']={ 0xffffff, "-105|-14|0xffffff,-220|-18|0xf85e74,144|31|0xf83d84", 90, 79, 578, 671, 703 } --多点找色
	t['完成界面']={ 0xb2b3b3, "0|12|0x373a3b,-143|12|0x363a3b,-595|0|0xff2581,-574|2|0xffffff", 90, 43, 1246, 710, 1312 } --多点找色
	local degree = 85

	t['填写资料']={0x4a90e2,"27|110|0xfedae6,-356|119|0xd6eeff",degree,17,43,721,603}
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
			if d('填写资料') or d('上传头像_跳过') or d('上传头像_跳过ios10新')then
				return true
			elseif d('手机号注册界面') then
				if 手机号 then
					var.phone = dxcode.getPhone()
					if #var.phone == 11 then
						delay(2)
						click(354,326)
						input[3](var.phone)
						手机号 = false
						短信 = true
					end
				elseif 短信 then	
					if d('手机号注册界面_获取验证码',true) then
					else	
						var.sms = dxcode.getMessage()
						if #var.sms == 5 then
							input[3](var.sms)
							click(187,437)
							input[3](sms)
							up('点击注册')
							短信 = false
							提交 = true
							
						else
							return false
						end	
					end
				end
			elseif 提交 then
--				if d('填写资料') then
--					up('填写资料')
					return true
--				end
			end	
		end
		delay(2)
	end

end


t['填资料1界面']={ 0x000000, "-10|-12|0xfefefe,285|4|0x000000,290|16|0xfefefe,296|19|0x000000,303|19|0xfefefe", 90, 29, 134, 362, 208 } --多点找色
t['填资料1界面ios10']={ 0x5a5c5d, "-39|-10|0x565859,-182|-18|0x7e7f7f,-186|5|0x979899,6|6|0xf1f1f1", 90, 271, 62, 484, 106 } --多点找色
	t['填资料1界面_请输入昵称']={ 0xd9d9d9, "-13|-3|0xd9d9d9,-28|-8|0xd9d9d9,-89|1|0xd9d9d9,-98|-1|0xd9d9d9", 90, 176, 386, 334, 432 } --多点找色
	t['填资料1界面_请输入昵称ios10']={ 0x4a90e2, "-140|-26|0x4a90e2,-3|-28|0x4a90e2", 90, 473, 275, 664, 335 } --多点找色
	t['填资料1界面_男女比例']={ 0xfed9e7, "-380|2|0xdaeeff,-348|46|0xd1edff,24|48|0xfedfe4", 90, 114, 471, 623, 569 } --多点找色
	t['填资料1界面_男女比例ios10']={ 0xfed9e7, "-373|4|0xd9eeff,-370|33|0xd5eeff,19|46|0xfee0e3", 95, 111, 371, 574, 452 } --多点找色
	t['填资料1界面_生日未选择']={ 0xd9d9d9, "6|8|0xd9d9d9,82|-4|0xf3f3f3,84|6|0xdadada,84|17|0xdbdbdb", 90, 545, 607, 644, 651 } --多点找色
	t['填资料1界面_生日未选择ios10']={ 0xd9d9d9, "6|8|0xd9d9d9,82|-4|0xf3f3f3,84|6|0xdadada,84|17|0xdbdbdb", 90, 540, 501, 649, 548 } --多点找色
	t['填资料1界面_地区未选择']={ 0xd9d9d9, "6|8|0xd9d9d9,82|-4|0xf3f3f3,84|6|0xdadada,84|17|0xdbdbdb", 90, 544, 701, 645, 739 } --多点找色
	t['填资料1界面_地区未选择ios10']={ 0xd9d9d9, "6|8|0xd9d9d9,82|-4|0xf3f3f3,84|6|0xdadada,84|17|0xdbdbdb", 90,  538, 586, 649, 644 } --多点找色
	t['填资料1界面_下一步']={ 0x333333, "0|-2|0x979797,-44|-9|0x333333,29|-3|0x353535", 90, 605, 58, 713, 109 } --多点找色
t['填资料2界面']={ 0x000000, "-2|0|0xa2a2a2,-3|1|0xfefefe,285|19|0x000000,287|20|0x545454,290|20|0xfefefe", 90, 19, 130, 339, 204 } --多点找色	
t['填资料2界面ios11']={ 0xa3a3a3, "-6|51|0xa0a0a0,281|22|0x555555,303|16|0x585858,314|15|0xababab", 90, 29, 139, 389, 215 } --多点找色
t['填资料2界面ios10']={ 0x7e7f7f, "-4|8|0xbcbdbd,-3|25|0x848686,192|24|0x909191,192|23|0xfefefe", 90, 271, 60, 481, 104 } --多点找色

	t['填资料2界面_身高未选择']={ 0xefefef, "-2|-21|0xf8f8f8,-85|-18|0xf4f4f4,-88|2|0xf5f5f5,-9|5|0xe4e4e4", 95, 545, 389, 643, 431 } --多点找色
	t['填资料2界面_学历未选择']={ 0xe0e0e0, "0|7|0xd9d9d9,8|21|0xdcdcdc,79|-4|0xd9d9d9,76|7|0xffffff", 95, 540, 484, 652, 520 } --多点找色
	t['填资料2界面_月薪未选择']={ 0xe0e0e0, "0|7|0xd9d9d9,8|21|0xdcdcdc,79|-4|0xd9d9d9,76|7|0xffffff", 95, 546, 576, 646, 612 } --多点找色
	t['填资料2界面_婚史未选择']={ 0xe0e0e0, "0|7|0xd9d9d9,8|21|0xdcdcdc,79|-4|0xd9d9d9,76|7|0xffffff", 95, 546, 666, 646, 704 } --多点找色	
	t['填资料2界面_身高未选择ios10']={ 0xefefef, "-2|-21|0xf8f8f8,-85|-18|0xf4f4f4,-88|2|0xf5f5f5,-9|5|0xe4e4e4", 95, 542, 277, 650, 331 } --多点找色
	t['填资料2界面_学历未选择ios10']={ 0xe0e0e0, "0|7|0xd9d9d9,8|21|0xdcdcdc,79|-4|0xd9d9d9,76|7|0xffffff", 95, 532, 369, 652, 427 } --多点找色
	t['填资料2界面_月薪未选择ios10']={ 0xe0e0e0, "0|7|0xd9d9d9,8|21|0xdcdcdc,79|-4|0xd9d9d9,76|7|0xffffff", 95,  541, 461, 649, 513 } --多点找色
	t['填资料2界面_婚史未选择ios10']={ 0xe0e0e0, "0|7|0xd9d9d9,8|21|0xdcdcdc,79|-4|0xd9d9d9,76|7|0xffffff", 95, 544, 559, 643, 606} --多点找色
t['完成']={ 0x2099ff, "11|4|0x1493ff,35|16|0x1c97ff,21|10|0x2b9eff,37|-1|0xa2d4ff", 90, 649, 837, 718, 881 } --多点找色
	t['完成_生日']={ 0x696969, "-6|12|0xa1a1a1,51|27|0x333333,51|0|0x4e4e4e,51|-1|0xffffff", 90, 342, 839, 405, 875 } --多点找色	
	t['完成_所在地区']={ 0xbebebe, "-2|26|0xaeaeae,123|0|0x737373,124|25|0x949494,98|-1|0x848484", 90, 305, 838, 441, 877 } --多点找色
	t['完成_身高']={ 0xe8e8e8, "1|0|0xb3b3b3,-11|20|0xc0c0c0,49|3|0xa2a2a2,47|29|0xb6b6b6", 85, 337, 836, 413, 878 } --多点找色
	t['完成_学历']={ 0x868686, "-4|6|0xbdbdbd,4|28|0xb5b5b5,56|2|0x646464,51|28|0xaaaaaa", 90, 340, 839, 411, 874 } --多点找色
	t['完成_月薪']={ 0xc7c7c7, "1|0|0x4e4e4e,-3|26|0xb1b1b1,55|1|0x6a6a6a,52|27|0x939393", 90, 344, 838, 407, 879 } --多点找色
	t['完成_婚史']={ 0x969696, "-2|0|0x606060,-4|28|0x787878,53|4|0x7b7b7b,56|26|0xe9e9e9", 90, 334, 837, 413, 879 } --多点找色
	
	
t['上传头像_跳过']={ 0x363839, "-424|88|0x000000,-417|89|0xfefefe,-361|356|0xd8d8d8,-317|385|0xfefefe", 90, 30, 57, 725, 652 } --多点找色
t['上传头像_跳过ios10']={ 0x3a3c3d, "-13|-5|0xfefefe,-280|235|0xd8d8d8,-243|262|0xffffff,-220|317|0xd8d8d8", 90, 370, 49, 735, 555 } --多点找色
t['上传头像_跳过ios10新']={ 0x66686c, "-14|-9|0x66686c,36|5|0x66686c,41|15|0xc5c6c8,42|13|0xe8e8e9", 90, 635, 89, 703, 133 } --多点找色
local degree = 85

	t['填资料2/完成注册ios10']={ 0xf83d84, "-323|-50|0xf95777,-212|-49|0xf8477f", 90, 120, 713, 601, 854 } --多点找色
	t['填资料2/完成注册']={0xf84680,"242|-38|0xf83a85,-256|20|0xf96c6e",degree,47,800,682,1000}
	local degree = 85

		t['主界面——完成']={0xff1a83,"-13|19|0xff2b7e,-24|7|0xff5071",degree,16,1226,132,1320}
	
function 填资料()
	local timeline = os.time()
	local outTimes = 60 * 4
	local 比例男 = math.random(1,100)
		  xingbie = ''
	local 完成注册key = false
	while os.time()-timeline < outTimes do
		if active(var.appbid,5) then
			if d('主界面——完成')then
				if 完成注册key then
					up('完整注册')
					return true
				else
					up('注册过拉黑')
					return true
				end
			elseif d('填资料2界面') or d('填资料2界面ios11') then
				if d('填资料2界面_身高未选择',true) then
				elseif d('填资料2界面_身高未选择' ,true) then
				elseif d('填资料2界面_学历未选择' ,true) then
				elseif d('填资料2界面_月薪未选择' ,true) then
				elseif d('填资料2界面_婚史未选择' ,true) then
				elseif d('填资料2/完成注册' ,true,1,3) then
					完成注册key = true
					delay(8)
				end
			elseif d('填资料1界面') or d('填资料1界面ios10') then
				if d('填资料1界面_下一步') then
					if 比例男 <= 50 then
						xingbie = '男'
						click(167,520)
					else
						xingbie = '女'
						click(516,510)
					end
					d('填资料1界面_下一步',true) 
					
				elseif d('填资料1界面_请输入昵称') then
					click(586,409)
				elseif d('填资料1界面_男女比例') then
					if 比例男 <= 50 then
						xingbie = '男'
						click(167,520)
					else
						xingbie = '女'
						click(516,510)
					end
				elseif d('填资料1界面_生日未选择',true) then
				elseif d('填资料1界面_地区未选择',true) then

				end
	
			elseif d('完成') then
				if d('完成_生日') then
					local 随机1 = math.random(1,5) 
					local 随机2 = math.random(1,3) 
					local 随机3 = math.random(1,3) 
					for i = 1 , 随机1 do
						click(234,1055)
					end	
					for i = 1 , 随机2 do
						click(381,1058)
					end	
					for i = 1 , 随机3 do
						click(518,1052)
					end	
					d('完成',true)
				elseif d('完成_所在地区') then
					local 随机4 = math.random(1,10) 
					local 随机5 = math.random(1,10) 
					for i = 1 , 随机4 do
						click(201,1178)
					end
					for i = 1 , 随机5 do
						click(547,1186)
					end	
					d('完成',true)
				elseif d('完成_身高') then
					if 比例男 <= 40 then
						for i = 1 ,math.random(4,8) do
							moveTo(379,1245,386,1067)
							delay(1)
						end
					else
						for i = 1 ,math.random(3,4) do
							moveTo(379,1245,386,1067)
							delay(1)
						end
					end
					d('完成',true)
				elseif d('完成_学历') then
					for i = 1 , math.random(1,5) do
						click(379,1185)
					end	
					d('完成',true)
				elseif d('完成_月薪') then	
					for i = 1 , math.random(1,4) do
						click(379,1185)
					end	
					d('完成',true)
				elseif d('完成_婚史') then
					click(379,1185)
					d('完成',true)
				else
					d('完成',true)
				end	
			else
				if d('上传头像_跳过',true) then
				elseif d('上传头像_跳过ios10新',true) then
				end
			end	
		end
		delay(1)
	end
end
function 填资料ios10()
	local timeline = os.time()
	local outTimes = 60 * 4
	local 比例男 = math.random(1,100)
		  xingbie = ''
	local 完成注册key = false
	while os.time()-timeline < outTimes do
		if active(var.appbid,5) then
			if d('主界面——完成')then
				if 完成注册key then
					up('完整注册')
					return true
				else
					up('注册过拉黑')
					return true
				end
			elseif d('填资料2界面') or d('填资料2界面ios10') then
				if d('填资料2界面_身高未选择',true) then
				elseif d('填资料2界面_身高未选择ios10' ,true) then
				elseif d('填资料2界面_学历未选择ios10' ,true) then
				elseif d('填资料2界面_月薪未选择ios10' ,true) then
				elseif d('填资料2界面_婚史未选择ios10' ,true) then
				elseif d('填资料2/完成注册ios10' ,true) then
					完成注册key = true
					delay(8)
				end
			elseif d('填资料1界面') or d('填资料1界面ios10') then
				if d('填资料1界面_下一步') then
					if 比例男 <= 50 then
						xingbie = '男'
						click(145,418)
					else
						xingbie = '女'
						click(533,414)
					end	
					d('填资料1界面_下一步',true)
				elseif d('填资料1界面_男女比例ios10') then
					if 比例男 <= 50 then
						xingbie = '男'
						click(145,418)
					else
						xingbie = '女'
						click(533,414)
					end	
				elseif d('填资料1界面_生日未选择',true) then
				elseif d('填资料1界面_生日未选择ios10',true) then
				elseif d('填资料1界面_地区未选择',true) then
				elseif d('填资料1界面_地区未选择ios10',true) then
				elseif d('填资料1界面_请输入昵称ios10',true) then

				end
	
			elseif d('完成') then
				if d('完成_生日') then
					local 随机1 = math.random(1,5) 
					local 随机2 = math.random(1,3) 
					local 随机3 = math.random(1,3) 
					for i = 1 , 随机1 do
						click(234,1055)
					end	
					for i = 1 , 随机2 do
						click(381,1058)
					end	
					for i = 1 , 随机3 do
						click(518,1052)
					end	
					d('完成',true)
				elseif d('完成_所在地区') then
					local 随机4 = math.random(1,10) 
					local 随机5 = math.random(1,10) 
					for i = 1 , 随机4 do
						click(201,1178)
					end
					for i = 1 , 随机5 do
						click(547,1186)
					end	
					d('完成',true)
				elseif d('完成_身高') then
					if 比例男 <= 50 then
						for i = 1 ,math.random(4,8) do
							moveTo(379,1245,386,1067)
							delay(1)
						end
					else
						for i = 1 ,math.random(3,4) do
							moveTo(379,1245,386,1067)
							delay(1)
						end
					end
					d('完成',true)
				elseif d('完成_学历') then
					for i = 1 , math.random(1,5) do
						click(379,1185)
					end	
					d('完成',true)
				elseif d('完成_月薪') then	
					for i = 1 , math.random(1,4) do
						click(379,1185)
					end	
					d('完成',true)
				elseif d('完成_婚史') then
					click(379,1185)
					d('完成',true)
				else
					d('完成',true)
				end	
			else
				if d('上传头像_跳过ios10',true) then
				elseif d('上传头像_跳过ios10新',true) then
				end
			end	
		end
		delay(1)
	end
end

function up(other)
	local url = 'http://hb.wenfree.cn/api/Public/idfa/'
	local postdate = {}
	postdate.service = 'Idfa.Idfa'
	postdate.name = '世纪佳缘'
	postdate.idfa = var.phone
	postdate.password = var.password
	postdate.phone = xingbie
	postdate.other = other
	log(post(url,postdate))
	-- body
end


function back_pass(task_id,success)
	local url = 'http://wenfree.cn/api/Public/tjj/?service=Tjj.backpass'
	local postArr = {}
	postArr.task_id = task_id
	postArr.success = success
	nLog( post(url,postArr) )
end
dxcode = _Server_get()
--[[]]
function main(v)
	nLog(v)
	work = v.work
	task_id = v.task_id
	bid={}
	bid[work]={}
	bid[work]['adid']=v.adid
	bid[work]['keyword']=v.keyword
	bid[work]['appbid']=v.appbid
	bid[work]['appid']=v.appid
	nLog("act")

	

	----------------------------------
	vpnx()
	delay(3)
	if false or vpn() then
		delay(3)
		other_txt = ''
		if sys.clear_bid(var.appbid)then
			if reg()then
--					if 填资料() then
--						back_pass(task_id,"ok")
--					end
				if 填资料ios10() then
					back_pass(task_id,"ok")
				end	
			end
		end	
		delay(2)
	end
end
--]]





