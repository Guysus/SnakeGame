
Entity = Object:extend()

function Entity:new(x, y, image_path)
  self.x = x
  self.y = y
  self.image = love.graphics.newImage(image_path)
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  
  self.last = {}
  self.last.x = self.x
  self.last.y = self.y
end

function Entity:update(dt)
  self.last.x = self.x
  self.last.y = self.y
end

function Entity:draw()
  love.graphics.draw(self.image, self.x, self.y)
end

function Entity:checkCollision(e)
    return self.x + self.width > e.x
    and self.x < e.x + e.width
    and self.y + self.height > e.y
    and self.y < e.y + e.height
end

function Entity:resolveCollision(e)
    if self:checkCollision(e) then
        local pushback = self.x + self.width - e.x
        self.x = self.x - pushback
    end
end

function Entity:wasVerticallyAligned(e)
    return self.last.y < e.last.y + e.height and self.last.y + self.height > e.last.y
end

function Entity:wasHorizontallyAligned(e)
    return self.last.x < e.last.x + e.width and self.last.x + self.width > e.last.x
end

