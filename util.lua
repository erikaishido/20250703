local util = {}

util.scale = 2 --need a better way to store this

function util.mouseIsWithinRect(xmouse, ymouse, rectx, recty, w, h)
    if xmouse < (rectx * util.scale) or xmouse > ((rectx + w) * util.scale) then
        return false
    end
    if ymouse < (recty * util.scale) or ymouse > ((recty + h) * util.scale) then
        return false
    end
    return true
end

function util.getTextDimensions(text)
    local width = font1:getWidth(text)
    local height = font1:getHeight()
    return width, height
end

return util