local gfx = playdate.graphics

titleScreen = {
  key = "template",     -- A string identifier for this state
  nextState = "",       -- Set this when you're ready to go to another state
  
  Init = function( self )
    titleScreen.nextState = ""
  end,
  
  Update = function( self )
    print( "Update" )
  end,
  
  Draw = function( self )
    print( "Draw" )
  end,
  
  Cleanup = function( self )
    print( "Cleanup" )
  end,
  
  
  
  -- Button handlers
  Handle_upButtonDown     = function( self )
  end,
  
  Handle_upButtonUp       = function( self ) 
  end,
  
  Handle_downButtonUp     = function( self ) 
  end,
  
  Handle_downButtonDown   = function( self )
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
  
  Handle_BButtonDown      = function( self )
  end,
}
