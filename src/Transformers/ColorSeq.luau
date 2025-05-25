type ColorSequenceOptions = ColorSequence | Color3 | { From: Color3, To: Color3 }

local function toColorSequence(color: ColorSequenceOptions): ColorSequence
	if typeof(color) == "Color3" then
		return ColorSequence.new(color)
	elseif typeof(color) == "table" and typeof(color.From) == "Color3" and typeof(color.To) == "Color3" then
		return ColorSequence.new({ ColorSequenceKeypoint.new(0, color.From), ColorSequenceKeypoint.new(1, color.To) })
	elseif typeof(color) == "ColorSequence" then
		return color
	else
		error("Invalid color type for Gradient: " .. typeof(color))
	end
end

return toColorSequence