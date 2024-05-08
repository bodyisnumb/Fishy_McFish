-- src/core/game.lua
local Player = require("src.entities.player")
local HUD = require("src.ui.hud")
local GameState = require("src.core.game_state")

local Game = {}
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