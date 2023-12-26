
function love.load()
  Object = require "classic"
  lume = require "lume"
  require "entity"
  require "player"
  require "apple"
  
  player = Player(100, 100)
  apple = Apple(200, 200)
end

function love.update(dt)
  player:update(dt)
  apple:update(dt)
end

function love.draw()
  player:draw()
  apple:draw()
end