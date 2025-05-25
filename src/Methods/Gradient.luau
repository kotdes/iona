local PackageRoot = script.Parent.Parent
local Utils = PackageRoot.Utils
local Transformers = PackageRoot.Transformers

local MapValue = require(Utils.MapValue)
local ColorSeq = require(Transformers.ColorSeq)
local Types = require(PackageRoot.Types)

type GradientColor = ColorSequence | Color3 | { From: Color3, To: Color3 }

type GradientProps = {
	Enabled: Types.CanBeValue<boolean>?,
	Color: Types.CanBeValue<GradientColor>?,
	Transparency: Types.CanBeValue<NumberSequence>?,
	Rotation: Types.CanBeValue<number>?,
	Offset: Types.CanBeValue<Vector2>?,
}


return function(scope: Types.Scope, props: GradientProps)
	return scope:New("UIGradient")({
		Enabled = props.Enabled,
		Color = MapValue(scope, props.Color, ColorSeq),
		Transparency = props.Transparency,
		Rotation = props.Rotation,
		Offset = props.Offset,
	})
end
