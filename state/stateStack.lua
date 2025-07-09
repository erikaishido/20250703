local stateStack = {}

-- states (global!!!!!?????? fucked up man)
-- each "state" is just a group of functions w/ identical names
homeState = require("state/homeState")
excelState = require("state/excelState")
dialogueState = require("state/dialogueState")

-- ye olde stack
local stack = {}

-----------------------------game loop--------------------------------

function stateStack.mousePressed(x, y)
    stack[#stack].mousePressed(x, y)
end

function stateStack.update(dt, xmouse, ymouse)
    for i=1, #stack do
        stack[i].update(dt, xmouse, ymouse)
    end
end

function stateStack.draw()
    for i=1, #stack do
        stack[i].draw()
    end
    love.graphics.print(getEntireStack(), 5, 5)
end

------------------------stack manipulation----------------------------

function stateStack.push(newState, ...)
    table.insert(stack, newState)
    stack[#stack].enter()
end

function stateStack.pop()
    table.remove(stack, #stack)
end

function stateStack.top()
    return stack[#stack]
end

--------------------------debug idk----------------------------

function getEntireStack()
    stackForPrint = ""
    for i=1, #stack do
        thisStack = stack[i].getName()
        stackForPrint = stackForPrint .. " /" .. thisStack
    end
    return stackForPrint
end

return stateStack