local Packages = script.Parent

local Fusion = require(Packages.Fusion)
local Methods = require(script.Methods)
local Types = require(script.Types)

local Children = Fusion.Children

type Properties = {
	[Fusion.SpecialKey | string]: any,
}
type CreateInstanceWithProps = (props: Properties) -> Instance

local Iona = {
	ionaVersion = { major = 0, minor = 1, isRelease = true },
} :: {
	ionaVersion: { major: number, minor: number, isRelease: boolean },
	Wrap: (scope: Types.Scope, obj: Instance) -> CreateInstanceWithProps,
	Wew: (scope: Types.Scope, className: string) -> CreateInstanceWithProps
}

function Iona.Wrap(scope, obj)
	return function(props: Properties)
		local ionaChildren = {}
		for index, value in props do
			if Methods[index] then
				table.insert(ionaChildren, Methods[index](scope, value))
				props[index] = nil
			end
		end

		if props[Children] then
			table.insert(props[Children], ionaChildren)
		else
			props[Children] = ionaChildren
		end

		return scope:Hydrate(obj)(props)
	end
end

function Iona.Wew(scope, className)
	return Iona.Wrap(scope, scope:New(className)({}))
end

return table.freeze(Iona)
