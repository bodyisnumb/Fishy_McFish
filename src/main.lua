-- src/main.lua
import "entities/player.lua"
import "ui/hud.lua"
import "core/game_state.lua"
local Game = require("src.core.game")

-- Initialize the game
local game = Game:new()

function playdate.update()
    game:update()
    game:draw()
end