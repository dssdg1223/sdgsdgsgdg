local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- ↓ WindUI e KeySystem
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Version = "1.6.41"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. Version .. "/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "GOJO HUB | Brookhaven",
    Icon = "door-open",
    Author = "by ghost626262628",
    Folder = "MySuperHub",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            print("clicked")
        end,
    },
    KeySystem = { 
        Key = { "GOJO999" },
        Note = "Key System.",
        Thumbnail = {
            Image = "rbxassetid://122375087976979",
            Title = "GOJO HUB TEAM",
        },
        URL = "https://discord.gg/5vtUNXczms",
        SaveKey = false,
    },
})

local Tab = Window:Tab({
    Title = "conmandos",
    Icon = "bird",
    Locked = false,
})

-- Função para encontrar o evento de chat global
local function findChatEvent()
    local defaultChat = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if defaultChat then
        local sayMessage = defaultChat:FindFirstChild("SayMessageRequest")
        if sayMessage then
            return sayMessage
        end
    end
    
    local chatEvents = {
        "SayMessageRequest",
        "ChatEvent",
        "SendMessage",
        "PostMessage",
        "ChatMsg"
    }
    
    for _, eventName in pairs(chatEvents) do
        local event = ReplicatedStorage:FindFirstChild(eventName)
        if event and event:IsA("RemoteEvent") then
            return event
        end
    end
    
    return nil
end

-- Função para enviar mensagem globalmente
local function SendGlobalMessage(msg)
    local chatEvent = findChatEvent()
    
    if chatEvent and chatEvent:IsA("RemoteEvent") then
        pcall(function()
            chatEvent:FireServer(msg, "All")
        end)
    else
        pcall(function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(msg)
        end)
    end
end

-- Loop que verifica a flag do admin e envia a mensagem
RunService.RenderStepped:Connect(function()
    if _G.SendGojoChat then
        SendGlobalMessage("GOJO_user")
        _G.SendGojoChat = false -- evita múltiplos envios
    end
end)
