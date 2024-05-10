local GameState = class("GameState")

function GameState:init()
    self.score = 0
    self.stamina = 65
    self.hp = 125
    self.gold = 5
    self.bag = {}
end

function GameState:addGold(amount)
    self.gold = self.gold + amount
end

function GameState:reduceHP(amount)
    self.hp = self.hp - amount
    if self.hp < 0 then
        self.hp = 0
    end
end

function GameState:increaseStamina(amount)
    self.stamina = math.min(self.stamina + amount, 100)
end

function GameState:decreaseStamina(amount)
    self.stamina = math.max(self.stamina - amount, 0)
end