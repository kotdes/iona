local Utils = script.Parent
local PackageRoot = Utils.Parent
local Packages = PackageRoot.Parent

local Fusion = require(Packages.Fusion)
local IsThisAValue = require(Utils.IsThisAValue)
local Types = require(PackageRoot.Types)

return function(scope: Types.Scope, value: Types.CanBeValue<any>, transformer: ((any) -> (any))?): Fusion.Computed<any> | any
    if IsThisAValue(value) then
        return scope:Computed(function(peek)
            local v = peek(value)
            return transformer and transformer(v) or v
        end)
    elseif value ~= nil then
        return transformer and transformer(value) or value
    else
        return nil
    end
end