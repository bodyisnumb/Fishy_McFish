-- src/core/game_state.lua
local GameState = {}
GameState.__index = GameState

function GameState:new()
    local self = setmetatable({}, GameState)
    self.score = 0
    self.stamina = 65
    self.hp = 125
    self.gold = 0 
    return self
end

return GameState