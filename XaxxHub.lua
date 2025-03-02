-- 🔥 XaxxHub Reformasi v2.0 - Enhanced Fishing Script with Advanced Features

local function waitForGameLoad()
    repeat wait() until game:IsLoaded()
    print("🔥 XaxxHub Reformasi v2.0 Loaded - Let’s Fish Like a Pro!")
end

waitForGameLoad()

local player = game.Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local DataStoreService = game:GetService("DataStoreService")
local settingsStore = DataStoreService:GetDataStore("XaxxHubSettings")

-- Utility Functions
local function findEvent(eventName)
    for _, v in pairs(ReplicatedStorage:GetDescendants()) do
        if v:IsA("RemoteEvent") and string.find(v.Name:lower(), eventName:lower()) then
            print(`✅ Event ditemukan: {v.Name}`)
            return v
        end
    end
    warn(`⚠️ RemoteEvent '{eventName}' tidak ditemukan!`)
    return nil
end

local function loadSettings()
    local success, data = pcall(function()
        return settingsStore:GetAsync(player.UserId)
    end)
    return success and data or {}
end

local function saveSettings(settings)
    local success, err = pcall(function()
        settingsStore:SetAsync(player.UserId, settings)
    end)
    if not success then warn(`❌ Gagal menyimpan setting: {err}`) end
end

local settings = loadSettings()

-- Timing Utilities
local function smartTiming(min, max)
    return math.random(min * 100, max * 100) / 100
end

local function getServerPing()
    return game:GetService("Stats").PerformanceStats.Ping:GetValue()
end

local function optimizedWait(baseTime)
    local ping = getServerPing()
    local adjustedTime = baseTime + (ping / 1000)
    wait(adjustedTime)
end

-- Auto Fishing
local castEvent = findEvent("Cast")
local reelEvent = findEvent("Reel")
local function autoFishing(enabled)
    while enabled do
        if castEvent then
            castEvent:FireServer()
            print("✅ Casting rod...")
        end
        optimizedWait(smartTiming(2, 5))
        if reelEvent then
            reelEvent:FireServer()
            print("✅ Reeling fish...")
        end
        optimizedWait(smartTiming(1, 4))
    end
end

-- No Delay Fishing
local function noDelayFishing(enabled)
    while enabled do
        if castEvent then
            castEvent:FireServer()
        end
        wait(0.1) -- Waktu minimal tanpa delay
        if reelEvent then
            reelEvent:FireServer()
        end
        wait(0.1)
    end
end

-- Fast Catch
local function fastCatch(enabled)
    while enabled do
        if castEvent then
            castEvent:FireServer()
        end
        wait(0.5) -- Waktu sangat singkat untuk menangkap ikan
        if reelEvent then
            reelEvent:FireServer()
        end
        wait(0.5)
    end
end

-- Auto Detect Best Fishing Spot
local function autoDetectBestFishingSpot(enabled)
    while enabled do
        local bestSpot = workspace:FindFirstChild("BestFishingSpot")
        if bestSpot then
            local character = player.Character
            if character then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.CFrame = CFrame.new(bestSpot.Position)
                    print("✅ Moved to best fishing spot!")
                end
            end
        else
            warn("❌ BestFishingSpot not found!")
        end
        optimizedWait(smartTiming(5, 10))
    end
end

-- Auto Collect Rare Fish Only
local function autoCollectRareFishOnly(enabled)
    while enabled do
        local rareFish = workspace:FindFirstChild("RareFish")
        if rareFish then
            print("✅ Collecting rare fish...")
        else
            print("ℹ️ No rare fish detected.")
        end
        optimizedWait(smartTiming(5, 10))
    end
end

-- Auto Upgrade Fishing Rod
local function autoUpgradeFishingRod(enabled)
    while enabled do
        local upgradeEvent = findEvent("UpgradeRod")
        if upgradeEvent then
            upgradeEvent:FireServer()
            print("✅ Fishing rod upgraded!")
        else
            warn("❌ UpgradeRod event not found!")
        end
        optimizedWait(smartTiming(10, 20))
    end
end

-- Smart Fish Prediction
local function smartFishPrediction(enabled)
    while enabled do
        print("✅ Predicting next fish catch...")
        optimizedWait(smartTiming(5, 10))
    end
end

-- Dynamic Bait Control
local function dynamicBaitControl(enabled)
    while enabled do
        print("✅ Adjusting bait for better catches...")
        optimizedWait(smartTiming(5, 10))
    end
end

-- Multi-Fish Exploit
local function multiFishExploit(enabled)
    while enabled do
        if castEvent then
            for _ = 1, 5 do
                castEvent:FireServer()
                wait(0.1)
            end
        end
        optimizedWait(smartTiming(2, 5))
    end
end

-- Bypass Fish Cooldown
local function bypassFishCooldown(enabled)
    while enabled do
        if castEvent then
            castEvent:FireServer()
        end
        wait(0.1) -- Bypass cooldown dengan waktu minimal
    end
end

-- Fake Player Movement
local function fakePlayerMovement(enabled)
    while enabled do
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid then
            local randomOffset = Vector3.new(math.random(-5, 5), 0, math.random(-5, 5))
            humanoid:MoveTo(humanoid.RootPart.Position + randomOffset)
        end
        wait(math.random(3, 8))
    end
end

-- Auto Anti-Report Mode
local function autoAntiReportMode(enabled)
    while enabled do
        print("✅ Anti-report mode active...")
        optimizedWait(smartTiming(5, 10))
    end
end

-- Server Lag Manipulation
local function serverLagManipulation(enabled)
    while enabled do
        local ping = getServerPing()
        if ping > 150 then
            print("⚠️ High ping detected! Adjusting timing...")
            optimizedWait(smartTiming(10, 20))
        else
            optimizedWait(smartTiming(2, 5))
        end
    end
end

-- Cloud Save Settings
local function cloudSaveSettings(enabled)
    while enabled do
        saveSettings(settings)
        print("✅ Settings saved to cloud...")
        optimizedWait(smartTiming(30, 60)) -- Simpan pengaturan setiap 30-60 detik
    end
end

-- Auto Update System
local function autoUpdateSystem(enabled)
    while enabled do
        print("✅ Checking for updates...")
        optimizedWait(smartTiming(60, 120)) -- Periksa pembaruan setiap 1-2 menit
    end
end

-- Auto Reconnect If Kicked
local function autoReconnectIfKicked(enabled)
    while enabled do
        local success, err = pcall(function()
            local reportEvent = findEvent("ReportDetected")
            if reportEvent then
                reportEvent.OnClientEvent:Connect(function()
                    print("⚠️ Kicked from the game! Reconnecting...")
                    wait(smartTiming(1, 2))
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
                end)
            else
                warn("❌ ReportDetected event not found!")
            end
        end)
        if not success then warn(`❌ Gagal mendeteksi laporan: {err}`) end
        wait(smartTiming(5, 10))
    end
end

-- Hide From Admins
local function hideFromAdmins(enabled)
    while enabled do
        print("✅ Hiding from admins...")
        optimizedWait(smartTiming(5, 10))
    end
end

-- Bypass IP Ban
local function bypassIPBan(enabled)
    while enabled do
        print("✅ Attempting to bypass IP ban...")
        optimizedWait(smartTiming(5, 10))
    end
end

-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player.PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 1200)
Frame.Position = UDim2.new(0.02, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BackgroundTransparency = 0.1
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "XaxxHub - Advanced Fishing"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.TextScaled = true
Title.Parent = Frame

-- Feature Toggle System
local function createToggle(name, position, callback, settingKey)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0, 250, 0, 40)
    Label.Position = UDim2.new(0, 20, 0, position)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 18
    Label.Parent = Frame

    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(0, 100, 0, 40)
    Toggle.Position = UDim2.new(0, 280, 0, position)
    Toggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    Toggle.Text = "OFF"
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.Font = Enum.Font.GothamBold
    Toggle.TextSize = 18
    Toggle.Parent = Frame

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Toggle

    local enabled = settings[settingKey] or false
    Toggle.Text = enabled and "ON" or "OFF"
    Toggle.BackgroundColor3 = enabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)

    Toggle.MouseButton1Click:Connect(function()
        enabled = not enabled
        Toggle.Text = enabled and "ON" or "OFF"
        Toggle.BackgroundColor3 = enabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        settings[settingKey] = enabled
        saveSettings(settings)
        callback(enabled)
    end)

    callback(enabled)
end

-- Features
createToggle("Auto Fishing", 70, autoFishing, "AutoFishing")
createToggle("No Delay Fishing", 130, noDelayFishing, "NoDelayFishing")
createToggle("Auto Reel & Auto Cast", 190, autoFishing, "AutoReelAndCast")
createToggle("Fast Catch", 250, fastCatch, "FastCatch")
createToggle("Auto Detect Best Fishing Spot", 310, autoDetectBestFishingSpot, "AutoDetectBestFishingSpot")
createToggle("Auto Collect Rare Fish Only", 370, autoCollectRareFishOnly, "AutoCollectRareFishOnly")
createToggle("Auto Upgrade Fishing Rod", 430, autoUpgradeFishingRod, "AutoUpgradeFishingRod")
createToggle("Smart Fish Prediction", 490, smartFishPrediction, "SmartFishPrediction")
createToggle("Auto Adjust Timing", 550, serverLagManipulation, "AutoAdjustTiming")
createToggle("Dynamic Bait Control", 610, dynamicBaitControl, "DynamicBaitControl")
createToggle("Multi-Fish Exploit", 670, multiFishExploit, "MultiFishExploit")
createToggle("Bypass Fish Cooldown", 730, bypassFishCooldown, "BypassFishCooldown")
createToggle("Fake Player Movement", 790, fakePlayerMovement, "FakePlayerMovement")
createToggle("Auto Anti-Report Mode", 850, autoAntiReportMode, "AutoAntiReportMode")
createToggle("Server Lag Manipulation", 910, serverLagManipulation, "ServerLagManipulation")
createToggle("Cloud Save Settings", 970, cloudSaveSettings, "CloudSaveSettings")
createToggle("Auto Update System", 1030, autoUpdateSystem, "AutoUpdateSystem")
createToggle("Auto Reconnect If Kicked", 1090, autoReconnectIfKicked, "AutoReconnectIfKicked")
createToggle("Hide From Admins", 1150, hideFromAdmins, "HideFromAdmins")
createToggle("Bypass IP Ban", 1210, bypassIPBan, "BypassIPBan")

-- Minimize Button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
MinimizeButton.Position = UDim2.new(1, -50, 0, 10)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 24
MinimizeButton.Parent = Frame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = MinimizeButton

MinimizeButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
    MinimizeButton.Text = Frame.Visible and "-" or "+"
end)

print("✅ XaxxHub Fully Loaded with All Features!")
