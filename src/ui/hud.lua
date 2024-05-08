-- src/ui/hud.lua
local HUD = {}
HUD.__index = HUD

function HUD:new()
    local self = setmetatable({}, HUD)
    return self
end

function HUD:draw(state)
    -- Display the stamina on the screen
    playdate.graphics.drawText("gold: " .. state.gold, 11, 11)
    playdate.graphics.drawText("Stamina: " .. state.stamina, 10, 10)
    playdate.graphics.drawText("Health: ".. state.hp,12,12)
end

return HUD