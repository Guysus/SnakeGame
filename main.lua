
function love.load()
  Object = require "classic"
  lume = require "lume"
  require "entity"
  require "player"
  require "apple"
  require "wall"
  
  background = love.graphics.newImage("Images/grass.jpg")
  
  player = Player(100, 100)
  apple = Apple(200, 200)
  wall = Wall(400, 150)
  
  objects = {}
  table.insert(objects, player)
  table.insert(objects, apple)
  table.insert(objects, wall)
end

function love.update(dt)
  
    for i,v in ipairs(objects) do
        v:update(dt)
    end
    
    for i=1,#objects-1 do
        for j=i+1,#objects do
            objects[i]:resolveCollision(objects[j])
        end
    end
  --player:update(dt)
  --apple:update(dt)
  --player:resolveCollision(apple)
end

function love.draw()
    for i,v in ipairs(objects) do
        v:draw()
    end
    
    love.graphics.draw(background, 0, 0, 0, 1.35, 1.67)
  --player:draw()
  --apple:draw()
end