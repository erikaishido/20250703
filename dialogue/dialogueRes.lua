local dialogueRes = {}

local allDialogues = {
    dialogue1 = {
        "my old swiss army knife",
        "stem cells, nothing is direct",
        "everything is love,\neverything is love",
        "take the leap,\nwelcome to the plant cell bath"
    },
    dialogue2 = {
        mode = "cut",
        "hell yeah a cutin",
        "this is a really cool cutin"
    },
    dialogue3 = {
        mode = "cut",
        "npc: im at a payphone",
        "player: tying to call home",
        "npc: all of my change ive spent on you"
    }
}

-----------------------getters & setters------------------------------

function dialogueRes.getDialogue(key)
    dialogue = allDialogues[key]
    return dialogue
end

return dialogueRes