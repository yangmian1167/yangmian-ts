require("TSLib")
require("AWZ")
require("tsp")
require("playgame")












url = ''
vpnx()
if vpn() then
	delay(3)
	dialog(url)
	openURL(url)
	if awzNew() then
		game()
	end
end
	
	
	
	
	
	
	
	
	
	
	
	