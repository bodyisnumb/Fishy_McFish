import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local Game = import "core/game"

local gfx = playdate.graphics
local Player = import "entities/player"
local HUD = import "ui/hud"
local Fish = import "entities/fish"
local GameState = import "core/game_state"

local game = Game:new() -- Create an instance of the Game class
game:init()
local gameState = game.gameState -- Get the gameState property from the Game instance

-- Ensure the HUD class is defined and callable, potentially with :new()
local hud = HUD(game.gameState)


function playdate.update()
    game:update()
    game:draw()
    hud:draw()
end