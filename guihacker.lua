-- Configurações iniciais
local HackerGUI = {}
HackerGUI.Version = "1.0"
HackerGUI.Codename = "MATAR_NO_SAFE"
HackerGUI.Active = false -- Estado inicial desativado

-- Serviços
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Criação da GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HackerGUI"
ScreenGui.ResetOnSpawn = false

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
end
ScreenGui.Parent = game:GetService("CoreGui")

-- Frame principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 200, 0, 80)
MainFrame.Position = UDim2.new(0.5, -100, 0.7, -40)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 0)
MainFrame.BorderSizePixel = 1
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

-- Efeito de scanlines
local Scanlines = Instance.new("Frame")
Scanlines.Name = "Scanlines"
Scanlines.Size = UDim2.new(1, 0, 1, 0)
Scanlines.BackgroundTransparency = 1
Scanlines.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Scanlines

for i = 1, 40 do
    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, 0, 0, 1)
    line.BackgroundColor3 = Color3.fromRGB(0, 30, 0)
    line.BackgroundTransparency = 0.9
    line.BorderSizePixel = 0
    line.Parent = Scanlines
end

-- Texto hacker
local HackerText = Instance.new("TextLabel")
HackerText.Name = "HackerText"
HackerText.Size = UDim2.new(1, -20, 0, 40)
HackerText.Position = UDim2.new(0, 10, 0, 5)
HackerText.BackgroundTransparency = 1
HackerText.Text = ""
HackerText.TextColor3 = Color3.fromRGB(0, 255, 0)
HackerText.TextSize = 14
HackerText.Font = Enum.Font.Code
HackerText.TextXAlignment = Enum.TextXAlignment.Left
HackerText.Parent = MainFrame

-- Botão hacker
local HackButton = Instance.new("TextButton")
HackButton.Name = "HackButton"
HackButton.Size = UDim2.new(1, -20, 0, 25)
HackButton.Position = UDim2.new(0, 10, 0, 50)
HackButton.BackgroundColor3 = Color3.fromRGB(0, 20, 0)
HackButton.BorderColor3 = Color3.fromRGB(0, 255, 0)
HackButton.BorderSizePixel = 1
HackButton.Text = "INITIATE"
HackButton.TextColor3 = Color3.fromRGB(0, 255, 0)
HackButton.TextSize = 12
HackButton.Font = Enum.Font.Code
HackButton.Parent = MainFrame

-- Efeito de brilho no botão
local ButtonGlow = Instance.new("Frame")
ButtonGlow.Name = "ButtonGlow"
ButtonGlow.Size = UDim2.new(1, 0, 1, 0)
ButtonGlow.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ButtonGlow.BackgroundTransparency = 1
ButtonGlow.Parent = HackButton

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 200, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0))
})
UIGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.8),
    NumberSequenceKeypoint.new(1, 1)
})
UIGradient.Parent = ButtonGlow

-- Animação de digitação
local function typeWriter(text, speed)
    HackerText.Text = ""
    for i = 1, #text do
        HackerText.Text = string.sub(text, 1, i)
        local randomDelay = math.random(speed * 0.8, speed * 1.2)
        wait(randomDelay)
    end
end

-- Textos aleatórios hacker
local hackerPhrases = {
    "> INITIALIZING SYSTEM...",
    "> ACCESSING MAINFRAME...",
    "> BYPASSING SECURITY...",
    "> CONNECTING TO SERVER...",
    "> LOADING "..HackerGUI.Codename.."..."
}

-- Efeito de piscar o texto
local function blinkText()
    while true do
        HackerText.TextTransparency = 0.3
        wait(0.5)
        HackerText.TextTransparency = 0
        wait(math.random(1, 3))
    end
end

coroutine.wrap(blinkText)()

-- Animação de entrada
MainFrame.Size = UDim2.new(0, 0, 0, 80)
MainFrame.Position = UDim2.new(0.5, 0, 0.7, -40)

TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
    Size = UDim2.new(0, 200, 0, 80)
}):Play()

wait(0.5)

-- Mostrar texto digitando
coroutine.wrap(function()
    while true do
        local randomPhrase = hackerPhrases[math.random(1, #hackerPhrases)]
        typeWriter(randomPhrase, 0.05)
        wait(math.random(3, 6))
    end
end)()

-- Efeito de hover no botão
HackButton.MouseEnter:Connect(function()
    TweenService:Create(HackButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(0, 30, 0),
        TextColor3 = Color3.fromRGB(0, 255, 100)
    }):Play()
    
    TweenService:Create(ButtonGlow, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.8
    }):Play()
end)

HackButton.MouseLeave:Connect(function()
    TweenService:Create(HackButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(0, 20, 0),
        TextColor3 = Color3.fromRGB(0, 255, 0)
    }):Play()
    
    TweenService:Create(ButtonGlow, TweenInfo.new(0.2), {
        BackgroundTransparency = 1
    }):Play()
end)

-- Função principal do botão (toggle)
HackButton.MouseButton1Click:Connect(function()
    -- Efeito ao clicar
    TweenService:Create(HackButton, TweenInfo.new(0.1), {
        BackgroundColor3 = Color3.fromRGB(0, 50, 0),
        Size = UDim2.new(1, -25, 0, 25)
    }):Play()
    
    TweenService:Create(HackButton, TweenInfo.new(0.1), {
        BackgroundColor3 = Color3.fromRGB(0, 30, 0),
        Size = UDim2.new(1, -20, 0, 25)
    }):Play()
    
    -- Alternar estado
    HackerGUI.Active = not HackerGUI.Active
    
    if HackerGUI.Active then
        -- Ativando
        HackerText.Text = "> ACTIVATING "..HackerGUI.Codename.."..."
        
        -- Efeito de loading
        for i = 1, 3 do
            HackerText.Text = HackerText.Text.."."
            wait(0.3)
        end
        
        -- Mensagem de sucesso
        HackerText.Text = "> "..HackerGUI.Codename.." ACTIVE"
        HackButton.Text = "DEACTIVATE"
        
        -- Print no console
        print(HackerGUI.Codename.." activated!")
        
        -- Piscar o texto em verde mais forte
        for i = 1, 3 do
            HackerText.TextColor3 = Color3.fromRGB(0, 255, 0)
            wait(0.1)
            HackerText.TextColor3 = Color3.fromRGB(0, 150, 0)
            wait(0.1)
        end
    else
        -- Desativando
        HackerText.Text = "> DEACTIVATING "..HackerGUI.Codename.."..."
        
        -- Efeito de loading
        for i = 1, 3 do
            HackerText.Text = HackerText.Text.."."
            wait(0.3)
        end
        
        -- Mensagem de desativação
        HackerText.Text = "> "..HackerGUI.Codename.." INACTIVE"
        HackButton.Text = "INITIATE"
        
        -- Print no console
        print(HackerGUI.Codename.." deactivated!")
        
        -- Piscar o texto em vermelho
        for i = 1, 3 do
            HackerText.TextColor3 = Color3.fromRGB(255, 0, 0)
            wait(0.1)
            HackerText.TextColor3 = Color3.fromRGB(150, 0, 0)
            wait(0.1)
        end
    end
end)

-- Efeito de glitch aleatório
coroutine.wrap(function()
    while true do
        wait(math.random(5, 15))
        local originalPos = MainFrame.Position
        local originalText = HackerText.Text
        
        -- Efeito de glitch na posição
        for i = 1, 3 do
            MainFrame.Position = originalPos + UDim2.new(0, math.random(-3, 3), 0, math.random(-1, 1))
            HackerText.Text = string.gsub(originalText, ".", function(c)
                if math.random() > 0.7 then
                    return string.char(math.random(33, 126))
                else
                    return c
                end
            end)
            wait(0.05)
        end
        
        MainFrame.Position = originalPos
        HackerText.Text = originalText
    end
end)()

return HackerGUI
