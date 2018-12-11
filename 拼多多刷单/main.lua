require("TSLib")
require("tsp")
require("AWZ")




function idfaupdate()
	local url = "http://idfa888.com/Public/idfa/?service=idfa.idfa"
	local tb={}
	tb.name = var.name or '拼多多Buy'
	tb.idfa = var.idfa or dizhilist[key][1]
	tb.ip = var.ip or ip()
	tb.phonename = var.phonename or getDeviceName()
	tb.other = var.other or dizhilist[key][3]	
	tb.password = var.password 
	tb.phone = var.phone or dizhilist[key][2]
	tb.account = var.account or dizhilist[key][1]
	return post(url,tb)
end

function idfaupdate_()
	local url = "http://idfa888.com/Public/idfa/?service=idfa.idfa"
	local tb={}
	tb.name = var.name or '拼多多Buy'
	tb.idfa = var.idfa 
	tb.ip = var.ip 
	tb.phonename = var.phonename or getDeviceName()
	tb.other = var.other 
	tb.password = var.password 
	tb.phone = var.phone 
	tb.account = var.account 
	return post(url,tb)
end

var = {}


pddbid = 'com.xunmeng.pinduoduo'



t = {}
t['首页点搜索']={ 0x666666, "-255|-15|0xe02e24,127|-18|0x898989", 90, 36, 1052, 606, 1128 } --多点找色
t['搜索界面']={ 0xe02e24, "-7|20|0xf9d7d5,-238|-9|0xf7f7f7,-135|-17|0x818181", 90, 47, 1047, 607, 1120 } --多点找色
t['搜索']={ 0xf7fbff, "-51|19|0x007aff,44|-28|0x007aff,29|-44|0xd2d5db", 90, 503, 1042, 629, 1130 } --多点找色
t['客户电池物品']={ 0x1d1a1d, "-9|-158|0xf90505,61|72|0x228c42,16|163|0x333333,-143|248|0xed8c86", 90, 321, 213, 631, 682 } --多点找色

t['填地址和支付界面']={ 0x858585, "-5|18|0x969696,-4|29|0x939393,66|30|0x656565,93|17|0xcccccc,88|3|0x747474", 90, 264, 61, 372, 103 } --多点找色
	t['填地址和支付界面_添加地址']={ 0xff2741, "22|25|0xff2741,60|4|0x2f2f30,585|13|0xadadad", 90, 23, 140, 622, 191 } --多点找色
	t['填地址和支付界面_添加新收货地址']={ 0xd7d7d8, "-1|8|0xa0a0a1,-1|25|0x9f9f9f,199|-1|0x808081,206|25|0x858585,387|-29|0x666666", 90, 214, 169, 618, 246 } --多点找色

t['tips']={ 0xb5b5b5, "-541|595|0xe02e24,-39|668|0xe02e24,-308|628|0xffffff", 90, 57, 173, 626, 911 } --多点找色
t['tips_红包tips']={ 0x666666, "-8|-7|0xb2b2b2,10|-8|0xdbdbdb,-8|8|0xb5b5b5", 90, 537, 265, 596, 316 } --多点找色
t['tips_宝箱']={ 0xfcfffc, "-159|136|0xf63a18,-222|406|0xdb250c,-91|612|0xe92f2e", 90, 301, 163, 583, 856 } --多点找色
t['tips_红包']={ 0xcecece, "-122|152|0xffe3b2,-122|156|0xdf7153,-5|508|0xc75138", 90, 412, 130, 621, 926 } --多点找色
dizhilist = {
	
{"张泽鹏","13473327325","同仁创业园                                                                    ",},
{"金先生","15298376212","苏蠡路58号中天和景苑9幢903                                                    ",},
{"李花","13852297970","四牌楼2号 东南大学                                                              ",},
{"李娟","15873598960","新民社区                                                                        ",},
{"欧立科","15607356555","桔井路31号卫计局                                                              ",},
{"琳琳","18518225921","槐房西路 南庭新苑南区4号楼905                                                   ",},
{"文医生","15173528116","新区环城北路山泉居                                                            ",},
{"汪乾","19941509434","金地自在城二期8栋1107                                                           ",},
{"江梦洋","18652052572","宁化街道振武路70号福晟钱隆广场22层                                            ",},
{"张悦","15034357517","步行街女友日化                                                                  ",},
{"张悦","15034357517","步行街女友日化                                                                  ",},
{"苏升杰","18000623836","北河镇6信箱4分箱                                                              ",},
{"李亚南","18193469453","筒车湾镇下街道中国葛洲坝集团1分布                                             ",},
{"史笑笑","18834285218","鼓楼西街街道贡院街1号山西师范大学                                             ",},
{"陀罗咪","13020229882","泗泾镇泗凤公路370弄8号                                                        ",},
{"边锋杰","17636609042","大马村自取                                                                    ",},
{"江军","18235180767","慎阳路728号驻马店市警察学校                                                     ",},
{"晓","18114922784","南京江宁区河定桥金王府14幢602                                                     ",},
{"王保平","13610611394","东街小学旁                                                                    ",},
{"云朵","18813129664","燕姣经济技术开发区102国道东柳河屯村口西50米中齐教育                             ",},
{"杨先生","17601059606","科创六街100号理贝尔西门                                                       ",},
{"吴燕霞","18735588438","长治学院南校区                                                                ",},
{"闫帅","18613323330","马驹桥神龙辛屯小区                                                              ",},
{"李晋阳","15203555974","老顶山关村汽贸城雪佛兰4s                                                      ",},
{"左花花","15934544473","三候自取                                                                      ",},
{"花花","13502028481","三候自取                                                                        ",},
{"胡文文","18435175390","学府西街华宇绿洲32号楼3单元201                                                ",},
{"苏亮","16619807620","太平桥街道华源一里8号院小区门口                                                 ",},
{"刘卫东","17328597737","棠下梅园西街23号广弘公寓                                                      ",},
{"南弟","15135170725","黄陵街道荣军南街颐龙佳园                                                        ",},
{"福强","15935729600","一中桥                                                ",},
{"杨女士","18601201312","青塔西路 珠江峰景西区4号楼 303                      ",},
{"王巧红","18910043360","宋庄镇高菜路瑞福鼎物业                              ",},
{"赵女士","15810955165","亦庄开发区 鹿华路10号2号楼1506                      ",},
{"左花梅","15234701451","中垛乡三候常家岭村                                  ",},
{"文虹","18128823268","文昌阁村 新屋组                                       ",},


}

------------------------------------------购买流程-----------------------------------------

function tip()
	if d('tips',true) then
	elseif d('tips_红包',true) then
	elseif d('tips_红包tips',true) then
	elseif d('tips_宝箱',true) then
	end
	return
end	




--[[
function buy()
	while true do
		if active(pddbid,5)	then
			if d('首页点搜索',true) then
			elseif d('搜索界面') then
				click(318,176)
				input('拾能大容量')
			elseif d('搜索',true) then
			elseif d('客户电池物品',true) then
			elseif d('填地址和支付界面_添加新收货地址') then
				click(119,308)
				input(dizhilist[key][1])
				click(365,314)
				input(dizhilist[key][2])
				click(105,489)
				input(dizhilist[key][3])
				delay(3)
				return true
			elseif d('填地址和支付界面') then
				if d('填地址和支付界面_添加地址',true) then
				
				end
			else
				tip()
			end
		end	
		delay(1)
	end		
	
end







while true do
	vpnx()
	if vpn() then
		awz_next()
		awzname,var.idfa = getTrueName_awz()
		 buy()
		idfaupdate()
		lua_exit()
--		
	end
end

--]]--

--------------------------------------------------复查订单号--------------------
t['首页点个人中心']={ 0xd2d2d2, "-515|-6|0xe02e24,-511|9|0xe02e24,-507|39|0xe02e24", 90, 40, 1057, 623, 1121 } --多点找色
t['个人中心']={ 0xe02e24, "-41|58|0xe96a63,29|59|0xe02e24", 90, 508, 1045, 628, 1133 } --多点找色
	t['个人中心_待分享or发货']={ 0xffffff, "19|-32|0xe02e24,43|-56|0xe02e24", 90, 152, 427, 392, 538 } --多点找色
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
					var.password = readPasteboard()
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






while true do
	vpnx()
	if vpn() then
		awz_next()
		awzname,var.idfa = getTrueName_awz()
		check_mun()
		idfaupdate_()
		
	
	end
end








