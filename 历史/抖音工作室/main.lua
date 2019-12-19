require("TSLib")
require("tsp")
require("AWZ")
--require("ui")


if width == 750 then
	require("iphone6")
end



appbid = "com.ss.iphone.ugc.Aweme"
init(appbid,0)
local arrs ={}
arrs.show={477, 0, 665, 41}
arrs.commnet={645, 852, 733, 896}
arrs.send = 1
arrs.lady = false
arrs.man = false
arrs.kongbai = false


---------------------------------全局变量
function orc(t)
	local recognize = ocrText(t[1],t[2],t[3],t[4],0)
	if recognize ~= nil then
		nLog('识别结果--'..recognize)
		local i,j = string.find(recognize,"%d+")
		if i~= nil and j~= nil then
			recognize =string.sub(recognize,i,j)
			recognize = tonumber(recognize)
			recognize = recognize or 1
			nLog(recognize)
			return recognize
		end
	end
	return 0
end

function box(txt)
	boxshow(txt,arrs.show[1],arrs.show[2],arrs.show[3],arrs.show[4])
end

function getTXT()
	url = "http://idfa888.com/Public/dyid/?service=dyid.readtext"
	return get(url)['data']
end

function Tip()
	if d('弹窗_允许',true,1,"是否允许发送通知")then
	elseif d('弹窗_位置允许',true,1,"是否允许访问你的位置允许")then
--	elseif d('弹窗_通讯录取消',true,1)then
--	elseif d('弹窗_取消回复',true,1,"误点操作")then
--		return '取消回复'
	else
		log('no Tip')
		return true
	end
end

function newphone()
	url='http://127.0.0.1:8080/reset_app'
	get(url)
end


function login()
	local timeline = os.time()
	local utime = 60*5
	
	while (os.time()-timeline < utime) do
		if active(appbid,5)then
			if d('首页红绿') and tab('首页菜单',true,4)then
			
			
			
		
		
			end
		end
		delay(1)
	end

end

log("33")










































































































































