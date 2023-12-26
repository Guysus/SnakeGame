
function love.load()
  Object = require "classic"
  lume = require "lume"
  require "entity"
  require "player"
  require "apple"
  
  background = love.graphics.newImage("Images/grass.jpg")
  
  player = Player(100, 100)
  apple = Apple(200, 200)
end

function love.update(dt)
  player:update(dt)
  apple:update(dt)
end

function love.draw()
  love.graphics.draw(background, 0, 0, 0, 1.35, 1.67)
  player:draw()
  apple:draw()
end