--// Variables \\--
getgenv().Autofarm = false
getgenv().OpenEgg = false
getgenv().AutoRebirth = false
getgenv().HoopFarm = false

getgenv().MainCity = false
getgenv().Snow = false
getgenv().Magma = false
getgenv().LegendsHighway = false

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Chr = Player.Character

Player.CharacterAdded:Connect(function()
    Chr = Player.Character
end)

local ChrHead = Chr.Head
local Humanoid = Chr.Humanoid
local Root = Chr.HumanoidRootPart

--// Tables \\--
local AreaToFarm = {}
local Crystals = {}

--// Functions \\--
local function CityFarm()
    spawn(function()
        while task.wait() do
            if not Autofarm then break end
            if not MainCity then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for i, v in next, game:GetService("Workspace").orbFolder["City"]:GetDescendants() do
                    if v.Name == "TouchInterest" then
                        firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
                    end
                end
            else
                repeat task.wait() until Chr:FindFirstChild("Head")
            end
        end
    end)
end

local function SnowFarm()
    spawn(function()
        while task.wait() do
            if not Autofarm then break end
            if not SnowFarm then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for i, v in next, game:GetService("Workspace").orbFolder["Snow City"]:GetDescendants() do
                    if v.Name == "TouchInterest" then
                        firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
                    end
                end
            else
                repeat task.wait() until Chr:FindFirstChild("Head")
            end
        end
    end)
end

local function MagmaFarm()
    spawn(function()
        while task.wait() do
            if not Autofarm then break end
            if not MagmaFarm then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for i, v in next, game:GetService("Workspace").orbFolder["Magma City"]:GetDescendants() do
                    if v.Name == "TouchInterest" then
                        firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
                    end
                end
            else
                repeat task.wait() until Chr:FindFirstChild("Head")
            end
        end
    end)
end

local function LegendsHighwayFarm()
    spawn(function()
        while task.wait() do
            if not Autofarm then break end
            if not LegendsHighway then break end
            if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
                for i, v in next, game:GetService("Workspace").orbFolder["Legends Highway"]:GetDescendants() do
                    if v.Name == "TouchInterest" then
                        firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
                    end
                end
            else
                repeat task.wait() until Chr:FindFirstChild("Head")
            end
        end
    end)
end

local function HoopFarmV2()
    local Chr = game.Players.LocalPlayer.Character
    if Chr and Chr.Parent and Chr:FindFirstChild("HumanoidRootPart") then
        local children = workspace.Hoops:GetChildren()
        for i, child in ipairs(children) do
            if child.Name == "Hoop" then
                child.CFrame = Chr.HumanoidRootPart.CFrame
            end    
        end
    end
end
local function HoopFarm()
    if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
        for i, v in next, game:GetService("Workspace").Hoops:GetDescendants() do
            if v.Name == "TouchInterest" and v.Parent then
            firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
            task.wait()
            firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 1)
            end
        end
    end
end
local function Egg(EggName)
    task.wait()
    local Open = "openCrystal"
    local Name = EggName
    game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(Open, Name)
end

local function Rebirth()
    task.wait()
    local ohString1 = "rebirthRequest"
    game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(ohString1)
end

for i, v in next, game:GetService("Workspace").mapCrystalsFolder:GetChildren() do
    table.insert(Crystals, v.Name)
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Função para alternar o estado de AutoRaces
local function ToggleAutoRaces(Value)
    AutoRaces = Value
    if AutoRaces then
        spawn(function()
            while AutoRaces do
                pcall(function()
                    ReplicatedStorage.rEvents.raceEvent:FireServer("joinRace")
                    task.wait()
                    local part = Players.LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(Workspace.raceMaps:GetDescendants()) do 
                        if v.Name == "Decal" and v.Parent then
                            firetouchinterest(part, v.Parent, 0)
                            wait()
                            firetouchinterest(part, v.Parent, 1)
                        end
                    end
                end)
                task.wait()
            end
        end)
    end
end 

local function ToggleAutoRacesSolo(Value)
    AutoRacesSolo = Value
    if AutoRacesSolo then
        spawn(function()
            while AutoRacesSolo do
                pcall(function()
                    local playerHead = Players.LocalPlayer.Character.Head
                    ReplicatedStorage.rEvents.raceEvent:FireServer("joinRace")
                    wait(0.00)
                end)
                task.wait()
            end
        end)
    end
end

local AutoRaces = false
local AutoRacesSolo = false

local function optimizeFpsPing()
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
            v.Material = Enum.Material.SmoothPlastic
            if v:IsA("Texture") then
                v:Destroy()
            end
        end
    end
end

local function deleteBarrier()
    spawn(function()
        local boundaries = {
            game:GetService("Workspace").raceMaps.Grassland.boundaryParts,
            game:GetService("Workspace").raceMaps.Desert.boundaryParts,
            game:GetService("Workspace").raceMaps.Magma.boundaryParts
        }
        
        for _, boundary in ipairs(boundaries) do
            for _, part in pairs(boundary:GetChildren()) do
                part:Destroy()
            end
        end
    end)
end

local function AntiKick()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end



local function SelectCity(City)
    if City == "Main City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9682.98828, 74.8522873, 3099.03394, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
    elseif City == "Snow City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9676.13867, 74.8522873, 3782.69385, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    elseif City == "Magma City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11054.9688, 232.791656, 4898.62842, -0.0872479677, 0.000158954252, -0.996186614, -0.00054083002, 0.999999821, 0.00020692969, 0.996186495, 0.000556821818, -0.0872478485)
    elseif City == "Legends Highway" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13098.8711, 232.791656, 5907.62793, -0.0872479677, 0.000158954252, -0.996186614, -0.00054083002, 0.999999821, 0.00020692969, 0.996186495, 0.000556821818, -0.0872478485)
    end
end

--// FeHari Hub \\--
local HaridadeLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/FeHariHub/FH/refs/heads/main/InterfaceUI2.lua')))()
local Window = HaridadeLib:MakeWindow({Name = "FeHari Hub | Lendas Da Velocidade ⚡", HidePremium = false, SaveConfig = true, ConfigFolder = "HaridadeTest"})

local FarmTab = Window:MakeTab({
	Name = "Início",
	Icon = "rbxassetid://100789040568622",
	PremiumOnly = false
})


local FarmTab = FarmTab:AddSection({
	Name = "Utilitários"
})


FarmTab:AddButton({
    Name = "Anti-Kick",
    Callback = function()
        AntiKick()
        print("O script AntiKick foi ativado.")
    end    
})

FarmTab:AddButton({
    Name = "Reduzir Os Gráficos Do Jogo",
    Default = false,
    Callback = function(value)
	    print("button pressed")	  
        isReducingGraphics = value
        if isReducingGraphics then
            while isReducingGraphics do
                optimizeFpsPing()
                task.wait()
            end
        end
    end    
})


local FarmTab = Window:MakeTab({
	Name = "Teleportar",
	Icon = "rbxassetid://103168823763561",
	PremiumOnly = false
})

local Section = FarmTab:AddSection({
	Name = "Áreas Para Teleportar"
})


FarmTab:AddDropdown({
	Name = "Selecionar Área Para Teleportar",
	Default = nil,
	Options = {"Main City", "Snow City", "Magma City", "Legends Highway"},
	Callback = function(Value)
		SelectCity(Value)
	end    
})


local FarmTab = Window:MakeTab({
	Name = "Farmar",
	Icon = "rbxassetid://78744214847458",
	PremiumOnly = false
})

local Section = FarmTab:AddSection({
	Name = "Farmar Aros"
})

FarmTab:AddToggle({
	Name = "Aros V1",
	Default = false,
	Callback = function(Value)
		getgenv().Hoop = Value
        while Hoop do
            HoopFarm()
            task.wait()
        end
	end    
})

FarmTab:AddToggle({
	Name = "Aros V2",
	Default = false,
	Callback = function(Value)
		getgenv().HoopV2 = Value
        while HoopV2 do
            HoopFarmV2()
            task.wait()
        end
	end    
})


local FarmTab = Window:MakeTab({
	Name = "Renascimentos",
	Icon = "rbxassetid://124658295933505",
	PremiumOnly = false
})

local Section = FarmTab:AddSection({
	Name = "Renascimentos Automáticos"
})


FarmTab:AddToggle({
	Name = "Auto Renascimento (ative apenas se for renascer)",
	Default = false,
	Callback = function(Value)
		getgenv().AutoRebirth = Value
        while AutoRebirth do
            Rebirth()
            task.wait()
        end
	end    
})

local FarmTab = Window:MakeTab({
	Name = "Corridas",
	Icon = "rbxassetid://97860628277392",
	PremiumOnly = false
})

local Section = FarmTab:AddSection({
	Name = "Corridas Automáticas"
})

FarmTab:AddToggle({
    Name = "Corridas Automáticas",
    Default = false,
    Callback = function(Value)
        ToggleAutoRaces(Value)
    end    
})

FarmTab:AddToggle({
    Name = "Bloquear Corridas (V-BETA)",
    Default = false,
    Callback = function(Value)
        ToggleAutoRacesSolo(Value)
    end    
})

local FarmTab = Window:MakeTab({
	Name = "Créditos",
	Icon = "rbxassetid://96062201354965",
	PremiumOnly = false
})

local Section = FarmTab:AddSection({
	Name = "V-BETA | FeHari Hub Trial Apenas Para Corridas!"
})

HaridadeLib:MakeNotification({
	Name = "Atenção!",
	Content = "Esta É Uma Versão Teste Do FeHari Hub!",
	Image = "rbxassetid://114376238948933",
	Time = 22
})

HaridadeLib:MakeNotification({
	Name = "FEHARI HUB",
	Content = "discord.gg/uydz6pZWMk",
	Image = "rbxassetid://101951842185056",
	Time = 20
})

HaridadeLib:MakeNotification({
	Name = "BYPASS ANTI-DETECTAÇÃO",
	Content = "Bypass Ativo! ✅",
	Image = "rbxassetid://71506531582407",
	Time = 18
})

HaridadeLib:Init()
