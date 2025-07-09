local cutin = {}
-- essentially a more specialized sister of textbox

local displayText = "default text"
-- portrait dimentions
local wporRect = 200
local hporRect = 80
local portrait1 = love.graphics.newImage("res/portrait/portrait1.png")
local xpor1 = -40      -- origin for portrait 1
local ypor1 = 150
local portrait2 = love.graphics.newImage("res/portrait/portrait2.png")
local xpor2 = 260        -- origin for portrait 2
local ypor2 = 25
-- textbox dimensions
local xtext = 105
local ytext = 120
local wtext = 200
local htext = 60

function cutin.load()
    cutin.por1 = love.graphics.newImage("res/portrait/portrait1.png")
    cutin.por2 = love.graphics.newImage("res/portrait/portrait2.png")
end

-----------------------------game loop--------------------------------

function cutin.update(dt)
end

function cutin.draw(dt)
    -- draw portrait1
    love.graphics.setColor(183/255, 196/255, 215/255)
    cutin.slantedRect(xpor1, ypor1, wporRect, hporRect)
    love.graphics.draw(cutin.por1, xpor1+130, ypor1-20, 0, -1, 1)

    -- draw portrait2
    love.graphics.setColor(224/255, 209/255, 236/255)
    cutin.slantedRect(xpor2, ypor2, wporRect, hporRect)
    love.graphics.draw(cutin.por2, xpor2+10, ypor2-20)

    -- draw textbox
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", xtext-16, ytext-20, wtext, htext)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("line", xtext-16, ytext-20, wtext, htext)
    love.graphics.print(displayText, xtext, ytext)

end

----------------------------------------------------------------------

function cutin.slantedRect(x, y, width, height)
    for i = 0, height-1, 2 do
        love.graphics.rectangle('fill', x-i/2, y+i, width , 2)
    end
    love.graphics.setColor(255, 255, 255)
end

function cutin.print(text)
    displayText = text
end

return cutin