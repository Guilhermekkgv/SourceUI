local Linux = {}

function Linux:Create(config)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false
    
    local Frame = Instance.new("Frame")
    Frame.Size = config.Size or UDim2.fromOffset(500, 350)
    Frame.Position = UDim2.new(0.5, -250, 0.5, -175)
    Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.Draggable = true
    Frame.Parent = ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Frame
    
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = Frame
    
    local TopCorner = Instance.new("UICorner")
    TopCorner.CornerRadius = UDim.new(0, 12)
    TopCorner.Parent = TopBar
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -20, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = config.Name or "Linux Hub"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 20
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TopBar
    
    local TabContainer = Instance.new("ScrollingFrame")
    TabContainer.Size = UDim2.new(1, -20, 0, 40)
    TabContainer.Position = UDim2.new(0, 10, 0, 50)
    TabContainer.BackgroundTransparency = 1
    TabContainer.BorderSizePixel = 0
    TabContainer.ScrollBarThickness = 0
    TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContainer.Parent = Frame
    
    local Content = Instance.new("ScrollingFrame")
    Content.Size = UDim2.new(1, -20, 1, -100)
    Content.Position = UDim2.new(0, 10, 0, 100)
    Content.BackgroundTransparency = 1
    Content.BorderSizePixel = 0
    Content.ScrollBarThickness = 0
    Content.CanvasSize = UDim2.new(0, 0, 0, 0)
    Content.Parent = Frame
    
    local Window = {}
    local Tabs = {}
    local CurrentTab = nil
    
    function Window:Tab(name, icon)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(0, 120, 0, 30)
        TabButton.Position = UDim2.new(0, #Tabs * 130, 0, 5)
        TabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
        TabButton.BorderSizePixel = 0
        TabButton.Text = name
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 16
        TabButton.Font = Enum.Font.GothamBold
        TabButton.Parent = TabContainer
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 8)
        TabCorner.Parent = TabButton
        
        local TabContent = Instance.new("Frame")
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.Visible = false
        TabContent.Parent = Content
        
        TabButton.MouseButton1Click:Connect(function()
            if CurrentTab then
                CurrentTab.Visible = false
            end
            TabContent.Visible = true
            CurrentTab = TabContent
            for _, button in pairs(TabContainer:GetChildren()) do
                if button:IsA("TextButton") then
                    button.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
                end
            end
            TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        end)
        
        if #Tabs == 0 then
            TabContent.Visible = true
            CurrentTab = TabContent
            TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        end
        
        table.insert(Tabs, TabContent)
        TabContainer.CanvasSize = UDim2.new(0, #Tabs * 130, 0, 0)
        
        local Tab = {}
        
        function Tab:Toggle(name, default, callback)
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(1, -10, 0, 50)
            ToggleFrame.Position = UDim2.new(0, 5, 0, #TabContent:GetChildren() * 60)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
            ToggleFrame.BorderSizePixel = 0
            ToggleFrame.Parent = TabContent
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 10)
            ToggleCorner.Parent = ToggleFrame
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Size = UDim2.new(0, 350, 1, 0)
            ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Text = name
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextSize = 18
            ToggleLabel.Font = Enum.Font.GothamBold
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Parent = ToggleFrame
            
            local ToggleSwitch = Instance.new("Frame")
            ToggleSwitch.Size = UDim2.new(0, 60, 0, 30)
            ToggleSwitch.Position = UDim2.new(1, -75, 0.5, -15)
            ToggleSwitch.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
            ToggleSwitch.BorderSizePixel = 0
            ToggleSwitch.Parent = ToggleFrame
            
            local SwitchCorner = Instance.new("UICorner")
            SwitchCorner.CornerRadius = UDim.new(0, 15)
            SwitchCorner.Parent = ToggleSwitch
            
            local ToggleKnob = Instance.new("Frame")
            ToggleKnob.Size = UDim2.new(0, 26, 0, 26)
            ToggleKnob.Position = default and UDim2.new(1, -28, 0.5, -13) or UDim2.new(0, 2, 0.5, -13)
            ToggleKnob.BackgroundColor3 = default and Color3.fromRGB(100, 100, 255) or Color3.fromRGB(80, 80, 100)
            ToggleKnob.BorderSizePixel = 0
            ToggleKnob.Parent = ToggleSwitch
            
            local KnobCorner = Instance.new("UICorner")
            KnobCorner.CornerRadius = UDim.new(0, 13)
            KnobCorner.Parent = ToggleKnob
            
            local state = default or false
            
            local TweenService = game:GetService("TweenService")
            local toggleTween = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            
            ToggleSwitch.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    state = not state
                    local newPos = state and UDim2.new(1, -28, 0.5, -13) or UDim2.new(0, 2, 0.5, -13)
                    local newColor = state and Color3.fromRGB(100, 100, 255) or Color3.fromRGB(80, 80, 100)
                    TweenService:Create(ToggleKnob, toggleTween, {Position = newPos, BackgroundColor3 = newColor}):Play()
                    TweenService:Create(ToggleSwitch, toggleTween, {BackgroundColor3 = state and Color3.fromRGB(40, 40, 50) or Color3.fromRGB(30, 30, 38)}):Play()
                    callback(state)
                end
            end)
            
            Content.CanvasSize = UDim2.new(0, 0, 0, #TabContent:GetChildren() * 60)
        end
        
        return Tab
    end
    
    return Window
end

return Linux
