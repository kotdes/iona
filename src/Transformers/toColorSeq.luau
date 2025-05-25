type ColorSequenceOptions = ColorSequence | Color3 | { From: Color3, To: Color3 }

local function toColorSeq(props: ColorSequenceOptions): ColorSequence
	if typeof(props) == "Color3" then
		return ColorSequence.new(props)
	elseif typeof(props) == "table" and typeof(props.From) == "Color3" and typeof(props.To) == "Color3" then
		return ColorSequence.new({ ColorSequenceKeypoint.new(0, props.From), ColorSequenceKeypoint.new(1, props.To) })
	elseif typeof(props) == "ColorSequence" then
		return props
	else
		error("Invalid datatype for ColorSequence: " .. typeof(props))
	end
end

return toColorSeq