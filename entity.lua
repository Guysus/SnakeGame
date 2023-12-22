
Entity = Object:extend()

function Entity:new(x, y, image_path)
  self.x = x
  self.y = y
  self.image = love.graphics.newImage(image_path)
  self.width = self.image.getWidth()
  self.height = self.image.getHeight()
  
  self.last = {}
  self.last.x = self.x
  self.last.y = self.y
end