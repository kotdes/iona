local Transformers = script.Parent
local PackageRoot = Transformers.Parent

local Types = require(PackageRoot.Types)

local function toUDim(props: Types.UDimOptions): UDim
	if typeof(props) == "number" then
		return UDim.new(0, props)
	else
		return props
	end
end

return toUDim