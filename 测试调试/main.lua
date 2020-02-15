
require('TSLib')
require('tsp')
--for var= 1, 30 do
--	local header_unm = math.random(100,2400)
--	local imgUrl = 'https://img.wenfree.cn/baihe/img-'.. header_unm ..'.jpg';
--	downFile(imgUrl,"/User/Media/TouchSprite/res/"..header_unm..".jpg");
--	saveImageToAlbum(header_unm .. ".jpg")
--end

--openURL('https://v.douyin.com/X1d3SF/')



---- 元类
--Shape = {area = 0}

---- 基础类方法 new
--function Shape:new (o,side)
--  o = o or {}
--  setmetatable(o, self)
--  self.__index = self
--  side = side or 0
--  self.area = side*side;
--  return o
--end

---- 基础类方法 printArea
--function Shape:printArea ()
--  print("面积为 ",self.area)
--end

---- 创建对象
--myshape = Shape:new(nil,10)

--myshape:printArea()

--sys = {
--	clear_bid = (function(bid)
--		closeApp(bid)
--		delay(1)
--		os.execute("rm -rf "..(appDataPath(bid)).."/Documents/*") --Documents
--		os.execute("rm -rf "..(appDataPath(bid)).."/Library/*") --Library
--		os.execute("rm -rf "..(appDataPath(bid)).."/tmp/*") --tmp
--		clearPasteboard()
--		--[[
--		local path = _G.const.cur_resDir
--		os.execute(
--			table.concat(
--				{
--					string.format("mkdir -p %s/keychain", path),
--					'killall -SIGSTOP SpringBoard',
--					"cp -f -r /private/var/Keychains/keychain-2.db " .. path .. "/keychain/keychain-2.db",
--					"cp -f -r /private/var/Keychains/keychain-2.db-shm " .. path .. "/keychain/keychain-2.db-shm",
--					"cp -f -r /private/var/Keychains/keychain-2.db-wal " .. path .. "/keychain/keychain-2.db-wal",
--					'killall -SIGCONT SpringBoard',
--				},
--				'\n'
--			)
--		)
		
--		]]
--		clearAllKeyChains()
--		clearIDFAV() 
--		--clearCookies()
--		delay(2)
--		return true
--	end)
--}
--ceshi = clearIDFAV() 
--log(ceshi)



function 点击赚钱(x,y)
	x,y = findMultiColorInRegionFuzzy( 0x007aff, "3|0|0x007aff,7|1|0x007aff,96|3|0x057cff,103|1|0x007aff,105|7|0x007aff,131|1|0x007aff,132|-9|0x007aff", 90, 646, 1133, 1009, 1256)
	if x ~= -1 and y ~= -1 then
		touchDown(x,y);    --在坐标 (150, 550)按下
		mSleep(30);
		touchUp(x,y);  --在坐标 (150, 600) 抬起
	end

	x,y = findMultiColorInRegionFuzzy( 0x999999, "-1|4|0x999999,0|10|0x999999,0|14|0x999999,53|14|0x999999,53|21|0x999999,52|24|0x999999,56|21|0xb4b4b4,62|6|0x999999", 90, 23, 616, 311, 742)
	if x ~= -1 and y ~= -1 then
		nLog('服务')
		tap(x,y)
		mSleep(50)
	end
end
点击赚钱(x,y)