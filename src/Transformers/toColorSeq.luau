local Transformers = script.Parent
local PackageRoot = Transformers.Parent

local toColor3 = require(Transformers.toColor3)
local Types = require(PackageRoot.Types)

local function toColorSeq(props: Types.ColorSeqOptions): ColorSequence
	if typeof(props) == "ColorSequence" then
		return props
	elseif typeof(props) == "table" and props.From and props.To then -- @_@ How should I make the type solver trust me
		return ColorSequence.new(toColor3(props.From), toColor3(props.To))
	elseif typeof(props) == ("table" or "string" or "Color3") then
		return ColorSequence.new(toColor3(props))
	end

	error("Invalid datatype for ColorSequence: " .. typeof(props))
end

return toColorSeq
