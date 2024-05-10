import "CoreLibs/graphics"

local gfx = playdate.graphics

local HUD = class("HUD")

function HUD:init(gameState)
    self.gameState = gameState
end

function HUD:draw()
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawText("Health: " .. self.gameState.hp, 10, 10)
    gfx.drawText("Stamina: " .. self.gameState.stamina, 10, 30)
    gfx.drawText("Gold: $" .. self.gameState.gold, 10, 50)
    gfx.drawText("Bag: " .. #self.gameState.bag .. " fish", 10, 70)
end

return HUD