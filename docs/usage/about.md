# About Iona

The short description **"declarative UI modifiers"** can be a confusing term for most. This page will walk you through what Iona really is and how it can be used — with side-by-side examples from another language and how they translate into Iona, so you can better grasp the idea.

> **ℹ️ Quick Info**  
> While writing this documentation, I realized that without a specific term, instances like `UIGradient`, `UICorner`, `UIPadding`, `UIListLayout`, etc., can be confusing. They might sound like UI elements containing frames and text labels.  
>
> Iona **is not** a library to extend UI classes — it’s a library for **modifiers**.  
>
> - **UI modifiers** (e.g., gradients, corners, padding) are instances that apply to **UI classes** (e.g., input fields, frames, buttons).  
> - Modifiers don’t do anything on their own — they need to be attached to a UI class.  
>
> This documentation will use these two terms to keep Roblox UI instances categorized clearly.

---

## Iona helps you write UI faster

Designing UI is fun. Writing it in code? Not so much.  

As someone who’s both a designer and a coder, I understand the pain of translating Studio-made UIs into Fusion. This isn’t a rant about Fusion — or any other library — but writing declarative UIs in Roblox can be tedious.Plugins like **Codify** do automate the process, but the end result is still a huge block of indented, chained code full of things like `UICorner`, `UIPadding`, and more.  

Special shoutout to `UIPadding` — the one where you write the word *padding* four times just to set... padding. (`PaddingTop`, `PaddingBottom`, `PaddingLeft`, `PaddingRight` *do I look like an idiot to you?*). It’s not great for frontend health. There will come a day where you just snap because your UI code has turned into an unreadable jungle of nested objects.

**That’s where Iona comes in.**  
Built on top of Fusion’s `New` method, Iona abstracts away the painful bits. You focus on the UI, not the boilerplate. No more deep nesting, no more repetitive properties, no more convoluted datatypes. We’ll handle the mess — just like other languages do.

---

## How modifiers are done in other languages?

I won’t cover every language, but let’s focus on one I know well that aligns closely with what Iona is doing — **Swift with SwiftUI**.

In SwiftUI, you apply modifiers via method chaining. Unlike Roblox, SwiftUI isn’t obsessed with object hierarchies. It’s cleaner and more declarative:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, Iona!")
            .padding(.all, 16)
            .background(Color.blue)
            .cornerRadius(8)
    }
}
```

Now, the same thing but in Roblox:

```luau
New "Frame" {
 New "TextLabel" {
  Text = "Hello, Iona!",
  BackgroundColor3 = Color3.new(0, 0, 1),

  [Children] = {
   New "UICorner" {
    CornerRadius = UDim.new(0, 8),
   },
   New "UIPadding" {
    PaddingTop = UDim.new(0, 16),
    PaddingRight = UDim.new(0, 16),
    PaddingBottom = UDim.new(0, 16),
    PaddingLeft = UDim.new(0, 16),
   },
  },
 },
}
```

Can you believe this? **16 lines** just to match SwiftUI's result. And if you ever need to adjust the padding, you’ll either:

- create a value/variable and reuse it
- or do a find-and-replace for all `UDim.new(0, 16)` values.

Meanwhile in SwiftUI, it's just `.padding(20)` and you’re done.

This is the grudge I hold against coding Roblox UI by hand. It’s not productive — and it’s why I built Iona. I just got really tired of all that mess.

## One, two, Iona

Let's recreate that same UI again - this time with Iona.

```luau
Scope:Wew "Frame" {
 Scope:Wew "TextLabel" {
  Text = "Hello, Iona!",
  BackgroundColor3 = Color3.new(0, 0, 1),
  CornerRadius = 8,
  Padding = 16,
 }
}
```

Boom - back to productivity! Just as short and sweet as the SwiftUI example.

### What if I want non-uniform padding?

No problem - Iona supports that too. Just provide an array up to 4 values (`number` or `UDim`):

```luau
Scope:Wew "Frame" {
 Scope:Wew "TextLabel" {
  Text = "Hello, Iona!",
  BackgroundColor3 = Color3.new(0, 0, 1),
  CornerRadius = 8,
  Padding = { 16, 8 },
 }
}
```

## The Conclusion

Hopefully, this gave you a clearer understanding of what Iona is, and why it exists.

It’s not something revolutionary, but it’s something that can seriously ease a frontend programmer’s life — *especially if you're working with intricate UI built by designers who love to nest things endlessly.*

With Iona, your UI code doesn’t have to be exhausting anymore.
