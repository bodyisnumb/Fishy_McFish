import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx = playdate.graphics

local image = nil
local musicPlayer = playdate.sound.fileplayer.new("sounds/castlebit.mp3")

local function initialize()
    gfx.setBackgroundColor(gfx.kColorClear)
    local image = gfx.image.new("images/castle")
    bgImage = gfx.sprite.new(image)
    bgImage:moveTo(200, 120)
    bgImage:add()
    
    
    local font = gfx.font.new("fonts/Venture.fnt")
    local text = gfx.drawText("Castle",100,100)
    
    
end

initialize()

function playdate.update()
    gfx.sprite.update()
    textboxDial:draw()
    musicPlayer:play()
end

textboxDial = gfx.sprite.new()
textboxDial:setSize(75, 75)
textboxDial:moveTo(10, 30)
textboxDial:setZIndex(899)
textboxDial.currentText = "Castle"

function textboxDial:update()
    textboxDial.currentText = actualNum
    self:markDirty()
end

function textboxDial:draw()

    gfx.pushContext()		
        gfx.setColor(gfx.kColorWhite)
        gfx.fillRect(300,10,75,50)
        gfx.setLineWidth(2)
        gfx.setColor(gfx.kColorBlack)
        gfx.drawRoundRect(300,10,75,50,4)
        
        gfx.drawText(self.currentText, 315, 25)
    
    gfx.popContext()
end