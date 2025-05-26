local Transformers = script.Parent
local PackageRoot = Transformers.Parent

local toColor3 = require(Transformers.toColor3)
local Types = require(PackageRoot.Types)

local function toColorSeq(props: Types.ColorSeqOptions): ColorSequence
	elseif typeof(props) == "ColorSequence" then
		return props
	else
		error("Invalid datatype for ColorSequence: " .. typeof(props))
	end
end

return toColorSeq