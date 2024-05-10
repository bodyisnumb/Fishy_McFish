import 'CoreLibs/graphics.lua'
import 'CoreLibs/crank.lua'
local gfx = playdate.graphics

gameScreen = {
  key = "title",    -- A string identifier for this state
  nextState = "",   -- Set this when you're ready to go to another state
  
  imgBackground = gfx.image.new( "images/gamebg.png" ),
  imgPlayer     = gfx.image.new( "images/player.png" ),
  imgPoop       = gfx.image.new( "images/poop.png" ),
  imgCoin       = gfx.image.new( "images/coin.png" ),
  
  buttonPressing = {
    up    = false,
    down  = false,
    left  = false,
    right = false,
    a     = false,
    b     = false
  },
  
  player = {
    x = 400/2 - 20/2,
    y = 240/2 - 20/2,
    width = 20,
    height = 20,
    speed = 2,
  },
  
  poop = {
    x = 0,
    y = 0,
    width = 20,
    height = 20
  },
  
  Init = function( self )
    -- Initialize any data that must be reset every time we return to this state here
    gameScreen.nextState = ""
    gameScreen.poop["x"] = math.random( 25, 400-20 )
    gameScreen.poop["y"] = math.random( 0, 240-20 )
    gameScreen.player["x"] = 400/2 - 20/2
    gameScreen.player["y"] = 240/2 - 20/2
    gameScreen.buttonPressing["up"] = false
    gameScreen.buttonPressing["down"] = false
    gameScreen.buttonPressing["left"] = false
    gameScreen.buttonPressing["a"] = false
    gameScreen.buttonPressing["b"] = false
  end,
  
  Update = function( self )
    xMove = 0
    yMove = 0
    
    if      ( gameScreen.buttonPressing["up"] == true )     then yMove = -1
    elseif  ( gameScreen.buttonPressing["down"] == true )   then yMove = 1
    elseif  ( gameScreen.buttonPressing["left"] == true )   then xMove = -1
    elseif  ( gameScreen.buttonPressing["right"] == true )  then xMove = 1
    end
    gameScreen.MovePlayer( self, xMove, yMove )
    
    -- Check distance between player and poop
    distance = gameScreen.GetDistance( self, gameScreen.player, gameScreen.poop )
    
    if ( distance < 20 ) then
      -- dead
      gameScreen.nextState = "title"
    end
  end,
  
  Draw = function( self )
    gameScreen.imgBackground:draw( 0, 0 )
    
    -- Draw poop
    gameScreen.imgPoop:draw( gameScreen.poop["x"], gameScreen.poop["y"] )
    
    -- Draw player
    gameScreen.imgPlayer:draw( gameScreen.player["x"], gameScreen.player["y"] )
    
  end,
  
  Cleanup = function( self )
    -- Free space here as needed
  end,
  
  GetDistance = function( self, obj1, obj2 )
    xdiff = obj2["x"] - obj1["x"]
    ydiff = obj2["y"] - obj2["y"]
    dist = math.sqrt( xdiff * xdiff + ydiff * ydiff )
    return dist
  end,
  
  MovePlayer = function( self, xAmt, yAmt )
    x = gameScreen.player["x"]
    y = gameScreen.player["y"]
    w = gameScreen.player["width"]
    h = gameScreen.player["height"]
    speed = gameScreen.player["speed"]
    
    -- Adjust position
    x = x + xAmt * speed
    y = y + yAmt * speed
    
    -- Keep character on the screen
    if      ( x < 0 )       then x = 0
    elseif  ( x > 400 - w ) then x = 400 - w end
    
    if      ( y < 0 )       then y = 0
    elseif  ( y > 240 - h ) then y = 240 - h end
    
    gameScreen.player["x"] = x
    gameScreen.player["y"] = y
  end,
  
  
  
  -- Button handlers
  Handle_upButtonDown     = function( self )
    gameScreen.buttonPressing["up"] = true
  end,
  
  Handle_upButtonUp       = function( self ) 
    gameScreen.buttonPressing["up"] = false
  end,
  
  Handle_downButtonDown   = function( self )
    gameScreen.buttonPressing["down"] = true
  end,
  
  Handle_downButtonUp     = function( self ) 
    gameScreen.buttonPressing["down"] = false
  end,
  
  Handle_leftButtonDown   = function( self ) 
    gameScreen.buttonPressing["left"] = true
  end,
  
  Handle_leftButtonUp     = function( self ) 
    gameScreen.buttonPressing["left"] = false
  end,
  
  Handle_rightButtonDown  = function( self ) 
    gameScreen.buttonPressing["right"] = true
  end,
  
  Handle_rightButtonUp    = function( self )
    gameScreen.buttonPressing["right"] = false 
  end,
  
  Handle_AButtonDown      = function( self ) 
    gameScreen.buttonPressing["a"] = true
  end,
  
  Handle_AButtonUp        = function( self )
    gameScreen.buttonPressing["a"] = false
  end,
  
  Handle_BButtonDown      = function( self )
    gameScreen.buttonPressing["b"] = true
  end,
  
  Handle_BButtonUp        = function( self ) 
    gameScreen.buttonPressing["b"] = false
  end,
}
