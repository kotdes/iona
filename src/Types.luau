local PackageRoot = script.Parent
local Packages = PackageRoot.Parent
local Fusion = require(Packages.Fusion)

export type CanBeValue<T> = T | Fusion.Value<T>
export type Scope = Fusion.Scope<typeof(Fusion)>

return {}