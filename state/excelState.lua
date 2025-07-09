local excelState = {}

-------------------------game loop-----------------------------

function excelState.mousePressed(x, y)
    stateStack.push(dialogueState)
end

function excelState.update(dt, xmouse, ymouse)
end

function excelState.draw()
    --love.graphics.rectangle("line", 30, 30, 280, 120)
    --love.graphics.print("insert soulless excel minigame here", 60, 90)
end

---------------------------------------------------------------

function excelState.enter()
end

function excelState.exit()
end

--------------------------debug idk----------------------------

function excelState.getName()
    return "excelState"
end

return excelState