
local library = {}


local LeafHub = Instance.new("ScreenGui")
local idk = Instance.new("Frame")
local UIPadding = Instance.new("UIPadding")
local UIListLayout = Instance.new("UIListLayout")

LeafHub.Name = "LeafHub"
LeafHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
LeafHub.ResetOnSpawn = false

idk.Name = "idk"
idk.Parent = LeafHub
idk.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
idk.BackgroundTransparency = 1.000
idk.Size = UDim2.new(10, 0, 10, 0)

UIPadding.Parent = idk
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)

UIPadding.Parent = elements
UIPadding.PaddingTop = UDim.new(0.2)


UIListLayout.Parent = idk
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)



function library:CreateWindow( windowname )
    local elementHandler = {}
    
    local window = Instance.new("Frame")
    local wndText = Instance.new("TextLabel")
    local opencloselmao = Instance.new("TextButton")
    local Line = Instance.new("Frame")
    local elements = Instance.new("Frame")
    local sorter = Instance.new("UIListLayout")

	window.Name = "window"
    window.Parent = idk
    window.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
    window.BorderSizePixel = 0
    window.Size = UDim2.new(0, 157, 0, 30)

    wndText.Name = "wndText"
    wndText.Parent = window
    wndText.AnchorPoint = Vector2.new(0.5, 0.5)
    wndText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    wndText.BackgroundTransparency = 1.000
    wndText.Position = UDim2.new(0.5, 0, 0.5, 0)
    wndText.Size = UDim2.new(0, 110, 0, 23)
    wndText.Font = Enum.Font.SourceSansSemibold
    wndText.Text = windowname
    wndText.TextColor3 = Color3.fromRGB(81, 255, 55)
    wndText.TextSize = 16

    opencloselmao.Name = "opencloselmao"
    opencloselmao.Parent = window
    opencloselmao.AnchorPoint = Vector2.new(1, 0.5)
    opencloselmao.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    opencloselmao.BackgroundTransparency = 1.000
    opencloselmao.Position = UDim2.new(1, 0, 0.5, 0)
    opencloselmao.Size = UDim2.new(0, 30, 0, 30)
    opencloselmao.Font = Enum.Font.SourceSansSemibold
    opencloselmao.Text = "-"
    opencloselmao.TextColor3 = Color3.fromRGB(81, 255, 55)
    opencloselmao.TextSize = 16.000

    Line.Name = "Line"
    Line.Parent = window
    Line.BackgroundColor3 = Color3.fromRGB(81, 255, 55)
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0, 0, 1, 0)
    Line.Size = UDim2.new(0, 157, 0, 1)
    Line.ZIndex = 2

    elements.Name = "elements"
    elements.Parent = window
    elements.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    elements.BorderSizePixel = 0
    elements.ClipsDescendants = true
    elements.Position = UDim2.new(0, 0, 1.0333333, 0)
    elements.Size = UDim2.new(0, 157, 0, 179)

    sorter.Name = "sorter"
    sorter.Parent = elements
    sorter.SortOrder = Enum.SortOrder.LayoutOrder

    local function Tween(obj, properties, time, easingDirection, easingStyle)
        easingStyle = easingStyle or Enum.EasingStyle.Linear
        easingDirection = easingDirection or Enum.EasingDirection.InOut
        time = time or 0.000001
        assert(obj and properties)
        local TI = TweenInfo.new(time, easingStyle, easingDirection)
        local Tween = game:GetService('TweenService'):Create(obj, TI, properties)
        return Tween, Tween:Play()
    end

    local function resize()
		elements.Size = UDim2.new(0, sorter.AbsoluteContentSize.X, 0, sorter.AbsoluteContentSize.Y)
    end

    local lmao = true
    opencloselmao.MouseButton1Click:Connect(function( ... )
        lmao = not lmao
        if lmao == false then
            elements:TweenSize(UDim2.new(0, sorter.AbsoluteContentSize.X, 0, 0),"InOut","Linear",.2,true)
            Tween(opencloselmao, {Rotation = -180}, 0.25).Completed:Connect(function( ... )
                opencloselmao.Text = "+"
            end)
        else
            elements:TweenSize(UDim2.new(0, sorter.AbsoluteContentSize.X, 0, sorter.AbsoluteContentSize.Y),"InOut","Linear",.2,true)
            Tween(opencloselmao, {Rotation = 0}, 0.25).Completed:Connect(function( ... )
                opencloselmao.Text = "-"
            end)
		end
    end)

    function elementHandler:TextBoxWithSubmit(placeholderText, submitText, callback)
        callback = callback or function() end
        placeholderText = placeholderText or "Type Here"
        submitText = submitText or "Submit"

        local TextBox = Instance.new("TextBox")
        local Button = Instance.new("TextButton")


        TextBox.Parent = elements
        TextBox.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
        TextBox.BackgroundTransparency = 1.000
        TextBox.BorderColor3 = Color3.fromRGB(81, 255, 55)
        TextBox.BorderSizePixel = 0
        TextBox.Position = UDim2.new(0, 0, 0.279329598, 0)
        TextBox.Size = UDim2.new(0, 157, 0, 58)
        TextBox.Font = Enum.Font.SourceSans
        TextBox.PlaceholderText = placeholderText
        TextBox.Text = ""
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.TextSize = 16.000

        Button.Text = submitText
        Button.Name = "Button"
        Button.Parent = TextBox
        Button.AnchorPoint = Vector2.new(0.5, 0.5)
        Button.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
        Button.BackgroundTransparency = 1.000
        Button.BorderSizePixel = 0
        Button.Position = UDim2.new(0.5, 0, 0.925694287, 0)
        Button.Size = UDim2.new(0, 157, 0, 25)
        Button.Font = Enum.Font.SourceSans
        Button.TextColor3 = Color3.fromRGB(250, 250, 250)
        Button.TextSize = 16.000
        
        Button.MouseButton1Click:Connect(function()

        end)
        resize()
    end
    function elementHandler:NewToggle(text, callback)
        callback = callback or function() end
        text = text or "Toggle"

        local toggle = Instance.new("Frame")
        local togglebtn = Instance.new("TextButton")
        local DoNotTouch = Instance.new("ImageLabel")
        local MainFrame = Instance.new("ImageLabel")
        local TextLabel = Instance.new("TextLabel")


        toggle.Name = "toggle"
        toggle.Parent = elements
        toggle.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
        toggle.BackgroundTransparency = 1.000
        toggle.BorderSizePixel = 0
        toggle.Position = UDim2.new(0, 0, 0.648044705, 0)
        toggle.Size = UDim2.new(0, 157, 0, 26)

        togglebtn.Name = "togglebtn"
        togglebtn.Parent = toggle
        togglebtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        togglebtn.BackgroundTransparency = 1.000
        togglebtn.BorderSizePixel = 0
        togglebtn.Position = UDim2.new(0.0509554148, 0, 0.115384616, 0)
        togglebtn.Size = UDim2.new(0, 20, 0, 20)
        togglebtn.ZIndex = 3
        togglebtn.Font = Enum.Font.SourceSans
        togglebtn.Text = ""
        togglebtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        togglebtn.TextSize = 14.000

        DoNotTouch.Name = "DoNotTouch"
        DoNotTouch.Parent = togglebtn
        DoNotTouch.Active = true
        DoNotTouch.AnchorPoint = Vector2.new(0.5, 0.5)
        DoNotTouch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DoNotTouch.BackgroundTransparency = 1.000
        DoNotTouch.Position = UDim2.new(0.5, 0, 0.5, 0)
        DoNotTouch.Selectable = true
        DoNotTouch.Size = UDim2.new(1, 0, 1, 0)
        DoNotTouch.Image = "rbxassetid://3570695787"
        DoNotTouch.ImageColor3 = Color3.fromRGB(42, 42, 42)
        DoNotTouch.ScaleType = Enum.ScaleType.Slice
        DoNotTouch.SliceCenter = Rect.new(100, 100, 100, 100)
        DoNotTouch.SliceScale = 0.010

        MainFrame.Name = "MainFrame"
        MainFrame.Parent = DoNotTouch
        MainFrame.Active = true
        MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainFrame.BackgroundTransparency = 1.000
        MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        MainFrame.Selectable = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Image = "rbxassetid://3570695787"
        MainFrame.ImageColor3 = Color3.fromRGB(81, 255, 55)
        MainFrame.ScaleType = Enum.ScaleType.Slice
        MainFrame.SliceCenter = Rect.new(100, 100, 100, 100)
        MainFrame.SliceScale = 0.010

        TextLabel.Parent = toggle
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 4.000
        TextLabel.Position = UDim2.new(0.229299366, 0, 0, 0)
        TextLabel.Size = UDim2.new(0, 112, 0, 26)
        TextLabel.Font = Enum.Font.SourceSans
        TextLabel.Text = " "..text
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 16.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        local tog = false
        togglebtn.MouseButton1Click:Connect(function()
            tog = not tog
            callback(tog)
            if tog then
                MainFrame:TweenSize(UDim2.new(1,0,1,0), "Out", "Quart", 0.2)
            else
                MainFrame:TweenSize(UDim2.new(0,0,0,0), "Out", "Quart", 0.2)
            end
        end)
        resize()
    end
    
    function elementHandler:Toggle(text,callback)
        text = text or "Toggle"
        callback = callback or function() end

        local toggle = Instance.new("Frame")
        local toggleText = Instance.new("TextLabel")
        local toggleonoff = Instance.new("TextButton")
        
        toggle.Name = "toggle"
        toggle.Parent = elements
        toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        toggle.BackgroundTransparency = 1.000
        toggle.Position = UDim2.new(0, 0, 0.139664799, 0)
        toggle.Size = UDim2.new(0, 157, 0, 25)
        
        toggleText.Name = "toggleText"
        toggleText.Parent = toggle
        toggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        toggleText.BackgroundTransparency = 1.000
        toggleText.Size = UDim2.new(0, 107, 0, 25)
        toggleText.Font = Enum.Font.SourceSans
        toggleText.Text = "  "..text
        toggleText.TextColor3 = Color3.fromRGB(240, 240, 240)
        toggleText.TextSize = 16.000
        toggleText.TextXAlignment = Enum.TextXAlignment.Left
        
        toggleonoff.Name = "toggleonoff"
        toggleonoff.Parent = toggle
        toggleonoff.AnchorPoint = Vector2.new(1, 0.5)
        toggleonoff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        toggleonoff.BackgroundTransparency = 1.000
        toggleonoff.Position = UDim2.new(1, 0, 0.5, 0)
        toggleonoff.Size = UDim2.new(0, 36, 0, 25)
        toggleonoff.Font = Enum.Font.SourceSans
        toggleonoff.Text = "OFF"
        toggleonoff.TextColor3 = Color3.fromRGB(255, 13, 5)
        toggleonoff.TextSize = 17.000

        local tog = false
        toggleonoff.MouseButton1Click:Connect(function()
            tog = not tog
            callback(tog)
            if tog then
                toggleonoff.TextColor3 = Color3.fromRGB(32, 218, 8)
                toggleonoff.Text = "ON"
            else
                toggleonoff.TextColor3 = Color3.fromRGB(255, 13, 5)
                toggleonoff.Text = "OFF"
            end
        end)
        resize()
    end
    function elementHandler:SliderItem(text, minvalue, maxvalue, callback)
        text = text or "Text"
        minvalue = minvalue or 0
        maxvalue = maxvalue or 0
        callback = callback or function() end


        local Slider = Instance.new("Frame")
        local SliderBtn = Instance.new("TextButton")
        local Inner = Instance.new("Frame")
        local name = Instance.new("TextLabel")
        local value = Instance.new("TextLabel")


        Slider.Name = "Slider"
        Slider.Parent = elements
        Slider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Slider.BackgroundTransparency = 1.000
        Slider.BorderSizePixel = 0
        Slider.Position = UDim2.new(0, 0, 0.787709475, 0)
        Slider.Size = UDim2.new(0, 157, 0, 25)

        SliderBtn.Name = "SliderBtn"
        SliderBtn.Parent = Slider
        SliderBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        SliderBtn.BorderSizePixel = 0
        SliderBtn.Position = UDim2.new(0.0573248416, 0, 0, 0)
        SliderBtn.Size = UDim2.new(0, 138, 0, 25)
        SliderBtn.Font = Enum.Font.SourceSans
        SliderBtn.Text = ""
        SliderBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        SliderBtn.TextSize = 14.000

        Inner.Name = "Inner"
        Inner.Parent = SliderBtn
        Inner.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        Inner.BorderSizePixel = 0
        Inner.Size = UDim2.new(0, 0, 0, 25)

        name.Name = "name"
        name.Parent = SliderBtn
        name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        name.BackgroundTransparency = 1.000
        name.Size = UDim2.new(0, 35, 0, 25)
        name.Font = Enum.Font.SourceSans
        name.Text = name
        name.TextColor3 = Color3.fromRGB(81, 255, 55)
        name.TextSize = 14.000

        value.Name = "value"
        value.Parent = SliderBtn
        value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        value.BackgroundTransparency = 1.000
        value.Position = UDim2.new(0.304347813, 0, 0, 0)
        value.Size = UDim2.new(0, 96, 0, 25)
        value.Font = Enum.Font.SourceSans
        value.Text = value
        value.TextColor3 = Color3.fromRGB(81, 255, 55)
        value.TextSize = 14.000
        value.TextXAlignment = Enum.TextXAlignment.Left
        SliderBtn.MouseButton1Down:Connect(function()
        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 157) * Inner.AbsoluteSize.X) + tonumber(minvalue)) or 0
        pcall(function()
            callback(Value)
        end)
        Inner.Size = UDim2.new(0, math.clamp(mouse.X - Inner.AbsolutePosition.X, 0, 157), 0, 25)
        moveconnection = mouse.Move:Connect(function()
            value.Text = Value
            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 157) * Inner.AbsoluteSize.X) + tonumber(minvalue))
            pcall(function()
                callback(Value)
            end)
            Inner.Size = UDim2.new(0, math.clamp(mouse.X - Inner.AbsolutePosition.X, 0, 157), 0, 25)
        end)
        releaseconnection = uis.InputEnded:Connect(function(Mouse)
            if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 157) * Inner.AbsoluteSize.X) + tonumber(minvalue))
                pcall(function()
                    callback(Value)
                end)
                Inner.Size = UDim2.new(0, math.clamp(mouse.X - Inner.AbsolutePosition.X, 0, 157), 0, 25)
                moveconnection:Disconnect()
                releaseconnection:Disconnect()
            end
        end)
    end)
end
    function elementHandler:Button(text,callback)
        text = text or "Toggle"
        callback = callback or function() end

        local Button = Instance.new("TextButton")

        Button.Name = "Button"
        Button.Parent = elements
        Button.AnchorPoint = Vector2.new(0.5, 0.5)
        Button.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
        Button.BackgroundTransparency = 1.000
        Button.BorderSizePixel = 0
        Button.Position = UDim2.new(0.5, 0, 0.0698323995, 0)
        Button.Size = UDim2.new(0, 157, 0, 25)
        Button.Font = Enum.Font.SourceSans
        Button.TextColor3 = Color3.fromRGB(250, 250, 250)
        Button.TextSize = 16.000
        Button.Text = text

        local ts = game:GetService("TweenService")
        local info = TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        
        local green = {
            TextColor3 = Color3.fromRGB(157, 255, 111)
        }
        local white = {
            TextColor3 = Color3.fromRGB(255,255,255)
        }
        
        local enter = ts:Create(Button, info, green)
        local leave = ts:Create(Button, info, white)
        Button.MouseLeave:Connect(function()
            leave:Play()
        end)
        
        Button.MouseEnter:Connect(function()
            enter:Play()
        end)

        Button.MouseButton1Click:Connect(function( ... )
            callback()
        end)
        resize()
    end

    return elementHandler
end

local window = library:CreateWindow("Main")
local GunMods = library:CreateWindow("Gun Mods")
local Functions = library:CreateWindow("Functions")
local Team = library:CreateWindow("Team Options")
local PlayerWindow = library:CreateWindow("Player")
-- Teleports Window
window:Button("Give M60", function()
    local InvokeServer = require(workspace.upsilonLibrary).InvokeServer
    InvokeServer("giveItem", "M60")
    local guntable = {"S&W 638","M1014","Dragunov","ACR","Makarov","SPAS-12","L86A2","M60","Beretta M9","Revolver","M14","AK47-U","M16","AK47","UMP-45","M98B"}
    
end)
window:Button("Give Sniper", function()
    local InvokeServer = require(workspace.upsilonLibrary).InvokeServer
InvokeServer("giveItem", "M98B")
local guntable = {"S&W 638","M1014","Dragunov","ACR","Makarov","SPAS-12","L86A2","M60","Beretta M9","Revolver","M14","AK47-U","M16","AK47","UMP-45","M98B"}

end)
window:Button("Give AK47", function()
    local InvokeServer = require(workspace.upsilonLibrary).InvokeServer
    InvokeServer("giveItem", "AK47")
    local guntable = {"S&W 638","M1014","Dragunov","ACR","Makarov","SPAS-12","L86A2","M60","Beretta M9","Revolver","M14","AK47-U","M16","AK47","UMP-45","M98B"}
    
end)
window:Button("Give Cop Weapons", function()
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "Taser")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "Handcuffs")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "Beretta M9")
end)
window:Button("Give Every Weapon", function()
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "M98B")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "Revolver")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "UMP-45")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "Parachute")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "ACR")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "M60")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "L86A2")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "Fake ID Card")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "AK47")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "AK47-U")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "Beretta M9")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "S&W 638")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "M1014")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "Dragunov")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "Makarov")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "SPAS-12")

end)
window:Button("Open All Doors", function()
    for _,v in pairs (game.Workspace.AllDoors:GetChildren()) do
        game.Workspace.resources.RemoteEvent:FireServer("updateDoorSystem", v)
    end
end)
window:Button("Destroy Doors", function()
    for _,v in pairs (game.Workspace.AllDoors:GetChildren()) do
        v:Destroy()
    end
end)
-- Gun Mods window
GunMods:Button("No Recoil", function()

end)
GunMods:Button("Infinity Ammo", function()
    while true do
         wait(0.15)
         local pPos = game.Players.LocalPlayer.Character.Torso.Position
         local ammoCrate = workspace.ammoCrate
         ammoCrate.CanCollide = false
         ammoCrate.Transparency = 1
         ammoCrate:ClearAllChildren()
         ammoCrate.Position = pPos
    end
end)

-- Functions Window
Noclip = false
Functions:NewToggle("Noclip (Glitchy)", function()
    tog = not tog
    if tog then
        Noclip = true
        Stepped = game:GetService("RunService").Stepped:Connect(function()
            if not Noclip == false then
                for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == game.Players.LocalPlayer.Name then
                for i, v in pairs(Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                v.CanCollide = false
                end end end end
            else
                Stepped:Disconnect()
            end
        end)
    else
        Noclip = false
    end
end)

Clipon = false
Functions:NewToggle("Fly (Soon)", function()
    tog = not tog
    if tog then

    else
        
    end
end)
Functions:NewToggle("Aimbot (Soon)", function()
    tog = not tog
    if tog then

    else
        
    end
end)
Functions:NewToggle("ESP (Soon)", function()
    tog = not tog
    if tog then
    
    else
       
    end
end)
Functions:Button("Auto Arrest", function()
    local Player = game.Players.LocalPlayer
    wait(0.5)
    for i,v in pairs(game.Teams.Fugitives:GetPlayers()) do
    repeat
    wait()
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "Handcuffs")
    Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
    until v.Team.Name ~= "Fugitives"
    end
end)
Functions:Button("Tase All", function()
    for _, v in pairs(game.Players:GetChildren()) do
        game.Workspace.resources.RemoteEvent:FireServer("tase", v)  
    end
end)
Functions:Button("Kill All", function()
    for _, v in pairs(game.Players:GetChildren()) do
        game.Workspace.resources.RemoteEvent:FireServer("dealDamage", v.Character.Humanoid, 100) 
    end
end)
Functions:Button("Cuff All", function()
    for _, v in pairs(game.Players:GetChildren()) do
        game.Workspace.resources.RemoteEvent:FireServer("cuff", v)
     end
end)
-- Team Window
Team:Button("Police (Gear Stays)", function()
    game.Workspace.resources.RemoteFunction:InvokeServer("requestTeam", "police")
end)
Team:Button("Prisoner (Gear Stays)", function()
    game.Workspace.resources.RemoteFunction:InvokeServer("requestTeam", "prisoners")
    game.Workspace.resources.RemoteFunction:InvokeServer("giveItem", "punch")
end)

-- Player Window
PlayerWindow:Button("Pilot Gear", function()
    game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).Shirt.ShirtTemplate = "rbxassetid://236886923"
    game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).Pants.PantsTemplate = "rbxassetid://454772491"
end)
PlayerWindow:Button("Spec Cops Gear", function()
    game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).Shirt.ShirtTemplate = "rbxassetid://278309832"
    game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).Pants.PantsTemplate = "rbxassetid://141031536"
end)
PlayerWindow:Button("SWAT Gear", function()
    game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).Shirt.ShirtTemplate = "rbxassetid://25655320"
    game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).Pants.PantsTemplate = "rbxassetid://25888948"
end)


