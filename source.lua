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

while true do

   wait()

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
                local pos = TargetHRP.Position

                if pos.Z > -40 then
                    
                  if pos.X > 10 then -- blue
                    blue = blue + 1
                  elseif pos.X < -10 then -- red
                    red = red + 1
                  end

                end

            end

            local choice

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
