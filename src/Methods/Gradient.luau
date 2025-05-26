local PackageRoot = script.Parent.Parent
local Utils = PackageRoot.Utils
local Transformers = PackageRoot.Transformers

local MapValue = require(Utils.MapValue)
local toColorSeq = require(Transformers.toColorSeq)
local toNumSeq = require(Transformers.toNumSeq)
local toVec2 = require(Transformers.toVec2)
local Types = require(PackageRoot.Types)

type GradientProps = {
	Enabled: Types.CanBeValue<boolean>?,
	Color: Types.CanBeValue<Types.ColorSeqOptions>?,
	Transparency: Types.CanBeValue<Types.NumberSeqOptions>?,
	Rotation: Types.CanBeValue<number>?,
	Offset: Types.CanBeValue<Types.Vector2Options>?,
}

return function(scope: Types.Scope, props: GradientProps)
	return scope:New("UIGradient")({
		Enabled = props.Enabled,
		Color = MapValue(scope, props.Color, toColorSeq),
		Transparency = MapValue(scope, props.Transparency, toNumSeq),
		Rotation = props.Rotation,
		Offset = MapValue(scope, props.Rotation, toVec2),
	})
end
