# `Iona.Wrap(scope: Types.Scope, applyTo: Instance): CreateInstanceWithProps`

Wraps a Fusion element constructor to support [Iona-style modifiers](../transformers/index.md). Converts specific keys in the [props](../types.md#CreateInstanceWithProps) table (e.g., `Padding`, `CornerRadius`, etc.) into child instances defined in Methods, and merges them into the `Children` of the element.

## Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| `scope` | [`Types.Scope`]((../types.md#Scope)) | A scope dictionary containing Fusion (i.e. `Fusion.scoped(Fusion)`). |
| `applyTo` | [`Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance) | A Roblox instance. |

## Returns

A [function](../types.md#CreateInstanceWithProps) that accepts a [props](../types.md#CreateInstanceWithProps) table and returns a hydrated [`Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance) with Iona modifiers applied.

## Usage

```luau
local TextLabel = Iona.Wrap(scope, scope:New("TextLabel")({}))

TextLabel({
    Text = "Hello, Iona!",
    CornerRadius = 8,
})
```

Equivalent to:

```luau
scope:New("TextLabel")({
    Text = "Hello, Iona!",
    [Children] = {
        scope:New("UICorner")({
            CornerRadius = UDim.new(0, 8),
        }),
    },
})
```
