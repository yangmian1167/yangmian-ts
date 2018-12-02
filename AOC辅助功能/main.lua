require("TSLib")
require("tsp")
require("AWZ")

init('0',1)
aocbid = "com.lilithgame.sgame"

t = {}


t['打开左侧功能栏']={
	{   10,  372, 0x1dad94},
}

t['技能']={
	{   55,  378, 0x7a7650},
}

t['回城']={
	{  303,  266, 0xbbffee},
}

t['使用']= {0x2a96bc, "99|3|0x1d89b2,45|-6|0xffffff", 90, 880, 451, 1079, 551}

t['在主城里']={
	{ 1302,   92, 0xeeae24},
}
t['回城CD中']={
	{  313,  183, 0x14142e},
}

function 回城()
	在主城 = false
	while true do
		if active(aocbid,6) then
			if d('打开左侧功能栏',true) then
			elseif d('技能',true) then
			elseif d('回城',true) then
			elseif d('回城CD中',true) then
				return true
			elseif d('使用',true) then
				在主城 = true
			
			elseif 在主城 then
				if d('在主城里',true) then
					return true
				end
			else
				click(27,24)
			end
		end	
		delay(2)
	end
end	


while true do
回城()
awz_next()
end



