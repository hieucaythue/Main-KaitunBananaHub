repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

local MENU_NAME = "CustomMenu"
local RESET_NAME = "ResetMenuButton"
local player = game.Players.LocalPlayer
local playerName = player.Name
local configFile = "menu_config_" .. playerName .. ".txt"
local TweenService = game:GetService("TweenService")

-- ================= FILE =================
local function ensureConfigFile()
    if not isfile(configFile) then
        writefile(configFile, "none")
    end
end

local function loadChoice()
    ensureConfigFile()
    return readfile(configFile)
end

local function saveChoice(choice)
    writefile(configFile, choice)
end

-- ================= GUI REMOVE =================
local function removeMenu()
    local gui = player.PlayerGui
    if gui:FindFirstChild(MENU_NAME) then
        gui[MENU_NAME]:Destroy()
    end
end

local function removeReset()
    local gui = player.PlayerGui
    if gui:FindFirstChild(RESET_NAME) then
        gui[RESET_NAME]:Destroy()
    end
end

-- ================= RESET BUTTON (UI ĐẸP) =================
local function createResetButton()
    removeReset()

    local gui = player.PlayerGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = RESET_NAME
    screenGui.ResetOnSpawn = false
    screenGui.Parent = gui

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,140,0,36)
    btn.Position = UDim2.new(1,-160,0,12)
    btn.BackgroundColor3 = Color3.fromRGB(200,60,60)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Text = "🔄 Reset Script"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 15
    btn.Parent = screenGui
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,14)

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(230,80,80)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(200,60,60)
    end)

    btn.MouseButton1Click:Connect(function()
        if isfile(configFile) then
            delfile(configFile)
        end
        removeMenu()
        removeReset()
        task.wait()
        showMenu()
    end)
end

-- ================= MAIN SCRIPT =================
function runMainScript()
    removeMenu()
    createResetButton()

    getgenv().Key = "a5cf677e9a4ab10c53e220de"
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"
    ))()
end

-- ================= KAITUN SCRIPT =================
function runKaitunScript()
    removeMenu()
    createResetButton()

    repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = "a5cf677e9a4ab10c53e220de"
    getgenv().SettingFarm ={
        ["Hide UI"] = false,
        ["Reset Teleport"] = {
            ["Enabled"] = false,
            ["Delay Reset"] = 3,
            ["Item Dont Reset"] = {
                ["Fruit"] = {
                    ["Enabled"] = true,
                    ["All Fruit"] = true, 
                    ["Select Fruit"] = {
                        ["Enabled"] = false,
                        ["Fruit"] = {},
                    },
                },
            },
        },
        ["White Screen"] = false,
        ["Lock Fps"] = {
            ["Enabled"] = false,
            ["FPS"] = 20,
        },
        ["Get Items"] = {
            ["Saber"] = true,
            ["Godhuman"] =  true,
            ["Skull Guitar"] = true,
            ["Mirror Fractal"] = true,
            ["Cursed Dual Katana"] = true,
            ["Upgrade Race V2-V3"] = true,
            ["Auto Pull Lever"] = true,
            ["Shark Anchor"] = true, --- if have cdk,sg,godhuman
        },
        ["Get Rare Items"] = {
            ["Rengoku"] = true,
            ["Dragon Trident"] = true, 
            ["Pole (1st Form)"] = true,
            ["Gravity Blade"]  = true,
        },
        ["Farm Fragments"] = {
            ["Enabled"]  = false,
            ["Fragment"] = 50000,
        },
        ["Auto Chat"] = {
            ["Enabled"] = false,
            ["Text"] = "",
        },
        ["Auto Summon Rip Indra"] = true, --- auto buy haki and craft haki legendary 
        ["Select Hop"] = { -- 70% will have it
            ["Hop Server If Have Player Near"] = false, 
            ["Hop Find Rip Indra Get Valkyrie Helm or Get Tushita"] = true, 
            ["Hop Find Dough King Get Mirror Fractal"] = true,
            ["Hop Find Raids Castle [CDK]"] = true,
            ["Hop Find Cake Queen [CDK]"] = true,
            ["Hop Find Soul Reaper [CDK]"] = true,
            ["Hop Find Darkbeard [SG]"] = true,
            ["Hop Find Mirage [ Pull Lever ]"] = true,
        },
        ["Farm Mastery"] = {
            ["Melee"] = false,
            ["Sword"] = false,
        },
        ["Buy Haki"] = {
            ["Enhancement"] = true,
            ["Skyjump"] = true,
            ["Flash Step"] = true,
            ["Observation"] = true,
        },
        ["Sniper Fruit Shop"] = {
            ["Enabled"] = true, -- Auto Buy Fruit in Shop Mirage and Normal
            ["Fruit"] = {"Leopard-Leopard","Kitsune-Kitsune","Dragon-Dragon","Yeti-Yeti","Gas-Gas"},
        },
        ["Lock Fruit"] = {},
        ["Webhook"] = {
            ["Enabled"] = false,
            ["WebhookUrl"] = "",
        }
    }
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))()
end

-- ================= MENU (UI ĐẸP) =================
function showMenu()
    removeMenu()
    removeReset()

    local gui = player.PlayerGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = MENU_NAME
    screenGui.ResetOnSpawn = false
    screenGui.Parent = gui

    -- Shadow
    local shadow = Instance.new("Frame")
    shadow.Size = UDim2.new(0,320,0,170)
    shadow.Position = UDim2.new(0.5,-160,0.5,-85)
    shadow.BackgroundColor3 = Color3.fromRGB(0,0,0)
    shadow.BackgroundTransparency = 0.45
    shadow.Parent = screenGui
    Instance.new("UICorner", shadow).CornerRadius = UDim.new(0,18)

    -- Main Frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,300,0,150)
    frame.Position = UDim2.new(0.5,-150,0.5,-75)
    frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
    frame.Parent = screenGui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,16)

    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1,0,0,40)
    title.BackgroundTransparency = 1
    title.Text = "🍌 Script Selector 🍌"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 22
    title.TextColor3 = Color3.new(1,1,1)
    title.Parent = frame

    -- Animation
    frame.Size = UDim2.new(0,0,0,0)
    shadow.Size = frame.Size
    TweenService:Create(
        frame,
        TweenInfo.new(0.25, Enum.EasingStyle.Back),
        {Size = UDim2.new(0,300,0,150)}
    ):Play()
    TweenService:Create(
        shadow,
        TweenInfo.new(0.25, Enum.EasingStyle.Back),
        {Size = UDim2.new(0,320,0,170)}
    ):Play()

    local function createButton(text, yPos, color, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.8,0,0.25,0)
        btn.Position = UDim2.new(0.1,0,yPos,0)
        btn.Text = text
        btn.BackgroundColor3 = color
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 18
        btn.Parent = frame
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,12)

        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = color:Lerp(Color3.new(1,1,1),0.15)
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = color
        end)

        btn.MouseButton1Click:Connect(callback)
    end

    createButton("🍌 Main",0.38,Color3.fromRGB(255,90,90),function()
        saveChoice("Main")
        runMainScript()
    end)

    createButton("🍌 Kaitun",0.68,Color3.fromRGB(0,170,255),function()
        saveChoice("Kaitun")
        runKaitunScript()
    end)
end

-- ================= START =================
local choice = loadChoice()
if choice == "Main" then
    runMainScript()
elseif choice == "Kaitun" then
    runKaitunScript()
else
    showMenu()
end

-- FPS + Ping + Play Time Display
-- Place as LocalScript in StarterPlayerScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local player = Players.LocalPlayer

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "STATS_GUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(0, 260, 0, 70)
TextLabel.Position = UDim2.new(0, 10, 0, 10)
TextLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TextLabel.BackgroundTransparency = 0.2
TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.TextSize = 18
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextYAlignment = Enum.TextYAlignment.Center
TextLabel.BorderSizePixel = 0
TextLabel.Parent = ScreenGui

-- FPS variables
local frames = 0
local lastTime = tick()
local fps = 0

-- Time tracking
local startTime = tick()

-- Format time function
local function formatTime(seconds)
	local h = math.floor(seconds / 3600)
	local m = math.floor((seconds % 3600) / 60)
	local s = math.floor(seconds % 60)

	if h > 0 then
		return string.format("%02d:%02d:%02d", h, m, s)
	else
		return string.format("%02d:%02d", m, s)
	end
end

RunService.RenderStepped:Connect(function()
	frames += 1
	local currentTime = tick()

	if currentTime - lastTime >= 1 then
		fps = frames
		frames = 0
		lastTime = currentTime
	end

	-- Ping
	local ping = math.floor(
		Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
	)

	-- Play time
	local playTime = tick() - startTime

	-- FPS color warning
	if fps < 30 then
		TextLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
	else
		TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
	end

	TextLabel.Text = string.format(
		"FPS: %d\nPing: %d ms\nTime: %s",
		fps,
		ping,
		formatTime(playTime)
	)
end)
