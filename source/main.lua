import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
import "knight"
import "wizard"
import "giant"

local pd <const> = playdate
local gfx <const> = playdate.graphics

local function initialize()
    local playerInstance = Wizard(200, 200)
    playerInstance:add()
end

initialize()

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end
