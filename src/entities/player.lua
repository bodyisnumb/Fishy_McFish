-- src/entities/player.lua
local Player = {}
Player.__index = Player

function Player:new(x, y)
    local self = setmetatable({}, Player)
    self.x = x
    self.y = y
    self.speed = 2
    self.width = 10
    self.height = 10
    return self
end

function Player:update(state)
    -- Basic controls for player movement
    if playdate.buttonIsPressed(playdate.kButtonUp) then
        self.y = self.y - self.speed
    elseif playdate.buttonIsPressed(playdate.kButtonDown) then
        self.y = self.y + self.speed
    end
    if playdate.buttonIsPressed(playdate.kButtonLeft) then
        self.x = self.x - self.speed
    elseif playdate.buttonIsPressed(playdate.kButtonRight) then
        self.x = self.x + self.speed
    end
end

function Player:draw()
    playdate.graphics.drawRect(self.x, self.y, self.width, self.height)
end

return Player