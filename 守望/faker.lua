require("TSLib")
require("tsp")

function new()
	openURL("IGG".."://cmd/".."newrecord");
	delay(4)
end

function nextgame()
	openURL("IGG:".."//cmd/".."nextrecord");
	delay(4)
end

local awzbid = 'A'..'W'..'Z'
--local awzbid = 'A'..'L'..'S'

function locks()
	local flag = deviceIsLock();
	if flag == 0 then
	--	log("未锁定");
	else
		unlockDevice(); --解锁屏幕
	end
end
function activeawz(app,t)
	t = t or 0.5
	locks()
	bid = frontAppBid();
	if bid ~= app then
		nLog(app.."，准备启动")
		runApp(app)
		mSleep(t*1000)
		return true
	end
end
function renameCurrentRecord(name)
	local sz = require("sz")	
	local res = httpGet("ht".."tp://127.0.".."0.1:1688/cmd?".."fun=renamecurre".."ntrecord&name="..name);
		local resJson = sz.json.decode(res);
		local result = resJson.result;
		nLog("the result is: " .. result);
		if result == 1 then
			return true
		end
end
function reName(newName)
	timeLine = os.time()
	outTime = 60 * 0.5
	while (os.time()-timeLine < outTime) do
		if activeawz(awzbid,3)then
		elseif renameCurrentRecord(newName)then
			return true
		end
		mSleep(1000)
	end
	nLog('重命令超时')
end














