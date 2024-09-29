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

--// Haridade Script \\--
local HaridadeLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/FeHari/HaridadeScript/main/LegendsOfSpeed.lua')))()
local Window = HaridadeLib:MakeWindow({Name = "Haridade | Legends Of Speed ⚡", HidePremium = false, SaveConfig = true, ConfigFolder = "HaridadeTest"})

local FarmTab = Window:MakeTab({
	Name = "Início",
	Icon = "rbxassetid://112625488111718",
	PremiumOnly = false
})


local FarmTab = FarmTab:AddSection({
	Name = "Utilitários"
})


FarmTab:AddButton({
    Name = "Diminuir Os Gráficos Do Jogo",
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

FarmTab:AddSlider({
    Name = "Velocidade Do Personagem",  -- Nome exibido na interface para o slider
    Min = 10000,                          -- Valor mínimo do slider
    Max = 10000,                       -- Valor máximo do slider
    Default = 16,                      -- Valor padrão inicial do slider
    Color = Color3.fromRGB(255, 255, 255),  -- Cor do slider
    Increment = 10,                    -- Incremento do slider
    ValueName = "Velocidade (fixo)",           -- Nome exibido ao lado do valor
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end    
})


local FarmTab = Window:MakeTab({
	Name = "Teleportar",
	Icon = "rbxassetid://109334924659404",
	PremiumOnly = false
})

local Section = FarmTab:AddSection({
	Name = "Áreas Para Teleportar"
})


FarmTab:AddDropdown({
	Name = "Selecionar Cidade Para Teleportar",
	Default = nil,
	Options = {"Main City", "Snow City", "Magma City", "Legends Highway"},
	Callback = function(Value)
		SelectCity(Value)
	end    
})


local FarmTab = Window:MakeTab({
	Name = "Farmar",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = FarmTab:AddSection({
	Name = "Farmar Automático"
})


FarmTab:AddDropdown({
	Name = "Áreas Para Farmar",
	Default = nil,
	Options = {"Main City", "Snow City", "Magma City", "Legends Highway"},
	Callback = function(Value)
		AreaToFarm = Value
    if AreaToFarm == "Main City" then 
        getgenv().MainCity = true
        getgenv().Snow = false
        getgenv().Magma = false
        getgenv().LegendsHighway = false
        CityFarm()
    elseif AreaToFarm == "Snow City" then
        getgenv().MainCity = false
        getgenv().Snow = true
        getgenv().Magma = false
        getgenv().LegendsHighway = false
        SnowFarm()
    elseif AreaToFarm == "Magma City" then
        getgenv().MainCity = false
        getgenv().Snow = false
        getgenv().Magma = true
        getgenv().LegendsHighway = false
        MagmaFarm()
    elseif AreaToFarm == "Legends Highway" then
        getgenv().MainCity = false
        getgenv().Snow = false
        getgenv().Magma = false
        getgenv().LegendsHighway = true
        LegendsHighwayFarm()
    end
end    
})

FarmTab:AddDropdown({
	Name = "Selecione a Orb",
	Default = nil,
	Options = {"Yellow Orb", "Orange Orb", "Blue Orb", "Red Orb", "Gemas"},
	Callback = function(Value)
		AreaToFarm = Value
    if AreaToFarm == "Main City" then 
        getgenv().MainCity = true
        getgenv().Snow = false
        getgenv().Magma = false
        getgenv().LegendsHighway = false
        CityFarm()
    elseif AreaToFarm == "Snow City" then
        getgenv().MainCity = false
        getgenv().Snow = true
        getgenv().Magma = false
        getgenv().LegendsHighway = false
        SnowFarm()
    elseif AreaToFarm == "Magma City" then
        getgenv().MainCity = false
        getgenv().Snow = false
        getgenv().Magma = true
        getgenv().LegendsHighway = false
        MagmaFarm()
    elseif AreaToFarm == "Legends Highway" then
        getgenv().MainCity = false
        getgenv().Snow = false
        getgenv().Magma = false
        getgenv().LegendsHighway = true
        LegendsHighwayFarm()
    end
end    
})

FarmTab:AddDropdown({
	Name = "Selecine a Velocidade",
	Default = nil,
	Options = {"x50", "x75", "x100", "x125", "x150", "x175", "x200", "x250", "x300"},
	Callback = function(Value)
		AreaToFarm = Value
    if AreaToFarm == "Main City" then 
        getgenv().MainCity = true
        getgenv().Snow = false
        getgenv().Magma = false
        getgenv().LegendsHighway = false
        CityFarm()
    elseif AreaToFarm == "Snow City" then
        getgenv().MainCity = false
        getgenv().Snow = true
        getgenv().Magma = false
        getgenv().LegendsHighway = false
        SnowFarm()
    elseif AreaToFarm == "Magma City" then
        getgenv().MainCity = false
        getgenv().Snow = false
        getgenv().Magma = true
        getgenv().LegendsHighway = false
        MagmaFarm()
    elseif AreaToFarm == "Legends Highway" then
        getgenv().MainCity = false
        getgenv().Snow = false
        getgenv().Magma = false
        getgenv().LegendsHighway = true
        LegendsHighwayFarm()
    end
end    
})

FarmTab:AddToggle({
	Name = "Diminuir o Ping (não faz milagre)",
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
	Name = "Farmar Orbs (BETA)",
	Default = false,
	Callback = function(Value)
    Autofarm = Value
    if Value then
        if AreaToFarm == "Main City" then
            CityFarm()
        elseif AreaToFarm == "Snow City" then
            SnowFarm()
        elseif AreaToFarm == "Magma City" then
            MagmaFarm()
        elseif AreaToFarm == "Legends Highway" then
            LegendsHighwayFarm()
        end
    end 
end
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
	Name = "Renascimento",
	Icon = "rbxassetid://121663556703347",
	PremiumOnly = false
})

local Section = FarmTab:AddSection({
	Name = "Auto Renascimento"
})


FarmTab:AddToggle({
	Name = "Auto Renascimento (ative apenas se for renascer AFK)",
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
	Name = "Auto Corridas",
	Icon = "rbxassetid://72430981170529",
	PremiumOnly = false
})

local Section = FarmTab:AddSection({
	Name = "Corridas Automáticas"
})

FarmTab:AddToggle({
    Name = "Auto Corridas",
    Default = false,
    Callback = function(Value)
        ToggleAutoRaces(Value)
    end    
})

FarmTab:AddButton({
    Name = "Bloquear Corridas (permamente)", -- Nome exibido para o botão
    Default = false,
    Callback = function(Value)
        -- Chama a função ToggleAutoRacesSolo com o valor desejado
        ToggleAutoRacesSolo(Value) -- Aqui você define o valor que deseja passar
    end    
})


local FarmTab = Window:MakeTab({
	Name = "Comprar Pets",
	Icon = "rbxassetid://95145057413711",
	PremiumOnly = false
})

local Section = FarmTab:AddSection({
	Name = "Comprar Pets Automáticamente"
})

local Crystal1

FarmTab:AddDropdown({
	Name = "Escolha O Cristal",
	Default = nil,
	Options = Crystals,
	Callback = function(Value)
        Crystal1 = Value
	end    
})

FarmTab:AddToggle({
	Name = "Comprar Pets Automáticamente (necessita de gemas)",
	Default = false,
	Callback = function(Value)
        getgenv().OpenEgg = Value
        while getgenv().OpenEgg do
            if Crystal1 then
                Egg(Crystal1)  
            end
            task.wait()
        end
	end    
})


local FarmTab = Window:MakeTab({
	Name = "Créditos",
	Icon = "rbxassetid://96062201354965",
	PremiumOnly = false
})

HaridadeLib:MakeNotification({
	Name = "Haridade Community",
	Content = "discord.gg/uydz6pZWMk",
	Image = "rbxassetid://101951842185056",
	Time = 20
})

HaridadeLib:MakeNotification({
	Name = "BYPASS ANTI-DETECTAÇÃO",
	Content = "ByPass Ativo... ✅",
	Image = "rbxassetid://71506531582407",
	Time = 20
})

HaridadeLib:Init()
