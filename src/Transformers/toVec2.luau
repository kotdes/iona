local Transformers = script.Parent
local PackageRoot = Transformers.Parent

local Types = require(PackageRoot.Types)

local function toVec2(props: Types.Vector2Options): Vector2
	if typeof(props) == "number" then
		return Vector2.new(props, props)
    elseif typeof(props) == "table" and #props == 2 then
        return Vector2.new(props[1], props[2])
	elseif typeof(props) == "Vector2" then
		return props
	end

	error("Invalid datatype for Vector2: " .. typeof(props))
end

return toVec2