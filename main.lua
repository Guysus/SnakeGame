
function love.load()
  Object = require "classic"
  lume = require "lume"
  require "entity"
  require "player"
  require "apple"
  require "wall"
  require "body"
  
  background = love.graphics.newImage("Images/grass.jpg")
  
  player = Player(100, 100)
  apple = Apple()
  wall = Wall()
  body = Body()

  objects = {}
  table.insert(objects, player)
  table.insert(objects, apple)
  
  highScore = love.graphics.newImage("Images/score.png")
  score = 0
  
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
        
        local collision = objects[1]:resolveCollision(objects[2])
        if collision then
            loop = true
            objects[2].x = math.random(50, 650)
            objects[2].y = math.random(50, 450)
            score = score + 1
            table.insert(objects, body)
            objects[3].x = player.x + 25
            objects[3].y = player.y + 25
        --local death = objects[1]:resolveCollision(objects[3])
        --if death then
            
        end
        
        --for i=1,#objects-1 do
            --for j=i+1,#objects do
                --local collision = objects[i]:resolveCollision(objects[j])
                --if collision then
                    --loop = true
                    --objects[2].x = math.random(50, 650)
                    --objects[2].y = math.random(50, 450)
                    --score = score + 1
                    --table.insert(objects, body)
                --end
            --end
        --end
        
        for i,wall in ipairs(walls) do
            for j,object in ipairs(objects) do
                local collision = object:resolveCollision(wall)
                if collision then
                    loop = true
                end
            end
        end
    end
end

function love.draw()
  
    love.graphics.draw(background, 0, 0, 0, 1.35, 1.67)
  
    for i,v in ipairs(objects) do
        v:draw()
    end
    
    for i,v in ipairs(walls) do
        v:draw()
    end
    
    love.graphics.draw(highScore, 0, -55, 0, 0.3, 0.3)
    love.graphics.print(score, 50, 45, 0, 3, 3)
end