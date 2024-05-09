import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx = playdate.graphics
import "core/game"
import "ui/hud"

local game = Game()
local hud = HUD(game.gameState)

function playdate.update()
    game:update()
    game:draw()
    hud:draw()
end