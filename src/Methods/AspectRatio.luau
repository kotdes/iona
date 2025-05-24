local PackageRoot = script.Parent.Parent

local Types = require(PackageRoot.Types)

type AspectRatioProps = {
	Ratio: Types.CanBeValue<number>?,
	Type: Types.CanBeValue<Enum.AspectType>?,
	Axis: Types.CanBeValue<Enum.DominantAxis>?,
}

return function(scope: Types.Scope, props: AspectRatioProps)
	return scope:New("UIAspectRatioConstraint") {
		AspectRatio = props.Ratio,
		AspectType = props.Type,
		DominantAxis = props.Axis,
	}
end
