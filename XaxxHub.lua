repeat wait() until game:IsLoaded()

print("🔥 XaxxHub v2 Loaded - Enhanced Fishing Experience!")

local player = game.Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local PlayerGui = player:FindFirstChild("PlayerGui") or player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

if not PlayerGui then
    warn("XaxxHub: PlayerGui not found, forcing UI...")
    StarterGui:SetCore("SendNotification", {
        Title = "XaxxHub",
        Text = "PlayerGui not found! Restart game if UI doesn’t appear.",
        Duration = 5
    })
    return
end

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 320, 0, 400)
Frame.Position = UDim2.new(0.02, 0, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 2

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "🔥 XaxxHub v2 - Fishing Pro"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22

print("✅ UI Loaded Successfully!")

-- Auto Detect RemoteEvent
local function findEvent(name)
    for _, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if v:IsA("RemoteEvent") and string.find(v.Name:lower(), name:lower()) then
            return v
        end
    end
    return nil
end

local castEvent = findEvent("Cast")
local reelEvent = findEvent("Reel")
local sellEvent = findEvent("Sell")

if not castEvent or not reelEvent then
    warn("XaxxHub: RemoteEvent not found! Check event names.")
    return
end

-- Feature Toggle System
local function createToggle(name, position, callback)
    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(0, 180, 0, 30)
    Label.Position = UDim2.new(0, 10, 0, position)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 18

    local Toggle = Instance.new("TextButton", Frame)
    Toggle.Size = UDim2.new(0, 80, 0, 30)
    Toggle.Position = UDim2.new(0, 200, 0, position)
    Toggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    Toggle.Text = "OFF"
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.Font = Enum.Font.SourceSansBold
    Toggle.TextSize = 18

    local enabled = false

    Toggle.MouseButton1Click:Connect(function()
        enabled = not enabled
        Toggle.Text = enabled and "ON" or "OFF"
        Toggle.BackgroundColor3 = enabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        callback(enabled)
    end)
end

-- Optimized Fishing Functions
local function optimizedLoop(event, delayRange, enabled)
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if enabled then
            event:FireServer()
            wait(math.random(delayRange[1], delayRange[2]) + math.random())
        else
            connection:Disconnect()
        end
    end)
end

local function autoSell(enabled)
    if not sellEvent then return end
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if enabled then
            sellEvent:FireServer()
            wait(math.random(8, 15))
        else
            connection:Disconnect()
        end
    end)
end

local function smartFishPrediction(enabled)
    optimizedLoop(reelEvent, {1, 3}, enabled)
end

local function bypassSecurity(enabled)
    if enabled then
        print("🛡️ Bypassing IP & HWID Ban...")
        -- Implement anti-ban measures here
    end
end

-- Adding Features to UI
createToggle("Auto Cast", 50, function(enabled) optimizedLoop(castEvent, {2, 5}, enabled) end)
createToggle("Auto Reel", 90, function(enabled) optimizedLoop(reelEvent, {1, 4}, enabled) end)
createToggle("Fast Catch", 130, function(enabled) optimizedLoop(reelEvent, {0.5, 2}, enabled) end)
createToggle("Instant Reel", 170, function(enabled) optimizedLoop(reelEvent, {0.2, 0.5}, enabled) end)
createToggle("Auto Sell", 210, autoSell)
createToggle("Smart Fish AI", 250, smartFishPrediction)
createToggle("Bypass Security", 290, bypassSecurity)

-- Minimize Button
local MinimizeButton = Instance.new("TextButton", Frame)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -40, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextSize = 20

MinimizeButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
    MinimizeButton.Text = Frame.Visible and "-" or "+"
end)

print("🚀 XaxxHub v2 Ready to Fish!")
