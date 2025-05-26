local Transformers = script.Parent
local PackageRoot = Transformers.Parent

local Types = require(PackageRoot.Types)

local function toNumSeq(props: Types.NumberSeqOptions): NumberSequence
	if typeof(props) == "number" then
		return NumberSequence.new(props)
	elseif typeof(props) == "table" and typeof(props.From) == "number" and typeof(props.To) == "number" then
		return NumberSequence.new({ NumberSequenceKeypoint.new(0, props.From), NumberSequenceKeypoint.new(1, props.To) })
	elseif typeof(props) == "NumberSequence" then
		return props
	else
		error("Invalid datatype for NumberSequence: " .. typeof(props))
	end
end

return toNumSeq