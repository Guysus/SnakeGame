
function love.load()
  Object = require "classic"
  lume = require "lume"
  require "entity"
  require "player"
  
  player = Player(100, 100)
end

function love.update()
  player:update(dt)
end

function love.draw()
  player:draw()
end