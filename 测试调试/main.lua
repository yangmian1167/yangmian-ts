

--for var= 1, 30 do
--	local header_unm = math.random(100,2400)
--	local imgUrl = 'https://img.wenfree.cn/baihe/img-'.. header_unm ..'.jpg';
--	downFile(imgUrl,"/User/Media/TouchSprite/res/"..header_unm..".jpg");
--	saveImageToAlbum(header_unm .. ".jpg")
--end

--openURL('https://v.douyin.com/X1d3SF/')



-- 元类
Shape = {area = 0}

-- 基础类方法 new
function Shape:new (o,side)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  side = side or 0
  self.area = side*side;
  return o
end

-- 基础类方法 printArea
function Shape:printArea ()
  print("面积为 ",self.area)
end

-- 创建对象
myshape = Shape:new(nil,10)

myshape:printArea()