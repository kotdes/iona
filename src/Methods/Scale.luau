local PackageRoot = script.Parent.Parent

local Types = require(PackageRoot.Types)

return function(scope: Types.Scope, scale: Types.CanBeValue<number>)
	return scope:New("UIScale")({
		Scale = scale
	})
end
