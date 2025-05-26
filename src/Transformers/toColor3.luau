-- This is a really dumb idea, but it does help a bit in terms of convenience.

type Color3Options = Color3 | string | { number }

local function toColor3(props: Color3Options): Color3
    if typeof(props) == "Color3" then
        return props
    elseif typeof(props) == "string" then
        return Color3.fromHex(props)
    elseif typeof(props) == "table" and #props == 3 then
        return Color3.fromRGB(props[1], props[2], props[3])
    end

    error("Invalid datatype for Color3: " .. typeof(props))
end

return toColor3