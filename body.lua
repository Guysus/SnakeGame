
Body = Entity:extend()

function Body:new(x, y)
    Body.super.new(self, x, y, "Images/body.png")
    self.strength = 5
    self.tempStrength = self.strength
end