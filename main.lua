game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Kershy Admin",
    Text = "hello! welcome to Kershy Admin, please join our discord server for a list of cmds, support, and to report bugs! ( invite has been copied )",
    Duration = 10
})
setclipboard("https://discord.gg/uq2u9fJWfF")

local player = game.Players.LocalPlayer

getgenv().settings = {

    infjump = false,
    speed = false,
    gravity = false,
    jumppower = false

}
local settings = getgenv().settings
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

