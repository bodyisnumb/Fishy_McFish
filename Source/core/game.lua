-- src/core/game.lua
import "entities/player.lua"
import "ui/hud.lua"
import "core/game_state.lua"

Game = {}
Game.__index = Game

function Game:new()
    local self = setmetatable({}, Game)
    self.state = GameState:new()
    self.player = Player:new(100, 120) -- Starting position of the player
    self.hud = HUD:new()
    return self
end

function Game:update()
    self.player:update(self.state)
end

function Game:draw()
    playdate.graphics.clear()
    self.player:draw()
    self.hud:draw(self.state)
end

return Game