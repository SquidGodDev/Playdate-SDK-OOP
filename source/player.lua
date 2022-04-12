import "projectile"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y, image)
    self:moveTo(x, y)
    self:setImage(image)
    self.moveSpeed = 1
    self.projectileSpeed = 1
end

function Player:shoot(x, y)
    local projectileInstance = Projectile(x, y - 10, self.projectileSpeed)
    projectileInstance:add()
end

function Player:ability()
    local function timerCallback()
        self:shoot(self.x, self.y)
    end
    pd.timer.performAfterDelay(50, timerCallback)
    pd.timer.performAfterDelay(150, timerCallback)
end

function Player:update()
    Player.super.update(self)
    if pd.buttonJustPressed(pd.kButtonA) then
        self:shoot(self.x, self.y)
    end
    if pd.buttonJustPressed(pd.kButtonB) then
        self:ability()
    end
    if pd.buttonIsPressed(pd.kButtonLeft) then
        self:moveBy(-self.moveSpeed, 0)
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        self:moveBy(self.moveSpeed, 0)
    end
end