local function toUDim(value: number): UDim
	if typeof(value) == "number" then
		return UDim.new(0, value)
	else
		return value
	end
end

return toUDim