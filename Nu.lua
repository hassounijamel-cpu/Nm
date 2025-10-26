-- neymar ma GUI (Asset ID Version)
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JapanF3XGUI"
ScreenGui.Parent = game.CoreGui

-- Toggle Button
local ToggleButton = Instance.new("ImageButton")
ToggleButton.Name = "JapanIcon"
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ToggleButton.BorderSizePixel = 0
ToggleButton.Image = "http://www.roblox.com/asset/?id=130007058879269"
ToggleButton.ZIndex = 3
ToggleButton.Parent = ScreenGui

local UICornerIcon = Instance.new("UICorner")
UICornerIcon.CornerRadius = UDim.new(0, 12)
UICornerIcon.Parent = ToggleButton

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 450, 0, 700)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -350)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.ZIndex = 2
MainFrame.Parent = ScreenGui

-- Background image
local BackgroundImage = Instance.new("ImageLabel")
BackgroundImage.Name = "Background"
BackgroundImage.Size = UDim2.new(1, 0, 1, 0)
BackgroundImage.BackgroundTransparency = 1
BackgroundImage.Image = "http://www.roblox.com/asset/?id=130007058879269"
BackgroundImage.ScaleType = Enum.ScaleType.Crop
BackgroundImage.ZIndex = 1
BackgroundImage.Parent = MainFrame

-- Overlay
local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.7
Overlay.BorderSizePixel = 0
Overlay.ZIndex = 1
Overlay.Parent = MainFrame

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.BackgroundTransparency = 0.3
Title.Text = "neymar"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.ZIndex = 2
Title.Parent = MainFrame

-- Drag functionality
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Tabs
local Tabs = Instance.new("Frame")
Tabs.Name = "Tabs"
Tabs.Size = UDim2.new(1, 0, 0, 40)
Tabs.Position = UDim2.new(0, 0, 0, 50)
Tabs.BackgroundTransparency = 1
Tabs.ZIndex = 2
Tabs.Parent = MainFrame

local TabLayout = Instance.new("UIGridLayout")
TabLayout.CellSize = UDim2.new(0.5, 0, 1, 0)
TabLayout.CellPadding = UDim2.new(0, 5, 0, 0)
TabLayout.Parent = Tabs

-- F3X Tab Button
local F3XTab = Instance.new("TextButton")
F3XTab.Name = "F3XTab"
F3XTab.Size = UDim2.new(1, 0, 1, 0)
F3XTab.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
F3XTab.Text = "F3X"
F3XTab.TextColor3 = Color3.fromRGB(255, 255, 255)
F3XTab.TextSize = 16
F3XTab.Font = Enum.Font.GothamBold
F3XTab.ZIndex = 2
F3XTab.Parent = Tabs

-- Admin Tab Button
local AdminTab = Instance.new("TextButton")
AdminTab.Name = "AdminTab"
AdminTab.Size = UDim2.new(1, 0, 1, 0)
AdminTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AdminTab.Text = "ADMIN"
AdminTab.TextColor3 = Color3.fromRGB(255, 255, 255)
AdminTab.TextSize = 16
AdminTab.Font = Enum.Font.GothamBold
AdminTab.ZIndex = 2
AdminTab.Parent = Tabs

-- Tab corners
local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 8)
TabCorner.Parent = F3XTab

local TabCorner2 = Instance.new("UICorner")
TabCorner2.CornerRadius = UDim.new(0, 8)
TabCorner2.Parent = AdminTab

-- Button containers
local F3XContainer = Instance.new("ScrollingFrame")
F3XContainer.Name = "F3XContainer"
F3XContainer.Size = UDim2.new(1, -20, 1, -100)
F3XContainer.Position = UDim2.new(0, 10, 0, 100)
F3XContainer.BackgroundTransparency = 1
F3XContainer.ScrollBarThickness = 8
F3XContainer.Visible = true
F3XContainer.ZIndex = 2
F3XContainer.Parent = MainFrame

local AdminContainer = Instance.new("ScrollingFrame")
AdminContainer.Name = "AdminContainer"
AdminContainer.Size = UDim2.new(1, -20, 1, -100)
AdminContainer.Position = UDim2.new(0, 10, 0, 100)
AdminContainer.BackgroundTransparency = 1
AdminContainer.ScrollBarThickness = 8
AdminContainer.Visible = false
AdminContainer.ZIndex = 2
AdminContainer.Parent = MainFrame

-- Button layouts
local ButtonLayout = Instance.new("UIGridLayout")
ButtonLayout.CellSize = UDim2.new(1, 0, 0, 40)
ButtonLayout.CellPadding = UDim2.new(0, 0, 0, 8)
ButtonLayout.Parent = F3XContainer

local AdminButtonLayout = Instance.new("UIGridLayout")
AdminButtonLayout.CellSize = UDim2.new(1, 0, 0, 40)
AdminButtonLayout.CellPadding = UDim2.new(0, 0, 0, 8)
AdminButtonLayout.Parent = AdminContainer

-- Button creation function
local function CreateButton(parent, name, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    button.BorderSizePixel = 0
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    button.ZIndex = 2
    button.Parent = parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = button
    
    button.MouseButton1Click:Connect(callback)
    
    return button
end

-- F3X Tool finder
local function getF3XTool()
    local player = game.Players.LocalPlayer
    local tool
    
    for i,v in player:GetDescendants() do
        if v.Name == "SyncAPI" then
            tool = v.Parent
            break
        end
    end
    
    if not tool then
        for i,v in game.ReplicatedStorage:GetDescendants() do
            if v.Name == "SyncAPI" then
                tool = v.Parent
                break
            end
        end
    end
    
    return tool
end

-- Tab switching
F3XTab.MouseButton1Click:Connect(function()
    F3XContainer.Visible = true
    AdminContainer.Visible = false
    F3XTab.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    AdminTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

AdminTab.MouseButton1Click:Connect(function()
    F3XContainer.Visible = false
    AdminContainer.Visible = true
    F3XTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    AdminTab.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
end)

-- F3X BUTTONS --

-- JAPAN Realm
CreateButton(F3XContainer, "neymar", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

    RequestCommand:InvokeServer(";btools")
    
    local tool = getF3XTool()
    if tool then
        local remote = tool.SyncAPI.ServerEndpoint
        local char = game.Players.LocalPlayer.Character
        local hrp = char.HumanoidRootPart
        
        -- Clean everything
        for i,v in workspace:GetDescendants() do
            if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                spawn(function()
                    pcall(function()
                        remote:InvokeServer("Remove", {v})
                    end)
                end)
            end
        end
        
        wait(1)
        
        -- Create baseplate
        local baseCF = CFrame.new(0, 0, 0)
        remote:InvokeServer("CreatePart", "Normal", baseCF, workspace)
        
        for i,v in workspace:GetChildren() do
            if v:IsA("Part") and v.Position == baseCF.Position then
                remote:InvokeServer("SyncResize", {
                    [1] = {
                        Part = v,
                        CFrame = baseCF,
                        Size = Vector3.new(500, 5, 500)
                    }
                })
                
                remote:InvokeServer("SyncMaterial", {
                    [1] = {
                        Part = v,
                        Material = Enum.Material.Neon
                    }
                })
                
                remote:InvokeServer("SyncColor", {
                    [1] = {
                        Part = v,
                        Color = Color3.fromRGB(255, 0, 0)
                    }
                })
                
                remote:InvokeServer("SetLocked", {[1] = v}, true)
                break
            end
        end
        
        -- Create angled part
        local angleCF = CFrame.new(0, 20, 0) * CFrame.Angles(0, 0, math.rad(70))
        remote:InvokeServer("CreatePart", "Normal", angleCF, workspace)
        
        for i,v in workspace:GetChildren() do
            if v:IsA("Part") and v.Position == angleCF.Position then
                remote:InvokeServer("SyncResize", {
                    [1] = {
                        Part = v,
                        CFrame = angleCF,
                        Size = Vector3.new(100, 200, 10)
                    }
                })
                
                remote:InvokeServer("SyncMaterial", {
                    [1] = {
                        Part = v,
                        Material = Enum.Material.Neon
                    }
                })
                
                remote:InvokeServer("SyncColor", {
                    [1] = {
                        Part = v,
                        Color = Color3.fromRGB(255, 255, 255)
                    }
                })
                
                -- Add decal
                remote:InvokeServer("CreateTextures", {
                    [1] = {
                        Part = v,
                        Face = Enum.NormalId.Front,
                        TextureType = "Decal"
                    }
                })
                
                remote:InvokeServer("SyncTexture", {
                    [1] = {
                        Part = v,
                        Face = Enum.NormalId.Front,
                        TextureType = "Decal",
                        Texture = "http://www.roblox.com/asset/?id=130007058879269"
                    }
                })
                
                remote:InvokeServer("SetLocked", {[1] = v}, true)
                break
            end
        end
        
        -- Create skybox
        local skyboxCF = CFrame.new(0, 5, 0)
        remote:InvokeServer("CreatePart", "Normal", skyboxCF, workspace)
        
        for i,v in workspace:GetChildren() do
            if v:IsA("Part") and v.Position == skyboxCF.Position then
                remote:InvokeServer("CreateMeshes", {[1] = {Part = v}})
                remote:InvokeServer("SyncMesh", {
                    [1] = {
                        Part = v,
                        MeshId = "http://www.roblox.com/asset/?id=130007058879269",
                        TextureId = "http://www.roblox.com/asset/?id=130007058879269",
                        Scale = Vector3.new(10000, 10000, 10000)
                    }
                })
                remote:InvokeServer("SetLocked", {[1] = v}, true)
                break
            end
        end
        
        -- Teleport character
        char:SetPrimaryPartCFrame(CFrame.new(0, 10, 0))
        
        -- Play music
        RequestCommand:InvokeServer(";music 134884767490882")
        RequestCommand:InvokeServer(";volume inf")
        
        print("JAPAN Realm active! 🎶 Music playing...")
    end
end)

-- Big Baseplate
CreateButton(F3XContainer, "Big Baseplate", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

    RequestCommand:InvokeServer(";btools")
    
    local tool = getF3XTool()
    if tool then
        local remote = tool.SyncAPI.ServerEndpoint
        local char = game.Players.LocalPlayer.Character
        local hrp = char.HumanoidRootPart
        
        -- Clean everything
        for i,v in workspace:GetDescendants() do
            if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                spawn(function()
                    pcall(function()
                        remote:InvokeServer("Remove", {v})
                    end)
                end)
            end
        end
        
        wait(1)
        
        -- Create giant baseplate
        local cf = CFrame.new(0, -5, 0)
        remote:InvokeServer("CreatePart", "Normal", cf, workspace)
        
        for i,v in workspace:GetChildren() do
            if v:IsA("Part") and v.Position == cf.Position then
                remote:InvokeServer("SyncResize", {
                    [1] = {
                        Part = v,
                        CFrame = cf,
                        Size = Vector3.new(10000, 10, 10000)
                    }
                })
                
                remote:InvokeServer("SyncMaterial", {
                    [1] = {
                        Part = v,
                        Material = Enum.Material.Grass
                    }
                })
                
                remote:InvokeServer("SyncColor", {
                    [1] = {
                        Part = v,
                        Color = Color3.fromRGB(0, 200, 0)
                    }
                })
                
                char:SetPrimaryPartCFrame(CFrame.new(0, 10, 0))
                remote:InvokeServer("SetLocked", {[1] = v}, true)
                break
            end
        end
        
        print("Big Baseplate created! 🏗️")
    end
end)

-- Diagonal Map
CreateButton(F3XContainer, "Diagonal Map", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

    RequestCommand:InvokeServer(";btools")
    
    local tool = getF3XTool()
    if tool then
        local remote = tool.SyncAPI.ServerEndpoint
        local char = game.Players.LocalPlayer.Character
        local hrp = char.HumanoidRootPart
        
        -- Clean everything
        for i,v in workspace:GetDescendants() do
            if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                spawn(function()
                    pcall(function()
                        remote:InvokeServer("Remove", {v})
                    end)
                end)
            end
        end
        
        wait(1)
        
        -- Create diagonal baseplate
        local cf = CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(45), math.rad(45))
        remote:InvokeServer("CreatePart", "Normal", cf, workspace)
        
        for i,v in workspace:GetChildren() do
            if v:IsA("Part") and v.Position == cf.Position then
                remote:InvokeServer("SyncResize", {
                    [1] = {
                        Part = v,
                        CFrame = cf,
                        Size = Vector3.new(1000, 50, 1000)
                    }
                })
                
                remote:InvokeServer("SyncMaterial", {
                    [1] = {
                        Part = v,
                        Material = Enum.Material.Neon
                    }
                })
                
                remote:InvokeServer("SyncColor", {
                    [1] = {
                        Part = v,
                        Color = Color3.fromRGB(255, 0, 0)
                    }
                })
                
                char:SetPrimaryPartCFrame(cf + Vector3.new(0, 10, 0))
                remote:InvokeServer("SetLocked", {[1] = v}, true)
                break
            end
        end
        
        print("Diagonal Map created! 🗺️")
    end
end)

-- Skybox
CreateButton(F3XContainer, "Skybox", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

    RequestCommand:InvokeServer(";btools")
    RequestCommand:InvokeServer(";fogcolor black")
    
    local tool = getF3XTool()
    if tool then
        local remote = tool.SyncAPI.ServerEndpoint
        local char = game.Players.LocalPlayer.Character
        local hrp = char.HumanoidRootPart
        
        local cf = hrp.CFrame + Vector3.new(0, 5, 0)
        remote:InvokeServer("CreatePart", "Normal", cf, workspace)
        
        for i,v in workspace:GetChildren() do
            if v:IsA("Part") and v.Position == cf.Position then
                remote:InvokeServer("CreateMeshes", {[1] = {Part = v}})
                remote:InvokeServer("SyncMesh", {
                    [1] = {
                        Part = v,
                        MeshId = "http://www.roblox.com/asset/?id=130007058879269",
                        TextureId = "http://www.roblox.com/asset/?id=130007058879269",
                        Scale = Vector3.new(10000, 10000, 10000)
                    }
                })
                remote:InvokeServer("SetLocked", {[1] = v}, true)
                break
            end
        end
    end
end)

-- Decal Spam
CreateButton(F3XContainer, "Decal Spam", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

    RequestCommand:InvokeServer(";btools")
    
    local tool = getF3XTool()
    if tool then
        local remote = tool.SyncAPI.ServerEndpoint
        
        for i,v in workspace:GetDescendants() do
            if v:IsA("Part") then
                spawn(function()
                    local faces = {
                        Enum.NormalId.Front,
                        Enum.NormalId.Back,
                        Enum.NormalId.Right,
                        Enum.NormalId.Left,
                        Enum.NormalId.Top,
                        Enum.NormalId.Bottom
                    }
                    
                    for _, face in pairs(faces) do
                        remote:InvokeServer("CreateTextures", {
                            [1] = {
                                Part = v,
                                Face = face,
                                TextureType = "Decal"
                            }
                        })
                        
                        remote:InvokeServer("SyncTexture", {
                            [1] = {
                                Part = v,
                                Face = face,
                                TextureType = "Decal",
                                Texture = "http://www.roblox.com/asset/?id=130007058879269"
                            }
                        })
                    end
                end)
            end
        end
    end
end)

-- ADMIN BUTTONS --

-- Avatars neymar
CreateButton(AdminContainer, "Avatars neymar", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    RequestCommand:InvokeServer(";char all hgw9t2bk")
    print("All avatars to neymar 💀")
end)

-- Title
CreateButton(AdminContainer, "Title", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    RequestCommand:InvokeServer(";title all join Neymer today!")
    print("Title sent! 📢")
end)

-- Bring All
CreateButton(AdminContainer, "Bring All", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    RequestCommand:InvokeServer(";bring all")
    print("Bring All executed! 🚀")
end)

-- Kill Others
CreateButton(AdminContainer, "Kill Others", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    RequestCommand:InvokeServer(";kill others")
    print("Kill Others executed! 💀")
end)

-- Explode Others
CreateButton(AdminContainer, "Explode Others", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    RequestCommand:InvokeServer(";explode others")
    print("Explode Others executed! 💥")
end)

-- Music Buttons
CreateButton(AdminContainer, "Play Music 1", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    RequestCommand:InvokeServer(";music 135009652401688")
    RequestCommand:InvokeServer(";volume inf")
    print("Music 1 playing! 🎵")
end)

CreateButton(AdminContainer, "Play Music 2", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    RequestCommand:InvokeServer(";music 91138951626248")
    RequestCommand:InvokeServer(";volume inf")
    print("Music 2 playing! 🎵")
end)

CreateButton(AdminContainer, "Stop Music", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    RequestCommand:InvokeServer(";unmusic")
    print("Music stopped! 🔇")
end)

-- Main Frame corner
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Toggle functionality
local guiVisible = false

ToggleButton.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    MainFrame.Visible = guiVisible
    
    if guiVisible then
        -- Open animation
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        local tween = TweenService:Create(MainFrame, tweenInfo, {
            Size = UDim2.new(0, 450, 0, 700),
            Position = UDim2.new(0.5, -225, 0.5, -350)
        })
        tween:Play()
        
        -- Update canvas size
        wait(0.1)
        F3XContainer.CanvasSize = UDim2.new(0, 0, 0, ButtonLayout.AbsoluteContentSize.Y)
        AdminContainer.CanvasSize = UDim2.new(0, 0, 0, AdminButtonLayout.AbsoluteContentSize.Y)
    else
        -- Close animation
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        local tween = TweenService:Create(MainFrame, tweenInfo, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        tween:Play()
    end
end)

print("JAPAN F3X GUI loaded! Click the icon!")
print("F3X and Admin tabs available!")
