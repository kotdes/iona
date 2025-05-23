local PackageRoot = script.Parent.Parent
local Packages = PackageRoot.Parent

local Types = require(PackageRoot.Types)
local Fusion = require(Packages.Fusion)

type AspectRatioProps = {
	Ratio: Types.CanBeValue<number>?,
	Type: Types.CanBeValue<Enum.AspectType>?,
	Axis: Types.CanBeValue<Enum.DominantAxis>?,
}

return function(scope: Fusion.Scope<typeof(Fusion)>, props: AspectRatioProps)
	return scope:New("UIAspectRatioConstraint") {
		AspectRatio = props.Ratio,
		AspectType = props.Type,
		DominantAxis = props.Axis,
	}
end
