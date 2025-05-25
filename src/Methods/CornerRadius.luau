local PackageRoot = script.Parent.Parent
local Utils = PackageRoot.Utils
local Transformers = PackageRoot.Transformers

local Types = require(PackageRoot.Types)
local MapValue = require(Utils.MapValue)
local toUDim = require(Transformers.toUDim)

return function(scope: Types.Scope, radius: Types.CanBeValue<UDim | number>)
	return scope:New("UICorner")({
		CornerRadius = MapValue(scope, radius, toUDim)
	})
end
