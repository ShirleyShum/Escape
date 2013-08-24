----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
-- Require the widget library
local widget = require( "widget" )

local mainRect, startRect, quitRect
local titleText, startText, quitText
local buttonStart, buttonQuit, buttonStartPress, buttonQuitPress 
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
	mainRect = display.newRect(60, 50, 200, 50)
	startRect = display.newRect(100, 200, 100, 50)
	quitRect = display.newRect(100, 280, 100, 50)
	
	--Display Texts 
	titleText = display.newText("Title", 60, 50, native.systemFont, 30)
	titleText:setTextColor(0,3,4)
	startText = display.newText("Start", 100, 200, native.systemFont, 40)
	startText:setTextColor(0,3,4)
	quitText = display.newText("Quit", 100, 280, native.systemFont, 30)
	quitText:setTextColor(0,3,4)
	
	--[[
	--Press Events for the widgets buttons 
	buttonStartPress = function( event ) 
	storyboard.gotoScene( "scene1", "fade", 500  )
		return true
	end
	

	-- When button is release it will go to scene1
	buttonQuitPress = function( event )
		if event.phase == "ended" then
		    os.exit()
			return true
		end

	
	end
	--]]
	
	--here I am going to test a button
	buttonStart = startRect
	buttonStart = startText

function buttonStart:tap(event)
local button2 = storyboard.gotoScene( "scene1", "fade", 500  )

end

buttonStart:addEventListener("tap", buttonStart)

	buttonQuit = quitRect
	buttonQuit = quitText

function buttonQuit:tap(event)
local button3 = os.exit()
local button3 = native.requestExit()

end

buttonQuit:addEventListener("tap", buttonQuit)
--[[
	--Widgets Buttons
	
	buttonStart = widget.newButton
	{
	defaultFile = "startRect",
	emboss = true,
	onPress = buttonStartPress,
	}

	-- the position of the buttons
	buttonStart.x = 100; buttonStart.y = 200
	--
	buttonQuit = widget.newButton
	{
	defaultFile = "quitRect",
	emboss = true,
	onPress = buttonQuitPress,
	}

	-- the position of the buttons
	buttonQuit.x = 100; buttonQuit.y = 280
--]]

	--Group insert 
	group:insert( mainRect)
	group:insert( startRect)
	group:insert( quitRect)
	group:insert( titleText)
	group:insert( startText)
	group:insert( quitText)
	--group:insert( buttonStartPress)
	--group:insert( buttonQuitPress)
	group:insert( buttonStart)
	group:insert( buttonQuit)

	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	-- remove previous scene's view
	storyboard.purgeScene( "main" )
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