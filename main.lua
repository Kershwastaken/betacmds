local player = game.Players.LocalPlayer

getgenv().settings = {

    infjump = false,
    speed = false,
    gravity = false

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
            player.Character.Humanoid.gravity = 0.000000000001
        end
    end
    while wait() do
        if settings.gravity == false then
            player.Character.Humanoid.gravity = 150
        end
    end
end)
