require("TSLib")
require("AWZ")
require("tsp")
require("playgame")












url = 'http://advertisetrack.miaogame.cn/ios/download?flag=2&lid=10154389'










while true do
	vpnx()
	if vpn() then
		if awzNew() then
			delay(3)
			dialog(url)
			if openU() then
				delay(15)
				game()
			end
		end
	end
end	
	
	
	
	
	
	
	
	
	