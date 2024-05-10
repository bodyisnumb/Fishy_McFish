import 'CoreLibs/graphics.lua'
local gfx = playdate.graphics

titleScreen = {
  key = "title",    -- A string identifier for this state
  nextState = "",   -- Set this when you're ready to go to another state
  
  imgBackground = gfx.image.new( "images/menubg.png" ),
  imgCursor     = gfx.image.new( "images/cursor.png" ),
  imgButton     = gfx.image.new( "images/buttonbg.png" ),
  
  buttons = {
    btnPlay = {
      text = "Play",
      x = 400/2 - 180/2, -- screenWidth / 2 - buttonWidth / 2 to center it
      y = 125,
      width = 180,
      height = 30,
      textOffsetX = 180/2,
      textOffsetY = 7
    },
    btnHelp = {
      text = "Help",
      x = 400/2 - 180/2,
      y = 175,
      width = 180,
      height = 30,
      textOffsetX = 180/2,
      textOffsetY = 7
    }
  },
  
  cursor = {
    x = 100,
    width = 30,
    height = 30,
    yPositions = { 125, 175 }, -- These correspond to the button y positions
    selections = { "game", "help" },
    currentPosition = 1
  },
  
  Init = function( self )
    titleScreen.nextState = ""
  end,
  
  Update = function( self )
  end,
  
  Draw = function( self )
    titleScreen.imgBackground:draw( 0, 0 )
    gfx.setColor( gfx.kColorWhite )
    gfx.fillRect( 145, 75, 110, 25 )
    gfx.drawTextAligned( "FISHY MCFISH", 150, 77, kTextAlignment.left )
    
    -- Draw buttons
    for key, button in pairs( titleScreen.buttons ) do
      titleScreen.imgButton:draw( button["x"], button["y"] )
      gfx.drawTextAligned( button["text"], button["x"] + button["textOffsetX"], button["y"] + button["textOffsetY"], kTextAlignment.center )
    end
    
    -- Draw cursor
    titleScreen.imgCursor:draw( titleScreen.cursor["x"], titleScreen.cursor["yPositions"][ titleScreen.cursor["currentPosition"] ] )
  end,
  
  Cleanup = function( self )
    -- Free space here as needed
  end,
  
  Handle_upButtonDown = function( self )
    titleScreen.cursor["currentPosition"] = titleScreen.cursor["currentPosition"] - 1
    if ( titleScreen.cursor["currentPosition"] == 0 ) then
      titleScreen.cursor["currentPosition"] = #titleScreen.cursor["yPositions"]
    end
  end,
  
  
  -- Button handlers
  Handle_downButtonDown = function( self )
    titleScreen.cursor["currentPosition"] = titleScreen.cursor["currentPosition"] + 1
    if ( titleScreen.cursor["currentPosition"] > #titleScreen.cursor["yPositions"] ) then
      titleScreen.cursor["currentPosition"] = 1
    end
  end,
  
  Handle_BButtonDown = function( self )
    cursorPosition = titleScreen.cursor["currentPosition"]
    titleScreen.nextState = titleScreen.cursor["selections"][ cursorPosition ]
  end,
  
  
  -- Unused
  Handle_upButtonUp       = function( self ) 
  end,
  
  Handle_downButtonUp     = function( self ) 
  end,
  
  Handle_leftButtonDown   = function( self ) 
  end,
  
  Handle_leftButtonUp     = function( self ) 
  end,
  
  Handle_rightButtonDown  = function( self ) 
  end,
  
  Handle_rightButtonUp    = function( self ) 
  end,
  
  Handle_AButtonDown      = function( self ) 
  end,
  
  Handle_AButtonUp        = function( self ) 
  end,
  
  Handle_BButtonUp        = function( self ) 
  end,
}
