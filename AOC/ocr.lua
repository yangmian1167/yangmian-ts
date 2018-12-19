init('0',1)
--list = '1234567890k'



function ocr(x1,y1,x2,y2)
	local ress = ocrText(x1,y1,x2,y2, 10) or 0
	if ress == '' then
--		nLog('nil')
		return 0 
	else
--		nLog(ress)
	end
	return ress
end

aoc_zy={}
aoc_zy['资源']={}
aoc_zy['资源']['gold']={{434,226,0x102138}, {549,267,0x17283d}, }
aoc_zy['资源']['water']={{648,226,0x192b3e}, {766,267,0x1b2e40}, }
aoc_zy['资源']['wood']={{858,226,0x182b3b}, {984,266,0x112946}, }
aoc_zy['资源']['blood']={{433,279,0x14253d}, {549,323,0x162a40}, }
aoc_zy['资源']['silver']={{624,281,0x15263a}, {766,322,0x152639}, }
aoc_zy['资源']['crystal']={{854,283,0x192a39}, {980,318,0x142336}, }
aoc_zy['资源']['mobi']={{449,440,0x112d45}, {547,475,0x113048}, }

aoc_zy['set']={}
aoc_zy['set']['fight'] ={{140,537,0x770011}, {258,575,0x650f12}, }		--战力
aoc_zy['set']['world']={{486,186,0x154261},{568,208,0x0e2c3f},}			--服
aoc_zy['set']['gid']={{514,129,0x184662}, {668,153,0x1f4b63}, }			--游戏id

aoc_zy['city']={}
aoc_zy['city']['lls']={{1023,26,0x1c3845},{1106,46,0x1f2f40},}
aoc_zy['city']['level']={{97,43,0x17121f},{158,68,0x484b55},}


if show == nil then
	show = {}
end
--[[
show = {}
show['level'] = 0
show['fight'] = 0
show['service'] = 0
show['country'] = 0
show['lls'] = 0
show['gid'] = 0

show['gold'] = 0
show['water'] = 0
show['wood'] = 0
show['blood'] = 0
show['silver'] = 0
show['crystal'] = 0
show['mobi'] = 0
--]]


function get_info(t)
	for k,v in pairs(t)do
		show[k] = ocr(v[1][1],v[1][2],v[2][1],v[2][2])
		nLog('K--'..k.."--"..show[k])
	end
end

--[[
keepScreen(true)
get_info(aoc_zy['资源'])
--]]

--[[
function get_info(t)
	for k,v in pairs(t)do
		local res = ocr(v[1][1],v[1][2],v[2][1],v[2][2])
		nLog(k .. '--' ..res) 
	end
end
--
--]]

function upAoc(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	
	aoc_url = 'http://test1.oupag.com/Public/ao/?service=Ao.game'
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = aoc_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(aoc_url, 15, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		return true
	end
end

function upAoc_wenfree(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	
	aoc_url = 'http://wenfree.cn/api/Public/aoc/?service=User.game'
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = aoc_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(aoc_url, 15, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		return true
	end
end

function upAoc_yzlilith(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	
	aoc_url = 'http://dajin.yzdingding.com/api_/Public/aoc/?service=User.game'
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = aoc_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(aoc_url, 5, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		return true
	end
end






