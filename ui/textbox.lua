local textbox = {}

local isVisible = true
local xorigin = 125        -- dimentions
local yorigin = 150
local width = 240
local height = 60

-- for typing out characters
local isTyping = false
local displayText = "default text"
local textToChars = {}
local charIndex = 1
-- typing timer
local typeTimer = 0
local typeDuration = 0.03


--"(…I don't even want to be here.\nNo, not really.)"

-----------------------------game loop--------------------------------

function textbox.update(dt)
    if isTyping == true then
        typeTimer = typeTimer - dt
        if typeTimer < 0 then
            typeChars()
            typeTimer = typeDuration
        end
    end
end

function textbox.draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", xorigin-16, yorigin-20, width, height)
    love.graphics.setColor(255, 255, 255)

    love.graphics.rectangle("line", xorigin-16, yorigin-20, width, height)
    love.graphics.print(displayText, xorigin, yorigin)
end

----------------------------------------------------------------------

function textbox.beginTyping(text)
    displayText = ""
    textToChars = {}
    charIndex = 1
    for i=1, #text, 2 do
        chars = string.sub(text, i, i+1)
        table.insert(textToChars, chars)
    end
    isTyping = true
end

function typeChars()
    displayText = displayText .. textToChars[charIndex]
    if charIndex >= #textToChars then
        isTyping = false
    end
    charIndex = charIndex + 1
end

-----------------------getters & setters------------------------------

function textbox.setDisplayText(text)
    displayText = text
end

function textbox.getIsTyping()
    return isTyping
end

return textbox