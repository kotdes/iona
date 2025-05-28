local Packages = script.Parent

local Fusion = require(Packages.Fusion)
local Methods = require(script.Methods)
local Types = require(script.Types)

local Children = Fusion.Children

local Iona: Types.Iona
Iona = {
	ionaVersion = { major = 0, minor = 1, isRelease = true },
	Wrap = function(scope, applyTo)
		return function(props)
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

			return scope:Hydrate(applyTo)(props)
		end
	end,
	Wew = function(scope, className)
		return Iona.Wrap(scope, scope:New(className)({}))
	end,
}

return table.freeze(Iona)
