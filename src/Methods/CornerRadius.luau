local PackageRoot = script.Parent.Parent
local Utils = PackageRoot.Utils

local IsThisAValue = require(Utils.IsThisAValue)
local ToUDim = require(Utils.ToUDim)
local Types = require(PackageRoot.Types)

return function(scope: Types.Scope, radius: Types.CanBeValue<number | UDim>)
	return scope:New("UICorner") {
        CornerRadius = scope:Computed(function(peek)
            local value = peek(radius)
            if IsThisAValue(value) then
                return peek(value)
            end
            return ToUDim(value)
        end),
	}
end
