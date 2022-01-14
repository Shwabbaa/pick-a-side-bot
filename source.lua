
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local memer = Instance.new("TextLabel")
local Red = Instance.new("TextButton")
local Blue = Instance.new("TextButton")
local RedCount = Instance.new("TextLabel")
local BlueCount = Instance.new("TextLabel")
local VSText = Instance.new("TextLabel")

local Pause = Instance.new("TextButton")

local globalChoice = -1

local paused = false

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
Frame.BackgroundTransparency = 0.25
Frame.BorderSizePixel = 3
Frame.Position = UDim2.new(0.80, 0, 0.75, 0)
Frame.Size = UDim2.new(0, 300, 0, 200)

Pause.Name = "Pause"
Pause.Parent = Frame
Pause.Active = false
Pause.BackgroundColor3 = Color3.new(1, 0, 1)
Pause.BackgroundTransparency = 0.54
Pause.Position = UDim2.new(0.815, 0, 0.1, 0)
Pause.Size = UDim2.new(0, 50, 0, 15)
Pause.Font = Enum.Font.SourceSans
Pause.Text = "Pause"
Pause.TextColor3 = Color3.new(0, 0, 0)
Pause.TextSize = 14
Pause.TextWrapped = true

Red.Name = "Red"
Red.Parent = Frame
Red.Active = false
Red.BackgroundColor3 = Color3.new(1, 0, 0)
Red.BackgroundTransparency = 0.54
Red.Position = UDim2.new(0.048, 0, 0.1, 0)
Red.Size = UDim2.new(0, 225, 0, 70)
Red.Font = Enum.Font.SourceSans
Red.Text = "Waiting for choice..."
Red.TextColor3 = Color3.new(0, 0, 0)
Red.TextSize = 14
Red.TextWrapped = true

Blue.Name = "Blue"
Blue.Parent = Frame
Blue.Active = false
Blue.BackgroundColor3 = Color3.new(0, 0, 1)
Blue.BackgroundTransparency = 0.54
Blue.Position = UDim2.new(0.048, 0, 0.575, 0)
Blue.Size =  UDim2.new(0, 225, 0, 70)
Blue.Font = Enum.Font.SourceSans
Blue.Text = "Waiting for choice..."
Blue.TextColor3 = Color3.new(0, 0, 0)
Blue.TextSize = 14

RedCount.Name = "RedCount"
RedCount.Parent = Frame
RedCount.BackgroundColor3 = Color3.new(1, 1, 1)
RedCount.BackgroundTransparency = 1
RedCount.Position = UDim2.new(0.56, 0, 0.15, 0)
RedCount.Size = UDim2.new(0, 200, 0, 50)
RedCount.Font = Enum.Font.SourceSans
RedCount.Text = "???"
RedCount.TextColor3 = Color3.new(0, 0, 0)
RedCount.TextSize = 24


BlueCount.Name = "BlueCount"
BlueCount.Parent = Frame
BlueCount.BackgroundColor3 = Color3.new(1, 1, 1)
BlueCount.BackgroundTransparency = 1
BlueCount.Position = UDim2.new(0.56, 0, 0.60, 0)
BlueCount.Size = UDim2.new(0, 200, 0, 50)
BlueCount.Font = Enum.Font.SourceSans
BlueCount.Text = "???"
BlueCount.TextColor3 = Color3.new(0, 0, 0)
BlueCount.TextSize = 24

VSText.Name = "VSText"
VSText.Parent = Frame
VSText.BackgroundColor3 = Color3.new(1, 1, 1)
VSText.BackgroundTransparency = 1
VSText.Position = UDim2.new(0.56, 0, 0.375, 0)
VSText.Size = UDim2.new(0, 200, 0, 50)
VSText.Font = Enum.Font.SourceSans
VSText.Text = "vs"
VSText.TextColor3 = Color3.new(0, 0, 0)
VSText.TextSize = 24


function getplayer(String)
    local plrs = {}
    local strl = String:lower()
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(plrs,v)
            end
        end    
    return plrs    
end

function asdjiadaoidjasd()
	getfenv().script = Instance.new('LocalScript', ScreenGui)
		for _,v in ipairs(script.Parent:GetDescendants()) do
			if not v:IsA("LocalScript") then
			v.Draggable = true
		end
	end

end
coroutine.resume(coroutine.create(asdjiadaoidjasd))

Red.MouseButton1Click:connect(function()
    globalChoice = 1
end
)

Blue.MouseButton1Click:connect(function()
    globalChoice = 0
end
)

Pause.MouseButton1Click:connect(function()
    if paused then
    paused = false
    Pause.Text = "Pause"
    else 
    paused = true
    Pause.Text = "Resume"
    end
end
)

--PAS Grind by Shwabbaa (OPEN SOURCE!!!!)

local Players = game:GetService("Players")
local player = Players.LocalPlayer


function getRoot(char)
   local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
   return rootPart
end

local potentialTargets = {}

function getTarget()

    local Character = player.Character
    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    if not (Character or HumanoidRootPart) then return nil end

    local TargetDistance = math.huge
    local Target = nil

    for i,v in ipairs(potentialTargets) do
        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local TargetHRP = v.Character.HumanoidRootPart
            local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
            if mag < TargetDistance then
                TargetDistance = mag
                Target = v
            end
        end
    end

    return Target
end

function grabTargets()

    if potentialTargets ~= nil then
        for k in pairs (potentialTargets) do
            potentialTargets [k] = nil
        end
    end 

   for _,player2 in pairs(Players:GetPlayers()) do
      if player2.Team ~= nil and player.Team ~= player2.Team then
         table.insert(potentialTargets, player2)
         break
      end
   end
end



delay(0, function()
while true do

   grabTargets()

   wait(1)
end
end)

local block = false

delay(0,function()

    while wait() do
    Red.Text = game:GetService("Workspace").Red.Screen.Gui.Title.Text
    Blue.Text = game:GetService("Workspace").Blue.Screen.Gui.Title.Text

    local allNeutral = true

    for _,player2 in pairs(Players:GetPlayers()) do
        if player2.Team ~= nil then
            allNeutral = false
            break
        end
    end

    local blue = 0
    local red = 0

    if allNeutral then
        for i,v in ipairs(Players:GetPlayers()) do

            if v.Character ~= nil and v.Character.HumanoidRootPart ~= nil then
                local TargetHRP = v.Character.HumanoidRootPart
                local pos = TargetHRP.Position

                if pos.Z > -40 then
                    
                if pos.X > 30 then -- blue
                    blue = blue + 1
                elseif pos.X < -30 then -- red
                    red = red + 1
                end

                end
            end



        end
    else
        for i,v in ipairs(Players:GetPlayers()) do

            if v ~= nil then

                if v.Team ~= nil then
                    if tostring(v.Team) == "Red" then
                        red = red + 1
                    elseif tostring(v.Team) == "Blue" then
                        blue = blue + 1
                    end
                end

            end


        end
    end

    RedCount.Text = red
    BlueCount.Text = blue

end

end)

while wait() do

    if not paused then
        if player.Team == nil then

            local allNeutral = true

            for _,player2 in pairs(Players:GetPlayers()) do
                if player2.Team ~= nil then
                    allNeutral = false
                    break
                end
            end

            if allNeutral then


                if not block then
                    block = true

                    local loa = true

                    delay(22, function()
                    loa = false

                    if player.Character:FindFirstChildOfClass('Humanoid') ~= nil then

                    player.Character:WaitForChild("Humanoid").Jump = true

                    local origin = Vector3.new(0, 4, 0)

                    player.Character:FindFirstChildOfClass('Humanoid'):MoveTo(origin)

                    end
                    wait(14)

                    local red = 0
                    local blue = 0

                    for i,v in ipairs(Players:GetPlayers()) do
                        local TargetHRP = v.Character.HumanoidRootPart

                        if v.Character ~= nil and v.Character.HumanoidRootPart ~= nil  then
                            local pos = TargetHRP.Position

                            if pos.Z > -40 then
                                
                            if pos.X > 30 then -- blue
                                blue = blue + 1
                            elseif pos.X < -30 then -- red
                                red = red + 1
                            end
                        end



                        end

                    end


                    local choice = globalChoice
					
					
                    if choice == -1 then
                        if red == 0 then
                            choice = 1
                        elseif blue == 0 then
                            choice = 0
                        else
                            if red > blue then
                                choice = 1
                            elseif red < blue then
                                choice = 0
                            else
                                choice = math.random(0,1)
                            end
                        end
                    end
					
					globalChoice = -1

                    local lol

                    if choice == 0 then
                    lol = Vector3.new(50, 4, 0)
                    else
                    lol = Vector3.new(-50, 4, 0)
                    end

                    if player.Character:FindFirstChildOfClass('Humanoid') ~= nil then

                        local move = true

                        delay(10, function()
                            move = false
                        end)

                    while player.Character:WaitForChild("Humanoid").WalkSpeed ~= 0 and move do
                        player.Character:WaitForChild("Humanoid").Jump = true
                        player.Character:FindFirstChildOfClass('Humanoid'):MoveTo(lol)
                        wait()
                    end

                    end

                    player.Character:WaitForChild("Humanoid").Jump = false


                    end)

                    local vss = Vector3.new(0, 3, -42)

                    while loa do
                    if player.Character:FindFirstChildOfClass('Humanoid') ~= nil then

                        player.Character:WaitForChild("Humanoid").Jump = true
                        player.Character:FindFirstChildOfClass('Humanoid'):MoveTo(vss)

                    end
                    wait()
                    end
                end

            else
                block = false
                if player.Character:FindFirstChildOfClass('Humanoid') ~= nil then

                    player.Character:WaitForChild("Humanoid").Jump = false

                end
                wait(0.2)
            end

        else

            block = false

            if player.Character:FindFirstChildOfClass('Humanoid') ~= nil then

                player.Character:WaitForChild("Humanoid").Jump = false

            end

            for k,v in pairs (potentialTargets) do
                if v.Team == nil or v.Team == player.Team then
                    table.remove(potentialTargets,k)
                end
            end

            local target

            if #potentialTargets > 0 then
                target = getTarget()
            else
                grabTargets()
                if #potentialTargets > 0 then
                target = getTarget()
                else
                target = nil
                end
            end
            
            if target ~= nil then
            
                --local weapon = game:GetService("Players").LocalPlayer.Character:FindFirstChild("W")

                --weapon.Remotes.ClientControl:InvokeServer()
            
                if player.Character:FindFirstChildOfClass('Humanoid') ~= nil then

                    if player.Character:FindFirstChildOfClass('Humanoid') and player.Character:FindFirstChildOfClass('Humanoid').SeatPart then
                    player.Character:FindFirstChildOfClass('Humanoid').Sit = false
                    wait(.1)
                    end

                    if getRoot(target.Character) ~= nil then
                        player.Character:FindFirstChildOfClass('Humanoid'):MoveTo(getRoot(target.Character).Position)
                    end 
                end
            end
        end
    end

   
end
