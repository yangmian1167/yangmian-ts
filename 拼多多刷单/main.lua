require("TSLib")
require("tsp")
require("AWZ")


-----up-------

function idfaupdate()
	local url = "http://idfa888.com/Public/idfa/?service=idfa.idfa"
	local tb={}
	tb.name =  '拼多多Buy'
	tb.idfa = var.idfa or dizhilist[key][1]
	tb.ip = var.ip or ip()
	tb.phonename = var.phonename or getDeviceName()
	tb.other = var.address
	tb.password = var.password 
	tb.phone = var.phone
	tb.account = var.name
	return post(url,tb)
end

function idfaupdate_()
	local url = "http://idfa888.com/Public/idfa/?service=idfa.idfa"
	local tb={}
	tb.name =  '拼多多订单号'
	tb.idfa = var.idfa 
	tb.ip = var.ip 
	tb.phonename = var.phonename or getDeviceName()
	tb.other = var.other 
	tb.password = var.password 
	tb.phone = var.phone 
	tb.account = var.account 
	return post(url,tb)
end

-----get------
function getadrees()
	local url = "http://wenfree.cn/api/Public/tjj/?service=Address.getOne"
	local tb={}

	return post(url,tb)
end




var = {}


pddbid = 'com.xunmeng.pinduoduo'
zfbbid = 'com.alipay.iphoneclient'




t = {}
t['首页点搜索']={ 0x646464, "-274|-10|0xf3618f,-255|28|0xe1362c,-138|-6|0x6d6d6d", 90, 31, 1047, 609, 1124 } --多点找色
t['搜索界面']={ 0x4d4d4e, "0|23|0x575757,311|-14|0xcdcdcd,310|19|0xffffff", 90, 259, 52, 632, 114 } --多点找色
t['搜索']={ 0xf7fbff, "-51|19|0x007aff,44|-28|0x007aff,29|-44|0xd2d5db", 90, 503, 1042, 629, 1130 } --多点找色
t['客户电池物品']={ 0x1d1a1d, "-9|-158|0xf90505,61|72|0x228c42,16|163|0x333333,-143|248|0xed8c86", 90, 321, 213, 631, 682 } --多点找色

t['填地址和支付界面']={ 0x858585, "-5|18|0x969696,-4|29|0x939393,66|30|0x656565,93|17|0xcccccc,88|3|0x747474", 90, 264, 61, 372, 103 } --多点找色
	t['填地址和支付界面_添加地址']={ 0xff2741, "22|25|0xff2741,60|4|0x2f2f30,585|13|0xadadad", 90, 23, 140, 622, 191 } --多点找色
	t['填地址和支付界面_添加新收货地址']={ 0xd7d7d8, "-1|8|0xa0a0a1,-1|25|0x9f9f9f,199|-1|0x808081,206|25|0x858585,387|-29|0x666666", 90, 214, 169, 618, 246 } --多点找色

t['tips']={ 0xb5b5b5, "-541|595|0xe02e24,-39|668|0xe02e24,-308|628|0xffffff", 90, 57, 173, 626, 911 } --多点找色
t['tips_红包tips']={ 0x666666, "-8|-7|0xb2b2b2,10|-8|0xdbdbdb,-8|8|0xb5b5b5", 90, 537, 265, 596, 316 } --多点找色
t['tips_宝箱']={ 0xfcfffc, "-159|136|0xf63a18,-222|406|0xdb250c,-91|612|0xe92f2e", 90, 301, 163, 583, 856 } --多点找色
t['tips_红包']={ 0xcecece, "-122|152|0xffe3b2,-122|156|0xdf7153,-5|508|0xc75138", 90, 412, 130, 621, 926 } --多点找色
t['tips_现金红包']={ 0xf2f3f1, "-183|398|0xe7627a,-333|526|0xffc913,-455|529|0xffb12b", 90, 101, 136, 635, 794 } --多点找色
t['tips_猛戳红包']={ 0xa5a2a2, "65|-89|0xea764e,-131|-253|0xf34736,-73|-333|0xffcd95", 90, 140, 418, 511, 946 } --多点找色
------------------------------------------购买流程-----------------------------------------

function tip()
	if d('tips',true) then
	elseif d('tips_红包',true) then
	elseif d('tips_红包tips',true) then
	elseif d('tips_宝箱',true) then
	elseif d('tips_现金红包',true) then
	elseif d('tips_猛戳红包',true) then
	end
	return
end	




--[[]]
function buy()
	while true do
		if frontAppBid() == pddbid or frontAppBid() == zfbbid then
			if frontAppBid() == pddbid then
				if d('首页点搜索',true) then
				elseif d('搜索界面') then
					click(318,176)
					input('拾能大容量')
				elseif d('搜索',true) then
				elseif d('客户电池物品',true) then
				elseif d('填地址和支付界面_添加新收货地址') then
					click(119,308)
					input(var.name)
					click(365,314)
					input(var.phone)
					click(105,489)
					input(var.address)
					delay(3)
					idfaupdate()
					return true
				elseif d('填地址和支付界面') then
					if d('填地址和支付界面_添加地址',true) then
					end
				else
					tip()
				end
			elseif  frontAppBid() == zfbbid  then
				log('-------------------------支付宝界面')
				idfaupdate()
				return true
			end	
		else
			active(pddbid,5)
		end	
		delay(1)
	end		
	
end





--------------------------------------------------复查订单号--------------------
t['首页点个人中心']={ 0xf2f2f2, "-6|22|0x666666,-509|-3|0xfc55dc,-505|16|0xfb4dc0", 90, 38, 1058, 611, 1125 } --多点找色
t['个人中心']={ 0xf46895, "-32|29|0xe02f25,-26|9|0xfecf1c,12|-17|0xf77787", 90, 535, 1057, 626, 1130 } --多点找色
	t['个人中心_待分享or发货']={ 0xe02e24, "-18|-2|0xe02e24,10|-15|0xe02e24", 90, 181, 428, 512, 496 } --多点找色
t['我的订单界面']={ 0x333333, "1|26|0x5e5e5e,123|-4|0xcbcbcb", 90, 249, 61, 395, 106 } --多点找色
	t['我的订单界面_点物品']={ 0xf5f5f5, "140|50|0xf5f5f5,-317|-50|0xf5f5f5,290|116|0xf5f5f5,291|-42|0xf5f5f5,-318|120|0xf5f5f5", 90, 5, 345, 630, 986 } --多点找色
t['订单详情界面']={ 0x9f9f9f, "-3|10|0x9f9f9f,2|28|0x808080,120|-1|0x5f5f5f,127|28|0x676767", 90, 246, 63, 394, 105 } --多点找色
t['复制订单编号']={ 0x58595b, "-27|16|0xd9d9d9,35|-16|0xcecece,35|17|0xcecece,-27|-14|0xf8f8f8", 90, 383, 353, 496, 1036 } --多点找色
t['复制订单编号1']={ 0x58595b, "-26|-15|0xd0d0d0,-27|16|0xdbdbdb,35|-15|0xcfcfcf,34|17|0xededed", 90, 360, 208, 525, 1035 } --多点找色
function check_mun()
	while true do
		if active(pddbid,5)	then
			if d('首页点个人中心',true) then
			elseif d('个人中心',true) then
				d('个人中心_待分享or发货',true)

			elseif d('我的订单界面',true) then
				d('我的订单界面_点物品',true)
			elseif d('订单详情界面') then
				if d('复制订单编号',true) or d('复制订单编号1',true)  then
					delay(2)
					var.idfa  = readPasteboard()
					delay(2)
					idfaupdate_()
					return true
				else
			
				moveTo(292,690,326,600)
				end
			else
				tip()
			end
		end	
		delay(1)
	end		
	
end




--[[

while true do
	vpnx()
	if vpn() then
		tb = getadrees()
		var.name = tb.data.address_name
		var.address = tb.data.address_area
		var.phone = tb.data.address_phone
		
		awz_next()
		awzname,var.idfa = getTrueName_awz()
		
--		buy()  ---购买
				

		check_mun() ----复查订单号                                        
	end
end
--]]--












var.idfa  = readPasteboard()


log(var.idfa )









