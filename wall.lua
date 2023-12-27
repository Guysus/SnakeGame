
Wall = Entity:extend()

function Wall:new(x, y)
    Wall.super.new(self, x, y, "Images/rock.png")
end