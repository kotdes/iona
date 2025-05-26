local PackageRoot = script.Parent.Parent

local Types = require(PackageRoot.Types)

return function(scope: Types.Scope, props: Types.AspectRatioProps)
	return scope:New("UIAspectRatioConstraint") {
		AspectRatio = props.Ratio,
		AspectType = props.Type,
		DominantAxis = props.Axis,
	}
end
