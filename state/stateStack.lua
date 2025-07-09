local stateStack = {}

-- ye olde stack
local stack = {}

function stateStack.load()
    homeState = require("state/homeState")      -- they all global
    excelState = require("state/excelState")
    dialogueState = require("state/dialogueState")
end

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