genv = {
    ServiceID = "YOUR SERVICE ID HERE", -- Provide your REV<>OLT Service ID
    Displayname = "YOUR PREFERED NAME", -- Provide a name to be displayed on the GUI
}
genv = genv or {}
genv.ServiceID = genv.ServiceID or ""
genv.Displayname = genv.Displayname or ""

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local StatusContainer = Instance.new("Frame")
local AlertBox = Instance.new("TextLabel")
local InputContainer = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local ButtonsContainer = Instance.new("Frame")
local SubmitButton = Instance.new("TextButton")
local CopyButton = Instance.new("TextButton")
local Footer = Instance.new("TextLabel")

local tweenService = game:GetService("TweenService")
local hwid = game:GetService("RbxAnalyticsService"):GetClientId()

-- DONT WORRY ABOUT THIS, JUST CHANGE THE FUNCTION NAME!
local function CHANGE_THIS_FUNCTION_NAME()
    tweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -210, 0, -330),
        Size = UDim2.new(0, 420*0.8, 0, 330*0.8),
        BackgroundTransparency = 1
    }):Play()
    
    wait(0.5)
    ScreenGui:Destroy()
end

-- YOUR SCRIPT WILL RUN WITH THIS FUNCTION!
local function CHANGE_THIS_FUNCTION_NAME_TOO()

    -- YOUR SCRIPT HERE

  print("REV<>OLT - User passed keysystem :)")

    -- YOUR SCRIPT HERE

end

local function CreateUICorner(instance, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 8)
    corner.Parent = instance
    return corner
end

local function CreateUIStroke(instance, color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Color3.fromRGB(255, 255, 255)
    stroke.Transparency = 0.7
    stroke.Thickness = thickness or 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = instance
    return stroke
end

ScreenGui.Name = "REVOLT_GUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame" 
MainFrame.Size = UDim2.new(0, 420, 0, 330)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -165)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
CreateUICorner(MainFrame, 12)
CreateUIStroke(MainFrame, Color3.fromRGB(100, 100, 255), 2)

local gradient = Instance.new("UIGradient")
gradient.Rotation = 45
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 50)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 30, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 35))
})
gradient.Parent = MainFrame

spawn(function()
    local counter = 0
    while wait(0.05) do
        if not MainFrame or not MainFrame.Parent then break end
        counter = counter + 0.005
        gradient.Rotation = 45 + math.sin(counter) * 15
    end
end)

TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
TopBar.BackgroundTransparency = 0.3
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
CreateUICorner(TopBar, 12)

local topBarMask = Instance.new("Frame")
topBarMask.Size = UDim2.new(1, 0, 0.5, 0)
topBarMask.Position = UDim2.new(0, 0, 0.5, 0)
topBarMask.BackgroundColor3 = TopBar.BackgroundColor3
topBarMask.BackgroundTransparency = TopBar.BackgroundTransparency
topBarMask.BorderSizePixel = 0
topBarMask.Parent = TopBar

Title.Name = "Title"
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = ""
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local titleShadow = Instance.new("TextLabel")
titleShadow.Size = Title.Size
titleShadow.Position = UDim2.new(0, 2, 0, 2)
titleShadow.BackgroundTransparency = 1
titleShadow.Text = Title.Text
titleShadow.TextColor3 = Color3.fromRGB(100, 100, 255)
titleShadow.Font = Title.Font
titleShadow.TextSize = Title.TextSize
titleShadow.TextXAlignment = Title.TextXAlignment
titleShadow.TextTransparency = 0.8
titleShadow.ZIndex = Title.ZIndex - 1
titleShadow.Parent = Title

CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 36, 0, 36)
CloseButton.Position = UDim2.new(1, -46, 0, 7)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
CloseButton.BackgroundTransparency = 0.2
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 24
CloseButton.Parent = TopBar
CloseButton.AutoButtonColor = false
CreateUICorner(CloseButton, 18)

StatusContainer.Name = "StatusContainer"
StatusContainer.Size = UDim2.new(1, -40, 0, 40)
StatusContainer.Position = UDim2.new(0, 20, 0, 60)
StatusContainer.BackgroundTransparency = 1
StatusContainer.Parent = MainFrame

AlertBox.Name = "AlertBox"
AlertBox.Size = UDim2.new(1, 0, 1, 0)
AlertBox.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
AlertBox.BackgroundTransparency = 0.25
AlertBox.TextColor3 = Color3.fromRGB(255, 255, 255)
AlertBox.Font = Enum.Font.GothamSemibold
AlertBox.TextSize = 18
AlertBox.Text = ""
AlertBox.Visible = false
AlertBox.Parent = StatusContainer
CreateUICorner(AlertBox, 8)

InputContainer.Name = "InputContainer"
InputContainer.Size = UDim2.new(1, -40, 0, 60)
InputContainer.Position = UDim2.new(0, 20, 0, 110)
InputContainer.BackgroundTransparency = 1
InputContainer.Parent = MainFrame

TextBox.Name = "KeyInput"
TextBox.Size = UDim2.new(1, 0, 1, 0)
TextBox.Text = ""
TextBox.PlaceholderText = "Enter key..."
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
TextBox.BackgroundTransparency = 0.2
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 200)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 18
TextBox.Parent = InputContainer
TextBox.ClearTextOnFocus = false
CreateUICorner(TextBox, 8)
CreateUIStroke(TextBox, Color3.fromRGB(100, 100, 255), 1.5)

ButtonsContainer.Name = "ButtonsContainer"
ButtonsContainer.Size = UDim2.new(1, -40, 0, 120)
ButtonsContainer.Position = UDim2.new(0, 20, 0, 180)
ButtonsContainer.BackgroundTransparency = 1
ButtonsContainer.Parent = MainFrame

SubmitButton.Name = "SubmitButton"
SubmitButton.Size = UDim2.new(1, 0, 0, 50)
SubmitButton.Position = UDim2.new(0, 0, 0, 0)
SubmitButton.Text = "Submit Key"
SubmitButton.BackgroundColor3 = Color3.fromRGB(70, 200, 120)
SubmitButton.BackgroundTransparency = 0.2
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.TextSize = 20
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.Parent = ButtonsContainer
SubmitButton.AutoButtonColor = false
CreateUICorner(SubmitButton, 8)

CopyButton.Name = "CopyButton"
CopyButton.Size = UDim2.new(1, 0, 0, 50)
CopyButton.Position = UDim2.new(0, 0, 0, 60)
CopyButton.Text = "Copy Keysystem URL"
CopyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
CopyButton.BackgroundTransparency = 0.2
CopyButton.Font = Enum.Font.GothamBold
CopyButton.TextSize = 20
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Parent = ButtonsContainer
CopyButton.AutoButtonColor = false
CreateUICorner(CopyButton, 8)

Footer.Name = "Footer"
Footer.Size = UDim2.new(1, -40, 0, 20)
Footer.Position = UDim2.new(0, 20, 1, -30)
Footer.BackgroundTransparency = 1
Footer.Text = "Powered by REV<>OLT"
Footer.TextColor3 = Color3.fromRGB(150, 150, 200)
Footer.Font = Enum.Font.Gotham
Footer.TextSize = 14
Footer.Parent = MainFrame

local function setupButtonEffects(button, defaultColor, hoverColor)
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    local hoverTween = tweenService:Create(button, tweenInfo, {
        BackgroundColor3 = hoverColor,
        TextSize = button.TextSize + 2
    })
    
    local leaveTween = tweenService:Create(button, tweenInfo, {
        BackgroundColor3 = defaultColor,
        TextSize = button.TextSize
    })
    
    local clickTween = tweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.5,
        Size = UDim2.new(button.Size.X.Scale, button.Size.X.Offset * 0.95, button.Size.Y.Scale, button.Size.Y.Offset * 0.95)
    })
    
    local releaseInfo = TweenInfo.new(0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
    local releaseTween = tweenService:Create(button, releaseInfo, {
        BackgroundTransparency = 0.2,
        Size = UDim2.new(button.Size.X.Scale, button.Size.X.Offset, button.Size.Y.Scale, button.Size.Y.Offset)
    })
    
    button.MouseEnter:Connect(function() hoverTween:Play() end)
    button.MouseLeave:Connect(function() leaveTween:Play() end)
    button.MouseButton1Down:Connect(function() clickTween:Play() end)
    button.MouseButton1Up:Connect(function() releaseTween:Play() end)
end

setupButtonEffects(SubmitButton, Color3.fromRGB(70, 200, 120), Color3.fromRGB(90, 220, 140))
setupButtonEffects(CopyButton, Color3.fromRGB(100, 100, 255), Color3.fromRGB(120, 120, 255))
setupButtonEffects(CloseButton, Color3.fromRGB(255, 70, 70), Color3.fromRGB(255, 90, 90))

local function enhancedDragging(frame)
    local dragging, dragInput, dragStart, startPos
    local tweenService = game:GetService("TweenService")
    
    local function update(input)
        local delta = input.Position - dragStart
        local targetPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, 
                                         startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        
        tweenService:Create(frame, TweenInfo.new(0.1), {
            Position = targetPosition
        }):Play()
    end
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

enhancedDragging(MainFrame)

local function typeWriterEffect(textLabel, text, delay)
    local originalFont = textLabel.Font
    local originalSize = textLabel.TextSize
    
    for i = 1, #text do
        textLabel.Text = string.sub(text, 1, i)
        wait(delay)
    end
    
    spawn(function()
        while textLabel and textLabel.Parent do
            tweenService:Create(textLabel, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
                TextColor3 = Color3.fromRGB(200, 200, 255)
            }):Play()
            wait(4)
        end
    end)
end

local function showAlert(message, isSuccess)
    AlertBox.Text = message
    AlertBox.BackgroundColor3 = isSuccess 
        and Color3.fromRGB(70, 200, 120) 
        or Color3.fromRGB(200, 70, 70)
    AlertBox.Visible = true
    AlertBox.TextTransparency = 0
    AlertBox.BackgroundTransparency = 0.25
    
    spawn(function()
        wait(3)
        for i = 0, 1, 0.1 do
            if not AlertBox or not AlertBox.Parent then break end
            AlertBox.TextTransparency = i
            AlertBox.BackgroundTransparency = 0.25 + (i * 0.75)
            wait(0.05)
        end
        if AlertBox and AlertBox.Parent then
            AlertBox.Visible = false
        end
    end)
end

MainFrame.Position = UDim2.new(0.5, -210, 0, -330)
MainFrame.Visible = true
tweenService:Create(MainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -210, 0.5, -165)
}):Play()

local function createGlowEffect(parent)
    local glow = Instance.new("ImageLabel")
    glow.Size = UDim2.new(1.5, 0, 1.5, 0)
    glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    glow.AnchorPoint = Vector2.new(0.5, 0.5)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://4996891970"
    glow.ImageColor3 = Color3.fromRGB(100, 100, 255)
    glow.ImageTransparency = 0.85
    glow.ZIndex = parent.ZIndex - 1
    glow.Parent = parent

    spawn(function()
        while glow and glow.Parent do
            tweenService:Create(glow, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
                ImageTransparency = 0.7,
                Size = UDim2.new(1.7, 0, 1.7, 0)
            }):Play()
            wait(4)
        end
    end)
end

createGlowEffect(Title)

local function isValidJSON(responseBody)
    local success, decoded = pcall(function()
        return game:GetService("HttpService"):JSONDecode(responseBody)
    end)
    return success, decoded
end

local function sendRequest(url, body)
    local request
    if syn and syn.request then
        request = syn.request
    elseif http and http.request then
        request = http.request
    elseif httprequest then
        request = httprequest
    else
        warn("No valid request method found.")
        return nil
    end
    
    local response
    local success, err = pcall(function()
        response = request({
            Url = url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = game:GetService("HttpService"):JSONEncode(body)
        })
    end)
    
    if not success then
        warn("Request failed:", err)
        return nil
    end

    if response and response.Body then
        local success, decodedResponse = isValidJSON(response.Body)
        if success then
            return decodedResponse
        else
            warn("Invalid JSON in response")
            return nil
        end
    else
        warn("Invalid response or missing Body")
        return nil
    end
end

local function getServiceURL()
    local response = sendRequest("https://revolt.kingluc.my.id/live/7-12", {
        I = genv.ServiceID,
        H = hwid
    })

    if response.link then
        showAlert("URL copied to clipboard!", true)
        return response.link
    elseif response.error then
        local errorMessages = {
            MISSING_PARAMS = "Missing Parameters",
            NOT_FOUND_SERVICE = "Service Not Found"
        }
        showAlert(errorMessages[response.error] or "Unknown Error", false)
    end
end

CopyButton.MouseButton1Click:Connect(function()
    local url = getServiceURL()
    if url then
        setclipboard(url)
        print(url)
    end
end)

SubmitButton.MouseButton1Click:Connect(function()
    local response = sendRequest("https://revolt.kingluc.my.id/live/3-11", {
        H = hwid,
        I = genv.ServiceID,
        K = TextBox.Text
    })
    
    if response.status == "VALID_KEY" then
        showAlert("Key Valid! Access Granted", true)
        task.wait(1)
        CHANGE_THIS_FUNCTION_NAME()
        CHANGE_THIS_FUNCTION_NAME_TOO()
    else
        local errorMessages = {
            MISSING_PARAMS = "Missing Parameters",
            INVALID_HWID = "Invalid HWID",
            NOT_FOUND_SERVICE = "Service Not Found",
            INVALID_KEY = "Invalid Key",
            REVOKED_KEY = "Key Revoked"
        }
        showAlert(errorMessages[response.error] or "Unknown Error", false)
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    tweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -210, 0, -330),
        Size = UDim2.new(0, 420*0.8, 0, 330*0.8),
        BackgroundTransparency = 1
    }):Play()
    
    wait(0.5)
    ScreenGui:Destroy()
end)

spawn(function()
    wait(0.7)
    typeWriterEffect(Title, genv.Displayname .. "KeySystem", 0.2)
end)
