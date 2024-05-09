-- src/ui/hud.lua
HUD = {}
HUD.__index = HUD

function HUD:new()
    local self = setmetatable({}, HUD)
    return self
end

function HUD:draw(state)
    -- Display the stamina on the screen
    playdate.graphics.drawText("Health: ".. state.hp,10,45)
    playdate.graphics.drawText("Stamina: " .. state.stamina, 10, 25)
    playdate.graphics.drawText("gold: " .. state.gold, 10, 5)

end

return HUD