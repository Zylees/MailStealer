-- Gui to Lua
-- Version: 3.2

-- Instances:

local Epicc = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Main = Instance.new("Frame")
local DropShadow = Instance.new("ImageLabel")
local UIGradient = Instance.new("UIGradient")
local Title = Instance.new("TextLabel")
local Loaded = Instance.new("TextLabel")
local Copyright = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")

--Properties:

Epicc.Name = "E01263KTFDS0JAQD"
Epicc.Parent = game.CoreGui
Epicc.IgnoreGuiInset = true

BG.Name = "BG"
BG.Parent = Epicc
BG.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BG.Size = UDim2.new(1, 0, 1, 0)
BG.ZIndex = -1

Main.Name = "Main"
Main.Parent = BG
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 880, 0, 495)

DropShadow.Name = "DropShadow"
DropShadow.Parent = Main
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 49, 1, 49)
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageTransparency = 0.500
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(195, 1, 221)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(90, 1, 221)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(74, 1, 221)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(89, 1, 221)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(195, 1, 221))}
UIGradient.Parent = DropShadow

Title.Name = "Title"
Title.Parent = Main
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.5, 0, 0.5, -35)
Title.Size = UDim2.new(0, 200, 0, 50)
Title.Font = Enum.Font.GothamMedium
Title.Text = "Dupe Script | 0.2 alpha"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20.000

Loaded.Name = "Loaded"
Loaded.Parent = Main
Loaded.AnchorPoint = Vector2.new(0.5, 0.5)
Loaded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Loaded.BackgroundTransparency = 1.000
Loaded.Position = UDim2.new(0.5, 0, 0.5, -5)
Loaded.Size = UDim2.new(0, 200, 0, 50)
Loaded.Font = Enum.Font.Gotham
Loaded.Text = "Loaded: 15"
Loaded.TextColor3 = Color3.fromRGB(209, 209, 209)
Loaded.TextSize = 20.000
local currentPercent = 0
task.spawn(function()
	while true do
		if currentPercent <= 100 then
		Loaded.Text = "Loaded: " .. currentPercent .. "%"
		currentPercent = currentPercent + 1
		wait(math.random(0.45, 2.1))
		end
	end
end)


Copyright.Name = "Copyright"
Copyright.Parent = Main
Copyright.AnchorPoint = Vector2.new(1, 1)
Copyright.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Copyright.BackgroundTransparency = 1.000
Copyright.Position = UDim2.new(1, 0, 1, 0)
Copyright.Size = UDim2.new(0, 200, 0, 40)
Copyright.Font = Enum.Font.Gotham
Copyright.Text = "Last Update | 14/06/2023"
Copyright.TextColor3 = Color3.fromRGB(209, 209, 209)
Copyright.TextSize = 16.000
Copyright.TextXAlignment = Enum.TextXAlignment.Right

UIPadding.Parent = Copyright
UIPadding.PaddingRight = UDim.new(0, 10)
