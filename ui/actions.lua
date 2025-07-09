local actions = {}

-- display variables
local xorigin = 240
local yorigin = 30
local yspacing = 20

local acts = {}
local day0 = {
    {"Take a walk", "(Some outside air sounds nice.)", hover=false, x=nil, y=nil, w=nil, h=nil},
    {"Cook together", "(I feel like we haven't cooked\ntogether in a while...)", hover=false, x=nil, y=nil, w=nil, h=nil}
}

function actions.load()
    acts = day0
    --fill in rect values
    for i=1, #acts do
        acts[i].x = xorigin
        acts[i].y = yorigin + (i-1)*yspacing
        acts[i].w, acts[i].h = util.getTextDimensions(acts[i][1])
    end
end

-----------------------------game loop--------------------------------

function actions.mousePressed(x, y)
end

function actions.update(xmouse, ymouse)
    for i=1, #acts do
        if acts[i].hover == false then
            if util.mouseIsWithinRect(xmouse, ymouse, acts[i].x, acts[i].y, acts[i].w, acts[i].h) == true then
                acts[i].hover = true
                textbox.setDisplayText(acts[i][2])
            end
        elseif acts[i].hover == true then
            if util.mouseIsWithinRect(xmouse, ymouse, acts[i].x, acts[i].y, acts[i].w, acts[i].h) == false then
                acts[i].hover = false
                textbox.setDisplayText("")
            end
        end
    end
end

function actions.draw()
    for i=1, #acts do
        if acts[i].hover == true then
            love.graphics.setColor(255, 0, 255)
            love.graphics.print(acts[i][1], xorigin, (yorigin + (i-1)*yspacing))
            love.graphics.setColor(255, 255, 255)
        else
            love.graphics.print(acts[i][1], xorigin, (yorigin + (i-1)*yspacing))
        end
    end
end

return actions