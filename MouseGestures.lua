--[[
Author: Mark van den Berg
Version: 0.8
Date: 01-05-2020

Special credits to https://github.com/wookiefriseur for showing a way to do this for windows gestures which inspired this script
For some windows gestures check https://github.com/wookiefriseur/LogitechMouseGestures

This script wil let you use a button on your mouse to act like the "Gesture button" from Logitech Options.
It will also let you use another button on your mouse for navigating between browser pages using gestures.
]]--

-- First Gesture Button
gb1 = 5;

-- Second Gesture Button
gb2 = 4;

-- The minimal horizontal/vertical distance your mouse needs to be moved for the gesture to recognize in pixels
minimalHorizontalMovement = 200;
minimalVerticalMovement = 200;

--Max movement for a click input, may require tuning
clickMovement = 10;

-- Default values for 
horizontalStartingPosistion = 0;
verticalStartingPosistion = 0;
horizontalEndingPosistion = 0;
verticalEndingPosistion = 0;

-- Delay between keypresses in milliseconds
delay = 20

-- Event detection
function OnEvent(event, arg, family)
    --Set 0,0 to this position
    if event == "MOUSE_BUTTON_PRESSED" and (arg == gb1 or arg == gb2) then
        -- Get stating mouse posistion
        horizontalStartingPosistion, verticalStartingPosistion = GetMousePosition()
    end

    --Set end position to here then run functions
    if event == "MOUSE_BUTTON_RELEASED" and (arg == gb1 or arg == gb2) then
        -- Get ending mouse posistion
        horizontalEndingPosistion, verticalEndingPosistion = GetMousePosition()
		
        -- Calculate differences between start and end posistions
        horizontalDifference = horizontalStartingPosistion - horizontalEndingPosistion
        verticalDifference = verticalStartingPosistion - verticalEndingPosistion
              
        -- Determine the direction of the mouse
        --If there's more horizontal movement than vertical movement, then execute. Otherwise, L58
        if math.abs(horizontalDifference) > math.abs(verticalDifference) then
            --Check that we've moved so little it's a click
            if math.abs(horizontalDifference) < clickMovement then
                gbclick(arg)
      
            --If it's too much movement to be a click, 
            else
                --then check for left movement
                if horizontalDifference > minimalHorizontalMovement then
                    mouseMovedLeft(arg)
                --or all other cases(right movement)
                else
                    mouseMovedRight(arg)
                end
            end
	
        --If anything else is true, then vertical < horizontal
        else
            --Check that we've moved so little it's a click
            if math.abs(verticalDifference) < clickMovement then
                gbclick(arg)
            
            --If it's too much movement to be a click,
            else
                --then check for down movement
                if verticalDifference < minimalVerticalMovement then
                    mouseMovedDown(arg)
                --or all other cases(up movement)
                else
                    mouseMovedUp(arg)
                end
            end
        end
    end
end

--Gesture Button Clicked
function gbclick(buttonNumber)
    OutputLogMessage("Gesture Button Clicked\n")
	
    if buttonNumber == gb1 then 
        OutputLogMessage("gb1\n")
    end
    if buttonNumber == gb2 then 
        OutputLogMessage("gb2\n")
    end

--4 directions of movement
function mouseMovedUp(buttonNumber)
    OutputLogMessage("mouseMovedUp\n")
	
    if buttonNumber == gb1 then 
        OutputLogMessage("gb1\n")
    end
    if buttonNumber == gb2 then 
        OutputLogMessage("gb2\n")
    end
end

function mouseMovedDown(buttonNumber)
    OutputLogMessage("mouseMovedDown\n")
	
    if buttonNumber == gb1 then 
        OutputLogMessage("gb1\n")
    end
    if buttonNumber == gb2 then 
        OutputLogMessage("gb2\n")
    end
end

function mouseMovedLeft(buttonNumber)
    OutputLogMessage("mouseMovedLeft\n")
	
    if buttonNumber == gb1 then 
        OutputLogMessage("gb1\n")
    end
    if buttonNumber == gb2 then 
        OutputLogMessage("gb2\n")
    end
end

function mouseMovedRight(buttonNumber)
    OutputLogMessage("mouseMovedRight\n")
	
    if buttonNumber == gb1 then 
        OutputLogMessage("gb1\n")
    end
    if buttonNumber == gb2 then 
        OutputLogMessage("gb2\n")
    end
end

-- Gesture Functions

-- Helper Functions
function pressTwoKeys(firstKey, secondKey)
  PressKey(firstKey)
  Sleep(delay)
  PressKey(secondKey)
  Sleep(delay)
  ReleaseKey(firstKey)
  ReleaseKey(secondKey)
end

end
