# `Iona.Wew(scope: Types.Scope, className: string): CreateInstanceWithProps`

Combines [`Fusion.New`](https://elttob.uk/Fusion/0.3/api-reference/roblox/members/new/) and [`Iona.Wrap`](./wrap.md) into a single helper. Creates a new [`Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance) of the given `className` and returns a constructor that supports [Iona-style modifiers](../transformers/index.md).

## Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| `scope` | [`Types.Scope`]((../types.md#Scope)) | A scope dictionary containing Fusion (i.e. `Fusion.scoped(Fusion)`). |
| `className` | [`string`](https://create.roblox.com/docs/luau/strings) | The name of the Roblox instance to be create. |

## Returns

A [function](../types.md#CreateInstanceWithProps) that accepts a [props](../types.md#CreateInstanceWithProps) table and returns a hydrated [`Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance) with Iona modifiers applied.

## Usage

```luau
local TextLabel = Iona.Wew(scope, "TextLabel")

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
