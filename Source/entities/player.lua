import "CoreLibs/graphics"
import "CoreLibs/sprites"

local gfx = playdate.graphics

local Player = class("Player", gfx.sprite)

function Player:init(x, y, gameState)
    Player.super.init(self)
    local mp = gfx.imagetable.new('assets/sprites/ship.png')
    local playerImage = mp:getImage("DOWN")
    self:setImage(playerImage)
    self:setCollideRect(0, 20, 21, 36)
    self:moveTo(x, y)
    self:add()
    self.gameState = gameState
end

function Player:update()
    local dx, dy = 0, 0
    if playdate.buttonIsPressed(playdate.kButtonLeft) then dx = -2 end
    if playdate.buttonIsPressed(playdate.kButtonRight) then dx = 2 end
    if playdate.buttonIsPressed(playdate.kButtonUp) then dy = -2 end
    if playdate.buttonIsPressed(playdate.kButtonDown) then dy = 2 end
    self:moveBy(dx, dy)
end

function Player:draw()
    gfx.sprite.draw(self)
end
function Player:isNear(fish)
    local playerX, playerY = self:getPosition()
    local fishX, fishY = fish:getPosition()
    local distance = math.sqrt((playerX - fishX)^2 + (playerY - fishY)^2)
    return distance < 30
end

function Player:addFish(fish)
    table.insert(self.gameState.bag, fish)
    self.gameState:addGold(fish.value)
end

return Player