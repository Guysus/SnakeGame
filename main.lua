
function love.load()
  Object = require "classic"
  lume = require "lume"
  require "entity"
  require "player"
  require "apple"
  require "wall"
  
  background = love.graphics.newImage("Images/grass.jpg")
  
  player = Player(100, 100)
  apple = Apple()
  
  apples = {}
  table.insert(apples, apple)
  
  --for i=1,25 do
      --table.insert(apples,
          --{
              --x = math.random(50, 650),
              --y = math.random(50, 450),
              --size = 10,
             -- image = love.graphics.newImage("Images/apple.png")
          --}
     -- )
  --end
  
  objects = {}
  table.insert(objects, player)
  table.insert(objects, apple)
  
  
  walls = {}
  
  map = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
    }

    for i,v in ipairs(map) do
        for j,w in ipairs(v) do
            if w == 1 then
                table.insert(walls, Wall((j-1)*50, (i-1)*50))
            end
        end
    end
end

function love.update(dt)
  
    for i,v in ipairs(objects) do
        v:update(dt)
    end
    
    for i,v in ipairs(walls) do
        v:update(dt)
    end
    
    local loop = true
    local limit = 0
    
    while loop do
        loop = false
        
        limit = limit+1
        if limit > 100 then
            break
        end
        for i=1,#objects-1 do
            for j=i+1,#objects do
                local collision = objects[i]:resolveCollision(objects[j])
                if collision then
                    loop = true
                end
            end
        end
        
        for i,wall in ipairs(walls) do
            for j,object in ipairs(objects) do
                local collision = object:resolveCollision(wall)
                if collision then
                    loop = true
                end
            end
        end
        
        for i,apple in ipairs(apples) do
            for j, object in ipairs(objects) do
                local collision = object:resolveCollision(apple)
                if collision then
                    table.remove(apples, i)
                end
            end
        end
    end
end

function love.draw()
    for i,v in ipairs(objects) do
        v:draw()
    end
    
    for i,v in ipairs(walls) do
        v:draw()
    end
    
    --for i,v in ipairs(apples) do
        --love.graphics.draw(v.image, v.x, v.y, 0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
    --end
    
    love.graphics.draw(background, 0, 0, 0, 1.35, 1.67)
    player:draw()
    apple:draw()
    
end