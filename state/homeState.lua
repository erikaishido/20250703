local homeState = {}

-------------------------game loop-----------------------------

function homeState.mousePressed(x, y)
    portrait.mousePressed(x, y)
end

function homeState.update(dt, xmouse, ymouse)
    actions.update(xmouse, ymouse)
end

function homeState.draw()
    textbox.draw()
    portrait.draw()
    actions.draw()
end

---------------------------------------------------------------

function homeState.enter()
end

function homeState.exit()
end

--------------------------debug idk----------------------------

function homeState.getName()
    return "homeState"
end

return homeState