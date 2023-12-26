
Apple = Entity:extend()

function Apple:new(x, y)
    
    apples = {}
    
    for i=1 do
        table.insert(apples,
            {
                x = math.random(50, 650),
                y = math.random(50, 450),
                image = love.graphics.newImage("Images/apple.png")
            }
        )
    end
  
    --Apple.super.new(self, x, y, "Images/apple.png")
end

function Apple:update(dt)
  Apple.super.update(self, dt)
end
