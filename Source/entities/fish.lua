import "CoreLibs/graphics"
import "CoreLibs/sprites"

local gfx = playdate.graphics

class('Fish', gfx.sprite)

function Fish:init(name, x, y, catchChance)
    self.super.init(self, x, y)
    self.name = name
    self.catchChance = catchChance
    local image = gfx.image.new(10, 10)
    gfx.pushContext(image)
    gfx.setColor(gfx.kColorBlack)
    gfx.fillRect(0, 0, image:getSize())
    gfx.popContext()
    
    self:setImage(image)
end

function Fish:attemptCatch()
    return math.random() < self.catchChance
end

function Fish:draw()
    self:drawImage()
end

return Fish