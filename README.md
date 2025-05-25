
# Iona

Declarative UI modifiers for Fusion, creating UI just like how you do with SwiftUI (and more)

## About

**Iona** extends Roblox's base UI classes for Fusion by integrating layout constraints and visual modifiers directly into the component API. This eliminates the need to manually create and parent separate constraint instances, streamlining the UI building process and making code more expressive and declarative. This kind of design is seen in libraries elsewhere such as SwiftUI, where there's no need to create a new object to add in Padding or CornerRadius like in Roblox:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, Iona!")
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
            .shadow(radius: 5)
    }
}
```

With Iona, most of the above are possible because it is doing all those annoying steps for you in background, creating a Chip component with a TextLabel is within a few lines, fewer than how it was done traditionally. The expansive design of Iona also allows creating classes quick by adding new methods. On top of that, also supporting state objects such as Fusion.Value, Fusion.Spring, Fusion.Computed and more.

## Example

Iona features two methods -- **Wrap** and **Wew** (Abbreivation of Wrap & New), with latter being a method combining both Scope:New and Wrap together. (i.e. `scope:Wew "TextLabel" { ... }`)

```lua
local padding = scope:Value(5) -- 5px in state
Scope:Wrap(Scope:New "TextLabel" {})({
  Text = "Hello Iona!",
  BackgroundColor3 = Color3.new(1, 1, 0),
  TextColor3 = Color3.new(1, 1, 1),
  AutomaticSize = Enum.AutomaticSize.XY,
  Padding = { padding } -- equals to p-[5px], you can also do smth like how you do in CSS, i.e. { 5, 10 }, which would be 5 X and 10 Y.
})
```
