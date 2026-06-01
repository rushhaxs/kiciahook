if not game:IsLoaded() then game.Loaded:Wait() end
setthreadidentity = setthreadidentity or function() end

local DISCORD = 'discord.gg/geekz'

local GAMES = {
    [701819006] = {FFA=false, Freemium=false, Unloadable=true, Url='https://api.luarmor.net/files/v3/loaders/f442f5803045e53e183560ff4cfbd71dfc.lua'},
    [743675578] = {FFA=true, Freemium=false, Unloadable=true, Url='https://api.luarmor.net/files/v3/loaders/b7d180acad508c48c140afe43d01ea0c.lua'},
    [717803275] = {FFA=true, Freemium=false, Unloadable=true, Url='https://api.luarmor.net/files/v3/loaders/2e6b46bc05af83e8427cd9b5123bba27.lua'},
    [603587208] = {FFA=false, Freemium=false, Unloadable=true, Url='https://api.luarmor.net/files/v3/loaders/63d0cd967eb525cdc489809d1537b356.lua'},
    [245662005] = {FFA=true, Freemium=false, Unloadable=false, Url='https://api.luarmor.net/files/v3/loaders/c7c92198fe99e9b6ea44f3601c77225d.lua'},
    [994732206] = {FFA=true, Freemium=false, Unloadable=false, Url='https://api.luarmor.net/files/v3/loaders/35da3a3a92dd3b65f8d20528035fc94c.lua'},
    [516694422] = {FFA=true, Freemium=false, Unloadable=false, Url='https://api.luarmor.net/files/v3/loaders/0233ba9954f152b29a924c57cf1e83053.lua'},
    [666541354] = {FFA=true, Freemium=false, Unloadable=false, Url='https://api.luarmor.net/files/v3/loaders/24e8cf30a21a49dc9f91b2856f04cd5a.lua'},
    [115797356] = {FFA=true, Freemium=false, Unloadable=false, Url='https://api.luarmor.net/files/v3/loaders/296e5f51cf7ad143111cfe011ce26503.lua'}
}

local gameConfig = GAMES[game.GameId]
if not gameConfig then
    game:GetService('Players').LocalPlayer:Kick('This game is not supported!')
    return
end

local function loadScript()
    pcall(function()
        setthreadidentity(8)
        for _, child in game:GetService('CoreGui'):GetChildren() do
            if child.Name == 'nexlib' then
                child:Destroy()
            end
        end
    end)
    loadstring(game:HttpGet(gameConfig.Url))()
end

local SDK = loadstring(game:HttpGet('https://sdkapi-public.luarmor.net/library.lua'))()
SDK.script_id = gameConfig.Url:split('/')[7]:sub(1, -5)
loadScript()

local KeyCodes = {Enum.KeyCode.Unknown, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D, Enum.KeyCode.Up, Enum.KeyCode.Left, Enum.KeyCode.Down, Enum.KeyCode.Right, Enum.KeyCode.Slash, Enum.KeyCode.Tab, Enum.KeyCode.Backspace, Enum.KeyCode.Escape, Enum.KeyCode.RightShift}
local MouseButtons = {[Enum.UserInputType.MouseButton1]='M1', [Enum.UserInputType.MouseButton2]='M2', [Enum.UserInputType.MouseButton3]='M3'}

local UI = {accentclr = Color3.fromRGB(128, 0, 255), dropdownframes = {}, colorpickerframes = {}}

local ScreenGui = Instance.new('ScreenGui')
ScreenGui.Name = 'nexlib'
setthreadidentity(8)
ScreenGui.Parent = game:GetService('CoreGui')
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new('Frame')
MainFrame.Name = 'MainFrame'
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 200)

local TitleLabel = Instance.new('TextLabel')
TitleLabel.Name = 'Title'
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
TitleLabel.BorderSizePixel = 0
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Font = Enum.Font.Code
TitleLabel.Text = 'geekz'
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18

local DiscordLabel = Instance.new('TextLabel')
DiscordLabel.Name = 'DiscordLabel'
DiscordLabel.Parent = MainFrame
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Position = UDim2.new(0, 10, 0, 40)
DiscordLabel.Size = UDim2.new(1, -20, 0, 30)
DiscordLabel.Font = Enum.Font.Code
DiscordLabel.Text = 'Discord: ' .. DISCORD
DiscordLabel.TextColor3 = UI.accentclr
DiscordLabel.TextSize = 14

local StatusLabel = Instance.new('TextLabel')
StatusLabel.Name = 'StatusLabel'
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 10, 0, 75)
StatusLabel.Size = UDim2.new(1, -20, 0, 30)
StatusLabel.Font = Enum.Font.Code
StatusLabel.Text = 'Script loaded successfully!'
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.TextSize = 14

local LoadButton = Instance.new('TextButton')
LoadButton.Name = 'LoadButton'
LoadButton.Parent = MainFrame
LoadButton.BackgroundColor3 = UI.accentclr
LoadButton.BorderSizePixel = 0
LoadButton.Position = UDim2.new(0.5, -75, 0, 120)
LoadButton.Size = UDim2.new(0, 150, 0, 30)
LoadButton.Font = Enum.Font.Code
LoadButton.Text = 'Ready to Exploit!'
LoadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadButton.TextSize = 14

LoadButton.MouseButton1Click:Connect(function()
    StatusLabel.Text = 'Executing...'
end)
