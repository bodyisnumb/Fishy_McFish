import "CoreLibs/graphics"
import "CoreLibs/sprites"

local gfx = playdate.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y, gameState)
    self.super.init(self)
    
    local image = gfx.image.new(20, 20)
    gfx.pushContext(image)
    gfx.setColor(gfx.kColorBlack)
    gfx.fillRect(0, 0, image:getSize())
    gfx.popContext()
    
    self:setImage(image)
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