import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "core/game_state"
import "entities/player"
import "entities/fish"
import "ui/hud"

local gfx = playdate.graphics

class('Game', gfx.sprite)

function Game:init(x, y)
    self.super.init(self, x, y)
    self.gameState = GameState()
    self.player = Player(100, 100, self.gameState)
    self.hud = HUD(self.gameState)
    self.fishes = {
        Fish('Common Fish', 100, 100, 0.8),
        Fish('Rare Fish', 200, 200, 0.2),
        Fish('Legendary Fish', 300, 300, 0.05)
    }
end

function Game:update()
    self.player:update()

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