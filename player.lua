


function Player:new(x, y)
    
end

function Player:update(dt) 
  if love.keypressed.isDown("left") then
      self.x = self.x - 200 * dt
  elseif love.keypressed.isDown("right") then
      self.x = self.x + 200 * dt
  elseif love.keypressed.isDown("up") then
      self.y = self.y - 200 * dt
  elseif love.keypressed.isDown("down") then
      self.y = self.y + 200 * dt
end

function Player:draw()
  
end