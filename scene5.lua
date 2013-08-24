----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
-- Require the widget library
local widget = require( "widget" )


local roundGreenRectangle, circleLeft, circleRight, buttonCircleLeft, buttonCircleRight
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
	roundGreenRectangle = display.newRoundedRect(80, 150 , 150, 150, 20)
	roundGreenRectangle:setFillColor(159, 253, 159)
	circleRight = display.newCircle(280,490, 20)
	circleRight:setFillColor(0, 153, 153)
	circleLeft = display.newCircle(40,490, 20)
	circleLeft:setFillColor(0, 153, 0)
	
	--here I am going to test a button
	buttonCircleLeft = circleLeft

function buttonCircleLeft:tap(event)
local button2 = storyboard.gotoScene( "scene4", "fade", 200  )

end

buttonCircleLeft:addEventListener("tap", buttonCircleLeft)
	--here I am going to test a button
	buttonCircleRight = circleRight

function buttonCircleRight:tap(event)
--local button3 = storyboard.gotoScene( "scene4", "fade", 200  )

end

buttonCircleRight:addEventListener("tap", buttonCircleRight)

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

	--Group insert 
	group:insert( roundGreenRectangle )
	group:insert( circleLeft )
	group:insert( circleRight )
	group:insert( buttonCircleLeft )
	group:insert( buttonCircleRight )
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
	storyboard.purgeScene( "scene4" )
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