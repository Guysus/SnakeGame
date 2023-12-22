
Player = Entity:extend()

function Player:new(x, y)
    Player.super.new(self, x, y, "Images/snakehead.png")
end

function Player:update(dt) 
  
    Player.super.update(self, dt)
    
    if love.keypressed.isDown("left") then
        self.x = self.x - 200 * dt
    elseif love.keypressed.isDown("right") then
        self.x = self.x + 200 * dt
    elseif love.keypressed.isDown("up") then
        self.y = self.y - 200 * dt
    elseif love.keypressed.isDown("down") then
      self.y = self.y + 200 * dt      
end
