import 'CoreLibs/graphics.lua'
local gfx = playdate.graphics

helpScreen = {
  key = "title",    -- A string identifier for this state
  nextState = "",   -- Set this when you're ready to go to another state
  
  imgBackground = gfx.image.new( "images/menubg.png" ),
  imgCursor     = gfx.image.new( "images/cursor.png" ),
  imgButton     = gfx.image.new( "images/buttonbg.png" ),
  
  buttons = {
    btnPlay = {
      text = "Back",
      x = 10,
      y = 200,
      width = 180,
      height = 30,
      textOffsetX = 180/2,
      textOffsetY = 7
    },
  },
  
  cursor = {
    x = 170,
    width = 30,
    height = 30,
    yPositions = { 200 }, -- These correspond to the button y positions
    selections = { "title" },
    currentPosition = 1
  },
  Init = function( self )
    helpScreen.nextState = ""
  end,
  
  Update = function( self )
  end,
  
  Draw = function( self )
    helpScreen.imgBackground:draw( 0, 0 )
    
    
    -- Instructions text
    gfx.setColor( gfx.kColorWhite )
    gfx.fillRect( 0, 0, 200, 75 )
    gfx.drawTextAligned( "HELP SCREEN", 25, 3, kTextAlignment.left )
    gfx.drawText( "Collect the poop", 50, 25 )
    gfx.drawText( "and be good.", 50, 50 )
    
    -- Draw buttons
    for key, button in pairs( helpScreen.buttons ) do
      helpScreen.imgButton:draw( button["x"], button["y"] )
      gfx.drawTextAligned( button["text"], button["x"] + button["textOffsetX"], button["y"] + button["textOffsetY"], kTextAlignment.center )
    end
    
    -- Draw cursor
    helpScreen.imgCursor:draw( helpScreen.cursor["x"], helpScreen.cursor["yPositions"][ helpScreen.cursor["currentPosition"] ], gfx.kImageFlippedX )
  end,
  
  Cleanup = function( self )
    -- Free space here as needed
  end,
  
  Handle_upButtonDown = function( self )
    helpScreen.cursor["currentPosition"] = helpScreen.cursor["currentPosition"] - 1
    if ( helpScreen.cursor["currentPosition"] == 0 ) then
      helpScreen.cursor["currentPosition"] = #helpScreen.cursor["yPositions"]
    end
  end,
  
  
  
  
  -- Button handlers
  Handle_downButtonDown = function( self )
    helpScreen.cursor["currentPosition"] = helpScreen.cursor["currentPosition"] + 1
    if ( helpScreen.cursor["currentPosition"] > #helpScreen.cursor["yPositions"] ) then
      helpScreen.cursor["currentPosition"] = 1
    end
  end,
  
  Handle_BButtonDown = function( self )
    helpScreen.nextState = helpScreen.cursor["selections"][ helpScreen.cursor["currentPosition"] ]
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
