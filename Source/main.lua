import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local Player = import "entities/player"
local HUD = import "ui/hud"
local GameState = import "core/game_state"
local Game = import "core/game"


local game = Game:new()

function playdate.update()
    game:update()
    game:draw()
end