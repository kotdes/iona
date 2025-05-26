local PackageRoot = script.Parent
local Packages = PackageRoot.Parent
local Fusion = require(Packages.Fusion)

export type CanBeValue<T> = T | Fusion.Value<T>
export type Scope = Fusion.Scope<typeof(Fusion)>

export type Color3Options = Color3 | string | { number }
export type ColorSeqOptions = ColorSequence | { From: Color3Options, To: Color3Options } | Color3Options
export type NumberSeqOptions = NumberSequence | number | { From: number, To: number }
export type Vector2Options = number | Vector2 | { number }
export type UDimOptions = UDim | number

return {}
