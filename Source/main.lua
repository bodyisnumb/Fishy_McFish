-- Example menu switcher
-- You don't need to modify the code here, add code to the 

import 'screen_title.lua'
import 'screen_help.lua'
import 'screen_game.lua'
import 'state_manager.lua'



local gfx = playdate.graphics
playdate.display.setRefreshRate( 50 )

gfx.setBackgroundColor( gfx.kColorWhite )

ChangeState( "title" )

function playdate.update()
  UpdateState()
  DrawState()
end

-- Callbacks
function playdate.upButtonDown()    currentState.Handle_upButtonDown()    end
function playdate.upButtonUp()      currentState.Handle_upButtonUp()      end

function playdate.downButtonDown()  currentState.Handle_downButtonDown()  end
function playdate.downButtonUp()    currentState.Handle_downButtonUp()    end
                                    
function playdate.leftButtonDown()  currentState.Handle_leftButtonDown()  end
function playdate.leftButtonUp()    currentState.Handle_leftButtonUp()    end
                                    
function playdate.rightButtonDown() currentState.Handle_rightButtonDown() end
function playdate.rightButtonUp()   currentState.Handle_rightButtonUp()   end
                                    
function playdate.AButtonDown()     currentState.Handle_AButtonDown()     end
function playdate.AButtonUp()       currentState.Handle_AButtonUp()       end

function playdate.BButtonDown()     currentState.Handle_BButtonDown()     end
function playdate.BButtonUp()       currentState.Handle_BButtonUp()       end
