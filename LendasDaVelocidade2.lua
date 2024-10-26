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
        while orbCollect do
            for _, orb in pairs({
                {"Red Orb", "Legends Highway"},
                {"Yellow Orb", "Legends Highway"},
                {"Gem", "Legends Highway"},
                {"Red Orb", "Snow City"},
                {"Yellow Orb", "Snow City"},
                {"Gem", "Snow City"},
                {"Red Orb", "City"},
                {"Yellow Orb", "City"},
                {"Gem", "City"},
                {"Red Orb", "Magma City"},
                {"Gem", "Magma City"}
            }) do
                -- Chamadas simultâneas
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", orb[1], orb[2])
            end
            -- Minimizar o tempo de espera para aumentar a velocidade
            task.wait(0.001) -- Ajuste se necessário
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





local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Demonnic Hub | Legends Of Speed ⚡", HidePremium = false, IntroEnabled = false, SaveConfig = true, ConfigFolder = "LoSH"})


OrionLib:MakeNotification({
	Name = "Demonnic Hub",
	Content = "discord.gg/uydz6pZWMk",
	Image = "rbxassetid://101951842185056",
	Time = 20
})

OrionLib:MakeNotification({
	Name = "Credits",
	Content = "Script made by: Demonnic_Alexg",
	Image = "rbxassetid://71506531582407",
	Time = 20
})


local AutoFarm = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://100789040568622",
	PremiumOnly = false
})

AutoFarm:AddToggle({
	Name = "Collect Orbs",
	Default = false,
	Callback = function(Value)
		orbCollect = Value
        orbCollecter()
	end    
})

AutoFarm:AddToggle({
	Name = "Hoop V1",
	Default = false,
	Callback = function(Value)
		hoopTP = Value
        hoopTPer()
	end    
})

AutoFarm:AddToggle({
	Name = "Auto Best Pet",
	Default = false,
	Callback = function(Value)
		eggOpen = Value
        eggOpener()
	end    
})


local AutoFarm = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://103168823763561",
	PremiumOnly = false
})

local Section = AutoFarm:AddSection({
	Name = "City Teleports"
})


FarmTab:AddDropdown({
	Name = "Teleports",
	Default = nil,
	Options = {"Main City", "Snow City", "Magma City", "Legends Highway"},
	Callback = function(Value)
		SelectCity(Value)
	end    
})

local AutoFarm = Window:MakeTab({
	Name = "Farm",
	Icon = "rbxassetid://78744214847458",
	PremiumOnly = false
})

local Section = AutoFarm:AddSection({
	Name = "Hoop Farm"
})

AutoFarm:AddToggle({
	Name = "Hoops V1",
	Default = false,
	Callback = function(Value)
		getgenv().Hoop = Value
        while Hoop do
            HoopFarm()
            task.wait()
        end
	end    
})

AutoFarm:AddToggle({
	Name = "Hoops V2",
	Default = false,
	Callback = function(Value)
		getgenv().HoopV2 = Value
        while HoopV2 do
            HoopFarmV2()
            task.wait()
        end
	end    
})

local AutoFarm = Window:MakeTab({
	Name = "Auto Rebirth",
	Icon = "rbxassetid://124658295933505",
	PremiumOnly = false
})

AutoFarm:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		autoRebirth = Value
        autoRebirther()
	end    
})

local AutoFarm = Window:MakeTab({
	Name = "Race",
	Icon = "rbxassetid://97860628277392",
	PremiumOnly = false
})

local Section = AutoFarm:AddSection({
	Name = "Auto Race"
})

FarmTab:AddToggle({
    Name = "Auto Race",
    Default = false,
    Callback = function(Value)
        ToggleAutoRaces(Value)
    end    
})

FarmTab:AddToggle({
    Name = "Race Block (BETA)",
    Default = false,
    Callback = function(Value)
        ToggleAutoRacesSolo(Value)
    end    
})

local AutoFarm = Window:MakeTab({
	Name = "Extra",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

AutoFarm:AddButton({
    Name = "Suicid",
    Callback = function()
        LocalPlayer.Character:WaitForChild("Humanoid").Health = 0
    end    
})

AutoFarm:AddButton({
	Name = "Remove Race Start Barriers",
	Callback = function()
      	deleteBarrier()
  	end    
})

AutoFarm:AddButton({
	Name = "Rejoin Game",
	Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
  	end    
})

 OrionLib:Init()
