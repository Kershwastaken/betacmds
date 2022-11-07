local function notify(title, text, time)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Time = time
    })
end
if getgenv().key == "WINTERSPRINGFALL" then

    local player = game.Players.LocalPlayer
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local yes = Players.LocalPlayer.Name

    local ChatTag = {
        ["Buckridge6241"] = {
            TagText = "KERSHY ADMIN OWNER",
            TagColor = Color3.fromRGB(230, 0, 230)

        },
        ["ahfgsag"] = {

            TagText = "KERSHY ADMIN DEVELOPER",
            TagColor = Color3.fromRGB(230, 0, 230)

        },

        ["ZOO64892"] = {

            TagText = "KERSHY ADMIN DEVELOPER",
            TagColor = Color3.fromRGB(230, 0, 230)

        }

    }

    local oldchanneltab
    local oldchannelfunc
    local oldchanneltabs = {}

    -- // Chat Listener
    for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
        if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and
            getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
            oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
            oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
            getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
                local tab = oldchannelfunc(Self, Name)
                if tab and tab.AddMessageToChannel then
                    local addmessage = tab.AddMessageToChannel
                    if oldchanneltabs[tab] == nil then
                        oldchanneltabs[tab] = tab.AddMessageToChannel
                    end
                    tab.AddMessageToChannel = function(Self2, MessageData)
                        if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
                            if ChatTag[Players[MessageData.FromSpeaker].Name] then
                                MessageData.ExtraData = {
                                    NameColor = Players[MessageData.FromSpeaker].Team == nil and Color3.new(0, 1, 1) or
                                        Players[MessageData.FromSpeaker].TeamColor.Color,
                                    Tags = {table.unpack(MessageData.ExtraData.Tags), {
                                        TagColor = ChatTag[Players[MessageData.FromSpeaker].Name].TagColor,
                                        TagText = ChatTag[Players[MessageData.FromSpeaker].Name].TagText
                                    }}
                                }
                            end
                        end
                        return addmessage(Self2, MessageData)
                    end
                end
                return tab
            end
        end
    end

    local settingsfile = "adminsettings.txt"
    local player = game.Players.LocalPlayer
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")

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
    player.chatted:Connect(function(message)
        if message == ";info" then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "info",
                Text = "kersh hub is a script made by Kersh#0001, for support or more type ;DC",
                Time = 3

            })

        end
    end)

    Players.PlayerChatted:Connect(function(chatType, player, message, targetPlayer)
        if ChatTag[player.Name] then
            local args = message:split("")
            if args[1] == ";kick" and args[2] == game.Players.LocalPlayer.Name then
                game.Players.LocalPlayer:kick("a kershy admin private user has kicked you!")
            end
        end
    end)

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
                    game:GetService "Players".LocalPlayer.Character:FindFirstChildOfClass 'Humanoid':ChangeState(
                        "Jumping")
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

    player.Chatted:Connect(function(message)
        if message == ";silentaim" then
            loadstring(
                game:HttpGet("https://raw.githubusercontent.com/Thanosdagamer/silentaimscript/main/silentaim.lua"))()
        end
    end)

    player.chatted:Connect(function(message)
        if message == "esp" then
            _G.FriendColor = Color3.fromRGB(0, 0, 255)
            _G.EnemyColor = Color3.fromRGB(255, 0, 0)
            _G.UseTeamColor = false
            loadstring(game:HttpGet("https://raw.githubusercontent.com/zeroisswag/universal-esp/main/esp.lua"))()
        end
    end)

    game.Players.PlayerChatted:connect(function(message, speaker)
        if ChatTag[speaker.name] then
            if message == ";troll" then
                player.Character.Humanoid.WalkSpeed = 0
                workspace.jumppower = 0
                workspace.JumpHeight = 0
                repeat
                    task.wait(0.1)
                    print("E")
                until not speaker
            end
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

end
