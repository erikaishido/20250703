local dialogueState = {}

local dialogue = {
    "my old swiss army knife",
    "stem cells, nothing is direct",
    "everything is love,\neverything is love",
    "take the leap,\nwelcome to the plant cell bath"
}
local currentIndex = 1

--------------------------enter/exit---------------------------

function dialogueState.enter()
    currentIndex = 1
    dialogueState.printCurrentLine()
end

function dialogueState.exit()
    --textbox.setDisplayText("")
    cutin.print("")
    stateStack.pop()
end

-------------------------game loop-----------------------------

function dialogueState.mousePressed(x, y)
    if textbox.getIsTyping() == true then
        return
    elseif currentIndex > #dialogue then
        dialogueState.exit()
    else
        dialogueState.printCurrentLine()
    end
end

function dialogueState.update(dt, xmouse, ymouse)
    --textbox.update(dt)
    cutin.update()
end

function dialogueState.draw()
    --textbox.draw()
    cutin.draw()
end

------------------------core functions-------------------------

function dialogueState.printCurrentLine()
    --textbox.beginTyping(dialogue[currentIndex])
    cutin.print(dialogue[currentIndex])
    currentIndex = currentIndex + 1
end

--------------------------debug idk----------------------------

function dialogueState.getName()
    return "dialogueState"
end

return dialogueState