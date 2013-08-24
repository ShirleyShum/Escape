----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
-- Require the widget library
local widget = require( "widget" )


local rectangle, circleRed, rectangle3, buttonCircleRed, rectangle2, doorLock, buttonCircleLock
local quitText, quitRect, buttonQuit


----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	rectangle = display.newRect(60, 150, 200, 200)
	rectangle2 = display.newRect(60, 450, 100, 100)
	rectangle2:setFillColor(255, 0, 0)
	rectangle2:setStrokeColor(87, 39, 39)
	rectangle2.strokeWidth = 5
	circleRed = display.newCircle(200,400, 20)
	circleRed:setFillColor(144, 35, 35)
	rectangle3 = display.newRect(160, 450, 100, 100)
	rectangle3:setFillColor(255, 0, 0)
	rectangle3:setStrokeColor(87, 39, 39)
	rectangle3.strokeWidth = 5
	
	doorLock = display.newCircle(200,275, 30)
	doorLock:setFillColor(102, 51, 0)


	--Quit Rectangle
	quitRect = display.newRect(220, 10, 80, 50)
	quitRect:setFillColor(252, 214, 165)
	--Text here
	quitText = display.newText("Quit", 220, 35, native.systemFont, 20)
	quitText:setTextColor(0,3,4)
	
	--Button Rectangle 
	buttonQuit = quitRect
	buttonQuit = quitText
	-- When button is release it will go to scene1
	function buttonQuit:tap(event)
	local button3 = os.exit()
	local button3 = native.requestExit()
	end
buttonQuit:addEventListener("tap", buttonQuit)
	
	--Button circleRed
	buttonCircleRed = circleRed
	--When circleRed is tap, it will go to inventory. 
	function buttonCircleRed:touch( event )
	--rectangle2.x = contentCenterX
	--rectangle2.y = display.contentCenterY
	if(event.phase == "began") then 
	circleRed:setReferencePoint(display.CenterReferencePoint)
	circleRed.x = rectangle2.x
	circleRed.y = rectangle2.y
		
		elseif(event.phase == "moved") then 

		
		elseif(phase == "ended" or phase == "cancelled") then 

		
		end
	--end
	return true; 
	end 
	buttonCircleRed:addEventListener("touch", buttonCircleRed)
	
	
	
		--Button CircleLock
	buttonCircleLock = doorLock
	--When doorLock is tap, circleRed will go to doorLock. 
	function buttonCircleLock:touch( event )

	if(event.phase == "began") then 
	
	
	elseif (doorLock == doorLock) then 	
		if(event.phase == "moved") then 
		doorLock:setReferencePoint(display.CenterReferencePoint)
		circleRed.x = doorLock.x
		circleRed.y = doorLock.y 
		
		elseif(phase == "ended" or phase == "cancelled") then 

		end
	end
	return true; 
	end 
	buttonCircleLock:addEventListener("touch", buttonCircleLock)

	
	--Group insert 
	group:insert( rectangle )
	group:insert( rectangle2 )
	group:insert( rectangle3 )
	group:insert(doorLock)
	group:insert( circleRed )
	group:insert( buttonCircleLock )
	group:insert( buttonCircleRed )
	group:insert( quitRect )
	group:insert( quitText )
	group:insert( buttonQuit )


end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	-- remove previous scene's view
	storyboard.purgeScene( "scenetemplate" )
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene