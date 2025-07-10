local cutin = {}

local displayText = "default cutin text"
local wrect = 200         -- slanted rectangle dimensions
local hrect = 80
local portrait1 = {
    image = nil,
    x = -40,
    y = 150
}
local portrait2 = {
    image = nil,
    x = 260,
    y = 25
}

-- textbox dimensions
local xtext = 105
local ytext = 120
local wtext = 200
local htext = 60

function cutin.load()
    portrait1.image = love.graphics.newImage("res/portrait/portrait1.png")
    portrait2.image = love.graphics.newImage("res/portrait/portrait2.png")
    print("test")
end

-----------------------------game loop--------------------------------

function cutin.update(dt)
    textbox.update(dt)
end

function cutin.draw()
    -- draw portrait1
    love.graphics.setColor(183/255, 196/255, 215/255)
    util.slantRect(portrait1.x, portrait1.y, wrect, hrect)
    love.graphics.draw(portrait1.image, portrait1.x+130, portrait1.y-20, 0, -1, 1)

    -- draw portrait2
    love.graphics.setColor(224/255, 209/255, 236/255)
    util.slantRect(portrait2.x, portrait2.y, wrect, hrect)
    love.graphics.draw(portrait2.image, portrait2.x+10, portrait2.y-20)

--[[     -- draw textbox
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", xtext-16, ytext-20, wtext, htext)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("line", xtext-16, ytext-20, wtext, htext)
    love.graphics.print(displayText, xtext, ytext) ]]
    textbox.draw()

end

----------------------------------------------------------------------

function cutin.print(text)
    --displayText = text
    textbox.print(text)
end

function cutin.bump()
    local portrait = portrait1
    local xorigin = portrait.x
    local yorigin = portrait.y
    
end

----------------------------------------------------------------------



return cutin