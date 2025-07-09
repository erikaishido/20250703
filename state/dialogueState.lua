local dialogueState = {}
local dialogueRes = require("dialogueRes")

local dialogue = {}
local currentIndex = 1
local mode = "textbox"

--------------------------enter/exit---------------------------

function dialogueState.enter()
    local key = "dialogue2"
    dialogue = dialogueRes.getDialogue(key)

    if dialogue["cutin"] == true then
        mode = "cutin"
    else
        mode = "textbox"
    end
    currentIndex = 1
    dialogueState.printCurrentLine()
end

function dialogueState.exit()
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
    if mode == "textbox" then
        textbox.update(dt)
    elseif mode == "cutin" then
        cutin.update()
    end
end

function dialogueState.draw()
    if mode == "textbox" then
        textbox.draw()
    elseif mode == "cutin" then
        cutin.draw()
    end
end

------------------------core functions-------------------------

function dialogueState.printCurrentLine()
    if mode == "textbox" then
        textbox.beginTyping(dialogue[currentIndex])
    elseif mode == "cutin" then
        cutin.print(dialogue[currentIndex])
    end
    currentIndex = currentIndex + 1
end

--------------------------debug idk----------------------------

function dialogueState.getName()
    return "dialogueState"
end

return dialogueState