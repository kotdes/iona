type Vector2Options = number | Vector2 | { X: number, Y: number }

local function toVec2(value: Vector2Options): Vector2
	if typeof(value) == "number" then
		return Vector2.new(value, value)
    elseif typeof(value) == "table" then
        return Vector2.new(value.X or 0, value.Y or 0)
	else
		return value
	end
end

return toVec2