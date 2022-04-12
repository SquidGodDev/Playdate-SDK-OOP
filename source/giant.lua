import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Giant').extends(Player)

function Giant:init(x, y)
    local giantImage = gfx.image.new("images/giant")
    Giant.super.init(self, x, y, giantImage)
    self.moveSpeed = 2
    self.projectileSpeed = 3
end

function Giant:ability()
    self:shoot(self.x, self.y)
    self:shoot(self.x+10, self.y)
    self:shoot(self.x-10, self.y)
end