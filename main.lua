-- global modules
stateStack = require("state/stateStack")
textbox = require("dialogue/textbox")
portrait = require("ui/portrait")
util = require("util")
actions = require("ui/actions")
cutin = require("dialogue/cutin")

----------------------booting the bad boy up--------------------------

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    font1 = love.graphics.newImageFont("res/font/font1.png",
        " abcdefghijklmnopqrstuvwxyz" ..
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
        "123456789.,!?-+/():;*…▷"
    )
    font1:setLineHeight(1.4)

    stateStack.load()
    portrait.load()
    actions.load()
    cutin.load()
    stateStack.push(excelState)
end

-----------------------------game loop--------------------------------

function love.mousepressed(x, y, button)
    if button ~= 1 then    --block out non-left clicks
        return
    end
    stateStack.mousePressed(x,y)
end

function love.update(dt)
    local xmouse, ymouse = love.mouse.getPosition()
    stateStack.update(dt, xmouse, ymouse)
end

function love.draw()
    love.graphics.setFont(font1)
    love.graphics.scale(2) --do i really need this in draw

    stateStack.draw()

    --love.graphics.print("…I don't even want to be here.\nNo, not really.", 100, 100)
end

-----------------------getters & setters------------------------------

