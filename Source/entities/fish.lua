import "CoreLibs/graphics"
import "CoreLibs/sprites"

local gfx = playdate.graphics

local Fish = class("Fish", gfx.sprite)

function Fish:init(name, x, y, catchChance)
    Fish.super.init(self)
    self.name = name
    self.catchChance = catchChance
    local image = gfx.image.new(10, 10)
    gfx.pushContext(image)
    gfx.setColor(gfx.kColorBlack)
    gfx.fillRect(0, 0, image:getSize())
    gfx.popContext()
    self:setImage(image)
    self:moveTo(x, y)
    self:add()

    if self.name == 'Common Fish' then
        self.value = 10
    elseif self.name == 'Rare Fish' then
        self.value = 50
    elseif self.name == 'Legendary Fish' then
        self.value = 100
    else
        self.value = 0
    end
end

function Fish:draw()
    gfx.sprite.draw(self)
end

function Fish:attemptCatch()
    return math.random() < self.catchChance
end

function Fish:getPosition()
    return self:getPositionXY()
end

return Fish