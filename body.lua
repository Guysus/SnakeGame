
Body = Entity:extend()

function Body:new(x, y)
    Body.super.new(self, x, y, "Images/body.png")
end

function Body:update(dt)
  Body.super.update(self, dt)
end
