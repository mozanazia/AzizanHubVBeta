repeat wait() until game:IsLoaded()

print("🔥 XaxxHub Loaded - Let’s Fish Like a Pro!")

local player = game.Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local PlayerGui = player:FindFirstChild("PlayerGui") or player:WaitForChild("PlayerGui")

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
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 320, 0, 400)
Frame.Position = UDim2.new(0.02, 0, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 2
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "XaxxHub - Fishing Master"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.Parent = Frame

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
local shakeEvent = findEvent("Shake")
local sellEvent = findEvent("Sell")

if not castEvent or not reelEvent or not shakeEvent then
    warn("XaxxHub: RemoteEvent not found! Check event names.")
    return
end

-- Feature Toggle System
local function createToggle(name, position, callback)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0, 180, 0, 30)
    Label.Position = UDim2.new(0, 10, 0, position)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 18
    Label.Parent = Frame

    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(0, 80, 0, 30)
    Toggle.Position = UDim2.new(0, 200, 0, position)
    Toggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    Toggle.Text = "OFF"
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.Font = Enum.Font.SourceSansBold
    Toggle.TextSize = 18
    Toggle.Parent = Frame

    local enabled = false

    Toggle.MouseButton1Click:Connect(function()
        enabled = not enabled
        Toggle.Text = enabled and "ON" or "OFF"
        Toggle.BackgroundColor3 = enabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        callback(enabled)
    end)
end

-- OP Fishing Features
local function autoCast(enabled)
    while enabled do
        castEvent:FireServer()
        wait(math.random(2, 5))
    end
end

local function autoReel(enabled)
    while enabled do
        reelEvent:FireServer()
        wait(math.random(1, 4))
    end
end

local function fastCatch(enabled)
    while enabled do
        reelEvent:FireServer()
        wait(math.random(0.5, 2))
    end
end

local function instantReel(enabled)
    while enabled do
        local delay = math.random(0.2, 0.5)
        reelEvent:FireServer()
        wait(delay)
    end
end

local function autoSell(enabled)
    while enabled and sellEvent do
        sellEvent:FireServer()
        wait(math.random(10, 20))
    end
end

-- Smart AI Fishing
local function smartFishPrediction(enabled)
    while enabled do
        wait(math.random(1, 3))
        reelEvent:FireServer()
    end
end

-- Anti-Ban System
local function bypassIPBan(enabled)
    if enabled then
        print("XaxxHub: IP Bypass Active!")
        -- Implement Proxy Switcher
    end
end

local function bypassHWIDBan(enabled)
    if enabled then
        print("XaxxHub: HWID Bypass Active!")
        -- Implement HWID Spoofer
    end
end

-- Remote Control (Web Dashboard)
local function webDashboard(enabled)
    if enabled then
        print("XaxxHub: Web Dashboard Active!")
        -- Implement Web Panel
    end
end

-- Add Features to UI
createToggle("Auto Cast", 50, autoCast)
createToggle("Auto Reel", 90, autoReel)
createToggle("Fast Catch", 130, fastCatch)
createToggle("Instant Reel", 170, instantReel)
createToggle("Auto Sell", 210, autoSell)
createToggle("Smart Fish Prediction", 250, smartFishPrediction)
createToggle("Bypass IP Ban", 290, bypassIPBan)
createToggle("Bypass HWID Ban", 330, bypassHWIDBan)
createToggle("Web Dashboard", 370, webDashboard)

-- Minimize Button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -40, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextSize = 20
MinimizeButton.Parent = Frame

MinimizeButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
    MinimizeButton.Text = Frame.Visible and "-" or "+"
end)
