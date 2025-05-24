local PackageRoot = script.Parent.Parent
local Utils = PackageRoot.Utils
local Packages = PackageRoot.Parent

local Fusion = require(Packages.Fusion)
local Types = require(PackageRoot.Types)
local IsThisAValue = require(Utils.IsThisAValue)

type Padding = Types.CanBeValue<number | UDim>
type Paddings = { [number]: Padding }
type PaddingProps = Padding | Paddings | nil

local SIDES = { "Top", "Right", "Bottom", "Left" }

local function toState(scope: Types.Scope, val: Types.CanBeValue<PaddingProps>): any -- idk how do i type this
	return IsThisAValue(val) and val or scope:Value(val)
end

local function normalize(v: { number }): { number }
	local n = #v
	if n == 0 then
		return { 0, 0, 0, 0 }
	end
	if n == 1 then
		return { v[1], v[1], v[1], v[1] }
	end
	if n == 2 then
		return { v[1], v[2], v[1], v[2] }
	end
	if n == 3 then
		return { v[1], v[2], v[3], v[2] }
	end
	return { v[1], v[2], v[3], v[4] }
end

local function toUDim(value: number): UDim
	if typeof(value) == "number" then
		return UDim.new(0, value)
	else
		return value
	end
end

return function(scope: Types.Scope, props: PaddingProps): Instance
	local state = toState(scope, props or {})
	local padding = scope:Computed(function(peek)
		local raw = peek(state)
		local vals = type(raw) == "table" and raw or { raw }
		local quad = normalize(vals)

		for index, value in quad do
			if IsThisAValue(value) then
				value = peek(value)
			end
			quad[index] = toUDim(value)
		end

		return quad
	end)
    local final = {}

	for index, side in SIDES do
		final["Padding" .. side] = scope:Computed(function(peek)
			return peek(padding)[index]
		end)
	end

	return scope:New("UIPadding")(final)
end
