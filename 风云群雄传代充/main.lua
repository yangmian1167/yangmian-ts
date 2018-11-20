require("TSLib")
require("tsp")
require("AWZ")
--require("ALZ")


fyurl = "http://uri6.com/tkio/EJ3ARba"
fybid = "com.fengyun.qxz.ios"

function openU(fyurl)
	local timeline = os.time()
	local outimes= 60
	openURL(fyurl)
	
	while os.time()-timeline < outimes do
		if frontAppBid() == "com.apple.AppStore" then
			delay(math.random(10,15))
			return true
		else
			delay(math.random(3,5))
		end
	end
end

function ganme()
	while true do
		if active(fybid,5) then
			delay(math.random(180,200))
			return true
		end
	end
end	



while true do
	vpnx()
	delay(3)
	if awzNew() then
		if vpn() then
			if openU(fyurl) then
				if ganme() then
				end	
			end
		end
	end
	delay(2)
end


