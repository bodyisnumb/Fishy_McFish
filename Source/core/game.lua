import "CoreLibs/object"
import "CoreLibs/graphics"

local gfx = playdate.graphics
local Player = import "entities/player"
local HUD = import "ui/hud"
local Fish = import "entities/fish"
local GameState = import "core/game_state"

Game = class('Game')

function Game:init()
    self.gameState = GameState:new()
    self.player = Player:new(100, 100, self.gameState)
    self.hud = HUD:new(self.gameState)
    self.fishes = {
        Fish:new('Common Fish', 100, 100, 0.8),
        Fish:new('Rare Fish', 200, 200, 0.2),
        Fish:new('Legendary Fish', 300, 300, 0.05)
    }
end

function Game:update()

    -- Fishing interaction
    if playdate.buttonJustPressed(playdate.kButtonA) then
        for _, fish in ipairs(self.fishes) do
            if self.player:isNear(fish) then
                local caught = fish:attemptCatch()
                if caught then
                    self.player:addFish(fish)
                end
                break
            end
        end
    end
end

function Game:draw()
    gfx.clear()
    self.player:draw()
    for _, fish in ipairs(self.fishes) do
        fish:draw()
    end
    self.hud:draw()
end

return Game