local settingsfile = "adminsettings.txt"
local player = game.Players.LocalPlayer
local HttpService = game:GetService("HttpService")

if isfile(settingsfile) then
    getgenv().settings = HttpService:JSONDecode(readfile(settingsfile))
else
    getgenv().settings = {
        infjump = false,
        speed = false,
        gravity = false,
        jumppower = false,
        tpwalk = false

    }
end

local settings = getgenv().settings

local speedthing = settings.speed

local infjump = settings.infjump
local gravity = settings.gravity
local jumppower = settings.jumppower
local tpwalk = settings.tpwalk

local json = HttpService:JSONEncode(settings)

local function save()
    local json = HttpService:JSONEncode(settings)
    writefile(settingsfile, json)
end

local notinfjump = ";infjump false"
game.Players.LocalPlayer.Chatted:Connect(function(message)
    if message == notinfjump then
        settings.infjump = false
    end
end)
local infjumpcmd = ";infjump"
game.Players.LocalPlayer.Chatted:Connect(function(message)
    if message == infjumpcmd then
        settings.infjump = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if settings.infjump then
                game:GetService "Players".LocalPlayer.Character:FindFirstChildOfClass 'Humanoid':ChangeState("Jumping")
            end
        end)
    end
end)
local unspeed = ";speed false"
speedcmd = ";speed"

player.Chatted:Connect(function(message)
    if message == unspeed then
        settings.speed = false
    elseif message == speedcmd then
        settings.speed = true
        player.Character.Humanoid.WalkSpeed = 50
        while wait() do
            if settings.speed == false then
                player.Character.Humanoid.WalkSpeed = 16
            end
        end
    end
end)

local nogravity = ";gravity false"
local gravitycmd = ";gravity"
player.Chatted:Connect(function(message)
    if message == nogravity then
        settings.gravity = false
    elseif message == gravitycmd then
        settings.gravity = true
        if settings.gravity == true then
            workspace.Gravity = 0.000000000001
        end
    end
    while wait() do
        if settings.gravity == false then
            workspace.Gravity = 150
        end
    end
end)
local nojumppower = ";jumppower false"
local jumppowercmd = ";jumppower"

player.Chatted:Connect(function(message)
    if message == nojumppower then
        settings.jumppower = false
    elseif message == jumppowercmd then
        settings.jumppower = true
        player.Character.Humanoid.JumpHeight = 65
    end
    while wait() do
        if settings.jumppower == false then
            player.Character.Humanoid.JumpHeight = 5.19
        end
    end

end)

local nameprotectcmd = ";nameprotect"

player.Chatted:Connect(function(message)
    if message == nameprotectcmd then
        player.Name = "Player"
        player.DisplayName = "player"
    end
end)

local discordcmd = ";DC"

player.Chatted:Connect(function(message)
    if message == discordcmd then
        setclipboard("https://discord.gg/uq2u9fJWfF")
    end
end)

local tpwalkcmd = ";tpwalk"
local notptalk = ";tpwalk false"

player.Chatted:Connect(function(message)
    if message == notptalk then
        settings.tpwalk = false
    elseif message == tpwalkcmd then
        local Speed = 5

        settings.tpwalk = true

        local You = game.Players.LocalPlayer.Name
        local UIS = game:GetService("UserInputService")

        while settings.tpwalk == true do
            if UIS:IsKeyDown(Enum.KeyCode.W) then
                game:GetService("Workspace")[You].HumanoidRootPart.CFrame =
                    game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0, 0, -Speed)
            end
            if UIS:IsKeyDown(Enum.KeyCode.A) then
                game:GetService("Workspace")[You].HumanoidRootPart.CFrame =
                    game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(-Speed, 0, 0)
            end
            if UIS:IsKeyDown(Enum.KeyCode.S) then
                game:GetService("Workspace")[You].HumanoidRootPart.CFrame =
                    game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0, 0, Speed)
            end
            if UIS:IsKeyDown(Enum.KeyCode.D) then
                game:GetService("Workspace")[You].HumanoidRootPart.CFrame =
                    game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(Speed, 0, 0)
            end
            wait()
        end
    end
end)

player.Chatted:Connect(function(message)

    local Arguments = message:split(" ")

    if Arguments[1]:lower() == ";tp" then
        if Arguments[2] then
            for i, v in pairs(player.Parent:GetChildren()) do

                if Arguments[2]:lower() == v.name or v.DisplayName then
                    player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end
end)

local supprotcmd = ";support"

player.Chatted:Connect(function(message)
    if message == supprotcmd then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Support",
            Text = "Need Any support? type ;DC to copy an invite to our discord server!",
            Duration = 10
        })
    end
end)

player.Chatted:Connect(function(message)

end)

local savecmd = ";save"

player.Chatted:Connect(function(message)
    if savecmd == ";save" then

        save()
    end
end)

while wait() do

    game:GetService("UserInputService").JumpRequest:connect(function()
        if settings.infjump then
            game:GetService "Players".LocalPlayer.Character:FindFirstChildOfClass 'Humanoid':ChangeState("Jumping")

        end
    end)

    if settings.gravity == true then
        workspace.Gravity = 0.000000000001
    end

    if settings.gravity then

        player.Character.Humanoid.JumpHeight = 65

    end

    if settings.speed then
        player.Character.Humanoid.WalkSpeed = 50
    end

    task.wait()
    local Speed = 5

    local You = game.Players.LocalPlayer.Name
    local UIS = game:GetService("UserInputService")

    while settings.tpwalk == true do
        if UIS:IsKeyDown(Enum.KeyCode.W) then
            game:GetService("Workspace")[You].HumanoidRootPart.CFrame =
                game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0, 0, -Speed)
        end
        if UIS:IsKeyDown(Enum.KeyCode.A) then
            game:GetService("Workspace")[You].HumanoidRootPart.CFrame =
                game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(-Speed, 0, 0)
        end
        if UIS:IsKeyDown(Enum.KeyCode.S) then
            game:GetService("Workspace")[You].HumanoidRootPart.CFrame =
                game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0, 0, Speed)
        end
        if UIS:IsKeyDown(Enum.KeyCode.D) then
            game:GetService("Workspace")[You].HumanoidRootPart.CFrame =
                game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(Speed, 0, 0)
        end
        wait()
    end

end
