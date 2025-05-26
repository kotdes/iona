local PackageRoot = script.Parent
local Packages = PackageRoot.Parent
local Fusion = require(Packages.Fusion)

-- Utils & Generics
export type CanBeValue<T> = T | Fusion.Value<T>
export type Scope = Fusion.Scope<typeof(Fusion)>

-- Transformers
export type Color3Options = Color3 | string | { number }
export type ColorSeqOptions = ColorSequence | { From: Color3Options, To: Color3Options } | Color3Options
export type NumberSeqOptions = NumberSequence | number | { From: number, To: number }
export type Vector2Options = number | Vector2 | { number }
export type UDimOptions = UDim | number

-- Methods
export type GradientProps = {
	Enabled: CanBeValue<boolean>?,
	Color: CanBeValue<ColorSeqOptions>?,
	Transparency: CanBeValue<NumberSeqOptions>?,
	Rotation: CanBeValue<number>?,
	Offset: CanBeValue<Vector2Options>?,
}

export type OutlineProps = {
    Mode: CanBeValue<Enum.ApplyStrokeMode>?,
    JoinMode: CanBeValue<Enum.LineJoinMode>?,
    Color: CanBeValue<Color3Options>?,
    Gradient: GradientProps?,
    Enabled: CanBeValue<boolean>?,
    Thickness: CanBeValue<number>?,
    Transparency: CanBeValue<number>?,
}

export type AspectRatioProps = {
	Ratio: CanBeValue<number>?,
	Type: CanBeValue<Enum.AspectType>?,
	Axis: CanBeValue<Enum.DominantAxis>?,
}

type Padding = CanBeValue<number | UDim>
type Paddings = { [number]: Padding }
export type PaddingProps = Padding | Paddings | nil


return {}
