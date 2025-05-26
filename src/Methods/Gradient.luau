local PackageRoot = script.Parent.Parent
local Utils = PackageRoot.Utils
local Transformers = PackageRoot.Transformers

local MapValue = require(Utils.MapValue)
local toColorSeq = require(Transformers.toColorSeq)
local toNumSeq = require(Transformers.toNumSeq)
local toVec2 = require(Transformers.toVec2)
local Types = require(PackageRoot.Types)

return function(scope: Types.Scope, props: Types.GradientProps)
	return scope:New("UIGradient")({
		Enabled = props.Enabled,
		Color = MapValue(scope, props.Color, toColorSeq),
		Transparency = MapValue(scope, props.Transparency, toNumSeq),
		Rotation = props.Rotation,
		Offset = MapValue(scope, props.Rotation, toVec2),
	})
end
