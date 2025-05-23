-- omg please just kill me THIS IS SO COMPLICATED
-- AGGGHGHGHGH I STILL HAVENT GOT THE TYPES PROPERLY DONE YET HELP
-- ME OUT.

-- IONA IS SUPPOSED TO BE A WRAPPER TO ABSTRACT UI CONSTRAINTS AND MODIFIERS
-- THIS IS BECOMING CSS.... dear lord.

local PackageRoot = script.Parent.Parent
local Utils = PackageRoot.Utils
local Packages = PackageRoot.Parent

local Types = require(PackageRoot.Types)
local IsThisAValue = require(Utils.IsThisAValue)

-- Utility: normalize any number|UDim into a UDim
local function wrapPaddingValue(scope, paddingValue)
    return scope:Computed(function(peek)
        local value = peek(paddingValue)
        if typeof(value) == "number" then
            return UDim.new(0, value)
        end
        return value
    end)
end

-- Helper to pick the correct padding from a list following CSS shorthand rules
local function getValueAt(vals, index)
    local count = #vals
    if count == 0 then
        return 0
    elseif count == 1 then
        return vals[1]
    elseif count == 2 then
        -- top/bottom = vals[1], left/right = vals[2]
        if index == 1 or index == 3 then
            return vals[1]
        else
            return vals[2]
        end
    elseif count == 3 then
        -- top = vals[1], left/right = vals[2], bottom = vals[3]
        if index == 1 then
            return vals[1]
        elseif index == 2 or index == 4 then
            return vals[2]
        else -- index == 3
            return vals[3]
        end
    else
        -- 4 or more: top, right, bottom, left
        return vals[index]
    end
end

-- Main export: process padding prop into UIPadding props
return function(scope, props)
    -- Wrap props into a Fusion.Value if it's a raw table, or leave if already a Value
    local padState
    if IsThisAValue(props) then
        padState = props
    elseif type(props) == "table" then
        padState = scope:Value(props)
    else
        -- single number or UDim, wrap into a 1-element list
        padState = scope:Value({ props })
    end

    -- Build computed UDim values for each side
    local sides = { "PaddingTop", "PaddingRight", "PaddingBottom", "PaddingLeft" }
    local processedProps = {}
    for i, sideName in ipairs(sides) do
        processedProps[sideName] = wrapPaddingValue(
            scope,
            scope:Computed(function(peek)
                local vals = peek(padState) or {}
                local raw = getValueAt(vals, i)
                return raw
            end)
        )
    end

    return scope:New("UIPadding")(processedProps)
end
