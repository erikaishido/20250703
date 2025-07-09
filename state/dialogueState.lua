local dialogueState = {}
local dialogueRes = require("dialogueRes")

local dialogue = {}
local currentIndex = 1

local mode = "text"
local modes = {
    text = textbox,
    cut = cutin
}

--------------------------enter/exit---------------------------

function dialogueState.enter()
    local key = "dialogue2"     -- test
    dialogue = dialogueRes.getDialogue(key)

    if dialogue["cutin"] == true then
        mode = "cut"
    else
        mode = "text"
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
    modes[mode].update(dt)
end

function dialogueState.draw()
    modes[mode].draw()
end

------------------------core functions-------------------------

function dialogueState.printCurrentLine()
    modes[mode].print(dialogue[currentIndex])
    currentIndex = currentIndex + 1
end

--------------------------debug idk----------------------------

function dialogueState.getName()
    return "dialogueState"
end

return dialogueState