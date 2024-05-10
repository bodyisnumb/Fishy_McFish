currentState = nil

function ChangeState( nextState )
  if ( currentState ~= nil ) then
    currentState.Cleanup()    
  end
  
  if ( nextState == "title" ) then
    currentState = titleScreen
  elseif ( nextState == "help" ) then
    currentState = helpScreen  
  elseif ( nextState == "game" ) then
    currentState = gameScreen
  end
  
  InitState()
end

function InitState()
  if ( currentState ~= nil ) then
    currentState.Init()
  end
end

function UpdateState()
  if ( currentState ~= nil ) then
    currentState.Update()
    
    if ( currentState.nextState ~= "" ) then
      ChangeState( currentState.nextState )
    end
  end
end

function DrawState()
  if ( currentState ~= nil ) then
    currentState.Draw()
  end
end
