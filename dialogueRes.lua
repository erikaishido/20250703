local dialogueRes = {}

local allDialogues = {
    dialogue1 = {
        "my old swiss army knife",
        "stem cells, nothing is direct",
        "everything is love,\neverything is love",
        "take the leap,\nwelcome to the plant cell bath"
    },
    dialogue2 = {
        cutin = true,
        mode = "cutin",
        "hell yeah a cutin"
    }
}

-----------------------getters & setters------------------------------

function dialogueRes.getDialogue(key)
    dialogue = allDialogues[key]
    return dialogue
end

return dialogueRes