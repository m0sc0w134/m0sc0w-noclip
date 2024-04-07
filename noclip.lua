-- Made by m0sc0w | m0sc0w on v3rmillion
-- DISCLAIMER: This script does not have any type of bypass on any AC. Use it at own risk.

-- Create the GUI
local gui = Instance.new("ScreenGui")
gui.Name = "Gunframe"
gui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create the frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Create rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

-- Create the button
local button = Instance.new("TextButton")
button.Name = "NoclipButton"
button.Size = UDim2.new(0, 180, 0, 40)
button.Position = UDim2.new(0.05, 0, 0.5, -20)
button.Text = "Toggle Noclip"
button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
button.BorderSizePixel = 0
button.Font = Enum.Font.SourceSansBold
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 18
button.Parent = frame

-- Function to toggle noclip on and off
local function toggleNoclip()
    local noclipEnabled = false
    
    -- Function to handle character added
    local function onCharacterAdded(character)
        if noclipEnabled then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
    
    -- Function to handle character removing
    local function onCharacterRemoving(character)
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
    
    -- Function to handle button click
    local function onButtonClick()
        noclipEnabled = not noclipEnabled
        
        if noclipEnabled then
            button.Text = "Noclip: ON"
            onCharacterAdded(game.Players.LocalPlayer.Character)
        else
            button.Text = "Noclip: OFF"
            onCharacterRemoving(game.Players.LocalPlayer.Character)
        end
    end
    
    -- Set the initial button text
    button.Text = noclipEnabled and "Noclip: ON" or "Noclip: OFF"
    
    -- Connect button click event
    button.MouseButton1Click:Connect(onButtonClick)
    
    -- Connect character added and removing events
    game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
    game.Players.LocalPlayer.CharacterRemoving:Connect(onCharacterRemoving)
    
    -- Check if character already exists
    if game.Players.LocalPlayer.Character then
        onCharacterAdded(game.Players.LocalPlayer.Character)
    end
end

-- Call the toggleNoclip function
toggleNoclip()
