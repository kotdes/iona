local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Packages = ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local Iona = require(Packages.Iona)

local Children = Fusion.Children
local scope = Fusion.scoped(Fusion, Iona)

local function main()
    local Image = scope:Wrap(scope:New "ImageLabel" {})
    local ratio = scope:Value(1)
    local spring = scope:Spring(ratio, 500, 100)

    scope:New "ScreenGui" {
        Parent = PlayerGui,
        [Children] = {
            Image {
                AspectRatio = {
                    Ratio = spring,
                    Type = Enum.AspectType.FitWithinMaxSize,
                    Axis = Enum.DominantAxis.Height,
                },
                Image = "rbxassetid://101114846864924",
                Size = UDim2.fromScale(0.5, 0.5),

                [Children] = {
                    scope:Wew "Frame" {
                        AutomaticSize = Enum.AutomaticSize.XY,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        BackgroundColor3 = Color3.new(1, 1, 0),
                        Padding = { spring },
                        CornerRadius = spring,
                        Outline = {
                            Mode = Enum.ApplyStrokeMode.Border,
                            Color = Color3.new(0, 0, 0),
                            Thickness = spring,
                        },

                        [Children] = {
                            scope:Wew "TextLabel" {
                                BackgroundTransparency = 1,
                                FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold),
                                Text = scope:Computed(function(peek)
                                    return "Ratio: " .. tostring(peek(spring))
                                end),
                                AutomaticSize = Enum.AutomaticSize.XY,
                                TextColor3 = Color3.new(1, 1, 1),

                                Gradient = {
                                    Color = {
                                        From = "#000000",
                                        To = "#0000FF"
                                    }
                                }
                            },
                        }
                    },
                }
            }
        },
    }

    task.defer(function()
        while task.wait(1) do
            ratio:set(math.random(0, 10))
        end
    end)
end

main()