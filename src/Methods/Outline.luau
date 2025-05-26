local PackageRoot = script.Parent.Parent
local Packages = PackageRoot.Parent
local Utils = PackageRoot.Utils
local Transformers = PackageRoot.Transformers
local Methods = PackageRoot.Methods

local Fusion = require(Packages.Fusion)
local Types = require(PackageRoot.Types)
local MapValue = require(Utils.MapValue)
local toColor3 = require(Transformers.toColor3)
local Gradient = require(Methods.Gradient)

local Children = Fusion.Children

return function(scope: Types.Scope, props: Types.OutlineProps)
	return scope:New("UIStroke")({
		ApplyStrokeMode = props.Mode,
		LineJoinMode = props.JoinMode,
		Color = MapValue(scope, props.Color, toColor3),
		Transparency = props.Transparency,
		Thickness = props.Thickness,
		Enabled = props.Enabled,

		[Children] = if props.Gradient then Gradient(scope, props.Gradient) else {}
	})
end
