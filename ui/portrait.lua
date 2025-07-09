local portrait = {}

local xorigin = 10
local yorigin = 135

function portrait.load()
    portrait.image = love.graphics.newImage("res/portrait/portrait1.png")
end

-----------------------------game loop--------------------------------

function portrait.mousePressed(x, y)
    if util.mouseIsWithinRect(x, y, xorigin, yorigin, portrait.image:getDimensions()) == true then
        --textbox.setDisplayText("clicked within portrait bounds")
        stateStack.push(dialogueState)
    end
end

function portrait.draw()
    love.graphics.draw(portrait.image, xorigin, yorigin)
end

-----------------------getters & setters------------------------------

return portrait