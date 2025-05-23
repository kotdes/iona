local PackageRoot = script.Parent.Parent
local Utils = PackageRoot.Utils
local Packages = PackageRoot.Parent

local Types = require(PackageRoot.Types)
local IsThisAValue = require(Utils.IsThisAValue)
local Fusion = require(Packages.Fusion)

type Padding = Types.CanBeValue<UDim | number>?
type Paddings = { [number]: Padding }

local function wrapPaddingValue(scope: Fusion.Scope<typeof(Fusion)>, paddingValue: Fusion.Value<UDim | number>): Fusion.Computed<UDim>
	local compute = scope:Computed(function(peek)
		local value = peek(paddingValue)
		if typeof(value) == "number" then
			return UDim.new(0, value)
		end

		return value
	end)

	return compute
end

-- Padding can exist in multiple forms...
-- 1. A single state/value (UDim | number or being wrapped in a state) 
-- 2. A table of states/values (up to 4, but can be less)
-- 3. A state/value that is a table of states/values (up to 4, but can be less)

-- In general, this function will process the above forms and turn into a UIPadding with the correct properties name (i.e. PaddingTop, etc)
-- In situations where the table was passed in with less than 4 values, it'll follow the CSS convention, i.e. 2 values will be treated as top/bottom and left/right, 3 values will be treated as top/bottom and left/right, and the last value will be ignored.
-- 4 values will be treated as top, right, bottom, left.
-- 1 value will be treated as top, right, bottom, left.
-- 0 values will be treated as 0, 0, 0, 0.

-- Example:
-- 1. 15 or UDim.new(0, 15)
-- 2. { 15, 20 } or { UDim.new(0, 15), UDim.new(0, 20) }
-- 3. { 15, 20, 25 } or { UDim.new(0, 15), UDim.new(0, 20), UDim.new(0, 25) }
-- 4. { 15, 20, 25, 30 } or { UDim.new(0, 15), UDim.new(0, 20), UDim.new(0, 25), UDim.new(0, 30) }
-- 5. scoped:Value(15) or scoped:Value({ 15, 20 }) or scoped:Value({ 15, 20, 25 }) or scoped:Value({ 15, 20, 25, 30 })


return function(scope: Fusion.Scope<typeof(Fusion)>, props: Padding | Paddings)
	local processedProps = {}

	return scope:New("UIPadding")(processedProps)
end
