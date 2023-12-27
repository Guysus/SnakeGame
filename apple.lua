
Apple = Entity:extend()

function Apple:new(x, y)
    Apple.super.new(self, x, y, "Images/apple.png")
    self.strength = 1
end

function Apple:update(dt)
  Apple.super.update(self, dt)
end
