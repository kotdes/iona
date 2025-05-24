local PackageRoot = script.Parent.Parent
local Utils = PackageRoot.Utils

local IsThisAValue = require(Utils.IsThisAValue)
local ToUDim = require(Utils.ToUDim)
local Types = require(PackageRoot.Types)

return function(scope: Types.Scope, radius: Types.CanBeValue<UDim | number>)
	return scope:New("UICorner")({
		CornerRadius = if IsThisAValue(radius) then
                scope:Computed(function(peek)
                    local value = peek(radius)
                    return ToUDim(value)
                end)
			else
                ToUDim(radius),
	})
end
