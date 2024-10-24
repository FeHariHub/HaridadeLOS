getgenv().orbCollect = false
getgenv().Speedster = false
getgenv().Jump = false
getgenv().autoRebirth = false
getgenv().eggOpen = false
getgenv().hoopTP = false



--Anti AFK
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

--Anti Slip
spawn(function()
    spawn(function()
        while wait() do
            game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        end
    end)
    while task.wait(1) do
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyGyro") then
                Instance.new("BodyGyro", game.Players.LocalPlayer.Character.HumanoidRootPart)
            end
        end
    end
end)



--Death Freeze Fix
spawn(function()
    while task.wait() do
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health == 0 then
            repeat
                game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation = Vector3.new(0, 0, 0)
            until (game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0)
        end
    end
end)



--Delete Barriers

function deleteBarrier()
    spawn(function()
        for i, v in pairs(game:GetService("Workspace").raceMaps.Grassland.boundaryParts:GetChildren()) do
            v:Destroy()
        end

        for i, v in pairs(game:GetService("Workspace").raceMaps.Desert.boundaryParts:GetChildren()) do
            v:Destroy()
        end

        for i, v in pairs(game:GetService("Workspace").raceMaps.Magma.boundaryParts:GetChildren()) do
            v:Destroy()
        end
    end)
end

--Orb Remote Spam
function orbCollecter()
    spawn(function()
        while task.wait() do
            if not orbCollect then break end

            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "Legends Highway")
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "Legends Highway")
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Gem", "Legends Highway")

            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "Snow City")
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "Snow City")
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Gem", "Snow City")

            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "City")
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "City")
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Gem", "City")

            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "Magma City")
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "Magma City")
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Gem", "Magma City")
        end
    end)
end



--Change Speed and Jump Height
function setSpeed(ws)
    spawn(function()    
        while task.wait() do
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ws
            end
        end
    end)
end

function setJump(jp)
    spawn(function()
        while task.wait() do
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = jp
            end
        end
    end)
end


--Auto Rebirth
function autoRebirther()
    spawn(function()
        while task.wait() do
            if not autoRebirth then
                break
            end
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
        end
    end)
end



--Makes as many Evolved Ultimate Overdrive Bunnies as possible *costs gems*
function eggOpener()
    spawn(function()
        while task.wait() do
            if not eggOpen then
                break
            end
            --Egg Open
            game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal",
                "Electro Legends Crystal")

            --Deletes if not Ultimate Overdrive Bunny
            spawn(function()
                game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer("sellPet",
                    game:GetService("Players").LocalPlayer.petsFolder.Omega["Hypersonic Pegasus"])
            end)

            spawn(function()
                game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer("sellPet",
                    game:GetService("Players").LocalPlayer.petsFolder.Omega["Dark Soul Birdie"])
            end)

            spawn(function()
                game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer("sellPet",
                    game:GetService("Players").LocalPlayer.petsFolder.Omega["Eternal Nebula Dragon"])
            end)

            spawn(function()
                game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer("sellPet",
                    game:GetService("Players").LocalPlayer.petsFolder.Omega["Shadows Edge Kitty"])
            end)

            spawn(function()
                game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer("sellPet",
                    game:GetService("Players").LocalPlayer.petsFolder.Omega["Soul Fusion Dog"])
            end)

            --Combines Bunnies

            spawn(function()
                game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer("evolvePet",
                    "Ultimate Overdrive Bunny")
            end)
        end
    end)
end



--Locally teleports every hoop in the game to your player to get rewards multiple times a second
function hoopTPer()
    spawn(function()
        while task.wait() do
            if not hoopTP then break end
            for i, v in pairs(game:GetService("Workspace").Hoops:GetChildren()) do
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end)
end





local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/FeHariHub/HaridadeLOS/main/Scripts.lua')))()
local Window = OrionLib:MakeWindow({Name = "FeHariV7 Hub | Lendas Da Velocidade ⚡", HidePremium = false, IntroEnabled = false, SaveConfig = true, ConfigFolder = "LoSH"})


OrionLib:MakeNotification({
	Name = "Bem-Vindo(a)",
	Content = "Script Carregado com Sucesso.",
	Image = "rbxassetid://111462827396918",
	Time = 5
})


local AutoFarm = Window:MakeTab({
	Name = "Farming",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

AutoFarm:AddToggle({
	Name = "Orb Collecter *may cause issues*",
	Default = false,
	Callback = function(Value)
		orbCollect = Value
        orbCollecter()
	end    
})

AutoFarm:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		autoRebirth = Value
        autoRebirther()
	end    
})

AutoFarm:AddToggle({
	Name = "Hoop Bring",
	Default = false,
	Callback = function(Value)
		hoopTP = Value
        hoopTPer()
	end    
})

AutoFarm:AddToggle({
	Name = "Auto Best Pet *drains gems*",
	Default = false,
	Callback = function(Value)
		eggOpen = Value
        eggOpener()
	end    
})


local Teleports = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Misc = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Misc:AddSlider({
	Name = "Speed",
	Min = 150,
	Max = 10000,
	Default = 1000,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "ws",
	Callback = function(Value)
		setSpeed(Value)
	end         
})

Misc:AddSlider({
	Name = "Jump Height",
	Min = 50,
	Max = 1500,
	Default = 200,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "jp",
	Callback = function(Value)
		setJump(Value)
	end    
})

Misc:AddButton({
	Name = "Remove Race Start Barriers",
	Callback = function()
      	deleteBarrier()
  	end    
})

Misc:AddButton({
	Name = "Re-join",
	Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
  	end    
})

 OrionLib:Init()
