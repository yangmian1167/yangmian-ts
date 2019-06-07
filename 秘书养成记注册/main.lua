require("TSLib")
require("AWZ")
require("tsp")
require("playgame")












url = 'http://advertisetrack.miaogame.cn/ios/download?flag=2&lid=10154385'


























while true do
	vpnx()
	if vpn() then
		delay(3)
		if awzNew() then
			dialog(url)
			if openU() then
				delay(15)
				game()
			end
		end
	end
end	
	
	
	
	
	
	
	
	
	