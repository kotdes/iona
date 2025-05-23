local Packages = script.Parent

local Fusion = require(Packages.Fusion)
local Methods = require(script.Methods)

local Children = Fusion.Children

type Properties = {
	[Fusion.SpecialKey | string]: any,
}

local function main(scope: Fusion.Scope<typeof(Fusion)>, obj: Instance, props: Properties): Instance
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

local function onInvoke(scope: Fusion.Scope<typeof(Fusion)>, obj: Instance)
	return function(props: Properties)
		return main(scope, obj, props)
	end
end

return table.freeze {
	ionaVersion = { major = 0, minor = 1, isRelease = true },
	Wrap = onInvoke,
}
