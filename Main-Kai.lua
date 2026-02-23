repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

local MENU_NAME = "CustomMenu"
local RESET_NAME = "ResetMenuButton"
local player = game.Players.LocalPlayer
local playerName = player.Name
local configFile = "menu_config_" .. playerName .. ".txt"

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

-- ================= RESET BUTTON =================
local function createResetButton()
    removeReset()

    local gui = player.PlayerGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = RESET_NAME
    screenGui.ResetOnSpawn = false
    screenGui.Parent = gui

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 110, 0, 32)
    button.Position = UDim2.new(1, -120, 0, 10)
    button.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    button.TextColor3 = Color3.new(1,1,1)
    button.Text = "Reset Script"
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 16
    button.Parent = screenGui

    button.MouseButton1Click:Connect(function()
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

-- ================= MENU =================
function showMenu()
    removeMenu()
    removeReset()

    local gui = player.PlayerGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = MENU_NAME
    screenGui.ResetOnSpawn = false
    screenGui.Parent = gui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,300,0,150)
    frame.Position = UDim2.new(0.5,-150,0.5,-75)
    frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    frame.Parent = screenGui

    local function createButton(text, yPos, color, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.8,0,0.3,0)
        btn.Position = UDim2.new(0.1,0,yPos,0)
        btn.Text = text
        btn.BackgroundColor3 = color
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = Enum.Font.SourceSansBold
        btn.TextSize = 20
        btn.Parent = frame
        btn.MouseButton1Click:Connect(callback)
    end

    createButton("Main",0.15,Color3.fromRGB(255,100,100),function()
        saveChoice("Main")
        runMainScript()
    end)

    createButton("Kaitun",0.55,Color3.fromRGB(0,170,255),function()
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
