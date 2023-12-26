
Apple = Entity:extend()

function Apple:new(x, y)
    Apple.super.new(self, x, y, "Image/apple")
end

function Apple:update(dt)
  Apple.super.update(self, dt)
end
