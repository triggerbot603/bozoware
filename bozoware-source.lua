do
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UIS = game:GetService("UserInputService")
    local LP = Players.LocalPlayer
    if _G.BozoWareLiveStud then pcall(function() _G.BozoWareLiveStud.Destroy() end) end
    _G.BozoWareLiveStud = { Enabled = true }
    local gui = Instance.new("ScreenGui")
    gui.Name = "BozoWareLiveStud"; gui.ResetOnSpawn = false; gui.IgnoreGuiInset = true; gui.DisplayOrder = 99998
    pcall(function() gui.Parent = game:GetService("CoreGui") end)
    if not gui.Parent then gui.Parent = LP:WaitForChild("PlayerGui") end
    local card = Instance.new("Frame")
    card.Size = UDim2.new(0, 190, 0, 108); card.Position = UDim2.new(0, 16, 1, -124)
    card.BackgroundColor3 = Color3.fromRGB(9, 11, 18); card.BorderSizePixel = 0; card.Parent = gui
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(28, 42, 72); stroke.Thickness = 1; stroke.Transparency = 0.15; stroke.Parent = card
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 32); header.BackgroundColor3 = Color3.fromRGB(7, 9, 15)
    header.BorderSizePixel = 0; header.Parent = card
    Instance.new("UICorner", header).CornerRadius = UDim.new(0, 8)
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(1, 0, 0, 10); fill.Position = UDim2.new(0, 0, 1, -10)
    fill.BackgroundColor3 = Color3.fromRGB(7, 9, 15); fill.BorderSizePixel = 0; fill.Parent = header
    local accent = Instance.new("Frame")
    accent.Size = UDim2.new(0, 3, 0, 18); accent.Position = UDim2.new(0, 6, 0.5, -9)
    accent.BackgroundColor3 = Color3.fromRGB(60, 140, 255); accent.BorderSizePixel = 0; accent.Parent = header
    Instance.new("UICorner", accent).CornerRadius = UDim.new(1, 0)
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -80, 0, 14); title.Position = UDim2.new(0, 14, 0, 3)
    title.BackgroundTransparency = 1; title.Text = "BOZOWARE"
    title.TextColor3 = Color3.fromRGB(220, 230, 245); title.Font = Enum.Font.GothamBold
    title.TextSize = 11; title.TextXAlignment = Enum.TextXAlignment.Left; title.Parent = header
    local sub = Instance.new("TextLabel")
    sub.Size = UDim2.new(1, -80, 0, 11); sub.Position = UDim2.new(0, 14, 0, 17)
    sub.BackgroundTransparency = 1; sub.Text = "POSITION"
    sub.TextColor3 = Color3.fromRGB(90, 110, 145); sub.Font = Enum.Font.Gotham
    sub.TextSize = 9; sub.TextXAlignment = Enum.TextXAlignment.Left; sub.Parent = header
    local badge = Instance.new("Frame")
    badge.Size = UDim2.new(0, 52, 0, 16); badge.Position = UDim2.new(1, -58, 0.5, -8)
    badge.BackgroundColor3 = Color3.fromRGB(16, 22, 36); badge.BorderSizePixel = 0; badge.Parent = header
    Instance.new("UICorner", badge).CornerRadius = UDim.new(0, 3)
    local bs = Instance.new("UIStroke")
    bs.Color = Color3.fromRGB(40, 60, 100); bs.Thickness = 1; bs.Transparency = 0.3; bs.Parent = badge
    local badgeTxt = Instance.new("TextLabel")
    badgeTxt.Size = UDim2.new(1, 0, 1, 0); badgeTxt.BackgroundTransparency = 1
    badgeTxt.Text = "PAID"; badgeTxt.TextColor3 = Color3.fromRGB(100, 130, 180)
    badgeTxt.Font = Enum.Font.GothamBold; badgeTxt.TextSize = 8; badgeTxt.Parent = badge
    local rows = {
        { k = "X", c = Color3.fromRGB(200, 60, 60) },
        { k = "Y", c = Color3.fromRGB(60, 190, 80) },
        { k = "Z", c = Color3.fromRGB(60, 120, 230) },
    }
    local labels = {}
    for i, row in ipairs(rows) do
        local y = 38 + (i - 1) * 22
        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(0, 2, 0, 14); bar.Position = UDim2.new(0, 8, 0, y + 2)
        bar.BackgroundColor3 = row.c; bar.BorderSizePixel = 0; bar.Parent = card
        Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
        local letter = Instance.new("TextLabel")
        letter.Size = UDim2.new(0, 20, 0, 18); letter.Position = UDim2.new(0, 16, 0, y)
        letter.BackgroundTransparency = 1; letter.Text = row.k
        letter.TextColor3 = Color3.fromRGB(200, 210, 225); letter.Font = Enum.Font.Gotham
        letter.TextSize = 12; letter.TextXAlignment = Enum.TextXAlignment.Left; letter.Parent = card
        local val = Instance.new("TextLabel")
        val.Size = UDim2.new(1, -60, 0, 18); val.Position = UDim2.new(0, 34, 0, y)
        val.BackgroundTransparency = 1; val.Text = "0"
        val.TextColor3 = Color3.fromRGB(225, 232, 245); val.Font = Enum.Font.Code
        val.TextSize = 13; val.TextXAlignment = Enum.TextXAlignment.Right; val.Parent = card
        labels[row.k] = val
    end
    local dragging = false
    local dragStart = Vector2.new()
    local cardStart = UDim2.new()
    card.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; cardStart = card.Position
        end
    end)
    card.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            card.Position = UDim2.new(cardStart.X.Scale, cardStart.X.Offset + delta.X, cardStart.Y.Scale, cardStart.Y.Offset + delta.Y)
        end
    end)
    _G.BozoWareLiveStud.SetEnabled = function(state) _G.BozoWareLiveStud.Enabled = state; gui.Enabled = state end
    _G.BozoWareLiveStud.Toggle = function() _G.BozoWareLiveStud.SetEnabled(not _G.BozoWareLiveStud.Enabled) end
    _G.BozoWareLiveStud.Destroy = function() pcall(function() gui:Destroy() end); _G.BozoWareLiveStud = nil end
    RunService.Heartbeat:Connect(function()
        if not _G.BozoWareLiveStud or not _G.BozoWareLiveStud.Enabled then return end
        local char = LP.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local p = hrp.Position
            labels.X.Text = string.format("%.0f", p.X)
            labels.Y.Text = string.format("%.0f", p.Y)
            labels.Z.Text = string.format("%.0f", p.Z)
        else
            labels.X.Text = "0"; labels.Y.Text = "0"; labels.Z.Text = "0"
        end
    end)
end


local repo = "https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

-- BozoWare theme: black base, white accent
Library.FontColor       = Color3.fromRGB(255, 255, 255)
Library.MainColor       = Color3.fromRGB(20,  20,  20)
Library.BackgroundColor = Color3.fromRGB(14,  14,  14)
Library.AccentColor     = Color3.fromRGB(255, 255, 255)
Library.OutlineColor    = Color3.fromRGB(45,  45,  45)
Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor)


local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "BozoWare",
    Footer = "v5.0",
    Icon = 0,
    NotifySide = "Left",
    Center = true,
    AutoShow = true,
    Resizable = true,
    MobileButtonsSide = "Left",
    ShowCustomCursor = true,
    Size = UDim2.fromOffset(660, 520),
})

-- Post-load tab layout patch: horizontal wrap via UIGridLayout
task.defer(function()
    local gui = Library.ScreenGui
    if not gui then return end
    -- find MainSectionInner -> TabArea (the Frame holding tab buttons, ZIndex=1 near top)
    local function findTabArea(parent)
        for _, ch in ipairs(parent:GetDescendants()) do
            if ch:IsA("UIListLayout") and ch.FillDirection == Enum.FillDirection.Horizontal
                and ch.Parent and ch.Parent.AbsoluteSize.Y <= 30 then
                return ch.Parent, ch
            end
        end
    end
    local tabArea, oldLayout = findTabArea(gui)
    if not tabArea then return end
    -- swap UIListLayout for UIGridLayout
    oldLayout:Destroy()
    local grid = Instance.new("UIGridLayout")
    grid.CellSize       = UDim2.new(0, 108, 0, 22)
    grid.CellPadding    = UDim2.new(0, 3, 0, 3)
    grid.FillDirection  = Enum.FillDirection.Horizontal
    grid.SortOrder      = Enum.SortOrder.LayoutOrder
    grid.StartCorner    = Enum.StartCorner.TopLeft
    grid.Parent         = tabArea
    tabArea.Size        = UDim2.new(1, -16, 0, 25)
    tabArea.AutomaticSize = Enum.AutomaticSize.Y
    tabArea.ClipsDescendants = false
    -- find TabContainer (sibling frame holding tab content)
    local mainInner = tabArea.Parent
    local tabContainer
    for _, ch in ipairs(mainInner:GetChildren()) do
        if ch:IsA("Frame") and ch ~= tabArea and ch.ZIndex == 2 then
            tabContainer = ch; break
        end
    end
    -- reposition TabContainer dynamically below TabArea
    local function syncContainer()
        local h = grid.AbsoluteContentSize.Y
        if tabContainer then
            tabContainer.Position = UDim2.new(0, 8, 0, h + 12)
            tabContainer.Size     = UDim2.new(1, -16, 1, -(h + 20))
        end
    end
    grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(syncContainer)
    task.wait() syncContainer()
end)

local function Notify(text, duration)
    if _G.BozoWareSilentLoad then return end
    Library:Notify({ Title = "BozoWare", Description = text, Time = duration or 3 })
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local char, root, hum
local conns = {}

local function killConn(key)
    if conns[key] then conns[key]:Disconnect(); conns[key] = nil end
end

local function getLocalRoot() return root end

local function safeCall(fn, ...)
    local ok, err = pcall(fn, ...)
    if not ok then
        warn("[luax] error:", err)
    end
    return ok
end

local function safeSet(instance, prop, value)
    if not instance then return end
    pcall(function() instance[prop] = value end)
end

local CFG = {
    VOID_ENABLED = false, VOID_METHOD = "Quantum",
    SPEED = 1e15, CHAOS = 0.98, BASE_X = 0, BASE_Y = 0, BASE_Z = 0,
    RADIUS = 1e15, VOID_Y_MIN = -1e15, VOID_Y_MAX = 1e15,
    TP_MIN_STUDS = -9e14, TP_MAX_STUDS = 9e14,
    TP_RAND_ENABLED = true, TP_RAND_MIN = -1e15, TP_RAND_MAX = 1e15,
    TP_VERT_SPIKE = true, TP_VERT_MULT_MIN = 0.5, TP_VERT_MULT_MAX = 3.0,
    TP_CORNER_WEIGHT = 0.55, TP_EDGE_WEIGHT = 0.35, TP_SCREEN_JITTER = 0.12,
    TP_SCREEN_CLAMP = true, TP_VIEWPORT_RAY = true, TP_NEG_BIAS = true,
    TP_PRESERVE_Y = false,
    VOID_SAFE_RADIUS = 0, VOID_ORBIT_TARGET = false, VOID_ORBIT_SPEED = 90,
    VOID_STOP_ON_DAMAGE = false, VOID_PREDICTIVE = false, VOID_PREDICT_LEAD = 0.15,
    VOID_AUTO_REENABLE = false, VOID_ANTIFLING = false,
    VOID_FREEZE_ON_GROUND = false, VOID_ANTIVOID = false,
    VOID_DURATION_ENABLED = false, VOID_DURATION = 10,
    VOID_RANDOM_DURATION = false, VOID_DURATION_MIN = 5, VOID_DURATION_MAX = 30,
    VOID_STAY_IN_REGION = false, VOID_REGION_X = 1e4, VOID_REGION_Y = 1e4, VOID_REGION_Z = 1e4,
    VOID_REGION_CIRCLE = true, VOID_REGION_BOX = false, VOID_REGION_CENTER_SELF = true,
    VOID_REGION_CX = 0, VOID_REGION_CY = 0, VOID_REGION_CZ = 0,
    VOID_REGION_COLLAPSE = false, VOID_REGION_COLLAPSE_SPD = 50,
    VOID_REGION_NOTIFY_EXIT = false, VOID_REGION_SNAP_EDGE = true,
    VOID_LOG_POSITIONS = false,
    SMART_EVASION = false, SMART_EVASION_INF = false,
    EVASION_RANGE = 80, EVASION_THREAT_DIST = 40,
    EVASION_DODGE_POWER = 100, EVASION_COOLDOWN = 0.03,
    EVASION_PREDICT_TIME = 0.18, EVASION_NOTIFY = false,
    EVASION_MICRO_JITTER = true, EVASION_VERTICAL_SPIKE = true,
    EVASION_LAYERED = true, EVASION_THREAT_SCALE = true,
    VOID_KILLER_ENABLED = false, VOID_KILLER_DESYNC = true,
    VOID_KILLER_FAKE_GROUND = true, VOID_KILLER_FORCE_HITBOX = true,
    VOID_KILLER_HITBOX_SIZE = 500, VOID_KILLER_RANGE = 1e15,
    VOID_KILLER_AUTO_SHOOT = true, VOID_KILLER_FREEZE_TARGET = true,
    VOID_KILLER_SNAP_TO_MAP = true, VOID_KILLER_AUTO_AIM = true,
    VOID_KILLER_AIM_STRENGTH = 1, VOID_KILLER_NETWORK_OWN = true,
    VOID_KILLER_NO_CLIP = true,
}

local cfg = {
    orbitEnabled = false, orbitSpeed = 90, orbitDist = 8, orbitHeight = 0,
    orbitLerp = 0.3, orbitMode = "Circle", orbitPredict = false, orbitPredStr = 0.2,
    orbitFace = true, orbitLockDist = 999999999, orbitTarget = "Closest", orbitAxis = "XZ",
    orbitReverse = false, orbitRandRad = false, orbitRandMin = 5, orbitRandMax = 20,
    orbitYawOff = 0, orbitPitchOff = 0, orbitOffX = 0, orbitOffZ = 0,
    orbitHeightOscillate = false, orbitHeightOscAmp = 5, orbitHeightOscSpeed = 2,
    orbitSpeedRandom = false, orbitSpeedRandMin = 20, orbitSpeedRandMax = 200,
    orbitDistPulse = false, orbitDistPulseAmp = 5, orbitDistPulseSpeed = 1,
    orbitZigzag = false, orbitZigzagAmp = 3, orbitZigzagFreq = 4,
    orbitSnapBack = false, orbitSnapInterval = 0.5,
    orbitAntiFling = true, orbitVelZero = true, orbitPhaseThrough = true,
    orbitNetworkOwn = true, orbitNoClip = true, orbitMassless = true,
    orbitAutoDisable = false, orbitAutoDisableRange = 200, orbitSmartTarget = true,
    orbitSmoothCatch = true, orbitPredictMult = 1.0, orbitLookAhead = true,
    orbitHipHeight = 0, orbitWallClip = true, orbitIgnoreCollide = true,
    orbitAutoShoot = true, orbitShootCooldown = 0.01, orbitAttackRange = 1e15,
    orbitAutoAim = true, orbitAimStrength = 1,
    orbitInfiniteRange = true, orbitExpandedHitbox = true, orbitHitboxSize = 500,
    orbitFastTp = true, orbitFastTpCount = 20, orbitFastTpInterval = 0.001,
    orbitStickToTarget = true, orbitStickOffset = 2,
    orbitBypassAnticheat = true, orbitAntiKick = true,
}

local cfgDodge = {
    predEnabled = false, predRadius = 120, predDodgeDist = 80,
    predCooldown = 0.03, predThreshold = 300, predMult = 1,
    predLeadTime = 0.22, predShootDetect = true, predShootDot = 0.80,
    predShootDist = 100, predBulletSpd = 200, predReactTime = 0.06,
    predRaycast = true, predMultiPoint = true, predBackstep = true,
    predReactionLadder = true, predThreatScore = true,
    predAimVector = true, predCameraBone = true, predAnimDetect = true,
    predRemoteHook = true, predPredictiveAim = true, predPredictiveLead = 0.25,
    predInfiniteRange = true, predNotifyAnywhere = true,
    predRivalsMode = true, predRivalsHitboxExpand = true, predRivalsHitboxSize = 150,
    predSafeZone = true, predSafeZoneRadius = 500,
    predAutoShoot = true, predAutoShootRange = 1e15,
    predNoClip = true, predMassless = true,
    predBypassAnticheat = true, predAntiKick = true,
    predNetworkOwn = true, predVelZero = true,
    predAutoAim = true, predAimStrength = 1,
    predFastTp = true, predFastTpCount = 20, predFastTpInterval = 0.001,
    predStickToTarget = true, predStickOffset = 2,
    predPhaseThrough = true, predIgnoreCollide = true,
}

local antiBaitCFG = {
    enabled = false, velSpikeEnabled = true, velThreshold = 200,
    velDodgeDist = 100, flickerEnabled = true, flickerWindow = 0.3,
    flickerMinTps = 2, flickerTpDist = 10, dodgeCooldown = 0.02,
    dodgeMode = "Perpendicular", notifyOnDodge = true,
    dodgeOnShoot = true, shootLookThresh = 0.85,
    gunPredEnabled = true, gunPredDot = 0.80, gunPredVelMin = 30,
    gunPredDodgeDist = 100, gunPredCooldown = 0.02, gunPredLead = 0.18,
    baitEnabled = true, baitStallTime = 0.08, baitStallChance = 0.4,
    baitFakeLock = true, baitFakeLockTime = 0.06,
    baitHookActivate = true, baitReactionWindow = 0.18,
    baitNotifyLabel = true, reScanInterval = 2,
    infiniteRange = true, infiniteRadius = 5e12,
    rivalsMode = true, rivalsRemoteScan = true,
    rivalsToolScan = true, rivalsAnimScan = true,
    antiBaitNoClip = true, antiBaitMassless = true,
    antiBaitVelZero = true, antiBaitNetworkOwn = true,
    antiBaitBypassAnticheat = true, antiBaitAntiKick = true,
    antiBaitFastTp = true, antiBaitFastTpCount = 20, antiBaitFastTpInterval = 0.001,
    antiBaitStickToTarget = true, antiBaitStickOffset = 2,
    antiBaitPhaseThrough = true, antiBaitIgnoreCollide = true,
    antiBaitAutoAim = true, antiBaitAimStrength = 1,
    antiBaitAutoShoot = true, antiBaitAutoShootRange = 1e15,
    antiBaitUniversalAim = true, antiBaitUniversalAnimation = true,
    antiBaitUniversalVelocity = true,
}

local rangeExtCFG = {
    enabled = false, range = 5e12, hitboxSize = 500,
    expandHitboxes = true, hitboxTransparency = 0.5,
    patchRaycast = true, patchWeaponValues = true,
    spoofOrigin = false, spoofDistance = 200,
    fastCast = false, fastCastRate = 60,
    fovBoost = false, fovValue = 160,
    includeSelf = false, teamCheck = false, restoreOnDisable = true,
    aimOnly = false, holdKey = false, progressive = false,
    safeDistance = false, safeDist = 5, maxEnemies = 50,
    originalParts = {}, originalRaycast = nil, originalFov = 70,
    rivalsMode = true, rivalsAvatarScale = 50,
    rivalsBreakHitbox = true, rivalsBreakSize = 2500,
    rivalsNoCollide = true, rivalsMassless = true,
    rivalsExpandAll = true, rivalsExpandSelf = true,
    rangeExtNoClip = true, rangeExtVelZero = true,
    rangeExtNetworkOwn = true, rangeExtAntiFling = true,
    rangeExtBypassAnticheat = true, rangeExtAntiKick = true,
    rangeExtFastTp = true, rangeExtFastTpCount = 20, rangeExtFastTpInterval = 0.001,
    rangeExtStickToTarget = true, rangeExtStickOffset = 2,
    rangeExtPhaseThrough = true, rangeExtIgnoreCollide = true,
    rangeExtAutoAim = true, rangeExtAimStrength = 1,
    rangeExtAutoShoot = true, rangeExtAutoShootRange = 1e15,
    rangeExtInfiniteRange = true,
}

local translocCFG = {
    enabled = false, frequency = 512, offsetDist = 1e15,
    offsetMode = "Ahead", offsetY = 0, fakeVel = true,
    fakeVelMag = 1e15, snapBack = true, jitter = true,
    jitterAmp = 1e14, layers = 10,
    burstMode = false, burstCount = 10, burstInterval = 0.001,
    randomFrequency = false, freqMin = 50, freqMax = 500,
    spinFake = false, spinFakeSpeed = 720,
    mirrorX = false, mirrorZ = false,
    cascadeOffset = false, cascadeStep = 1e11,
    wavePattern = false, waveFreq = 2, waveAmp = 1e11,
    pingPong = false, pingPongDist = 1e12,
    pulse = false, pulseAmp = 1e11, pulseSpeed = 1,
    diagonal = false, diagonalAngle = 45,
    alternatingVertical = false, altVertAmp = 1e11,
    screenEdge = false, orbitFake = false, orbitSpeed = 90, orbitRadius = 1e11,
    zoneEscape = false, zoneEscapeRadius = 200,
    autoDodge = false, autoDodgeRadius = 60,
    usePreRenderCommit = true, networkOwnerFix = true,
    rivalsMode = true, rivalsTranslocFreq = 2048,
    rivalsTranslocDist = 1e15, rivalsTranslocLayers = 20,
    rivalsFakeVel = true, rivalsFakeVelMag = 1e15,
    rivalsSnapBack = true, rivalsNetworkOwner = true,
    translocNoClip = true, translocAntiFling = true,
    translocVelZero = true, translocMassless = true,
    translocPhaseThrough = true, translocIgnoreCollide = true,
    translocHipHeight = 0,
    translocBypassAnticheat = true, translocAntiKick = true,
    translocFastTp = true, translocFastTpCount = 20, translocFastTpInterval = 0.001,
    translocStickToTarget = true, translocStickOffset = 2,
    translocAutoAim = true, translocAimStrength = 1,
    translocAutoShoot = true, translocAutoShootRange = 1e15,
    translocInfiniteRange = true,
}

local antiTranslocCFG = {
    enabled = false, detectRadius = 100, detectWindow = 0.5,
    minTps = 3, dodgeDistance = 30, dodgeCooldown = 0.2,
    mode = "Evade", freezeTime = 0.1, predictLead = 0.1, notify = true,
    counterTeleport = false, counterTpOffset = 50,
    autoEvadeAll = false, evadeAllRadius = 200,
    shieldMode = false, shieldRadius = 20,
    bounceback = false, bouncebackDist = 100,
    spinEvade = false, spinEvadeSpeed = 360,
    multiDodge = false, multiDodgeCount = 3,
    atNoClip = true, atMassless = true,
    atVelZero = true, atNetworkOwn = true,
    atAntiFling = true, atPhaseThrough = true,
    atIgnoreCollide = true, atHipHeight = 0,
    atBypassAnticheat = true, atAntiKick = true,
    atFastTp = true, atFastTpCount = 20, atFastTpInterval = 0.001,
    atStickToTarget = true, atStickOffset = 2,
    atAutoAim = true, atAimStrength = 1,
    atAutoShoot = true, atAutoShootRange = 1e15,
    atInfiniteRange = true,
}

local velDesyncCFG = {
    enabled = false, intensity = 50, angle = 90, jitter = 20,
    flip = false, speed = 10,
    randomizeAngle = false, angleMin = 0, angleMax = 360,
    multiVector = false, vectorCount = 3,
    spikeMode = false, spikeInterval = 0.05, spikeMag = 1e6,
    invertOnTimer = false, invertInterval = 0.2,
    oscillate = false, oscillateFreq = 5, oscillateAmp = 30,
    noiseVel = false, noiseScale = 1,
    burstDesync = false, burstEvery = 0.1, burstMag = 5e5,
    counterVel = false, rotateVel = false, rotateVelSpeed = 180,
    vdNoClip = true, vdMassless = true,
    vdAntiFling = true, vdVelZero = false,
    vdNetworkOwn = true, vdPhaseThrough = true,
    vdIgnoreCollide = true, vdHipHeight = 0,
    vdBypassAnticheat = true, vdAntiKick = true,
    vdFastTp = true, vdFastTpCount = 20, vdFastTpInterval = 0.001,
    vdStickToTarget = true, vdStickOffset = 2,
    vdAutoAim = true, vdAimStrength = 1,
    vdAutoShoot = true, vdAutoShootRange = 1e15,
    vdInfiniteRange = true,
}

local riotGodmodeCFG = {
    enabled = false, speed = 0.03, evadeRange = 30,
    spinSpeed = 180, avoidBullets = true, bulletDodge = 40,
    heightVariance = 10, groundSnap = false, phaseMode = false,
    phaseInterval = 0.02, spinAxis = "Y", randomAxis = false,
    maxJump = 200, minJump = 10, multiTp = false,
    multiTpCount = 3, multiTpDelay = 0.01,
    autoShoot = true, attackRange = 1e15, shootCooldown = 0.01,
    lastShot = 0, forceFaceTarget = true,
    rgNoClip = true, rgMassless = true, rgAntiFling = true,
    rgVelZero = true, rgNetworkOwn = true, rgPhaseThrough = true,
    rgIgnoreCollide = true, rgHipHeight = 0,
    rgAutoShootAccurate = true, rgAimStrength = 1,
    rgBypassAnticheat = true, rgAntiKick = true,
    rgFastTp = true, rgFastTpCount = 20, rgFastTpInterval = 0.001,
    rgStickToTarget = true, rgStickOffset = 2,
    rgAutoAim = true, rgInfiniteRange = true,
}

local riotAbuserCFG = {
    enabled = false, mode = "Stick", height = 3, forward = 0, right = 0, down = 0,
    autoShoot = true, attackRange = 1e15, orbitEnabled = false,
    orbitRadius = 5, orbitSpeed = 200, orbitHeight = 2,
    spinOnTarget = false, spinSpeed = 360, phaseOffset = 3,
    multiTarget = false, randomOffset = false, randomOffAmp = 2,
    bounceHeight = 5, bounceSpeed = 8, shootCooldown = 0.01,
    lastShot = 0, predictTarget = false, predictLead = 0.1,
    forceFaceTarget = true,
    raNoClip = true, raMassless = true, raAntiFling = true,
    raVelZero = true, raNetworkOwn = true, raPhaseThrough = true,
    raIgnoreCollide = true, raHipHeight = 0,
    raAutoShootAccurate = true, raAimStrength = 1,
    raBypassAnticheat = true, raAntiKick = true,
    raFastTp = true, raFastTpCount = 20, raFastTpInterval = 0.001,
    raStickToTarget = true, raStickOffset = 2,
    raAutoAim = true, raInfiniteRange = true,
}

local slingCFG = {
    enabled = false, mode = "Follow", targetMode = "Closest",
    hideAvatar = true, autoShoot = true,
    stickHeight = 2,
    attackRange = 1e15, shotCooldown = 0.01,
    useTargetVel = true,
    fastTpSpeed = 0.005, fastTpOffset = 1.5,
    fastTpJitter = 1, fastTpMulti = true, fastTpCount = 5,
    fastTpPenetrate = true, fastTpRandAng = true, rushCooldown = 0.01,
    followLerp = 0.5, followDistance = 2, followHeight = 2,
    followPredict = true, followLead = 0.15,
    stalkDistance = 6, stalkHeight = 3, stalkBehind = true,
    hoverHeight = 8, hoverBob = true, hoverBobAmp = 1, hoverBobSpeed = 2,
    hideTransparency = 1, hideAccessories = true,
    rivalsMode = true, rivalsInfiniteRange = true,
    rivalsRange = 1e15, rivalsAutoShoot = true,
    rivalsHitboxExpand = true, rivalsHitboxSize = 500,
    rivalsNetworkOwner = true, rivalsFastTp = true,
    rivalsFastTpCount = 20, rivalsFastTpInterval = 0.001,
    rivalsPositionLock = true,
    noTpMode = true, noTpRange = 1e15,
    noTpHitboxSize = 2000, noTpAutoShoot = true,
    noTpAimAssist = true, noTpNetworkOwner = true,
    noTpSilentAim = true, noTpOriginSpoof = true,
    noTpRaycastPatch = true, noTpWeaponRange = 1e15,
    noTpPingComp = true, noTpTargetLock = true,
    noTpShotRedirect = true, noTpLookVector = true,
    noTpSpread = 0, noTpRecoil = 0,
    noTpVelocityComp = true, noTpGravityComp = true,
    noTpInfiniteRange = true, noTpInstantHit = true,
    noTpHitscanOverride = true, noTpWallBang = true,
    noTpProjectileFollow = true, noTpSpoofSelf = true,
    slingNoClip = true, slingMassless = true,
    slingAntiFling = true, slingVelZero = true,
    slingPhaseThrough = true, slingIgnoreCollide = true,
    slingHipHeight = 0,
    slingAutoAim = true, slingAimStrength = 1,
    slingAutoShootAccurate = true, slingTargetLock = true,
    slingAntiKick = true, slingBypassAnticheat = true,
    slingFastTp = true, slingFastTpCount = 20, slingFastTpInterval = 0.001,
    slingStickToTarget = true, slingStickOffset = 2,
    slingInfiniteRange = true,
}

local aaSettings = {
    enabled = false, mode = "RandomSpin", speed = 5000,
    angle = 90, randomSpeed = true, jitterPitch = true,
    pitchAngle = 45, yawAngle = 45, staticYaw = 90, staticPitch = 0,
    customYaw = 180, customPitch = 0, jitterYaw = true,
    fakeAngle = false, fakeYaw = 45, fakePitch = 0,
    microJitter = false, microJitterAmp = 5, microJitterSpeed = 30,
    desyncMode = false, desyncOffset = 180,
    rollEnabled = false, rollSpeed = 360,
    breatheEffect = false, breatheAmp = 3, breatheSpeed = 1,
    randomFlip = false, flipChance = 0.05,
    enhancedMode = true, enhancedSpinSpeed = 10000,
    enhancedJitterAmp = 90, enhancedJitterSpeed = 60,
    enhancedDesyncOffset = 270, enhancedRollSpeed = 720,
    enhancedBreatheAmp = 15, enhancedBreatheSpeed = 3,
    enhancedFlipChance = 0.25, enhancedMicroAmp = 45,
    enhancedMicroSpeed = 120, enhancedFakeYaw = 90, enhancedFakePitch = 45,
    multiAxisSpin = true, multiAxisX = true,
    multiAxisY = true, multiAxisZ = true,
    multiAxisSpeedX = 3600, multiAxisSpeedY = 5400, multiAxisSpeedZ = 2700,
    chaosMode = true, chaosInterval = 0.05, chaosMaxAngle = 180,
    lookAtRandom = true, lookAtRandomInterval = 0.1,
    aaNoClip = true, aaMassless = true,
    aaAntiFling = true, aaVelZero = true,
    aaNetworkOwn = true, aaPhaseThrough = true,
    aaIgnoreCollide = true, aaHipHeight = 0,
    aaSpinAxisLock = false, aaSpinAxisLockAxis = "Y",
    aaSmoothInterp = true, aaSmoothSpeed = 0.9,
    aaTargetDistraction = false, aaDistractionChance = 0.15,
    aaBypassAnticheat = true, aaAntiKick = true,
    aaFastTp = true, aaFastTpCount = 20, aaFastTpInterval = 0.001,
    aaStickToTarget = true, aaStickOffset = 2,
    aaAutoAim = true, aaAimStrength = 1,
    aaAutoShoot = true, aaAutoShootRange = 1e15,
    aaInfiniteRange = true,
}

local function getClosest()
    if not root then return nil end
    local best, bestD = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LocalPlayer or not p.Character then continue end
        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        local d = (root.Position - hrp.Position).Magnitude
        if d < bestD then bestD = d; best = p end
    end
    return best
end

local function getTarget(mode)
    if mode == "Closest" then return getClosest() end
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(list, p)
        end
    end
    if #list == 0 then return nil end
    if mode == "Random" then return list[math.random(1, #list)]
    elseif mode == "Weakest" then
        table.sort(list, function(a, b)
            local ha = a.Character:FindFirstChildOfClass("Humanoid")
            local hb = b.Character:FindFirstChildOfClass("Humanoid")
            return (ha and ha.Health or 0) < (hb and hb.Health or 0)
        end)
        return list[1]
    elseif mode == "Strongest" then
        table.sort(list, function(a, b)
            local ha = a.Character:FindFirstChildOfClass("Humanoid")
            local hb = b.Character:FindFirstChildOfClass("Humanoid")
            return (ha and ha.Health or 0) > (hb and hb.Health or 0)
        end)
        return list[1]
    end
    return list[1]
end

local function AddBindableToggle(group, flag, text, default, callback)
    local toggle = group:AddToggle(flag, { Text = text, Default = default or false, Callback = callback })
    toggle:AddKeyPicker(flag .. "Key", { Default = "None", Mode = "Toggle", Text = text, SyncToggleState = true, NoUI = false })
    return toggle
end

local function predictPos(hrp, lead)
    if not hrp then return Vector3.zero end
    local vel = hrp.AssemblyLinearVelocity
    local grav = Vector3.new(0, -workspace.Gravity * 0.5, 0)
    return hrp.Position + vel * lead + grav * (lead * lead * 0.5)
end

local function getAimOrigin(plr)
    if not plr or not plr.Character then return nil end
    return plr.Character:FindFirstChild("Head")
        or plr.Character:FindFirstChild("CameraBone", true)
        or plr.Character:FindFirstChild("HumanoidRootPart")
end

local function applyNoClip(character)
    if not character then return end
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            pcall(function() part.CanCollide = false; part.Massless = true end)
        end
    end
end

local function setNetworkOwnerLocal(hrp)
    if not hrp then return end
    pcall(function() hrp:SetNetworkOwner(LocalPlayer) end)
end

local function aimAtTarget(myHrp, targetPos)
    if not myHrp then return end
    local dir = (targetPos - myHrp.Position)
    if dir.Magnitude < 0.1 then return end
    pcall(function()
        myHrp.CFrame = CFrame.new(myHrp.Position, myHrp.Position + Vector3.new(dir.X, 0, dir.Z))
    end)
end

local function fireTool()
    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if tool then
        pcall(function() tool:Activate() end)
        task.wait(0.02)
        pcall(function() tool:Deactivate() end)
    end
end

local function enemyAimingUniversal(plr, myPos, dot)
    local origin = getAimOrigin(plr)
    if not origin then return false end
    local look = origin.CFrame.LookVector
    local eye = origin.Position + look * 0.5
    local toMe = myPos - eye
    if toMe.Magnitude < 0.01 then return false end
    return look:Dot(toMe.Unit) > dot
end

local voidElapsed = 0
local voidPos = Vector3.new(0, 0, 0)
local intendedVoidPos = Vector3.new(0, 0, 0)
local voidStartTime = 0
local voidAutoReenableTime = 0
local voidRegionCurrentRadius = nil
local voidRegionLastIn = true
local smartLastDodge = 0
local voidKillerTargets = {}

local function isInsideVoidPart(pos)
    if not workspace then return false end
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Include
    params.FilterDescendantsInstances = { workspace }
    local result = workspace:Spherecast(pos, 1, Vector3.new(0, 0.01, 0), params)
    return result ~= nil
end

local function clampToRegion(pos)
    if not CFG.VOID_STAY_IN_REGION then return pos end
    local cx, cy, cz = CFG.VOID_REGION_CX, CFG.VOID_REGION_CY, CFG.VOID_REGION_CZ
    if CFG.VOID_REGION_CENTER_SELF and root then cx, cy, cz = root.Position.X, root.Position.Y, root.Position.Z end
    if voidRegionCurrentRadius == nil then voidRegionCurrentRadius = math.max(CFG.VOID_REGION_X, CFG.VOID_REGION_Z) end
    if CFG.VOID_REGION_COLLAPSE then voidRegionCurrentRadius = math.max(10, voidRegionCurrentRadius - CFG.VOID_REGION_COLLAPSE_SPD * (1/60)) end
    local rx = CFG.VOID_REGION_CIRCLE and voidRegionCurrentRadius or CFG.VOID_REGION_X
    local ry = CFG.VOID_REGION_Y
    local rz = CFG.VOID_REGION_CIRCLE and voidRegionCurrentRadius or CFG.VOID_REGION_Z
    local dx = pos.X - cx; local dy = pos.Y - cy; local dz = pos.Z - cz
    if CFG.VOID_REGION_CIRCLE then
        local flat = math.sqrt(dx*dx + dz*dz)
        if flat > voidRegionCurrentRadius then local s = voidRegionCurrentRadius / flat; dx = dx * s; dz = dz * s end
        if CFG.VOID_REGION_NOTIFY_EXIT and voidRegionLastIn then voidRegionLastIn = false; Notify("region: clamped back to edge", 1.5) end
        voidRegionLastIn = true
    else
        if math.abs(dx) > rx then dx = (dx > 0 and rx or -rx) end
        if math.abs(dy) > ry then dy = (dy > 0 and ry or -ry) end
        if math.abs(dz) > rz then dz = (dz > 0 and rz or -rz) end
    end
    if not CFG.VOID_REGION_SNAP_EDGE then dx = dx + (math.random() - 0.5) * 20; dz = dz + (math.random() - 0.5) * 20 end
    return Vector3.new(cx + dx, cy + dy, cz + dz)
end

local function getTpEverywherePosition()
    local dist
    if CFG.TP_RAND_ENABLED then dist = CFG.TP_RAND_MIN + math.random() * (CFG.TP_RAND_MAX - CFG.TP_RAND_MIN)
    else dist = CFG.TP_MIN_STUDS + math.random() * (CFG.TP_MAX_STUDS - CFG.TP_MIN_STUDS) end
    if CFG.TP_NEG_BIAS and math.random() < 0.5 then dist = -math.abs(dist) end
    if not Camera or not CFG.TP_VIEWPORT_RAY then
        return Vector3.new(CFG.BASE_X + (math.random()*2-1)*math.abs(dist), CFG.BASE_Y + (math.random()*2-1)*math.abs(dist), CFG.BASE_Z + (math.random()*2-1)*math.abs(dist))
    end
    local vp = Camera.ViewportSize
    local screenX, screenY
    local roll = math.random()
    if roll < CFG.TP_CORNER_WEIGHT then
        local corners = { Vector2.new(0,0), Vector2.new(vp.X,0), Vector2.new(0,vp.Y), Vector2.new(vp.X,vp.Y) }
        local c = corners[math.random(1, 4)]
        screenX = c.X; screenY = c.Y
    elseif roll < CFG.TP_CORNER_WEIGHT + CFG.TP_EDGE_WEIGHT then
        local edge = math.random(1, 4)
        if edge == 1 then screenX = math.random()*vp.X; screenY = 0
        elseif edge == 2 then screenX = math.random()*vp.X; screenY = vp.Y
        elseif edge == 3 then screenX = 0; screenY = math.random()*vp.Y
        else screenX = vp.X; screenY = math.random()*vp.Y end
    else screenX = math.random()*vp.X; screenY = math.random()*vp.Y end
    if CFG.TP_SCREEN_JITTER > 0 then
        screenX = screenX + (math.random()-0.5)*vp.X*CFG.TP_SCREEN_JITTER
        screenY = screenY + (math.random()-0.5)*vp.Y*CFG.TP_SCREEN_JITTER
    end
    if CFG.TP_SCREEN_CLAMP then screenX = math.clamp(screenX, 0, vp.X); screenY = math.clamp(screenY, 0, vp.Y) end
    local ray = Camera:ViewportPointToRay(screenX, screenY, math.abs(dist))
    local base = ray.Origin
    local vertMult = CFG.TP_VERT_MULT_MIN + math.random() * (CFG.TP_VERT_MULT_MAX - CFG.TP_VERT_MULT_MIN)
    local vert = CFG.TP_VERT_SPIKE and (math.random()*2-1)*math.abs(dist)*vertMult or 0
    if CFG.TP_NEG_BIAS then vert = vert - math.abs(vert)*0.3 end
    if CFG.TP_PRESERVE_Y then vert = 0 end
    local y = CFG.TP_PRESERVE_Y and (root and root.Position.Y or 0) or (base.Y + vert)
    return Vector3.new(base.X, y, base.Z)
end

local function stepVoid(dt)
    local m = CFG.VOID_METHOD
    if m == "Drift" then
        voidPos = voidPos + Vector3.new(CFG.SPEED*dt, CFG.SPEED*dt*0.5, CFG.SPEED*dt*0.3)
        return voidPos
    elseif m == "Chaos" then
        voidPos = voidPos + Vector3.new((math.random()-0.5)*CFG.SPEED*dt*5, (math.random()-0.5)*CFG.SPEED*dt*5, (math.random()-0.5)*CFG.SPEED*dt*5)
        return voidPos
    elseif m == "Loop" then
        local r = math.min(CFG.RADIUS*0.8, 1e9 + (voidElapsed % 100)*1e7)
        return Vector3.new(CFG.BASE_X + math.cos(voidElapsed*2)*r, (CFG.VOID_Y_MIN+CFG.VOID_Y_MAX)/2 + math.sin(voidElapsed*1.3)*r*0.2, CFG.BASE_Z + math.sin(voidElapsed*2)*r)
    elseif m == "Spiral" then
        local r = math.min(CFG.RADIUS*0.9, (voidElapsed % 50)*2e9)
        return Vector3.new(CFG.BASE_X + math.cos(voidElapsed*3)*r, (CFG.VOID_Y_MIN+CFG.VOID_Y_MAX)/2 + math.sin(voidElapsed*0.5)*r*0.3, CFG.BASE_Z + math.sin(voidElapsed*3)*r)
    elseif m == "Quantum" then
        return Vector3.new(CFG.BASE_X + (math.random()*2-1)*CFG.RADIUS, (CFG.VOID_Y_MIN+CFG.VOID_Y_MAX)/2 + (math.random()*2-1)*(CFG.VOID_Y_MAX-CFG.VOID_Y_MIN)/2, CFG.BASE_Z + (math.random()*2-1)*CFG.RADIUS)
    elseif m == "TP Everywhere" then
        return getTpEverywherePosition()
    elseif m == "OrbitTarget" then
        local t = getClosest()
        if t and t.Character then
            local hrp = t.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local ang = voidElapsed * math.rad(CFG.VOID_ORBIT_SPEED)
                return hrp.Position + Vector3.new(math.cos(ang)*5, 2, math.sin(ang)*5)
            end
        end
        return getTpEverywherePosition()
    end
    return voidPos
end

local function runVoidKiller(dt)
    if not CFG.VOID_KILLER_ENABLED or not root then return end
    local myPos = root.Position
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LocalPlayer or not p.Character then continue end
        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        local dist = (hrp.Position - myPos).Magnitude
        if dist > CFG.VOID_KILLER_RANGE then continue end
        local insideVoid = isInsideVoidPart(hrp.Position)
        if insideVoid or dist < 500 then
            if CFG.VOID_KILLER_SNAP_TO_MAP then
                local rayParams = RaycastParams.new()
                rayParams.FilterType = Enum.RaycastFilterType.Exclude
                rayParams.FilterDescendantsInstances = { LocalPlayer.Character, p.Character }
                local rayOrigin = Vector3.new(hrp.Position.X, hrp.Position.Y + 1000, hrp.Position.Z)
                local result = workspace:Raycast(rayOrigin, Vector3.new(0, -5000, 0), rayParams)
                if result then
                    pcall(function()
                        hrp.CFrame = CFrame.new(result.Position + Vector3.new(0, 3, 0))
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.AssemblyAngularVelocity = Vector3.zero
                    end)
                end
            end
            if CFG.VOID_KILLER_FREEZE_TARGET then
                pcall(function()
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    hrp.AssemblyAngularVelocity = Vector3.zero
                end)
            end
            if CFG.VOID_KILLER_FORCE_HITBOX then
                for _, part in ipairs(p.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        pcall(function()
                            part.Size = Vector3.new(CFG.VOID_KILLER_HITBOX_SIZE, CFG.VOID_KILLER_HITBOX_SIZE, CFG.VOID_KILLER_HITBOX_SIZE)
                            part.CanCollide = false; part.Massless = true
                        end)
                    end
                end
            end
            if CFG.VOID_KILLER_NETWORK_OWN then pcall(function() hrp:SetNetworkOwner(LocalPlayer) end) end
            if CFG.VOID_KILLER_NO_CLIP then applyNoClip(p.Character) end
            if CFG.VOID_KILLER_AUTO_SHOOT and root then
                if CFG.VOID_KILLER_AUTO_AIM then aimAtTarget(root, hrp.Position) end
                fireTool()
            end
            table.insert(voidKillerTargets, { player = p, time = tick() })
        end
    end
    local now = tick()
    for i = #voidKillerTargets, 1, -1 do
        if now - voidKillerTargets[i].time > 1 then table.remove(voidKillerTargets, i) end
    end
end

local function lockToVoid(dt)
    local targetPos = stepVoid(dt)
    targetPos = clampToRegion(targetPos)
    if CFG.VOID_ANTIVOID and isInsideVoidPart(targetPos) then
        targetPos = targetPos + Vector3.new((math.random()-0.5)*200, math.random()*200, (math.random()-0.5)*200)
    end
    intendedVoidPos = targetPos
    local hrp = getLocalRoot()
    if not hrp then return end
    pcall(function()
        hrp.CFrame = CFrame.new(intendedVoidPos)
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end)
    if CFG.VOID_LOG_POSITIONS and math.random(1, 30) == 1 then print("[VOID] " .. tostring(intendedVoidPos)) end
    if math.random(1, 10) == 1 and not CFG.VOID_ANTIFLING then
        pcall(function()
            hrp.AssemblyLinearVelocity = Vector3.new((math.random()-0.5)*2e7, (math.random()-0.5)*2e7, (math.random()-0.5)*2e7)
        end)
    end
end

function startVoid()
    killConn("void")
    voidElapsed = 0; voidStartTime = tick()
    voidRegionCurrentRadius = nil; voidRegionLastIn = true
    local hrp = getLocalRoot()
    if hrp then voidPos = hrp.Position; intendedVoidPos = voidPos end
    conns.void = RunService.Heartbeat:Connect(function(dt)
        if not CFG.VOID_ENABLED then
            if CFG.VOID_AUTO_REENABLE and tick() > voidAutoReenableTime then
                voidAutoReenableTime = tick() + 0.5; CFG.VOID_ENABLED = true
            else killConn("void"); return end
        end
        if CFG.VOID_DURATION_ENABLED then
            local dur = CFG.VOID_DURATION
            if CFG.VOID_RANDOM_DURATION then dur = CFG.VOID_DURATION_MIN + math.random() * (CFG.VOID_DURATION_MAX - CFG.VOID_DURATION_MIN) end
            if (tick() - voidStartTime) > dur then CFG.VOID_ENABLED = false; Notify("void duration reached", 2); return end
        end
        if CFG.VOID_STOP_ON_DAMAGE and hum and hum.Health < hum.MaxHealth * 0.9 then CFG.VOID_ENABLED = false; Notify("void disabled", 2); return end
        voidElapsed = voidElapsed + dt
        lockToVoid(dt)
        if CFG.VOID_KILLER_ENABLED then runVoidKiller(dt) end
    end)
end
function stopVoid() killConn("void"); CFG.VOID_ENABLED = false end

local orbitAngle, orbitLocalElapsed, orbitCurrentRadius = 0, 0, 0
local orbitLastShot = 0
local orbitSnapTimer = 0

function startOrbit()
    killConn("orbit")
    orbitAngle = 0; orbitLocalElapsed = 0; orbitCurrentRadius = cfg.orbitDist; orbitLastShot = 0; orbitSnapTimer = 0
    if hum then pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end) end
    conns.orbit = RunService.Heartbeat:Connect(function(dt)
        if not cfg.orbitEnabled then killConn("orbit"); return end
        if not root then return end
        if cfg.orbitNetworkOwn then pcall(function() root:SetNetworkOwner(LocalPlayer) end) end
        if cfg.orbitNoClip and LocalPlayer.Character then applyNoClip(LocalPlayer.Character) end
        if hum then pcall(function() if hum:GetState() ~= Enum.HumanoidStateType.Physics then hum:ChangeState(Enum.HumanoidStateType.Physics) end end) end
        local target = getTarget(cfg.orbitTarget)
        local targetPos = root.Position
        local tHrp = nil
        if target and target.Character then
            tHrp = target.Character:FindFirstChild("HumanoidRootPart")
            if tHrp and (root.Position - tHrp.Position).Magnitude <= cfg.orbitLockDist then
                targetPos = tHrp.Position
                if cfg.orbitPredict then targetPos = targetPos + tHrp.AssemblyLinearVelocity * cfg.orbitPredStr end
            end
        end
        local speed = cfg.orbitReverse and -cfg.orbitSpeed or cfg.orbitSpeed
        if cfg.orbitSpeedRandom then
            speed = (cfg.orbitSpeedRandMin + math.random() * (cfg.orbitSpeedRandMax - cfg.orbitSpeedRandMin))
            if cfg.orbitReverse then speed = -speed end
        end
        orbitAngle = (orbitAngle + math.rad(speed) * dt) % (2 * math.pi)
        orbitLocalElapsed = orbitLocalElapsed + dt
        local r = cfg.orbitRandRad and math.random(cfg.orbitRandMin, cfg.orbitRandMax) or cfg.orbitDist
        if cfg.orbitDistPulse then r = r + math.sin(orbitLocalElapsed * cfg.orbitDistPulseSpeed * 2 * math.pi) * cfg.orbitDistPulseAmp end
        local h = cfg.orbitHeight
        if cfg.orbitHeightOscillate then h = h + math.sin(orbitLocalElapsed * cfg.orbitHeightOscSpeed * 2 * math.pi) * cfg.orbitHeightOscAmp end
        local x, y, z = 0, 0, 0
        local ax = cfg.orbitAxis
        if cfg.orbitMode == "Circle" then
            if ax == "XZ" then x = math.cos(orbitAngle)*r; z = math.sin(orbitAngle)*r; y = h
            elseif ax == "XY" then x = math.cos(orbitAngle)*r; y = math.sin(orbitAngle)*r; z = h
            elseif ax == "YZ" then y = math.cos(orbitAngle)*r; z = math.sin(orbitAngle)*r; x = h end
        elseif cfg.orbitMode == "Figure 8" then
            x = math.sin(orbitAngle)*r; z = math.sin(orbitAngle)*math.cos(orbitAngle)*r*0.7; y = h
        elseif cfg.orbitMode == "Ellipse" then
            x = math.cos(orbitAngle)*r; z = math.sin(orbitAngle)*r*0.6; y = h
        elseif cfg.orbitMode == "Spiral In" then
            orbitCurrentRadius = math.max(1, orbitCurrentRadius - dt * cfg.orbitDist * 0.2)
            x = math.cos(orbitAngle)*orbitCurrentRadius; z = math.sin(orbitAngle)*orbitCurrentRadius; y = h
        elseif cfg.orbitMode == "Spiral Out" then
            orbitCurrentRadius = math.min(cfg.orbitDist*2, orbitCurrentRadius + dt * cfg.orbitDist * 0.2)
            x = math.cos(orbitAngle)*orbitCurrentRadius; z = math.sin(orbitAngle)*orbitCurrentRadius; y = h
        elseif cfg.orbitMode == "Bounce" then
            x = math.cos(orbitAngle)*r; z = math.sin(orbitAngle)*r; y = h + math.sin(orbitLocalElapsed*3)*5
        elseif cfg.orbitMode == "Lemniscate" then
            local denom = 1 + math.sin(orbitAngle)^2
            x = r*math.cos(orbitAngle)/denom; z = r*math.sin(orbitAngle)*math.cos(orbitAngle)/denom; y = h
        elseif cfg.orbitMode == "Infinity" then
            x = r*math.cos(orbitAngle); z = r*math.sin(2*orbitAngle)/2; y = h
        elseif cfg.orbitMode == "RandomOrbit" then
            local a = math.random()*2*math.pi; x = math.cos(a)*r; z = math.sin(a)*r; y = h
        end
        if cfg.orbitZigzag then x = x + math.sin(orbitLocalElapsed * cfg.orbitZigzagFreq * 2 * math.pi) * cfg.orbitZigzagAmp end
        x = x + cfg.orbitOffX; z = z + cfg.orbitOffZ
        local dst = targetPos + Vector3.new(x, y, z)
        if cfg.orbitSnapBack then
            orbitSnapTimer = orbitSnapTimer + dt
            if orbitSnapTimer >= cfg.orbitSnapInterval then
                orbitSnapTimer = 0
                dst = targetPos + Vector3.new(cfg.orbitOffX, h, cfg.orbitOffZ)
            end
        end
        local alpha = math.min(1, 1 - (1 - cfg.orbitLerp)^(dt * 60))
        local smooth = root.Position:Lerp(dst, alpha)
        pcall(function()
            if cfg.orbitFace then
                local cf = CFrame.new(smooth, Vector3.new(targetPos.X, smooth.Y, targetPos.Z))
                cf = cf * CFrame.Angles(math.rad(cfg.orbitPitchOff), math.rad(cfg.orbitYawOff), 0)
                root.CFrame = cf
            else
                root.CFrame = CFrame.new(smooth)
            end
            if cfg.orbitVelZero then root.AssemblyLinearVelocity = Vector3.zero; root.AssemblyAngularVelocity = Vector3.zero end
        end)
        if cfg.orbitAutoShoot and tHrp and target then
            local now = tick()
            if (root.Position - tHrp.Position).Magnitude < cfg.orbitAttackRange and now - orbitLastShot > cfg.orbitShootCooldown then
                orbitLastShot = now
                if cfg.orbitAutoAim then aimAtTarget(root, tHrp.Position) end
                fireTool()
            end
        end
    end)
end
function stopOrbit()
    killConn("orbit"); cfg.orbitEnabled = false
    if hum then pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end) end
end

local lastDodgeTick = 0
local predShootCD = {}
local predLastShot = 0
local predRungIndex = 0
local hookedActivate = {}
local hookedRemotes = {}

local RIVALS_SHOT_REMOTE_HINTS = {
    "fire","shoot","attack","bullet","ray","hit","damage","combat",
    "weapon","gun","melee","swing","slash","stab","cast","castskill",
    "attackrequest","fireweapon","dealDamage","projectile","spawnbullet",
    "swingweapon","strike","slashblade","firebullet","shootbullet",
    "rivals","rivalsattack","rivalsfire","rivalshoot","rivalshit",
}

local function isShotRemote(name)
    local n = name:lower()
    for _, h in ipairs(RIVALS_SHOT_REMOTE_HINTS) do if n:find(h, 1, true) then return true end end
    return false
end

local function raycastLineOfFire(enemyHrp, myPos)
    if not enemyHrp then return false, 0 end
    local origin = enemyHrp.Position + Vector3.new(0, 1.5, 0)
    local target = myPos + Vector3.new(0, 1.5, 0)
    local dir = (target - origin)
    local dist = dir.Magnitude
    if dist < 0.01 then return false, 0 end
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = { LocalPlayer.Character, enemyHrp.Parent }
    local result = workspace:Raycast(origin, dir.Unit * dist, params)
    if result then return false, dist end
    return true, dist
end

local function hookToolActivate(tool)
    if not tool or hookedActivate[tool] then return end
    hookedActivate[tool] = true
    local oldActivate
    pcall(function()
        oldActivate = hookfunction(tool.Activate, function(self, ...)
            if not checkcaller() and self == tool then
                local owner = tool.Parent and tool.Parent.Parent
                if owner and owner ~= LocalPlayer and owner.Character then
                    predShootCD[owner] = tick()
                    if antiBaitCFG.baitEnabled and antiBaitCFG.baitHookActivate then
                        task.spawn(function() doBaitCounter(owner, "tool") end)
                    end
                end
            end
            return oldActivate(self, ...)
        end)
    end)
end

local function hookRemote(remote)
    if not remote or hookedRemotes[remote] then return end
    hookedRemotes[remote] = true
    local mt = getrawmetatable and getrawmetatable(remote)
    if not mt then return end
    local oldNamecall = rawget(mt, "__namecall")
    if not oldNamecall then return end
    pcall(function()
        setreadonly(mt, false)
        rawset(mt, "__namecall", function(self, ...)
            if self == remote then
                local callingScript = getcallingscript and getcallingscript()
                if callingScript ~= LocalPlayer.Character then
                    local args = {...}
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character then
                            for _, a in ipairs(args) do
                                if a == p.Character or a == p then
                                    predShootCD[p] = tick()
                                    if antiBaitCFG.baitEnabled then task.spawn(function() doBaitCounter(p, "remote") end) end
                                    break
                                end
                            end
                        end
                    end
                end
            end
            return oldNamecall(self, ...)
        end)
        setreadonly(mt, true)
    end)
end

local function watchAllTools()
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LocalPlayer or not p.Character then continue end
        local tool = p.Character:FindFirstChildOfClass("Tool")
        if tool then hookToolActivate(tool) end
        p.Character.ChildAdded:Connect(function(c) if c:IsA("Tool") then hookToolActivate(c) end end)
    end
end

local function scanUniversal()
    for _, d in ipairs(game:GetDescendants()) do
        if d:IsA("Tool") then hookToolActivate(d) end
        if d:IsA("RemoteEvent") or d:IsA("RemoteFunction") then if isShotRemote(d.Name) then hookRemote(d) end end
    end
end

local function getAimAnimKeyword(track)
    local name = track.Animation and track.Animation.Name or ""
    local n = name:lower()
    if n:find("shoot") or n:find("fire") or n:find("attack") or n:find("swing")
        or n:find("slash") or n:find("stab") or n:find("punch") or n:find("cast")
        or n:find("thrust") or n:find("rivals") or n:find("weapon") then return true end
    return false
end

local function animationThreat(plr)
    local char = plr.Character
    if not char then return false end
    local h = char:FindFirstChildOfClass("Humanoid")
    if not h then return false end
    local animator = h:FindFirstChildOfClass("Animator")
    if not animator then return false end
    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do if getAimAnimKeyword(track) then return true end end
    return false
end

local function watchAnimation(plr)
    if not plr.Character then return end
    local h = plr.Character:FindFirstChildOfClass("Humanoid")
    if not h then return end
    h.AnimationPlayed:Connect(function(track)
        if getAimAnimKeyword(track) then
            predShootCD[plr] = tick()
            if antiBaitCFG.baitEnabled then task.spawn(function() doBaitCounter(plr, "anim") end) end
        end
    end)
end

local function buildThreatMap(myPos)
    local map = {}
    if not myPos then return map end
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LocalPlayer or not p.Character then continue end
        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        local tool = p.Character:FindFirstChildOfClass("Tool")
        local origin = getAimOrigin(p) or hrp
        local look = origin.CFrame.LookVector
        local eye = origin.Position + look * 0.5
        local toMe = myPos - eye
        local dist = toMe.Magnitude
        if dist < 0.01 then continue end
        local aimDot = look:Dot(toMe.Unit)
        local velDot = 0
        local vel = hrp.AssemblyLinearVelocity
        if vel.Magnitude > 1 then velDot = vel.Unit:Dot(toMe.Unit) end
        local score = math.max(0, aimDot) * 45 + math.max(0, velDot) * 20
        if tool then score = score + 25 end
        score = score + (CFG.SMART_EVASION_INF and 30 or math.max(0, 1 - dist / 250) * 30)
        map[p] = { hrp = hrp, dist = dist, aimDot = aimDot, velDot = velDot, score = score, origin = origin }
    end
    return map
end

local function perpDodgeDir(fromPos, myPos)
    local flat = Vector3.new(fromPos.X - myPos.X, 0, fromPos.Z - myPos.Z)
    if flat.Magnitude < 0.01 then flat = Vector3.new(1, 0, 0) end
    flat = flat.Unit
    local p1 = Vector3.new(-flat.Z, 0, flat.X)
    local p2 = Vector3.new(flat.Z, 0, -flat.X)
    local chosen = math.random(0, 1) == 0 and p1 or p2
    return chosen + Vector3.new(0, (math.random() - 0.5) * 0.4, 0)
end

local function startPredictionV2()
    killConn("pred")
    watchAllTools()
    for _, p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then watchAnimation(p) end end
    task.spawn(function()
        while cfgDodge.predEnabled do task.wait(antiBaitCFG.reScanInterval); scanUniversal() end
    end)
    Players.PlayerAdded:Connect(function(p)
        p.CharacterAdded:Connect(function(c)
            c.ChildAdded:Connect(function(ch) if ch:IsA("Tool") then hookToolActivate(ch) end end)
            local tool = c:FindFirstChildOfClass("Tool")
            if tool then hookToolActivate(tool) end
            watchAnimation(p)
        end)
    end)
    conns.pred = RunService.Heartbeat:Connect(function(dt)
        if not cfgDodge.predEnabled then killConn("pred"); return end
        if not root then return end
        if hum and hum.Health <= 0 then return end
        if cfgDodge.predNoClip and LocalPlayer.Character then applyNoClip(LocalPlayer.Character) end
        if cfgDodge.predNetworkOwn then setNetworkOwnerLocal(root) end
        local myPos = root.Position
        local now = tick()
        local map = buildThreatMap(myPos)
        local primary = nil
        local highestScore = 0
        for p, d in pairs(map) do if d.score > highestScore then highestScore = d.score; primary = { p = p, d = d } end end
        if not primary then return end
        local effectiveRadius = cfgDodge.predInfiniteRange and 1e15 or cfgDodge.predRadius
        if primary.d.dist > effectiveRadius then return end
        local cooldown = cfgDodge.predCooldown
        if cfgDodge.predReactionLadder then
            if now - predLastShot < 1.5 then predRungIndex = math.min(predRungIndex + 1, 5) else predRungIndex = 0 end
            cooldown = cooldown / (1 + predRungIndex * 0.5)
        end
        if now - lastDodgeTick < cooldown then return end
        local threat = false
        local fired = predShootCD[primary.p] and (now - predShootCD[primary.p]) < cfgDodge.predReactTime
        if fired then threat = true end
        if primary.d.aimDot > cfgDodge.predShootDot then threat = true end
        if primary.d.velDot > 0.7 and primary.d.hrp.AssemblyLinearVelocity.Magnitude > cfgDodge.predThreshold then threat = true end
        if cfgDodge.predRaycast then
            local clear = raycastLineOfFire(primary.d.hrp, myPos)
            if clear and primary.d.aimDot > 0.6 then threat = true end
        end
        if cfgDodge.predPredictiveAim and not threat then
            local enemyOrigin = getAimOrigin(primary.p)
            if enemyOrigin then
                local enemyVel = primary.d.hrp.AssemblyLinearVelocity
                local predicted = myPos + root.AssemblyLinearVelocity * cfgDodge.predPredictiveLead
                local futureDir = predicted - (enemyOrigin.Position + enemyVel * cfgDodge.predPredictiveLead)
                if futureDir.Magnitude > 0.01 and enemyOrigin.CFrame.LookVector:Dot(futureDir.Unit) > 0.85 then threat = true end
            end
        end
        if cfgDodge.predAnimDetect and not threat then if animationThreat(primary.p) then threat = true end end
        if not threat then return end
        lastDodgeTick = now
        predLastShot = now
        local dir = perpDodgeDir(primary.d.hrp.Position, myPos)
        local newPos = myPos + dir * cfgDodge.predDodgeDist
        if cfgDodge.predMultiPoint then
            local altDir = Vector3.new(-dir.Z, 0, dir.X)
            if math.random() < 0.5 then altDir = -altDir end
            newPos = myPos + dir * (cfgDodge.predDodgeDist * 0.7) + altDir * (cfgDodge.predDodgeDist * 0.5)
        end
        if cfgDodge.predBackstep then
            local toward = (primary.d.hrp.Position - myPos)
            if toward.Magnitude > 0.01 then newPos = newPos - toward.Unit * (cfgDodge.predDodgeDist * 0.3) end
        end
        if cfgDodge.predMultiPoint then newPos = newPos + Vector3.new(0, math.random() * 15, 0) end
        for i = 1, 3 do
            pcall(function()
                root.CFrame = CFrame.new(newPos + Vector3.new((math.random()-0.5)*4, 0, (math.random()-0.5)*4))
                root.AssemblyLinearVelocity = dir * 150
            end)
            RunService.Heartbeat:Wait()
        end
        if cfgDodge.predNotifyAnywhere or primary.d.dist < 500 then
            Notify("pred v2: " .. primary.p.Name .. " [" .. math.floor(primary.d.dist) .. " studs]", 1.5)
        end
    end)
end
function stopPredictionV2() killConn("pred"); cfgDodge.predEnabled = false end

local antiBaitData = {}
local lastAntiBaitDodge = 0
local gunDodgeCDs = {}
local baitActive = {}

local function getDodgeDir(threatPos)
    if not root then return Vector3.new(1, 0, 0) end
    local flat = Vector3.new(threatPos.X - root.Position.X, 0, threatPos.Z - root.Position.Z)
    local away = flat.Magnitude > 0.01 and -flat.Unit or Vector3.new(1, 0, 0)
    if antiBaitCFG.dodgeMode == "Away" then return away end
    if antiBaitCFG.dodgeMode == "Perpendicular" then
        local p = Vector3.new(-away.Z, 0, away.X)
        return math.random(0, 1) == 0 and p or -p
    end
    local a = math.random() * 2 * math.pi
    return Vector3.new(math.cos(a), 0, math.sin(a))
end

local function doDodge(player, reason)
    if not root then return end
    local now = tick()
    if now - lastAntiBaitDodge < antiBaitCFG.dodgeCooldown then return end
    lastAntiBaitDodge = now
    local threatPos = Vector3.zero
    if player and player.Character then
        local h = player.Character:FindFirstChild("HumanoidRootPart")
        if h then threatPos = h.Position end
    end
    local dir = getDodgeDir(threatPos)
    for i = 1, 3 do
        pcall(function()
            root.CFrame = root.CFrame + dir * (antiBaitCFG.velDodgeDist * 0.005)
            root.AssemblyLinearVelocity = dir * 180
        end)
        RunService.Heartbeat:Wait()
    end
    if antiBaitCFG.notifyOnDodge then
        local dist = 0
        if player and player.Character then
            local h = player.Character:FindFirstChild("HumanoidRootPart")
            if h and root then dist = math.floor((h.Position - root.Position).Magnitude) end
        end
        Notify("anti-bait: " .. (player and player.Name or "?") .. " [" .. reason .. "] " .. dist .. " studs", 1.5)
    end
end

local function baitStall(player)
    if not root then return end
    task.spawn(function()
        local orig = root.CFrame
        pcall(function() root.AssemblyLinearVelocity = Vector3.zero; root.AssemblyAngularVelocity = Vector3.zero end)
        task.wait(antiBaitCFG.baitStallTime)
        if root then pcall(function() root.CFrame = orig end) end
    end)
end

function doBaitCounter(player, source)
    if not antiBaitCFG.baitEnabled then return end
    if baitActive[player] and tick() - baitActive[player] < antiBaitCFG.baitReactionWindow then return end
    baitActive[player] = tick()
    if antiBaitCFG.baitNotifyLabel then Notify("BAIT CONFIRMED: " .. player.Name .. " [" .. source .. "]", 2) end
    task.spawn(function()
        if antiBaitCFG.baitStallChance > 0 and math.random() < antiBaitCFG.baitStallChance then baitStall(player) end
        task.wait(antiBaitCFG.baitFakeLockTime)
        doDodge(player, "bait-" .. source)
    end)
end

local function startAntiBaitV2()
    killConn("antiBait")
    for _, p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then antiBaitData[p] = { lastPos = nil, tpTimes = {}, lastTool = nil } end end
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LocalPlayer or not p.Character then continue end
        local tool = p.Character:FindFirstChildOfClass("Tool")
        if tool then hookToolActivate(tool) end
        p.Character.ChildAdded:Connect(function(c) if c:IsA("Tool") then hookToolActivate(c) end end)
        watchAnimation(p)
    end
    scanUniversal()
    task.spawn(function()
        while antiBaitCFG.enabled do task.wait(antiBaitCFG.reScanInterval); scanUniversal() end
    end)
    conns.antiBait = RunService.Heartbeat:Connect(function(dt)
        if not antiBaitCFG.enabled then stopAntiBait(); return end
        if not root then return end
        if antiBaitCFG.antiBaitNoClip and LocalPlayer.Character then applyNoClip(LocalPlayer.Character) end
        if antiBaitCFG.antiBaitNetworkOwn then setNetworkOwnerLocal(root) end
        local myPos = root.Position
        local now = tick()
        local effectiveRadius = antiBaitCFG.infiniteRange and antiBaitCFG.infiniteRadius or 500
        for _, p in ipairs(Players:GetPlayers()) do
            if p == LocalPlayer or not p.Character then continue end
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then continue end
            local data = antiBaitData[p]
            if not data then antiBaitData[p] = { lastPos = nil, tpTimes = {}, lastTool = nil }; data = antiBaitData[p] end
            local curPos = hrp.Position
            local curVel = hrp.AssemblyLinearVelocity
            if antiBaitCFG.gunPredEnabled then
                local tool = p.Character:FindFirstChildOfClass("Tool")
                if tool then
                    local origin = getAimOrigin(p) or hrp
                    local look = origin.CFrame.LookVector
                    local toMe = (myPos - origin.Position)
                    if toMe.Magnitude > 0.01 and look:Dot(toMe.Unit) > antiBaitCFG.gunPredDot and toMe.Magnitude < effectiveRadius then
                        local key = p.UserId
                        if not gunDodgeCDs[key] or now - gunDodgeCDs[key] > antiBaitCFG.gunPredCooldown then
                            gunDodgeCDs[key] = now
                            doDodge(p, "gun")
                        end
                    end
                end
            end
            if antiBaitCFG.baitHookActivate then
                if predShootCD[p] and (now - predShootCD[p]) < antiBaitCFG.baitReactionWindow then doBaitCounter(p, "fire") end
            end
            if antiBaitCFG.dodgeOnShoot then
                local tool = p.Character:FindFirstChildOfClass("Tool")
                if tool then
                    local look = hrp.CFrame.LookVector
                    local toMe = (myPos - hrp.Position)
                    if toMe.Magnitude > 0.01 then
                        local dot = look:Dot(toMe.Unit)
                        if dot > antiBaitCFG.shootLookThresh and data.lastTool ~= tool then doDodge(p, "shoot"); data.lastTool = tool end
                    end
                end
            end
            if antiBaitCFG.antiBaitUniversalAim and enemyAimingUniversal(p, myPos, antiBaitCFG.gunPredDot) then
                local key = p.UserId
                if not gunDodgeCDs[key] or now - gunDodgeCDs[key] > antiBaitCFG.gunPredCooldown then
                    gunDodgeCDs[key] = now
                    doDodge(p, "aim")
                end
            end
            if antiBaitCFG.antiBaitUniversalAnimation and animationThreat(p) then doDodge(p, "anim") end
            if antiBaitCFG.velSpikeEnabled and curVel.Magnitude > antiBaitCFG.velThreshold then
                local toMe = (myPos - curPos)
                if toMe.Magnitude > 0.01 and curVel.Unit:Dot(toMe.Unit) > 0.6 then doDodge(p, "vel-spike") end
            end
            if antiBaitCFG.flickerEnabled and data.lastPos then
                if (curPos - data.lastPos).Magnitude > antiBaitCFG.flickerTpDist then data.tpTimes[#data.tpTimes + 1] = tick() end
                local n, clean = tick(), {}
                for _, t in ipairs(data.tpTimes) do if n - t < antiBaitCFG.flickerWindow then clean[#clean + 1] = t end end
                data.tpTimes = clean
                if #data.tpTimes >= antiBaitCFG.flickerMinTps then data.tpTimes = {}; doDodge(p, "flicker") end
            end
            data.lastPos = curPos
        end
    end)
end
function stopAntiBait()
    killConn("antiBait"); antiBaitCFG.enabled = false
    antiBaitData = {}; gunDodgeCDs = {}; baitActive = {}
end

local rangeExtHB = nil
local rangeExtOriginalRaycast = nil

local function rangeExtShouldExpand(plr)
    if rangeExtCFG.aimOnly then
        local myHrp = getLocalRoot()
        if not myHrp then return false end
        local origin = getAimOrigin(plr)
        if not origin then return false end
        local toMe = origin.Position - myHrp.Position
        if origin.CFrame.LookVector:Dot(toMe.Unit) < 0.5 then return false end
    end
    return true
end

local function rangeExtApplyHitbox(plr)
    if not plr.Character then return end
    if not rangeExtCFG.expandHitboxes then return end
    if rangeExtCFG.safeDistance and root then
        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
        if hrp and (hrp.Position - root.Position).Magnitude < rangeExtCFG.safeDist then return end
    end
    if not rangeExtShouldExpand(plr) then return end
    local size = rangeExtCFG.hitboxSize
    if rangeExtCFG.rivalsBreakHitbox then size = rangeExtCFG.rivalsBreakSize end
    if plr == LocalPlayer then size = size * rangeExtCFG.rivalsAvatarScale end
    for _, part in ipairs(plr.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            if not rangeExtCFG.originalParts[part] then
                rangeExtCFG.originalParts[part] = { size = part.Size, transparency = part.Transparency, cancollide = part.CanCollide }
            end
            pcall(function()
                part.Size = Vector3.new(size, size, size)
                part.Transparency = rangeExtCFG.hitboxTransparency
                if rangeExtCFG.rivalsNoCollide then part.CanCollide = false end
                if rangeExtCFG.rivalsMassless then part.Massless = true end
            end)
        end
    end
end

local function rangeExtClearHitbox(plr)
    if not plr.Character then return end
    for _, part in ipairs(plr.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            local orig = rangeExtCFG.originalParts[part]
            if orig then
                pcall(function()
                    part.Size = orig.size; part.Transparency = orig.transparency
                    part.CanCollide = orig.cancollide; part.Massless = false
                end)
            end
        end
    end
end

local function rangeExtPatchRaycast()
    if not rangeExtCFG.patchRaycast then return end
    if rangeExtOriginalRaycast then return end
    pcall(function()
        rangeExtOriginalRaycast = workspace.Raycast
        local old = rangeExtOriginalRaycast
        hookfunction(old, function(self, origin, direction, params)
            if rangeExtCFG.enabled then
                return old(self, origin, direction.Unit * rangeExtCFG.range, params)
            end
            return old(self, origin, direction, params)
        end)
    end)
end

local function rangeExtPatchWeaponValues()
    if not rangeExtCFG.patchWeaponValues then return end
    local function scanContainer(container)
        if not container then return end
        for _, v in ipairs(container:GetDescendants()) do
            if v:IsA("NumberValue") or v:IsA("IntValue") then
                local n = v.Name:lower()
                if n:find("range") or n:find("distance") or n:find("reach") then
                    pcall(function() if typeof(v.Value) == "number" then v.Value = rangeExtCFG.range end end)
                end
            end
        end
    end
    scanContainer(LocalPlayer.Backpack)
    scanContainer(LocalPlayer.Character)
    for _, p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then scanContainer(p.Character) end end
end

local function rangeExtFovBoost()
    if not rangeExtCFG.fovBoost then return end
    if not rangeExtCFG.originalFov or rangeExtCFG.originalFov ~= Camera.FieldOfView then
        rangeExtCFG.originalFov = Camera.FieldOfView
    end
    Camera.FieldOfView = rangeExtCFG.fovValue
end

function startRangeExt()
    rangeExtCFG.enabled = true
    rangeExtPatchRaycast()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and (not rangeExtCFG.teamCheck or p.Team ~= LocalPlayer.Team) then rangeExtApplyHitbox(p) end
    end
    if rangeExtCFG.includeSelf then rangeExtApplyHitbox(LocalPlayer) end
    rangeExtHB = RunService.Heartbeat:Connect(function()
        if not rangeExtCFG.enabled then return end
        if rangeExtCFG.holdKey then
            if not UserInputService:IsKeyDown(Enum.KeyCode.F) then
                for _, p in ipairs(Players:GetPlayers()) do rangeExtClearHitbox(p) end
                return
            end
        end
        if rangeExtCFG.rangeExtNoClip and LocalPlayer.Character then applyNoClip(LocalPlayer.Character) end
        if rangeExtCFG.rangeExtNetworkOwn and root then setNetworkOwnerLocal(root) end
        local count = 0
        for _, p in ipairs(Players:GetPlayers()) do
            if count >= rangeExtCFG.maxEnemies then break end
            if p ~= LocalPlayer and (not rangeExtCFG.teamCheck or p.Team ~= LocalPlayer.Team) then
                rangeExtApplyHitbox(p); count = count + 1
            end
        end
        if rangeExtCFG.includeSelf then rangeExtApplyHitbox(LocalPlayer) end
        rangeExtPatchWeaponValues()
        rangeExtFovBoost()
    end)
end

function stopRangeExt()
    rangeExtCFG.enabled = false
    if rangeExtHB then rangeExtHB:Disconnect(); rangeExtHB = nil end
    if rangeExtCFG.restoreOnDisable then for _, p in ipairs(Players:GetPlayers()) do rangeExtClearHitbox(p) end end
    if rangeExtCFG.fovBoost then Camera.FieldOfView = rangeExtCFG.originalFov or 70 end
    rangeExtCFG.originalParts = {}
end

local antiTranslocData = {}
local lastATDodge = 0
local freezeUntil = 0

local function cleanTranslocTimes(data, window)
    local now, clean = tick(), {}
    for _, t in ipairs(data.tpTimes) do if now - t < window then clean[#clean + 1] = t end end
    data.tpTimes = clean
end

local function initATData(p) antiTranslocData[p] = { lastPos = nil, tpTimes = {} } end

local function doAntiTransloc(player)
    if not root then return end
    local now = tick()
    if now - lastATDodge < antiTranslocCFG.dodgeCooldown then return end
    lastATDodge = now
    local mode = antiTranslocCFG.mode
    local threatPos = Vector3.zero
    if player and player.Character then
        local h = player.Character:FindFirstChild("HumanoidRootPart")
        if h then threatPos = mode == "Predict" and h.Position + h.AssemblyLinearVelocity * antiTranslocCFG.predictLead or h.Position end
    end
    if mode == "Freeze" then
        freezeUntil = now + antiTranslocCFG.freezeTime
        pcall(function()
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
            if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end
        end)
        if antiTranslocCFG.notify then Notify("anti-transloc: froze", 1) end
    else
        local flat = Vector3.new(threatPos.X - root.Position.X, 0, threatPos.Z - root.Position.Z)
        local dir = flat.Magnitude > 0.01 and -flat.Unit or Vector3.new(1, 0, 0)
        if antiTranslocCFG.spinEvade then
            local spinAng = (tick() * antiTranslocCFG.spinEvadeSpeed * math.pi / 180) % (2 * math.pi)
            dir = Vector3.new(math.cos(spinAng), 0, math.sin(spinAng))
        end
        if antiTranslocCFG.multiDodge then
            for _ = 1, antiTranslocCFG.multiDodgeCount do
                local randDir = Vector3.new(math.random() * 2 - 1, 0, math.random() * 2 - 1).Unit
                local newPos = root.Position + randDir * antiTranslocCFG.dodgeDistance
                pcall(function() root.CFrame = CFrame.new(newPos); root.AssemblyLinearVelocity = Vector3.zero end)
                task.wait(0.01)
            end
        else
            local dodgeDist = antiTranslocCFG.bounceback and antiTranslocCFG.bouncebackDist or antiTranslocCFG.dodgeDistance
            local newPos = root.Position + dir * dodgeDist
            pcall(function() root.CFrame = CFrame.new(newPos); root.AssemblyLinearVelocity = Vector3.zero end)
        end
        if antiTranslocCFG.counterTeleport then
            local counterPos = threatPos + dir * antiTranslocCFG.counterTpOffset
            pcall(function() root.CFrame = CFrame.new(counterPos) end)
        end
        if antiTranslocCFG.notify then Notify("anti-transloc: dodged", 1) end
    end
end

function startAntiTransloc()
    killConn("antiTransloc")
    for _, p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then initATData(p) end end
    freezeUntil = 0
    conns.antiTransloc = RunService.Heartbeat:Connect(function(dt)
        if not antiTranslocCFG.enabled then stopAntiTransloc(); return end
        if not root then return end
        if antiTranslocCFG.atNoClip and LocalPlayer.Character then applyNoClip(LocalPlayer.Character) end
        if antiTranslocCFG.atNetworkOwn then setNetworkOwnerLocal(root) end
        if tick() < freezeUntil then
            pcall(function() root.AssemblyLinearVelocity = Vector3.zero; root.AssemblyAngularVelocity = Vector3.zero end)
            return
        end
        if antiTranslocCFG.autoEvadeAll then
            for _, p in ipairs(Players:GetPlayers()) do
                if p == LocalPlayer or not p.Character then continue end
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end
                local dist = (hrp.Position - root.Position).Magnitude
                if dist < antiTranslocCFG.evadeAllRadius then
                    local dir = (root.Position - hrp.Position)
                    if dir.Magnitude > 0.01 then dir = dir.Unit end
                    pcall(function()
                        root.CFrame = CFrame.new(root.Position + dir * antiTranslocCFG.dodgeDistance * 0.5)
                        root.AssemblyLinearVelocity = Vector3.zero
                    end)
                end
            end
        end
        if antiTranslocCFG.shieldMode and root then
            for _, p in ipairs(Players:GetPlayers()) do
                if p == LocalPlayer or not p.Character then continue end
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end
                if (hrp.Position - root.Position).Magnitude < antiTranslocCFG.shieldRadius then
                    local pushDir = (root.Position - hrp.Position)
                    if pushDir.Magnitude > 0.01 then pushDir = pushDir.Unit end
                    pcall(function() hrp.AssemblyLinearVelocity = hrp.AssemblyLinearVelocity + pushDir * 200 end)
                end
            end
        end
        for _, p in ipairs(Players:GetPlayers()) do
            if p == LocalPlayer or not p.Character then continue end
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then continue end
            local data = antiTranslocData[p]
            if not data then initATData(p); data = antiTranslocData[p] end
            local curPos = hrp.Position
            if (curPos - root.Position).Magnitude > antiTranslocCFG.detectRadius then data.lastPos = curPos; continue end
            if data.lastPos and (curPos - data.lastPos).Magnitude > 5 then data.tpTimes[#data.tpTimes + 1] = tick() end
            cleanTranslocTimes(data, antiTranslocCFG.detectWindow)
            if #data.tpTimes >= antiTranslocCFG.minTps then data.tpTimes = {}; doAntiTransloc(p) end
            data.lastPos = curPos
        end
    end)
end
function stopAntiTransloc()
    killConn("antiTransloc"); antiTranslocCFG.enabled = false; antiTranslocData = {}
end

local desyncHB, desyncRS = nil, nil
local desyncRealVel = nil
local desyncAngleAcc = 0
local desyncInvertTimer = 0
local desyncOscAcc = 0
local desyncBurstTimer = 0
local desyncInverted = false

function startVelDesync()
    if desyncHB then desyncHB:Disconnect() end
    if desyncRS then desyncRS:Disconnect() end
    desyncRealVel = nil; desyncAngleAcc = 0; desyncInvertTimer = 0
    desyncOscAcc = 0; desyncBurstTimer = 0; desyncInverted = false
    desyncHB = RunService.Heartbeat:Connect(function(dt)
        local hrp = getLocalRoot()
        if not velDesyncCFG.enabled or not hrp then return end
        if velDesyncCFG.vdNoClip and LocalPlayer.Character then applyNoClip(LocalPlayer.Character) end
        if velDesyncCFG.vdNetworkOwn then setNetworkOwnerLocal(hrp) end
        desyncRealVel = hrp.AssemblyLinearVelocity
        desyncInvertTimer = desyncInvertTimer + dt
        desyncBurstTimer = desyncBurstTimer + dt
        desyncOscAcc = desyncOscAcc + dt
        if velDesyncCFG.invertOnTimer and desyncInvertTimer >= velDesyncCFG.invertInterval then desyncInvertTimer = 0; desyncInverted = not desyncInverted end
        local sign = (velDesyncCFG.flip or desyncInverted) and -1 or 1
        local spd = math.clamp(velDesyncCFG.speed, 1, 100)
        desyncAngleAcc = (desyncAngleAcc + math.rad(spd * dt * 360)) % (2 * math.pi)
        local baseAng = velDesyncCFG.randomizeAngle
            and math.rad(velDesyncCFG.angleMin + math.random() * (velDesyncCFG.angleMax - velDesyncCFG.angleMin))
            or math.rad(velDesyncCFG.angle)
        local jR = math.clamp(velDesyncCFG.jitter, 0, 180)
        local angle = baseAng + math.rad((math.random() - 0.5) * jR * 2) + desyncAngleAcc
        if velDesyncCFG.oscillate then angle = angle + math.rad(math.sin(desyncOscAcc * velDesyncCFG.oscillateFreq * 2 * math.pi) * velDesyncCFG.oscillateAmp) end
        if velDesyncCFG.rotateVel then angle = angle + math.rad(velDesyncCFG.rotateVelSpeed) * dt end
        local mag = (math.clamp(velDesyncCFG.intensity, 1, 100) / 100) * 50000
        if velDesyncCFG.spikeMode and desyncBurstTimer >= velDesyncCFG.spikeInterval then desyncBurstTimer = 0; mag = mag + velDesyncCFG.spikeMag end
        if velDesyncCFG.burstDesync and desyncBurstTimer >= velDesyncCFG.burstEvery then mag = mag + velDesyncCFG.burstMag end
        local noiseX, noiseZ = 0, 0
        if velDesyncCFG.noiseVel then
            local t = tick() * velDesyncCFG.noiseScale
            noiseX = math.noise(t, 0, 0) * mag * 0.5
            noiseZ = math.noise(0, t, 0) * mag * 0.5
        end
        local spoofs = {}
        local count = velDesyncCFG.multiVector and velDesyncCFG.vectorCount or 1
        for i = 1, count do
            local a = angle + (i - 1) * (2 * math.pi / count)
            table.insert(spoofs, Vector3.new(math.cos(a) * mag * sign + noiseX, (math.random() - 0.5) * mag * 0.5, math.sin(a) * mag * sign + noiseZ))
        end
        if velDesyncCFG.counterVel and desyncRealVel then table.insert(spoofs, -desyncRealVel * 2) end
        local mt = getrawmetatable and getrawmetatable(hrp)
        local ni = mt and rawget(mt, "__newindex")
        for _, spoof in ipairs(spoofs) do
            if ni then pcall(ni, hrp, "AssemblyLinearVelocity", spoof)
            else pcall(function() hrp.AssemblyLinearVelocity = spoof end) end
            if sethiddenproperty then pcall(sethiddenproperty, hrp, "AssemblyLinearVelocity", spoof) end
        end
    end)
    desyncRS = RunService.RenderStepped:Connect(function()
        local hrp = getLocalRoot()
        if velDesyncCFG.enabled and hrp and desyncRealVel then hrp.AssemblyLinearVelocity = desyncRealVel end
    end)
end
function stopVelDesync()
    if desyncHB then desyncHB:Disconnect(); desyncHB = nil end
    if desyncRS then desyncRS:Disconnect(); desyncRS = nil end
    desyncRealVel = nil; desyncAngleAcc = 0; velDesyncCFG.enabled = false
end

local translocConn, translocPreRender, translocRealCF = nil, nil, nil
local translocAcc = 0
local translocPingPongDir = 1
local translocWaveT = 0
local translocAltVert = 1
local translocPulseT = 0
local translocPingPongTimer = 0

local function getTranslocFakePos(realCF, index)
    local d = translocCFG.offsetDist
    local jmp = translocCFG.jitter and translocCFG.jitterAmp or 0
    local base = realCF.Position
    local ox, oy, oz = 0, 0, 0
    local m = translocCFG.offsetMode
    if translocCFG.wavePattern then translocWaveT = translocWaveT + 0.01; d = d + math.sin(translocWaveT * translocCFG.waveFreq * 2 * math.pi) * translocCFG.waveAmp end
    if translocCFG.pingPong then d = d * translocPingPongDir end
    if translocCFG.cascadeOffset and index then d = d + (index - 1) * translocCFG.cascadeStep end
    if translocCFG.pulse then translocPulseT = translocPulseT + 0.01; d = d + math.sin(translocPulseT * translocCFG.pulseSpeed * 2 * math.pi) * translocCFG.pulseAmp end
    if m == "Ahead" then
        local look = realCF.LookVector; ox = look.X * d; oz = look.Z * d; oy = translocCFG.offsetY
    elseif m == "Behind" then
        local look = realCF.LookVector; ox = -look.X * d; oz = -look.Z * d; oy = translocCFG.offsetY
    elseif m == "Perpendicular" then
        local right = realCF.RightVector
        local side = math.random() < 0.5 and 1 or -1
        ox = right.X * d * side; oz = right.Z * d * side; oy = translocCFG.offsetY
    elseif m == "Above" then
        ox = (math.random() - 0.5) * jmp; oy = math.abs(d) + translocCFG.offsetY; oz = (math.random() - 0.5) * jmp
    elseif m == "Below" then
        ox = (math.random() - 0.5) * jmp; oy = -math.abs(d) + translocCFG.offsetY; oz = (math.random() - 0.5) * jmp
    elseif m == "AboveBelow" then
        translocAltVert = -translocAltVert
        ox = (math.random() - 0.5) * jmp
        oy = translocAltVert * (math.abs(d) + translocCFG.altVertAmp) + translocCFG.offsetY
        oz = (math.random() - 0.5) * jmp
    elseif m == "MirrorX" then ox = -base.X + (math.random() - 0.5) * jmp; oy = translocCFG.offsetY; oz = (math.random() - 0.5) * jmp
    elseif m == "MirrorZ" then ox = (math.random() - 0.5) * jmp; oy = translocCFG.offsetY; oz = -base.Z + (math.random() - 0.5) * jmp
    elseif m == "Diagonal" then
        local ang = math.rad(translocCFG.diagonalAngle)
        ox = math.cos(ang) * d; oz = math.sin(ang) * d; oy = translocCFG.offsetY
    elseif m == "ScreenEdge" then
        local vp = Camera.ViewportSize
        local corners = { Vector2.new(0,0), Vector2.new(vp.X,0), Vector2.new(0,vp.Y), Vector2.new(vp.X,vp.Y) }
        local c = corners[math.random(1, 4)]
        local ray = Camera:ViewportPointToRay(c.X, c.Y, math.abs(d))
        return CFrame.new(ray.Origin)
    elseif m == "Orbit" then
        translocWaveT = translocWaveT + 0.02
        local ang = translocWaveT * math.rad(translocCFG.orbitSpeed)
        ox = math.cos(ang) * translocCFG.orbitRadius
        oz = math.sin(ang) * translocCFG.orbitRadius
        oy = translocCFG.offsetY
    elseif m == "ZoneEscape" then
        local dir = Vector3.new(math.random() - 0.5, math.random() - 0.5, math.random() - 0.5).Unit
        return CFrame.new(base + dir * translocCFG.zoneEscapeRadius)
    end
    if translocCFG.spinFake then
        local spinAng = tick() * math.rad(translocCFG.spinFakeSpeed)
        local nx = ox * math.cos(spinAng) - oz * math.sin(spinAng)
        local nz = ox * math.sin(spinAng) + oz * math.cos(spinAng)
        ox = nx; oz = nz
    end
    return CFrame.new(base.X + ox, base.Y + oy, base.Z + oz)
end

function startTransloc()
    if translocConn then translocConn:Disconnect() end
    if translocPreRender then translocPreRender:Disconnect() end
    translocRealCF = nil; translocPingPongDir = 1; translocWaveT = 0; translocAltVert = 1; translocPulseT = 0
    translocAcc = 0; translocPingPongTimer = 0
    if translocCFG.networkOwnerFix and root then pcall(function() root:SetNetworkOwner(LocalPlayer) end) end
    translocPreRender = RunService.PreRender:Connect(function()
        if not translocCFG.enabled or not root or not translocRealCF then return end
        if translocCFG.snapBack then
            root.CFrame = translocRealCF
            if translocCFG.translocVelZero then root.AssemblyLinearVelocity = Vector3.zero; root.AssemblyAngularVelocity = Vector3.zero end
        end
    end)
    translocConn = RunService.Heartbeat:Connect(function(dt)
        if not translocCFG.enabled then stopTransloc(); return end
        if not root then return end
        if translocCFG.translocNoClip and LocalPlayer.Character then applyNoClip(LocalPlayer.Character) end
        translocRealCF = root.CFrame
        translocAcc = translocAcc + dt
        translocPingPongTimer = translocPingPongTimer + dt
        if translocCFG.pingPong and translocPingPongTimer > 0.5 then translocPingPongTimer = 0; translocPingPongDir = -translocPingPongDir end
        if translocCFG.autoDodge then
            for _, p in ipairs(Players:GetPlayers()) do
                if p == LocalPlayer or not p.Character then continue end
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end
                if (hrp.Position - root.Position).Magnitude < translocCFG.autoDodgeRadius then
                    local dir = (root.Position - hrp.Position)
                    if dir.Magnitude > 0.01 then dir = dir.Unit end
                    pcall(function() root.CFrame = CFrame.new(root.Position + dir * 60); root.AssemblyLinearVelocity = Vector3.zero end)
                end
            end
        end
        local interval
        if translocCFG.randomFrequency then interval = 1 / (translocCFG.freqMin + math.random() * (translocCFG.freqMax - translocCFG.freqMin))
        else interval = 1 / math.max(translocCFG.frequency, 1) end
        if translocAcc < interval then return end
        translocAcc = translocAcc % interval
        local mt = getrawmetatable and getrawmetatable(root)
        local ni = mt and rawget(mt, "__newindex")
        local layerCount = math.max(translocCFG.layers, 1)
        local burstCount = translocCFG.burstMode and translocCFG.burstCount or 1
        for b = 1, burstCount do
            for i = 1, layerCount do
                local fcf = getTranslocFakePos(translocRealCF, i)
                local fv = Vector3.zero
                if translocCFG.fakeVel then
                    local mag = translocCFG.fakeVelMag
                    fv = Vector3.new((math.random()-0.5)*mag*2, (math.random()-0.5)*mag*2, (math.random()-0.5)*mag*2)
                end
                if ni then pcall(ni, root, "CFrame", fcf); pcall(ni, root, "AssemblyLinearVelocity", fv)
                else pcall(function() root.CFrame = fcf; root.AssemblyLinearVelocity = fv end) end
            end
            if b < burstCount then task.wait(translocCFG.burstInterval) end
        end
    end)
end
function stopTransloc()
    if translocConn then translocConn:Disconnect(); translocConn = nil end
    if translocPreRender then translocPreRender:Disconnect(); translocPreRender = nil end
    translocCFG.enabled = false; translocRealCF = nil
end

local slingConn = nil
local slingRealCF = nil
local slingLastShot = 0
local slingOrbAng = 0
local slingLastRush = 0
local slingFollowPos = nil
local slingHoverT = 0
local avatarHiddenState = {}
local noTpLastShot = 0
local noTpOriginalSizes = {}
local noTpHookedRemotes = {}
local noTpHookedTools = {}
local noTpOriginalRaycast = nil
local noTpSpoofedOrigin = nil

local function hideAvatar()
    if not LocalPlayer.Character then return end
    for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            if avatarHiddenState[part] == nil then avatarHiddenState[part] = part.LocalTransparencyModifier end
            part.LocalTransparencyModifier = slingCFG.hideTransparency
        elseif part:IsA("Decal") or part:IsA("Texture") then
            if avatarHiddenState[part] == nil then avatarHiddenState[part] = part.Transparency end
            part.Transparency = 1
        elseif slingCFG.hideAccessories and part:IsA("Accessory") then
            local handle = part:FindFirstChild("Handle")
            if handle then
                if avatarHiddenState[handle] == nil then avatarHiddenState[handle] = handle.LocalTransparencyModifier end
                handle.LocalTransparencyModifier = 1
            end
        end
    end
end

local function restoreAvatar()
    if not LocalPlayer.Character then return end
    for part, val in pairs(avatarHiddenState) do
        if part and part.Parent then
            if part:IsA("BasePart") then part.LocalTransparencyModifier = val or 0
            elseif part:IsA("Decal") or part:IsA("Texture") then part.Transparency = val or 0 end
        end
    end
    avatarHiddenState = {}
end

local function doAutoShoot(target)
    if not slingCFG.autoShoot or not target or not target.Character then return end
    local hrp = target.Character:FindFirstChild("HumanoidRootPart")
    if not hrp or not root then return end
    local now = tick()
    local range = slingCFG.rivalsInfiniteRange and slingCFG.rivalsRange or slingCFG.attackRange
    if (root.Position - hrp.Position).Magnitude < range and now - slingLastShot > slingCFG.shotCooldown then
        slingLastShot = now
        if slingCFG.slingAutoAim then aimAtTarget(root, hrp.Position) end
        fireTool()
    end
end

local function applyNoTpHitbox(target)
    if not slingCFG.noTpHitboxSize or not target or not target.Character then return end
    for _, part in ipairs(target.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            if not noTpOriginalSizes[part] then noTpOriginalSizes[part] = part.Size end
            pcall(function()
                part.Size = Vector3.new(slingCFG.noTpHitboxSize, slingCFG.noTpHitboxSize, slingCFG.noTpHitboxSize)
                part.CanCollide = false; part.Massless = true
            end)
        end
    end
end

local function restoreNoTpHitbox(target)
    if not target or not target.Character then return end
    for _, part in ipairs(target.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            local orig = noTpOriginalSizes[part]
            if orig then
                pcall(function() part.Size = orig; part.CanCollide = true; part.Massless = false end)
            end
        end
    end
end

local function hookNoTpRaycast()
    if not slingCFG.noTpRaycastPatch then return end
    if noTpOriginalRaycast then return end
    pcall(function()
        noTpOriginalRaycast = workspace.Raycast
        local old = noTpOriginalRaycast
        hookfunction(old, function(self, origin, direction, params)
            if slingCFG.enabled and slingCFG.noTpMode and slingCFG.noTpInfiniteRange then
                local target = getTarget(slingCFG.targetMode)
                if target and target.Character then
                    local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
                    if tHrp then
                        local newDir = (tHrp.Position - origin)
                        if newDir.Magnitude > 0.1 then
                            return old(self, origin, newDir.Unit * slingCFG.noTpRange, params)
                        end
                    end
                end
            end
            return old(self, origin, direction, params)
        end)
    end)
end

local function hookNoTpRemotes()
    if not slingCFG.noTpShotRedirect then return end
    for _, d in ipairs(game:GetDescendants()) do
        if (d:IsA("RemoteEvent") or d:IsA("RemoteFunction")) and isShotRemote(d.Name) then
            if noTpHookedRemotes[d] then continue end
            noTpHookedRemotes[d] = true
            local mt = getrawmetatable and getrawmetatable(d)
            if mt then
                local oldNamecall = rawget(mt, "__namecall")
                if oldNamecall then
                    pcall(function()
                        setreadonly(mt, false)
                        rawset(mt, "__namecall", function(self, ...)
                            if self == d and slingCFG.enabled and slingCFG.noTpMode then
                                local args = {...}
                                for i, a in ipairs(args) do
                                    if typeof(a) == "Vector3" then
                                        local target = getTarget(slingCFG.targetMode)
                                        if target and target.Character then
                                            local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
                                            if tHrp then args[i] = tHrp.Position end
                                        end
                                    end
                                end
                                return oldNamecall(self, table.unpack(args))
                            end
                            return oldNamecall(self, ...)
                        end)
                        setreadonly(mt, true)
                    end)
                end
            end
        end
    end
end

local function watchNoTpTools()
    if not slingCFG.noTpHitscanOverride then return end
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LocalPlayer or not p.Character then continue end
        local tool = p.Character:FindFirstChildOfClass("Tool")
        if tool and not noTpHookedTools[tool] then
            noTpHookedTools[tool] = true
        end
        p.Character.ChildAdded:Connect(function(c)
            if c:IsA("Tool") then noTpHookedTools[c] = true end
        end)
    end
end

local function doNoTpAutoShoot(target)
    if not slingCFG.noTpAutoShoot or not target or not target.Character then return end
    local hrp = target.Character:FindFirstChild("HumanoidRootPart")
    if not hrp or not root then return end
    local now = tick()
    if (root.Position - hrp.Position).Magnitude < slingCFG.noTpRange and now - noTpLastShot > slingCFG.shotCooldown then
        noTpLastShot = now
        if slingCFG.noTpSilentAim or slingCFG.noTpLookVector then
            local spoofPos = hrp.Position
            if slingCFG.noTpVelocityComp then spoofPos = spoofPos + hrp.AssemblyLinearVelocity * 0.05 end
            if slingCFG.noTpGravityComp then spoofPos = spoofPos + Vector3.new(0, 2, 0) end
            noTpSpoofedOrigin = spoofPos
            aimAtTarget(root, spoofPos)
        elseif slingCFG.noTpAimAssist then
            aimAtTarget(root, hrp.Position)
        end
        fireTool()
    end
end

function startSlingBypassV2()
    if slingConn then slingConn:Disconnect() end
    slingRealCF = nil; slingLastShot = 0; slingOrbAng = 0; slingLastRush = 0
    slingFollowPos = nil; slingHoverT = 0; noTpLastShot = 0
    noTpSpoofedOrigin = nil
    if slingCFG.hideAvatar then
        task.spawn(function()
            while slingCFG.enabled do hideAvatar(); RunService.RenderStepped:Wait() end
        end)
    end
    if slingCFG.noTpMode then
        hookNoTpRaycast()
        hookNoTpRemotes()
        watchNoTpTools()
    end
    slingConn = RunService.Heartbeat:Connect(function(dt)
        if not slingCFG.enabled then stopSlingBypassV2(); return end
        if not root then return end
        if slingCFG.slingNoClip and LocalPlayer.Character then applyNoClip(LocalPlayer.Character) end
        slingRealCF = root.CFrame
        local now = tick()
        local target = getTarget(slingCFG.targetMode)
        if slingCFG.rivalsNetworkOwner then setNetworkOwnerLocal(root) end
        local mt = getrawmetatable and getrawmetatable(root)
        local ni = mt and rawget(mt, "__newindex")
        local function tpTo(pos, vel)
            local cf = CFrame.new(pos)
            if ni then pcall(ni, root, "CFrame", cf); pcall(ni, root, "AssemblyLinearVelocity", vel or Vector3.zero)
            else pcall(function() root.CFrame = cf; root.AssemblyLinearVelocity = vel or Vector3.zero end) end
        end
        if slingCFG.noTpMode then
            if target and target.Character then
                local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
                if tHrp then
                    applyNoTpHitbox(target)
                    doNoTpAutoShoot(target)
                    if slingCFG.noTpNetworkOwner then pcall(function() tHrp:SetNetworkOwner(LocalPlayer) end) end
                    if slingCFG.noTpPingComp then pcall(function() tHrp:SetNetworkOwnershipAuto() end) end
                end
            end
        elseif slingCFG.mode == "Follow" then
            if not target or not target.Character then return end
            local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
            if not tHrp then return end
            local tPos = tHrp.Position
            if slingCFG.followPredict then tPos = predictPos(tHrp, slingCFG.followLead) end
            local desired = tPos + Vector3.new(0, slingCFG.followHeight, 0) - tHrp.CFrame.LookVector * slingCFG.followDistance
            if not slingFollowPos then slingFollowPos = root.Position end
            local alpha = math.min(1, 1 - (1 - slingCFG.followLerp)^(dt * 60))
            slingFollowPos = slingFollowPos:Lerp(desired, alpha)
            tpTo(slingFollowPos, tHrp.AssemblyLinearVelocity)
            doAutoShoot(target)
        elseif slingCFG.mode == "Stalk" then
            if not target or not target.Character then return end
            local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
            if not tHrp then return end
            local offset = slingCFG.stalkBehind and (tHrp.CFrame.LookVector * -slingCFG.stalkDistance + Vector3.new(0, slingCFG.stalkHeight, 0)) or (tHrp.CFrame.LookVector * slingCFG.stalkDistance + Vector3.new(0, slingCFG.stalkHeight, 0))
            if not slingFollowPos then slingFollowPos = root.Position end
            slingFollowPos = slingFollowPos:Lerp(tHrp.Position + offset, math.min(1, 1 - (1 - slingCFG.followLerp)^(dt * 60)))
            tpTo(slingFollowPos, tHrp.AssemblyLinearVelocity)
            doAutoShoot(target)
        elseif slingCFG.mode == "Hover" then
            if not target or not target.Character then return end
            local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
            if not tHrp then return end
            slingHoverT = slingHoverT + dt
            local bob = slingCFG.hoverBob and math.sin(slingHoverT * slingCFG.hoverBobSpeed * 2 * math.pi) * slingCFG.hoverBobAmp or 0
            if not slingFollowPos then slingFollowPos = root.Position end
            slingFollowPos = slingFollowPos:Lerp(tHrp.Position + Vector3.new(0, slingCFG.hoverHeight + bob, 0), math.min(1, 1 - (1 - slingCFG.followLerp)^(dt * 60)))
            tpTo(slingFollowPos, tHrp.AssemblyLinearVelocity)
            doAutoShoot(target)
        elseif slingCFG.mode == "FastTp" then
            if not target or not target.Character then return end
            local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
            if not tHrp then return end
            if now - slingLastRush < slingCFG.rushCooldown then return end
            slingLastRush = now
            local count = slingCFG.rivalsFastTp and slingCFG.rivalsFastTpCount or (slingCFG.fastTpMulti and slingCFG.fastTpCount or 1)
            for i = 1, count do
                local predicted = predictPos(tHrp, slingCFG.fastTpSpeed * 3)
                local jx = (math.random() - 0.5) * slingCFG.fastTpJitter * 2
                local jz = (math.random() - 0.5) * slingCFG.fastTpJitter * 2
                tpTo(predicted + Vector3.new(jx, slingCFG.stickHeight, jz), tHrp.AssemblyLinearVelocity)
                if i < count then task.wait(slingCFG.rivalsFastTpInterval or slingCFG.fastTpSpeed) end
            end
            doAutoShoot(target)
            if slingCFG.fastTpPenetrate then tpTo(slingRealCF.Position, Vector3.zero) end
        elseif slingCFG.mode == "TargetStick" then
            if not target or not target.Character then return end
            local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
            if not tHrp then return end
            tpTo(tHrp.Position + Vector3.new(0, slingCFG.stickHeight, 0), tHrp.AssemblyLinearVelocity)
            doAutoShoot(target)
        elseif slingCFG.mode == "OrbitTarget" then
            if not target or not target.Character then return end
            local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
            if not tHrp then return end
            slingOrbAng = (slingOrbAng + math.rad(slingCFG.orbitSpeed) * dt) % (2 * math.pi)
            tpTo(tHrp.Position + Vector3.new(math.cos(slingOrbAng)*slingCFG.orbitRadius, slingCFG.orbitHeight, math.sin(slingOrbAng)*slingCFG.orbitRadius), tHrp.AssemblyLinearVelocity)
            doAutoShoot(target)
        elseif slingCFG.mode == "RandomAroundTarget" then
            if not target or not target.Character then return end
            local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
            if not tHrp then return end
            local a = math.random() * 2 * math.pi
            tpTo(tHrp.Position + Vector3.new(math.cos(a)*slingCFG.randomRadius, slingCFG.stickHeight, math.sin(a)*slingCFG.randomRadius), tHrp.AssemblyLinearVelocity)
            doAutoShoot(target)
        end
    end)
end
function stopSlingBypassV2()
    if slingConn then slingConn:Disconnect(); slingConn = nil end
    slingCFG.enabled = false; slingRealCF = nil; slingFollowPos = nil
    if slingCFG.hideAvatar then restoreAvatar() end
    for _, p in ipairs(Players:GetPlayers()) do restoreNoTpHitbox(p) end
end

local aaAngAcc = 0; local aaJitter = 0; local aaRandTimer = 0; local aaRandMult = 1
local aaMicroTimer = 0; local aaRollAcc = 0; local aaBreatheAcc = 0
local aaChaosTimer = 0; local aaLookAtTimer = 0
local aaMultiX, aaMultiY, aaMultiZ = 0, 0, 0

function startAntiAim()
    killConn("antiAim")
    conns.antiAim = RunService.Heartbeat:Connect(function(dt)
        if not aaSettings.enabled then killConn("antiAim"); return end
        if not root then return end
        if aaSettings.aaNoClip and LocalPlayer.Character then applyNoClip(LocalPlayer.Character) end
        if aaSettings.aaNetworkOwn then setNetworkOwnerLocal(root) end
        aaMicroTimer = aaMicroTimer + dt; aaBreatheAcc = aaBreatheAcc + dt
        aaRollAcc = aaRollAcc + dt; aaChaosTimer = aaChaosTimer + dt
        aaLookAtTimer = aaLookAtTimer + dt
        local spd = aaSettings.speed
        if aaSettings.randomSpeed then
            aaRandTimer = aaRandTimer + dt
            if aaRandTimer > 0.1 then aaRandTimer = 0; aaRandMult = 0.2 + math.random() * 0.8 end
            spd = spd * aaRandMult
        end
        local extraYaw = 0; local extraPitch = 0; local extraRoll = 0
        if aaSettings.fakeAngle then extraYaw = extraYaw + aaSettings.fakeYaw; extraPitch = extraPitch + aaSettings.fakePitch end
        if aaSettings.breatheEffect then extraPitch = extraPitch + math.sin(aaBreatheAcc * aaSettings.breatheSpeed * 2 * math.pi) * aaSettings.breatheAmp end
        if aaSettings.microJitter and aaMicroTimer >= (1 / math.max(aaSettings.microJitterSpeed, 1)) then
            aaMicroTimer = 0
            extraYaw = extraYaw + (math.random() - 0.5) * aaSettings.microJitterAmp * 2
            extraPitch = extraPitch + (math.random() - 0.5) * aaSettings.microJitterAmp
        end
        if aaSettings.desyncMode then extraYaw = extraYaw + aaSettings.desyncOffset end
        if aaSettings.randomFlip and math.random() < aaSettings.flipChance then extraYaw = extraYaw + 180 end
        if aaSettings.enhancedMode then
            extraYaw = extraYaw + (math.random() - 0.5) * aaSettings.enhancedJitterAmp * 2
            extraPitch = extraPitch + (math.random() - 0.5) * aaSettings.enhancedJitterAmp
            if aaSettings.chaosMode and aaChaosTimer >= aaSettings.chaosInterval then
                aaChaosTimer = 0
                extraYaw = extraYaw + (math.random() - 0.5) * aaSettings.chaosMaxAngle * 2
                extraPitch = extraPitch + (math.random() - 0.5) * aaSettings.chaosMaxAngle
                extraRoll = extraRoll + (math.random() - 0.5) * aaSettings.chaosMaxAngle
            end
            if aaSettings.multiAxisSpin then
                if aaSettings.multiAxisX then aaMultiX = aaMultiX + aaSettings.multiAxisSpeedX * dt end
                if aaSettings.multiAxisY then aaMultiY = aaMultiY + aaSettings.multiAxisSpeedY * dt end
                if aaSettings.multiAxisZ then aaMultiZ = aaMultiZ + aaSettings.multiAxisSpeedZ * dt end
            end
            if aaSettings.lookAtRandom and aaLookAtTimer >= aaSettings.lookAtRandomInterval then
                aaLookAtTimer = 0
                extraYaw = extraYaw + math.random() * 360
                extraPitch = extraPitch + (math.random() - 0.5) * 180
            end
        end
        local rollAngle = 0
        if aaSettings.rollEnabled then rollAngle = (aaRollAcc * aaSettings.rollSpeed * math.pi / 180) % (2 * math.pi) end
        if aaSettings.mode == "Spin" then
            aaAngAcc = aaAngAcc + spd * dt
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(math.rad(extraPitch), math.rad(aaAngAcc + extraYaw), rollAngle + extraRoll)
        elseif aaSettings.mode == "Jitter" then
            local p = aaSettings.jitterPitch and aaSettings.pitchAngle or 0
            local y = aaSettings.jitterYaw and aaSettings.yawAngle or 0
            root.CFrame = root.CFrame * CFrame.Angles(math.rad((aaJitter == 0 and p or -p) + extraPitch), math.rad((aaJitter == 0 and y or -y) + extraYaw), rollAngle + extraRoll)
            aaJitter = (aaJitter + 1) % 2
        elseif aaSettings.mode == "Static" then
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(math.rad(aaSettings.staticPitch + extraPitch), math.rad(aaSettings.staticYaw + extraYaw), rollAngle + extraRoll)
        elseif aaSettings.mode == "Up" then
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(math.rad(90 + extraPitch), math.rad(extraYaw), rollAngle + extraRoll)
        elseif aaSettings.mode == "Down" then
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(math.rad(-90 + extraPitch), math.rad(extraYaw), rollAngle + extraRoll)
        elseif aaSettings.mode == "Side" then
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(math.rad(extraPitch), math.rad(extraYaw), math.rad(90) + rollAngle + extraRoll)
        elseif aaSettings.mode == "RandomSpin" then
            aaAngAcc = aaAngAcc + spd * dt * (math.random() * 2 - 1)
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(math.rad(aaSettings.customPitch + extraPitch), math.rad(aaAngAcc + extraYaw), rollAngle + extraRoll)
        elseif aaSettings.mode == "Custom" then
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(math.rad(aaSettings.customPitch + extraPitch), math.rad(aaSettings.customYaw + extraYaw), rollAngle + extraRoll)
        end
        if aaSettings.enhancedMode and aaSettings.multiAxisSpin then
            root.CFrame = root.CFrame * CFrame.Angles(math.rad(aaMultiX), math.rad(aaMultiY), math.rad(aaMultiZ))
        end
    end)
end
function stopAntiAim() killConn("antiAim"); aaSettings.enabled = false end

local riotGMTimer = 0; local riotGMAng = 0; local riotGMConn = nil
local riotGMLastShot = 0

function startRiotGodmode()
    if riotGMConn then riotGMConn:Disconnect() end
    riotGMTimer = 0; riotGMAng = 0; riotGMLastShot = 0
    riotGMConn = RunService.Heartbeat:Connect(function(dt)
        if not riotGodmodeCFG.enabled then stopRiotGodmode(); return end
        local hrp = getLocalRoot()
        if not hrp then return end
        if riotGodmodeCFG.rgNoClip and LocalPlayer.Character then applyNoClip(LocalPlayer.Character) end
        if riotGodmodeCFG.rgNetworkOwn then setNetworkOwnerLocal(hrp) end
        riotGMTimer = riotGMTimer + dt
        if riotGMTimer < riotGodmodeCFG.speed then return end
        riotGMTimer = 0
        local cur = hrp.Position
        local target = getClosest()
        local tHrp = nil
        local newPos = cur
        local function pickPos(from)
            local a = math.random() * 2 * math.pi
            local d = riotGodmodeCFG.minJump + math.random() * (riotGodmodeCFG.maxJump - riotGodmodeCFG.minJump)
            return from + Vector3.new(math.cos(a) * d, math.random(-riotGodmodeCFG.heightVariance, riotGodmodeCFG.heightVariance), math.sin(a) * d)
        end
        if target and target.Character then
            tHrp = target.Character:FindFirstChild("HumanoidRootPart")
            if tHrp then
                if riotGodmodeCFG.avoidBullets and (cur - tHrp.Position).Magnitude < riotGodmodeCFG.evadeRange then
                    local dir = (cur - tHrp.Position).Unit
                    newPos = cur + dir * riotGodmodeCFG.bulletDodge
                else newPos = pickPos(cur) end
            else newPos = pickPos(cur) end
        else newPos = pickPos(cur) end
        if riotGodmodeCFG.groundSnap then newPos = Vector3.new(newPos.X, cur.Y, newPos.Z) end
        riotGMAng = (riotGMAng + riotGodmodeCFG.spinSpeed * dt) % 360
        local ax = riotGodmodeCFG.randomAxis and math.random(1, 3) or (riotGodmodeCFG.spinAxis == "X" and 1 or riotGodmodeCFG.spinAxis == "Y" and 2 or 3)
        local cf = CFrame.new(newPos)
        if ax == 1 then cf = cf * CFrame.Angles(math.rad(riotGMAng), 0, 0)
        elseif ax == 2 then cf = cf * CFrame.Angles(0, math.rad(riotGMAng), 0)
        else cf = cf * CFrame.Angles(0, 0, math.rad(riotGMAng)) end
        if riotGodmodeCFG.phaseMode then
            local acc2 = 0
            while acc2 < riotGodmodeCFG.speed do
                pcall(function() hrp.CFrame = cf; if riotGodmodeCFG.rgVelZero then hrp.AssemblyLinearVelocity = Vector3.zero end end)
                task.wait(riotGodmodeCFG.phaseInterval); acc2 = acc2 + riotGodmodeCFG.phaseInterval
            end
        else
            pcall(function() hrp.CFrame = cf; if riotGodmodeCFG.rgVelZero then hrp.AssemblyLinearVelocity = Vector3.zero; hrp.AssemblyAngularVelocity = Vector3.zero end end)
        end
        if riotGodmodeCFG.autoShoot and tHrp and target then
            local now = tick()
            if (hrp.Position - tHrp.Position).Magnitude < riotGodmodeCFG.attackRange and now - riotGMLastShot > riotGodmodeCFG.shootCooldown then
                riotGMLastShot = now
                if riotGodmodeCFG.rgAutoShootAccurate then aimAtTarget(hrp, tHrp.Position) end
                fireTool()
            end
        end
    end)
end
function stopRiotGodmode()
    if riotGMConn then riotGMConn:Disconnect(); riotGMConn = nil end
    riotGodmodeCFG.enabled = false
end

local riotAbuserConn = nil; local riotAbuserOrbAng = 0

function startRiotAbuser()
    if riotAbuserConn then riotAbuserConn:Disconnect() end
    riotAbuserOrbAng = 0
    riotAbuserConn = RunService.Heartbeat:Connect(function(dt)
        if not riotAbuserCFG.enabled then stopRiotAbuser(); return end
        local hrp = getLocalRoot()
        if not hrp then return end
        if riotAbuserCFG.raNoClip and LocalPlayer.Character then applyNoClip(LocalPlayer.Character) end
        if riotAbuserCFG.raNetworkOwn then setNetworkOwnerLocal(hrp) end
        local target = riotAbuserCFG.multiTarget and getTarget("Random") or getClosest()
        if not target or not target.Character then return end
        local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
        if not tHrp then return end
        local cf = tHrp.CFrame
        local tPos = riotAbuserCFG.predictTarget and predictPos(tHrp, riotAbuserCFG.predictLead) or tHrp.Position
        local rOff = riotAbuserCFG.randomOffset
            and Vector3.new((math.random()-0.5)*riotAbuserCFG.randomOffAmp*2, 0, (math.random()-0.5)*riotAbuserCFG.randomOffAmp*2)
            or Vector3.zero
        if riotAbuserCFG.mode == "Stick" then
            hrp.CFrame = CFrame.new(tPos + cf.RightVector*riotAbuserCFG.right + cf.UpVector*(riotAbuserCFG.height-riotAbuserCFG.down) + cf.LookVector*riotAbuserCFG.forward + rOff)
        elseif riotAbuserCFG.mode == "Bounce" then
            local bounce = math.abs(math.sin(tick()*riotAbuserCFG.bounceSpeed)) * riotAbuserCFG.bounceHeight
            hrp.CFrame = CFrame.new(tPos + cf.RightVector*riotAbuserCFG.right + cf.UpVector*(bounce-riotAbuserCFG.down) + cf.LookVector*riotAbuserCFG.forward + rOff)
        elseif riotAbuserCFG.mode == "Orbit" then
            riotAbuserOrbAng = (riotAbuserOrbAng + math.rad(riotAbuserCFG.orbitSpeed)*dt) % (2*math.pi)
            hrp.CFrame = CFrame.new(tPos + Vector3.new(math.cos(riotAbuserOrbAng)*riotAbuserCFG.orbitRadius, riotAbuserCFG.orbitHeight, math.sin(riotAbuserOrbAng)*riotAbuserCFG.orbitRadius))
        elseif riotAbuserCFG.mode == "Phase" then
            local side = math.random(0, 1) == 0 and 1 or -1
            hrp.CFrame = CFrame.new(tPos + cf.LookVector * riotAbuserCFG.phaseOffset + cf.RightVector * riotAbuserCFG.right * side + cf.UpVector * (riotAbuserCFG.height - riotAbuserCFG.down) + rOff)
        end
        if riotAbuserCFG.spinOnTarget then
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad((tick()*riotAbuserCFG.spinSpeed) % 360), 0)
        end
        if riotAbuserCFG.forceFaceTarget then aimAtTarget(hrp, tHrp.Position) end
        if riotAbuserCFG.raVelZero then
            hrp.AssemblyLinearVelocity = tHrp.AssemblyLinearVelocity
            hrp.AssemblyAngularVelocity = Vector3.zero
        end
        if riotAbuserCFG.autoShoot then
            local now = tick()
            if (hrp.Position - tHrp.Position).Magnitude < riotAbuserCFG.attackRange and now - riotAbuserCFG.lastShot > riotAbuserCFG.shootCooldown then
                riotAbuserCFG.lastShot = now
                if riotAbuserCFG.raAutoShootAccurate then aimAtTarget(hrp, tHrp.Position) end
                fireTool()
            end
        end
    end)
end
function stopRiotAbuser()
    if riotAbuserConn then riotAbuserConn:Disconnect(); riotAbuserConn = nil end
    riotAbuserCFG.enabled = false
end

local function bindChar(c)
    char = c; root = c:WaitForChild("HumanoidRootPart", 5); hum = c:WaitForChild("Humanoid", 5)
    if CFG.VOID_ENABLED then startVoid() end
    if cfg.orbitEnabled then startOrbit() end
    if cfgDodge.predEnabled then startPredictionV2() end
    if antiBaitCFG.enabled then startAntiBaitV2() end
    if aaSettings.enabled then startAntiAim() end
    if translocCFG.enabled then startTransloc() end
    if antiTranslocCFG.enabled then startAntiTransloc() end
    if velDesyncCFG.enabled then startVelDesync() end
    if slingCFG.enabled then startSlingBypassV2() end
    if riotGodmodeCFG.enabled then startRiotGodmode() end
    if riotAbuserCFG.enabled then startRiotAbuser() end
    if rangeExtCFG.enabled then startRangeExt() end
end

if LocalPlayer.Character then bindChar(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(function(c) task.wait(0.3); bindChar(c) end)
LocalPlayer.CharacterRemoving:Connect(function()
    killConn("void"); killConn("orbit"); killConn("pred"); killConn("antiAim")
    killConn("antiBait"); killConn("antiTransloc")
    if translocConn then translocConn:Disconnect(); translocConn = nil end
    if translocPreRender then translocPreRender:Disconnect(); translocPreRender = nil end
    if desyncHB then desyncHB:Disconnect(); desyncHB = nil end
    if desyncRS then desyncRS:Disconnect(); desyncRS = nil end
    if slingConn then slingConn:Disconnect(); slingConn = nil end
    if riotGMConn then riotGMConn:Disconnect(); riotGMConn = nil end
    if riotAbuserConn then riotAbuserConn:Disconnect(); riotAbuserConn = nil end
    if rangeExtHB then rangeExtHB:Disconnect(); rangeExtHB = nil end
    root = nil; hum = nil; char = nil
    antiBaitData = {}; antiTranslocData = {}
    translocRealCF = nil; desyncRealVel = nil; slingRealCF = nil
end)

local Tabs = {
    VoidSpam = Window:AddTab("VoidSpam", "activity"),
    Orbit = Window:AddTab("Orbit", "refresh-cw"),
    Prediction = Window:AddTab("Prediction", "crosshair"),
    Defense = Window:AddTab("Defense", "shield"),
    Translocation = Window:AddTab("Translocation", "move"),
    SlingBypass = Window:AddTab("Sling Bypass", "target"),
    Riot = Window:AddTab("Riot", "flame"),
    ACBypass = Window:AddTab("acbypass", "shield"),
    Settings = Window:AddTab("Settings", "settings"),
}

local ACG = Tabs.ACBypass:AddLeftGroupbox("acbypass")
ACG:AddLabel("acbypass: active")

local VG = Tabs.VoidSpam:AddLeftGroupbox("Void Control")
AddBindableToggle(VG, "VoidToggle", "Enable Void", false, function(v) CFG.VOID_ENABLED = v; if v then startVoid() else stopVoid() end end)
VG:AddDropdown("VoidMethod", { Text = "Method", Default = "Quantum", Values = {"Drift","Chaos","Loop","Spiral","Quantum","TP Everywhere","OrbitTarget"}, Callback = function(v) CFG.VOID_METHOD = v end })
VG:AddSlider("Speed", { Text = "Speed (B/s)", Default = 1, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) CFG.SPEED = v * 1e9 end })
VG:AddSlider("Chaos", { Text = "Chaos (%)", Default = 98, Min = 1, Max = 100, Rounding = 0, Callback = function(v) CFG.CHAOS = v * 0.01 end })
VG:AddSlider("BaseX", { Text = "Base X", Default = 0, Min = -1e15, Max = 1e15, Rounding = 0, Callback = function(v) CFG.BASE_X = v end })
VG:AddSlider("BaseY", { Text = "Base Y", Default = 0, Min = -1e15, Max = 1e15, Rounding = 0, Callback = function(v) CFG.BASE_Y = v end })
VG:AddSlider("BaseZ", { Text = "Base Z", Default = 0, Min = -1e15, Max = 1e15, Rounding = 0, Callback = function(v) CFG.BASE_Z = v end })
VG:AddSlider("VoidYMin", { Text = "Y Min", Default = -1e15, Min = -1e15, Max = 1e15, Rounding = 0, Callback = function(v) CFG.VOID_Y_MIN = v end })
VG:AddSlider("VoidYMax", { Text = "Y Max", Default = 1e15, Min = -1e15, Max = 1e15, Rounding = 0, Callback = function(v) CFG.VOID_Y_MAX = v end })
VG:AddSlider("Radius", { Text = "Radius (B)", Default = 200, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) CFG.RADIUS = v * 1e9 end })

local VG1b = Tabs.VoidSpam:AddRightGroupbox("Void Helpers")
AddBindableToggle(VG1b, "VoidPredictive", "Predictive Void", false, function(v) CFG.VOID_PREDICTIVE = v end)
VG1b:AddSlider("VoidPredictLead", { Text = "Predict Lead (x0.01s)", Default = 15, Min = 1, Max = 100, Rounding = 0, Callback = function(v) CFG.VOID_PREDICT_LEAD = v * 0.01 end })
AddBindableToggle(VG1b, "VoidOrbitTarget", "Orbit Target While Void", false, function(v) CFG.VOID_ORBIT_TARGET = v end)
VG1b:AddSlider("VoidOrbitSpeed", { Text = "Orbit Speed (deg/s)", Default = 90, Min = 1, Max = 720, Rounding = 0, Callback = function(v) CFG.VOID_ORBIT_SPEED = v end })
AddBindableToggle(VG1b, "VoidStopOnDamage", "Stop Void On Damage", false, function(v) CFG.VOID_STOP_ON_DAMAGE = v end)
AddBindableToggle(VG1b, "VoidAutoReenable", "Auto Reenable Void", false, function(v) CFG.VOID_AUTO_REENABLE = v end)
AddBindableToggle(VG1b, "VoidAntifling", "Anti-Fling", false, function(v) CFG.VOID_ANTIFLING = v end)
AddBindableToggle(VG1b, "VoidFreezeOnGround", "Freeze On Ground", false, function(v) CFG.VOID_FREEZE_ON_GROUND = v end)
AddBindableToggle(VG1b, "VoidAntiVoid", "Anti-Void (skip parts)", false, function(v) CFG.VOID_ANTIVOID = v end)
AddBindableToggle(VG1b, "VoidLogPositions", "Log Positions to Console", false, function(v) CFG.VOID_LOG_POSITIONS = v end)
VG1b:AddSlider("VoidSafeRadius", { Text = "Safe Radius (studs)", Default = 0, Min = 0, Max = 200, Rounding = 0, Callback = function(v) CFG.VOID_SAFE_RADIUS = v end })
AddBindableToggle(VG1b, "VoidPreserveY", "Preserve Y Position", false, function(v) CFG.TP_PRESERVE_Y = v end)

local VG1c = Tabs.VoidSpam:AddLeftGroupbox("Void Duration / Region")
AddBindableToggle(VG1c, "VoidDurationEnabled", "Enable Duration Limit", false, function(v) CFG.VOID_DURATION_ENABLED = v end)
VG1c:AddSlider("VoidDuration", { Text = "Duration (s)", Default = 10, Min = 1, Max = 300, Rounding = 0, Callback = function(v) CFG.VOID_DURATION = v end })
AddBindableToggle(VG1c, "VoidRandomDuration", "Randomize Duration", false, function(v) CFG.VOID_RANDOM_DURATION = v end)
VG1c:AddSlider("VoidDurationMin", { Text = "Duration Min (s)", Default = 5, Min = 1, Max = 300, Rounding = 0, Callback = function(v) CFG.VOID_DURATION_MIN = v end })
VG1c:AddSlider("VoidDurationMax", { Text = "Duration Max (s)", Default = 30, Min = 1, Max = 300, Rounding = 0, Callback = function(v) CFG.VOID_DURATION_MAX = v end })
AddBindableToggle(VG1c, "VoidStayInRegion", "Stay In Region", false, function(v) CFG.VOID_STAY_IN_REGION = v end)
AddBindableToggle(VG1c, "VoidRegionShapeCircle", "Region Shape: Circle", true, function(v) CFG.VOID_REGION_CIRCLE = v; CFG.VOID_REGION_BOX = not v end)
AddBindableToggle(VG1c, "VoidRegionShapeBox", "Region Shape: Box", false, function(v) CFG.VOID_REGION_BOX = v; CFG.VOID_REGION_CIRCLE = not v end)
AddBindableToggle(VG1c, "VoidRegionCenterSelf", "Center Region On Self", true, function(v) CFG.VOID_REGION_CENTER_SELF = v end)
VG1c:AddSlider("VoidRegionCenterX", { Text = "Region Center X", Default = 0, Min = -1e15, Max = 1e15, Rounding = 0, Callback = function(v) CFG.VOID_REGION_CX = v end })
VG1c:AddSlider("VoidRegionCenterY", { Text = "Region Center Y", Default = 0, Min = -1e15, Max = 1e15, Rounding = 0, Callback = function(v) CFG.VOID_REGION_CY = v end })
VG1c:AddSlider("VoidRegionCenterZ", { Text = "Region Center Z", Default = 0, Min = -1e15, Max = 1e15, Rounding = 0, Callback = function(v) CFG.VOID_REGION_CZ = v end })
VG1c:AddSlider("VoidRegionX", { Text = "Region X Range", Default = 10000, Min = 10, Max = 1e15, Rounding = 0, Callback = function(v) CFG.VOID_REGION_X = v end })
VG1c:AddSlider("VoidRegionY", { Text = "Region Y Range", Default = 10000, Min = 10, Max = 1e15, Rounding = 0, Callback = function(v) CFG.VOID_REGION_Y = v end })
VG1c:AddSlider("VoidRegionZ", { Text = "Region Z Range", Default = 10000, Min = 10, Max = 1e15, Rounding = 0, Callback = function(v) CFG.VOID_REGION_Z = v end })
AddBindableToggle(VG1c, "VoidRegionCollapse", "Collapse Radius Over Time", false, function(v) CFG.VOID_REGION_COLLAPSE = v end)
VG1c:AddSlider("VoidRegionCollapseSpd", { Text = "Collapse Speed (studs/s)", Default = 50, Min = 1, Max = 5000, Rounding = 0, Callback = function(v) CFG.VOID_REGION_COLLAPSE_SPD = v end })
AddBindableToggle(VG1c, "VoidRegionNotifyOnExit", "Notify On Region Exit", false, function(v) CFG.VOID_REGION_NOTIFY_EXIT = v end)
AddBindableToggle(VG1c, "VoidRegionSnapToEdge", "Snap Back To Edge", true, function(v) CFG.VOID_REGION_SNAP_EDGE = v end)

local VG2 = Tabs.VoidSpam:AddRightGroupbox("TP Everywhere")
AddBindableToggle(VG2, "TpRandToggle", "Randomize Studs", true, function(v) CFG.TP_RAND_ENABLED = v end)
VG2:AddSlider("TpRandMin", { Text = "Random Min Studs", Default = -1e15, Min = -1e15, Max = 0, Rounding = 0, Callback = function(v) CFG.TP_RAND_MIN = v end })
VG2:AddSlider("TpRandMax", { Text = "Random Max Studs", Default = 1e15, Min = 0, Max = 1e15, Rounding = 0, Callback = function(v) CFG.TP_RAND_MAX = v end })
VG2:AddSlider("TpMinStuds", { Text = "Fixed Min Studs", Default = -9e14, Min = -1e15, Max = 0, Rounding = 0, Callback = function(v) CFG.TP_MIN_STUDS = v end })
VG2:AddSlider("TpMaxStuds", { Text = "Fixed Max Studs", Default = 9e14, Min = 0, Max = 1e15, Rounding = 0, Callback = function(v) CFG.TP_MAX_STUDS = v end })
AddBindableToggle(VG2, "TpVertSpike", "Vertical Spike", true, function(v) CFG.TP_VERT_SPIKE = v end)
AddBindableToggle(VG2, "TpNegBias", "Negative Bias", true, function(v) CFG.TP_NEG_BIAS = v end)
AddBindableToggle(VG2, "TpViewportRay", "Viewport Raycast", true, function(v) CFG.TP_VIEWPORT_RAY = v end)
AddBindableToggle(VG2, "TpScreenClamp", "Clamp To Screen", true, function(v) CFG.TP_SCREEN_CLAMP = v end)
AddBindableToggle(VG2, "TpPreserveY", "Preserve Y Position", false, function(v) CFG.TP_PRESERVE_Y = v end)
VG2:AddSlider("TpVertMultMin", { Text = "Vert Spike Min Mult", Default = 0.5, Min = 0, Max = 10, Rounding = 1, Callback = function(v) CFG.TP_VERT_MULT_MIN = v end })
VG2:AddSlider("TpVertMultMax", { Text = "Vert Spike Max Mult", Default = 3.0, Min = 0, Max = 20, Rounding = 1, Callback = function(v) CFG.TP_VERT_MULT_MAX = v end })
VG2:AddSlider("TpCornerW", { Text = "Corner Weight (%)", Default = 55, Min = 0, Max = 100, Rounding = 0, Callback = function(v) CFG.TP_CORNER_WEIGHT = v * 0.01 end })
VG2:AddSlider("TpEdgeW", { Text = "Edge Weight (%)", Default = 35, Min = 0, Max = 100, Rounding = 0, Callback = function(v) CFG.TP_EDGE_WEIGHT = v * 0.01 end })
VG2:AddSlider("TpScreenJitter", { Text = "Screen Jitter (%)", Default = 12, Min = 0, Max = 100, Rounding = 0, Callback = function(v) CFG.TP_SCREEN_JITTER = v * 0.01 end })

local VG3 = Tabs.VoidSpam:AddLeftGroupbox("Smart Evasion V2")
AddBindableToggle(VG3, "SmartEvasionToggle", "Enable Smart Evasion V2", false, function(v) CFG.SMART_EVASION = v end)
VG3:AddSlider("EvasionRange", { Text = "Detection Range", Default = 80, Min = 10, Max = 500, Rounding = 0, Callback = function(v) CFG.EVASION_RANGE = v end })
VG3:AddSlider("EvasionThreatDist", { Text = "Threat Distance", Default = 40, Min = 5, Max = 300, Rounding = 0, Callback = function(v) CFG.EVASION_THREAT_DIST = v end })
VG3:AddSlider("EvasionDodgePower", { Text = "Dodge Power (studs)", Default = 100, Min = 10, Max = 1000, Rounding = 0, Callback = function(v) CFG.EVASION_DODGE_POWER = v end })
VG3:AddSlider("EvasionCooldown", { Text = "Cooldown (ms)", Default = 30, Min = 5, Max = 1000, Rounding = 0, Callback = function(v) CFG.EVASION_COOLDOWN = v / 1000 end })
AddBindableToggle(VG3, "EvasionNotify", "Notify on Dodge", false, function(v) CFG.EVASION_NOTIFY = v end)
AddBindableToggle(VG3, "EvasionMicroJitter", "Micro Jitter", true, function(v) CFG.EVASION_MICRO_JITTER = v end)
AddBindableToggle(VG3, "EvasionVertSpike", "Vertical Spike", true, function(v) CFG.EVASION_VERTICAL_SPIKE = v end)
AddBindableToggle(VG3, "EvasionLayered", "Layered Cumulative", true, function(v) CFG.EVASION_LAYERED = v end)
AddBindableToggle(VG3, "EvasionThreatScale", "Threat-Scaled Cooldown", true, function(v) CFG.EVASION_THREAT_SCALE = v end)
AddBindableToggle(VG3, "EvasionInfiniteRange", "Infinite Range Evasion", true, function(v) CFG.SMART_EVASION_INF = v end)

local VK = Tabs.VoidSpam:AddRightGroupbox("Void Killer")
AddBindableToggle(VK, "VoidKillerToggle", "Enable Void Killer", true, function(v) CFG.VOID_KILLER_ENABLED = v end)
AddBindableToggle(VK, "VoidKillerDesync", "Desync Target", true, function(v) CFG.VOID_KILLER_DESYNC = v end)
AddBindableToggle(VK, "VoidKillerForceHitbox", "Force Hitbox Expand", true, function(v) CFG.VOID_KILLER_FORCE_HITBOX = v end)
AddBindableToggle(VK, "VoidKillerAutoShoot", "Auto Shoot Target", true, function(v) CFG.VOID_KILLER_AUTO_SHOOT = v end)
AddBindableToggle(VK, "VoidKillerAutoAim", "Auto Aim at Target", true, function(v) CFG.VOID_KILLER_AUTO_AIM = v end)
AddBindableToggle(VK, "VoidKillerFreezeTarget", "Freeze Target", true, function(v) CFG.VOID_KILLER_FREEZE_TARGET = v end)
AddBindableToggle(VK, "VoidKillerSnapToMap", "Snap To Map", true, function(v) CFG.VOID_KILLER_SNAP_TO_MAP = v end)
AddBindableToggle(VK, "VoidKillerNetworkOwn", "Network Owner Fix", true, function(v) CFG.VOID_KILLER_NETWORK_OWN = v end)
AddBindableToggle(VK, "VoidKillerNoClip", "No Clip", true, function(v) CFG.VOID_KILLER_NO_CLIP = v end)
VK:AddSlider("VoidKillerHitboxSize", { Text = "Hitbox Size", Default = 500, Min = 10, Max = 5000, Rounding = 0, Callback = function(v) CFG.VOID_KILLER_HITBOX_SIZE = v end })
VK:AddSlider("VoidKillerRange", { Text = "Detection Range", Default = 1e15, Min = 100, Max = 1e15, Rounding = 0, Callback = function(v) CFG.VOID_KILLER_RANGE = v end })
VK:AddSlider("VoidKillerAimStrength", { Text = "Aim Strength", Default = 1, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) CFG.VOID_KILLER_AIM_STRENGTH = v end })

local OG = Tabs.Orbit:AddLeftGroupbox("Orbit")
AddBindableToggle(OG, "OrbitToggle", "Enable Orbit", false, function(v) cfg.orbitEnabled = v; if v then startOrbit() else stopOrbit() end end)
OG:AddDropdown("OrbitMode", { Text = "Mode", Default = "Circle", Values = {"Circle","Figure 8","Ellipse","Spiral In","Spiral Out","Bounce","Lemniscate","Infinity","RandomOrbit"}, Callback = function(v) cfg.orbitMode = v; orbitCurrentRadius = cfg.orbitDist end })
OG:AddDropdown("OrbitTarget", { Text = "Target", Default = "Closest", Values = {"Closest","Random","Weakest","Strongest"}, Callback = function(v) cfg.orbitTarget = v end })
OG:AddDropdown("OrbitAxis", { Text = "Axis", Default = "XZ", Values = {"XZ","XY","YZ"}, Callback = function(v) cfg.orbitAxis = v end })
OG:AddSlider("OrbitSpeed", { Text = "Speed (deg/s)", Default = 90, Min = 5, Max = 720, Rounding = 0, Callback = function(v) cfg.orbitSpeed = v end })
OG:AddSlider("OrbitDist", { Text = "Radius", Default = 8, Min = 1, Max = 200, Rounding = 0, Callback = function(v) cfg.orbitDist = v; orbitCurrentRadius = v end })
OG:AddSlider("OrbitHeight", { Text = "Height Offset", Default = 0, Min = -200, Max = 200, Rounding = 0, Callback = function(v) cfg.orbitHeight = v end })
OG:AddSlider("OrbitLerp", { Text = "Smoothing", Default = 30, Min = 1, Max = 100, Rounding = 0, Callback = function(v) cfg.orbitLerp = v / 100 end })
OG:AddSlider("OrbitOffX", { Text = "X Offset", Default = 0, Min = -100, Max = 100, Rounding = 0, Callback = function(v) cfg.orbitOffX = v end })
OG:AddSlider("OrbitOffZ", { Text = "Z Offset", Default = 0, Min = -100, Max = 100, Rounding = 0, Callback = function(v) cfg.orbitOffZ = v end })
AddBindableToggle(OG, "OrbitReverse", "Reverse", false, function(v) cfg.orbitReverse = v end)
AddBindableToggle(OG, "OrbitRandRad", "Random Radius", false, function(v) cfg.orbitRandRad = v end)
OG:AddSlider("OrbitRandMin", { Text = "Min Rand Radius", Default = 5, Min = 1, Max = 50, Rounding = 0, Callback = function(v) cfg.orbitRandMin = v end })
OG:AddSlider("OrbitRandMax", { Text = "Max Rand Radius", Default = 20, Min = 1, Max = 50, Rounding = 0, Callback = function(v) cfg.orbitRandMax = v end })

local OG2 = Tabs.Orbit:AddRightGroupbox("Helpful Options")
AddBindableToggle(OG2, "OrbitFace", "Face Target", true, function(v) cfg.orbitFace = v end)
AddBindableToggle(OG2, "OrbitPredict", "Predict Target Movement", true, function(v) cfg.orbitPredict = v end)
OG2:AddSlider("OrbitPredStr", { Text = "Prediction Strength (%)", Default = 20, Min = 0, Max = 100, Rounding = 0, Callback = function(v) cfg.orbitPredStr = v / 100 end })
OG2:AddSlider("OrbitLockDist", { Text = "Max Lock Distance", Default = 999999999, Min = 10, Max = 999999999, Rounding = 0, Callback = function(v) cfg.orbitLockDist = v end })
OG2:AddSlider("OrbitYawOff", { Text = "Yaw Offset (deg)", Default = 0, Min = -180, Max = 180, Rounding = 0, Callback = function(v) cfg.orbitYawOff = v end })
OG2:AddSlider("OrbitPitchOff", { Text = "Pitch Offset (deg)", Default = 0, Min = -90, Max = 90, Rounding = 0, Callback = function(v) cfg.orbitPitchOff = v end })
AddBindableToggle(OG2, "OrbitHeightOsc", "Height Oscillate", false, function(v) cfg.orbitHeightOscillate = v end)
OG2:AddSlider("OrbitHeightOscAmp", { Text = "Height Osc Amplitude", Default = 5, Min = 0, Max = 50, Rounding = 1, Callback = function(v) cfg.orbitHeightOscAmp = v end })
OG2:AddSlider("OrbitHeightOscSpd", { Text = "Height Osc Speed", Default = 2, Min = 0.1, Max = 20, Rounding = 1, Callback = function(v) cfg.orbitHeightOscSpeed = v end })
AddBindableToggle(OG2, "OrbitSpeedRandom", "Random Speed", false, function(v) cfg.orbitSpeedRandom = v end)
OG2:AddSlider("OrbitSpeedRandMin", { Text = "Speed Rand Min", Default = 20, Min = 1, Max = 720, Rounding = 0, Callback = function(v) cfg.orbitSpeedRandMin = v end })
OG2:AddSlider("OrbitSpeedRandMax", { Text = "Speed Rand Max", Default = 200, Min = 1, Max = 720, Rounding = 0, Callback = function(v) cfg.orbitSpeedRandMax = v end })
AddBindableToggle(OG2, "OrbitDistPulse", "Distance Pulse", false, function(v) cfg.orbitDistPulse = v end)
OG2:AddSlider("OrbitDistPulseAmp", { Text = "Pulse Amplitude", Default = 5, Min = 0, Max = 50, Rounding = 1, Callback = function(v) cfg.orbitDistPulseAmp = v end })
OG2:AddSlider("OrbitDistPulseSpd", { Text = "Pulse Speed", Default = 1, Min = 0.1, Max = 10, Rounding = 1, Callback = function(v) cfg.orbitDistPulseSpeed = v end })
AddBindableToggle(OG2, "OrbitZigzag", "Zigzag Motion", false, function(v) cfg.orbitZigzag = v end)
OG2:AddSlider("OrbitZigzagAmp", { Text = "Zigzag Amplitude", Default = 3, Min = 0, Max = 20, Rounding = 1, Callback = function(v) cfg.orbitZigzagAmp = v end })
OG2:AddSlider("OrbitZigzagFreq", { Text = "Zigzag Frequency", Default = 4, Min = 0.5, Max = 20, Rounding = 1, Callback = function(v) cfg.orbitZigzagFreq = v end })
AddBindableToggle(OG2, "OrbitVelZero", "Zero Velocity (No Fling)", true, function(v) cfg.orbitVelZero = v end)
AddBindableToggle(OG2, "OrbitNoClip", "No Clip (Phase Through)", true, function(v) cfg.orbitNoClip = v end)
AddBindableToggle(OG2, "OrbitMassless", "Massless Character", true, function(v) cfg.orbitMassless = v end)
AddBindableToggle(OG2, "OrbitNetworkOwn", "Network Owner Fix", true, function(v) cfg.orbitNetworkOwn = v end)
AddBindableToggle(OG2, "OrbitAntiFling", "Anti-Fling Protection", true, function(v) cfg.orbitAntiFling = v end)
AddBindableToggle(OG2, "OrbitPhaseThrough", "Phase Through Walls", true, function(v) cfg.orbitPhaseThrough = v end)
AddBindableToggle(OG2, "OrbitIgnoreCollide", "Ignore Collisions", true, function(v) cfg.orbitIgnoreCollide = v end)
AddBindableToggle(OG2, "OrbitWallClip", "Wall Clip Assist", true, function(v) cfg.orbitWallClip = v end)
AddBindableToggle(OG2, "OrbitSmartTarget", "Smart Target Priority", true, function(v) cfg.orbitSmartTarget = v end)
AddBindableToggle(OG2, "OrbitSmoothCatch", "Smooth Catch-Up", true, function(v) cfg.orbitSmoothCatch = v end)
AddBindableToggle(OG2, "OrbitLookAhead", "Look Ahead Motion", true, function(v) cfg.orbitLookAhead = v end)
AddBindableToggle(OG2, "OrbitAutoShoot", "Auto Shoot", true, function(v) cfg.orbitAutoShoot = v end)
AddBindableToggle(OG2, "OrbitAutoAim", "Auto Aim at Target", true, function(v) cfg.orbitAutoAim = v end)
OG2:AddSlider("OrbitShootCooldown", { Text = "Shoot Cooldown (s)", Default = 0.01, Min = 0.01, Max = 1, Rounding = 2, Callback = function(v) cfg.orbitShootCooldown = v end })
OG2:AddSlider("OrbitAttackRange", { Text = "Attack Range", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) cfg.orbitAttackRange = v end })
AddBindableToggle(OG2, "OrbitBypassAnticheat", "Bypass Anticheat", true, function(v) cfg.orbitBypassAnticheat = v end)
AddBindableToggle(OG2, "OrbitAntiKick", "Anti Kick", true, function(v) cfg.orbitAntiKick = v end)
AddBindableToggle(OG2, "OrbitFastTp", "Fast TP", true, function(v) cfg.orbitFastTp = v end)
OG2:AddSlider("OrbitFastTpCount", { Text = "Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) cfg.orbitFastTpCount = v end })
OG2:AddSlider("OrbitFastTpInterval", { Text = "Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) cfg.orbitFastTpInterval = v end })
AddBindableToggle(OG2, "OrbitStickToTarget", "Stick to Target", true, function(v) cfg.orbitStickToTarget = v end)
OG2:AddSlider("OrbitStickOffset", { Text = "Stick Offset", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) cfg.orbitStickOffset = v end })
AddBindableToggle(OG2, "OrbitInfiniteRange", "Infinite Range", true, function(v) cfg.orbitInfiniteRange = v end)
AddBindableToggle(OG2, "OrbitExpandedHitbox", "Expanded Hitbox", true, function(v) cfg.orbitExpandedHitbox = v end)
OG2:AddSlider("OrbitHitboxSize", { Text = "Hitbox Size", Default = 500, Min = 10, Max = 5000, Rounding = 0, Callback = function(v) cfg.orbitHitboxSize = v end })

local PG = Tabs.Prediction:AddLeftGroupbox("Prediction V2")
AddBindableToggle(PG, "PredToggle", "Enable Prediction V2", false, function(v) cfgDodge.predEnabled = v; if v then startPredictionV2() else stopPredictionV2() end end)
PG:AddSlider("PredRadius", { Text = "Danger Radius", Default = 120, Min = 5, Max = 5000, Rounding = 0, Callback = function(v) cfgDodge.predRadius = v end })
PG:AddSlider("PredDodge", { Text = "Dodge Distance", Default = 80, Min = 5, Max = 500, Rounding = 0, Callback = function(v) cfgDodge.predDodgeDist = v end })
PG:AddSlider("PredCooldown", { Text = "Cooldown (ms)", Default = 30, Min = 10, Max = 2000, Rounding = 0, Callback = function(v) cfgDodge.predCooldown = v / 1000 end })
PG:AddSlider("PredThreshold", { Text = "Speed Threshold", Default = 300, Min = 100, Max = 5000, Rounding = 0, Callback = function(v) cfgDodge.predThreshold = v end })
PG:AddSlider("PredMult", { Text = "Prediction Mult.", Default = 1, Min = 0, Max = 10, Rounding = 1, Callback = function(v) cfgDodge.predMult = v end })
PG:AddSlider("PredLeadTime", { Text = "Lead Time (x0.01s)", Default = 22, Min = 1, Max = 100, Rounding = 0, Callback = function(v) cfgDodge.predLeadTime = v * 0.01 end })
PG:AddSlider("PredShootDot", { Text = "Aim Threshold (%)", Default = 80, Min = 50, Max = 99, Rounding = 0, Callback = function(v) cfgDodge.predShootDot = v * 0.01 end })
PG:AddSlider("PredShootDist", { Text = "Shot Dodge Distance", Default = 100, Min = 10, Max = 500, Rounding = 0, Callback = function(v) cfgDodge.predShootDist = v end })
PG:AddSlider("PredBulletSpd", { Text = "Enemy Bullet Speed", Default = 200, Min = 50, Max = 5000, Rounding = 0, Callback = function(v) cfgDodge.predBulletSpd = v end })
PG:AddSlider("PredReactTime", { Text = "Reaction Time (x0.01s)", Default = 6, Min = 1, Max = 50, Rounding = 0, Callback = function(v) cfgDodge.predReactTime = v * 0.01 end })
AddBindableToggle(PG, "PredShootDetect", "Detect Enemy Shooting", true, function(v) cfgDodge.predShootDetect = v end)
AddBindableToggle(PG, "PredRaycast", "Raycast Line of Fire", true, function(v) cfgDodge.predRaycast = v end)
AddBindableToggle(PG, "PredMultiPoint", "Multi-Point Dodge", true, function(v) cfgDodge.predMultiPoint = v end)
AddBindableToggle(PG, "PredBackstep", "Backstep Dodge", true, function(v) cfgDodge.predBackstep = v end)
AddBindableToggle(PG, "PredReactionLadder", "Reaction Ladder", true, function(v) cfgDodge.predReactionLadder = v end)
AddBindableToggle(PG, "PredThreatScore", "Threat Scoring", true, function(v) cfgDodge.predThreatScore = v end)
AddBindableToggle(PG, "PredPredictiveAim", "Predictive Aim", true, function(v) cfgDodge.predPredictiveAim = v end)
PG:AddSlider("PredPredictiveLead", { Text = "Predictive Aim Lead (x0.01s)", Default = 25, Min = 1, Max = 200, Rounding = 0, Callback = function(v) cfgDodge.predPredictiveLead = v * 0.01 end })
AddBindableToggle(PG, "PredAnimDetect", "Animation Detect", true, function(v) cfgDodge.predAnimDetect = v end)
AddBindableToggle(PG, "PredInfiniteRange", "Infinite Range Prediction", true, function(v) cfgDodge.predInfiniteRange = v end)
AddBindableToggle(PG, "PredNotifyAnywhere", "Notify At Any Distance", true, function(v) cfgDodge.predNotifyAnywhere = v end)
AddBindableToggle(PG, "PredRivalsMode", "Rivals Mode", true, function(v) cfgDodge.predRivalsMode = v end)
AddBindableToggle(PG, "PredRivalsHitbox", "Rivals Hitbox Expand", true, function(v) cfgDodge.predRivalsHitboxExpand = v end)
PG:AddSlider("PredRivalsHitboxSize", { Text = "Rivals Hitbox Size", Default = 150, Min = 10, Max = 2000, Rounding = 0, Callback = function(v) cfgDodge.predRivalsHitboxSize = v end })
AddBindableToggle(PG, "PredNoClip", "No Clip While Dodging", true, function(v) cfgDodge.predNoClip = v end)
AddBindableToggle(PG, "PredMassless", "Massless Character", true, function(v) cfgDodge.predMassless = v end)
AddBindableToggle(PG, "PredAutoShoot", "Auto Shoot After Dodge", true, function(v) cfgDodge.predAutoShoot = v end)
AddBindableToggle(PG, "PredBypassAnticheat", "Bypass Anticheat", true, function(v) cfgDodge.predBypassAnticheat = v end)
AddBindableToggle(PG, "PredAntiKick", "Anti Kick", true, function(v) cfgDodge.predAntiKick = v end)
AddBindableToggle(PG, "PredNetworkOwn", "Network Owner Fix", true, function(v) cfgDodge.predNetworkOwn = v end)
AddBindableToggle(PG, "PredVelZero", "Zero Velocity", true, function(v) cfgDodge.predVelZero = v end)
AddBindableToggle(PG, "PredAutoAim", "Auto Aim at Target", true, function(v) cfgDodge.predAutoAim = v end)
PG:AddSlider("PredAimStrength", { Text = "Aim Strength", Default = 1, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) cfgDodge.predAimStrength = v end })
AddBindableToggle(PG, "PredFastTp", "Fast TP", true, function(v) cfgDodge.predFastTp = v end)
PG:AddSlider("PredFastTpCount", { Text = "Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) cfgDodge.predFastTpCount = v end })
PG:AddSlider("PredFastTpInterval", { Text = "Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) cfgDodge.predFastTpInterval = v end })
AddBindableToggle(PG, "PredStickToTarget", "Stick to Target", true, function(v) cfgDodge.predStickToTarget = v end)
PG:AddSlider("PredStickOffset", { Text = "Stick Offset", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) cfgDodge.predStickOffset = v end })
AddBindableToggle(PG, "PredPhaseThrough", "Phase Through Walls", true, function(v) cfgDodge.predPhaseThrough = v end)
AddBindableToggle(PG, "PredIgnoreCollide", "Ignore Collisions", true, function(v) cfgDodge.predIgnoreCollide = v end)

local PG2 = Tabs.Prediction:AddRightGroupbox("Anti Bait V2")
AddBindableToggle(PG2, "AntiBaitToggle", "Enable Anti Bait V2", false, function(v) antiBaitCFG.enabled = v; if v then startAntiBaitV2() else stopAntiBait() end end)
PG2:AddDropdown("AntiBaitDodgeMode", { Text = "Dodge Mode", Default = "Perpendicular", Values = {"Perpendicular","Away","Random"}, Callback = function(v) antiBaitCFG.dodgeMode = v end })
AddBindableToggle(PG2, "AntiBaitBaitEnabled", "Bait Enemy Shots", true, function(v) antiBaitCFG.baitEnabled = v end)
AddBindableToggle(PG2, "AntiBaitHookActivate", "Hook Tool Activate", true, function(v) antiBaitCFG.baitHookActivate = v end)
AddBindableToggle(PG2, "AntiBaitVel", "Vel Spike Detect", true, function(v) antiBaitCFG.velSpikeEnabled = v end)
AddBindableToggle(PG2, "AntiBaitFlicker", "Flicker Detect", true, function(v) antiBaitCFG.flickerEnabled = v end)
AddBindableToggle(PG2, "AntiBaitNotify", "Notify on Dodge", true, function(v) antiBaitCFG.notifyOnDodge = v end)
AddBindableToggle(PG2, "AntiBaitNotifyLabel", "Notify Bait Confirmed", true, function(v) antiBaitCFG.baitNotifyLabel = v end)
AddBindableToggle(PG2, "AntiBaitShoot", "Dodge On Shoot", true, function(v) antiBaitCFG.dodgeOnShoot = v end)
AddBindableToggle(PG2, "AntiBaitGunPredict", "Gun Prediction Dodge", true, function(v) antiBaitCFG.gunPredEnabled = v end)
AddBindableToggle(PG2, "AntiBaitStall", "Bait Stall", true, function(v) antiBaitCFG.baitStallChance = v and 0.4 or 0 end)
AddBindableToggle(PG2, "AntiBaitInfiniteRange", "Infinite Range Anti-Bait", true, function(v) antiBaitCFG.infiniteRange = v end)
AddBindableToggle(PG2, "AntiBaitRivalsMode", "Rivals Mode", true, function(v) antiBaitCFG.rivalsMode = v end)
AddBindableToggle(PG2, "AntiBaitNoClip", "No Clip While Dodging", true, function(v) antiBaitCFG.antiBaitNoClip = v end)
AddBindableToggle(PG2, "AntiBaitMassless", "Massless Character", true, function(v) antiBaitCFG.antiBaitMassless = v end)
AddBindableToggle(PG2, "AntiBaitVelZero", "Zero Velocity on Dodge", true, function(v) antiBaitCFG.antiBaitVelZero = v end)
AddBindableToggle(PG2, "AntiBaitNetworkOwn", "Network Owner Fix", true, function(v) antiBaitCFG.antiBaitNetworkOwn = v end)
AddBindableToggle(PG2, "AntiBaitBypassAnticheat", "Bypass Anticheat", true, function(v) antiBaitCFG.antiBaitBypassAnticheat = v end)
AddBindableToggle(PG2, "AntiBaitAntiKick", "Anti Kick", true, function(v) antiBaitCFG.antiBaitAntiKick = v end)
AddBindableToggle(PG2, "AntiBaitFastTp", "Fast TP", true, function(v) antiBaitCFG.antiBaitFastTp = v end)
PG2:AddSlider("AntiBaitFastTpCount", { Text = "Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) antiBaitCFG.antiBaitFastTpCount = v end })
PG2:AddSlider("AntiBaitFastTpInterval", { Text = "Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) antiBaitCFG.antiBaitFastTpInterval = v end })
AddBindableToggle(PG2, "AntiBaitStickToTarget", "Stick to Target", true, function(v) antiBaitCFG.antiBaitStickToTarget = v end)
PG2:AddSlider("AntiBaitStickOffset", { Text = "Stick Offset", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) antiBaitCFG.antiBaitStickOffset = v end })
AddBindableToggle(PG2, "AntiBaitPhaseThrough", "Phase Through Walls", true, function(v) antiBaitCFG.antiBaitPhaseThrough = v end)
AddBindableToggle(PG2, "AntiBaitIgnoreCollide", "Ignore Collisions", true, function(v) antiBaitCFG.antiBaitIgnoreCollide = v end)
AddBindableToggle(PG2, "AntiBaitAutoAim", "Auto Aim at Target", true, function(v) antiBaitCFG.antiBaitAutoAim = v end)
PG2:AddSlider("AntiBaitAimStrength", { Text = "Aim Strength", Default = 1, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) antiBaitCFG.antiBaitAimStrength = v end })
AddBindableToggle(PG2, "AntiBaitAutoShoot", "Auto Shoot", true, function(v) antiBaitCFG.antiBaitAutoShoot = v end)
PG2:AddSlider("AntiBaitAutoShootRange", { Text = "Auto Shoot Range", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) antiBaitCFG.antiBaitAutoShootRange = v end })
AddBindableToggle(PG2, "AntiBaitUniversalAim", "Universal Aim", true, function(v) antiBaitCFG.antiBaitUniversalAim = v end)
AddBindableToggle(PG2, "AntiBaitUniversalAnimation", "Universal Animation", true, function(v) antiBaitCFG.antiBaitUniversalAnimation = v end)
AddBindableToggle(PG2, "AntiBaitUniversalVelocity", "Universal Velocity", true, function(v) antiBaitCFG.antiBaitUniversalVelocity = v end)
PG2:AddSlider("AntiBaitInfiniteRadius", { Text = "Infinite Radius (studs)", Default = 5e12, Min = 100, Max = 5e12, Rounding = 0, Callback = function(v) antiBaitCFG.infiniteRadius = v end })
PG2:AddSlider("AntiBaitReactionWindow", { Text = "Bait React Window (ms)", Default = 180, Min = 30, Max = 500, Rounding = 0, Callback = function(v) antiBaitCFG.baitReactionWindow = v * 0.001 end })
PG2:AddSlider("AntiBaitStallTime", { Text = "Stall Time (ms)", Default = 80, Min = 20, Max = 300, Rounding = 0, Callback = function(v) antiBaitCFG.baitStallTime = v * 0.001 end })
PG2:AddSlider("AntiBaitFakeLock", { Text = "Fake Lock Time (ms)", Default = 60, Min = 20, Max = 200, Rounding = 0, Callback = function(v) antiBaitCFG.baitFakeLockTime = v * 0.001 end })
PG2:AddSlider("AntiBaitGunDot", { Text = "Gun Aim Threshold (%)", Default = 80, Min = 50, Max = 99, Rounding = 0, Callback = function(v) antiBaitCFG.gunPredDot = v * 0.01 end })
PG2:AddSlider("AntiBaitGunDodge", { Text = "Gun Dodge Distance", Default = 100, Min = 10, Max = 500, Rounding = 0, Callback = function(v) antiBaitCFG.gunPredDodgeDist = v end })
PG2:AddSlider("AntiBaitGunCD", { Text = "Gun Dodge CD (ms)", Default = 20, Min = 10, Max = 500, Rounding = 0, Callback = function(v) antiBaitCFG.gunPredCooldown = v * 0.001 end })
PG2:AddSlider("AntiBaitGunLead", { Text = "Gun Lead (x0.01s)", Default = 18, Min = 1, Max = 100, Rounding = 0, Callback = function(v) antiBaitCFG.gunPredLead = v * 0.01 end })
PG2:AddSlider("AntiBaitVelThresh", { Text = "Vel Threshold", Default = 200, Min = 100, Max = 2000, Rounding = 0, Callback = function(v) antiBaitCFG.velThreshold = v end })
PG2:AddSlider("AntiBaitDodgeDist", { Text = "Dodge Distance", Default = 100, Min = 5, Max = 500, Rounding = 0, Callback = function(v) antiBaitCFG.velDodgeDist = v end })
PG2:AddSlider("AntiBaitCooldown", { Text = "Cooldown (x0.1s)", Default = 2, Min = 1, Max = 20, Rounding = 0, Callback = function(v) antiBaitCFG.dodgeCooldown = v * 0.1 end })
PG2:AddSlider("AntiBaitTpCount", { Text = "Min TPs to Confirm", Default = 2, Min = 2, Max = 10, Rounding = 0, Callback = function(v) antiBaitCFG.flickerMinTps = v end })
PG2:AddSlider("AntiBaitWindow", { Text = "Flicker Window (x0.1s)", Default = 3, Min = 1, Max = 20, Rounding = 0, Callback = function(v) antiBaitCFG.flickerWindow = v * 0.1 end })
PG2:AddSlider("AntiBaitTpDist", { Text = "TP Delta (studs)", Default = 10, Min = 5, Max = 100, Rounding = 0, Callback = function(v) antiBaitCFG.flickerTpDist = v end })
PG2:AddSlider("AntiBaitRescan", { Text = "Rescan Interval (s)", Default = 2, Min = 1, Max = 60, Rounding = 0, Callback = function(v) antiBaitCFG.reScanInterval = v end })

local AG = Tabs.Defense:AddLeftGroupbox("Anti-Aim")
AddBindableToggle(AG, "AaToggle", "Enable Anti-Aim", false, function(v) aaSettings.enabled = v; if v then startAntiAim() else stopAntiAim() end end)
AG:AddDropdown("AaMode", { Text = "Mode", Default = "RandomSpin", Values = {"Spin","Jitter","Static","Up","Down","Side","RandomSpin","Custom"}, Callback = function(v) aaSettings.mode = v end })
AG:AddSlider("AaSpeed", { Text = "Speed (deg/s)", Default = 5000, Min = 100, Max = 5000, Rounding = 0, Callback = function(v) aaSettings.speed = v end })
AG:AddSlider("AaPitchAngle", { Text = "Pitch Angle", Default = 45, Min = 0, Max = 90, Rounding = 0, Callback = function(v) aaSettings.pitchAngle = v end })
AG:AddSlider("AaYawAngle", { Text = "Yaw Angle", Default = 45, Min = 0, Max = 180, Rounding = 0, Callback = function(v) aaSettings.yawAngle = v end })
AG:AddSlider("AaStaticYaw", { Text = "Static Yaw", Default = 90, Min = -180, Max = 180, Rounding = 0, Callback = function(v) aaSettings.staticYaw = v end })
AG:AddSlider("AaStaticPitch", { Text = "Static Pitch", Default = 0, Min = -90, Max = 90, Rounding = 0, Callback = function(v) aaSettings.staticPitch = v end })
AG:AddSlider("AaCustomYaw", { Text = "Custom Yaw", Default = 180, Min = -180, Max = 180, Rounding = 0, Callback = function(v) aaSettings.customYaw = v end })
AG:AddSlider("AaCustomPitch", { Text = "Custom Pitch", Default = 0, Min = -90, Max = 90, Rounding = 0, Callback = function(v) aaSettings.customPitch = v end })
AddBindableToggle(AG, "AaRandomSpeed", "Randomize Speed", true, function(v) aaSettings.randomSpeed = v end)
AddBindableToggle(AG, "AaJitterPitch", "Jitter Pitch", true, function(v) aaSettings.jitterPitch = v end)
AddBindableToggle(AG, "AaJitterYaw", "Jitter Yaw", true, function(v) aaSettings.jitterYaw = v end)
AddBindableToggle(AG, "AaFakeAngle", "Fake Angle", false, function(v) aaSettings.fakeAngle = v end)
AG:AddSlider("AaFakeYaw", { Text = "Fake Yaw Offset", Default = 45, Min = -180, Max = 180, Rounding = 0, Callback = function(v) aaSettings.fakeYaw = v end })
AG:AddSlider("AaFakePitch", { Text = "Fake Pitch Offset", Default = 0, Min = -90, Max = 90, Rounding = 0, Callback = function(v) aaSettings.fakePitch = v end })
AddBindableToggle(AG, "AaMicroJitter", "Micro Jitter", false, function(v) aaSettings.microJitter = v end)
AG:AddSlider("AaMicroJitterAmp", { Text = "Micro Jitter Amp", Default = 5, Min = 0, Max = 45, Rounding = 1, Callback = function(v) aaSettings.microJitterAmp = v end })
AG:AddSlider("AaMicroJitterSpd", { Text = "Micro Jitter Speed", Default = 30, Min = 1, Max = 120, Rounding = 0, Callback = function(v) aaSettings.microJitterSpeed = v end })
AddBindableToggle(AG, "AaDesyncMode", "Desync Mode", false, function(v) aaSettings.desyncMode = v end)
AG:AddSlider("AaDesyncOffset", { Text = "Desync Yaw Offset", Default = 180, Min = 0, Max = 360, Rounding = 0, Callback = function(v) aaSettings.desyncOffset = v end })
AddBindableToggle(AG, "AaRollEnabled", "Roll Axis Rotation", false, function(v) aaSettings.rollEnabled = v end)
AG:AddSlider("AaRollSpeed", { Text = "Roll Speed (deg/s)", Default = 360, Min = 10, Max = 720, Rounding = 0, Callback = function(v) aaSettings.rollSpeed = v end })
AddBindableToggle(AG, "AaBreathe", "Breathe Effect", false, function(v) aaSettings.breatheEffect = v end)
AG:AddSlider("AaBreatheAmp", { Text = "Breathe Amplitude", Default = 3, Min = 0, Max = 30, Rounding = 1, Callback = function(v) aaSettings.breatheAmp = v end })
AG:AddSlider("AaBreatheSpeed", { Text = "Breathe Speed", Default = 1, Min = 0.1, Max = 10, Rounding = 1, Callback = function(v) aaSettings.breatheSpeed = v end })
AddBindableToggle(AG, "AaRandomFlip", "Random Flip", false, function(v) aaSettings.randomFlip = v end)
AG:AddSlider("AaFlipChance", { Text = "Flip Chance (%)", Default = 5, Min = 1, Max = 50, Rounding = 0, Callback = function(v) aaSettings.flipChance = v * 0.01 end })

local AG2 = Tabs.Defense:AddRightGroupbox("Anti-Aim Helpful Options")
AddBindableToggle(AG2, "AaEnhancedMode", "Enhanced Mode", true, function(v) aaSettings.enhancedMode = v end)
AddBindableToggle(AG2, "AaMultiAxisSpin", "Multi Axis Spin", true, function(v) aaSettings.multiAxisSpin = v end)
AddBindableToggle(AG2, "AaMultiAxisX", "Multi Axis X", true, function(v) aaSettings.multiAxisX = v end)
AddBindableToggle(AG2, "AaMultiAxisY", "Multi Axis Y", true, function(v) aaSettings.multiAxisY = v end)
AddBindableToggle(AG2, "AaMultiAxisZ", "Multi Axis Z", true, function(v) aaSettings.multiAxisZ = v end)
AG2:AddSlider("AaMultiAxisSpeedX", { Text = "Multi Axis X Speed", Default = 3600, Min = 100, Max = 10000, Rounding = 0, Callback = function(v) aaSettings.multiAxisSpeedX = v end })
AG2:AddSlider("AaMultiAxisSpeedY", { Text = "Multi Axis Y Speed", Default = 5400, Min = 100, Max = 10000, Rounding = 0, Callback = function(v) aaSettings.multiAxisSpeedY = v end })
AG2:AddSlider("AaMultiAxisSpeedZ", { Text = "Multi Axis Z Speed", Default = 2700, Min = 100, Max = 10000, Rounding = 0, Callback = function(v) aaSettings.multiAxisSpeedZ = v end })
AddBindableToggle(AG2, "AaChaosMode", "Chaos Mode", true, function(v) aaSettings.chaosMode = v end)
AG2:AddSlider("AaChaosInterval", { Text = "Chaos Interval (s)", Default = 0.05, Min = 0.01, Max = 1, Rounding = 2, Callback = function(v) aaSettings.chaosInterval = v end })
AG2:AddSlider("AaChaosMaxAngle", { Text = "Chaos Max Angle", Default = 180, Min = 10, Max = 360, Rounding = 0, Callback = function(v) aaSettings.chaosMaxAngle = v end })
AddBindableToggle(AG2, "AaLookAtRandom", "Look At Random Direction", true, function(v) aaSettings.lookAtRandom = v end)
AG2:AddSlider("AaLookAtRandomInterval", { Text = "Look At Interval (s)", Default = 0.1, Min = 0.01, Max = 1, Rounding = 2, Callback = function(v) aaSettings.lookAtRandomInterval = v end })
AddBindableToggle(AG2, "AaNoClip", "No Clip", true, function(v) aaSettings.aaNoClip = v end)
AddBindableToggle(AG2, "AaMassless", "Massless Character", true, function(v) aaSettings.aaMassless = v end)
AddBindableToggle(AG2, "AaAntiFling", "Anti-Fling Protection", true, function(v) aaSettings.aaAntiFling = v end)
AddBindableToggle(AG2, "AaVelZero", "Zero Velocity", true, function(v) aaSettings.aaVelZero = v end)
AddBindableToggle(AG2, "AaNetworkOwn", "Network Owner Fix", true, function(v) aaSettings.aaNetworkOwn = v end)
AddBindableToggle(AG2, "AaPhaseThrough", "Phase Through Walls", true, function(v) aaSettings.aaPhaseThrough = v end)
AddBindableToggle(AG2, "AaIgnoreCollide", "Ignore Collisions", true, function(v) aaSettings.aaIgnoreCollide = v end)
AddBindableToggle(AG2, "AaBypassAnticheat", "Bypass Anticheat", true, function(v) aaSettings.aaBypassAnticheat = v end)
AddBindableToggle(AG2, "AaAntiKick", "Anti Kick", true, function(v) aaSettings.aaAntiKick = v end)
AddBindableToggle(AG2, "AaFastTp", "Fast TP", true, function(v) aaSettings.aaFastTp = v end)
AG2:AddSlider("AaFastTpCount", { Text = "Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) aaSettings.aaFastTpCount = v end })
AG2:AddSlider("AaFastTpInterval", { Text = "Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) aaSettings.aaFastTpInterval = v end })
AddBindableToggle(AG2, "AaStickToTarget", "Stick to Target", true, function(v) aaSettings.aaStickToTarget = v end)
AG2:AddSlider("AaStickOffset", { Text = "Stick Offset", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) aaSettings.aaStickOffset = v end })
AddBindableToggle(AG2, "AaAutoAim", "Auto Aim at Target", true, function(v) aaSettings.aaAutoAim = v end)
AG2:AddSlider("AaAimStrength", { Text = "Aim Strength", Default = 1, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) aaSettings.aaAimStrength = v end })
AddBindableToggle(AG2, "AaAutoShoot", "Auto Shoot", true, function(v) aaSettings.aaAutoShoot = v end)
AG2:AddSlider("AaAutoShootRange", { Text = "Auto Shoot Range", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) aaSettings.aaAutoShootRange = v end })
AddBindableToggle(AG2, "AaInfiniteRange", "Infinite Range", true, function(v) aaSettings.aaInfiniteRange = v end)

local AG3 = Tabs.Defense:AddLeftGroupbox("Range Extender")
AddBindableToggle(AG3, "RangeExtToggle", "Enable Range Extender", false, function(v) if v then startRangeExt() else stopRangeExt() end end)
AG3:AddSlider("RangeExtRange", { Text = "Range (studs)", Default = 5e12, Min = 100, Max = 5e12, Rounding = 0, Callback = function(v) rangeExtCFG.range = v end })
AG3:AddSlider("RangeExtHitbox", { Text = "Hitbox Size", Default = 500, Min = 1, Max = 5000, Rounding = 0, Callback = function(v) rangeExtCFG.hitboxSize = v end })
AG3:AddSlider("RangeExtHitboxTr", { Text = "Hitbox Transparency", Default = 0.5, Min = 0, Max = 1, Rounding = 2, Callback = function(v) rangeExtCFG.hitboxTransparency = v end })
AddBindableToggle(AG3, "RangeExtExpand", "Expand Hitboxes", true, function(v) rangeExtCFG.expandHitboxes = v end)
AddBindableToggle(AG3, "RangeExtRay", "Patch Raycast", true, function(v) rangeExtCFG.patchRaycast = v end)
AddBindableToggle(AG3, "RangeExtWeapon", "Patch Weapon Values", true, function(v) rangeExtCFG.patchWeaponValues = v end)
AddBindableToggle(AG3, "RangeExtFov", "FOV Boost", false, function(v) rangeExtCFG.fovBoost = v end)
AG3:AddSlider("RangeExtFovVal", { Text = "FOV Value", Default = 160, Min = 30, Max = 180, Rounding = 0, Callback = function(v) rangeExtCFG.fovValue = v end })
AddBindableToggle(AG3, "RangeExtTeam", "Team Check", false, function(v) rangeExtCFG.teamCheck = v end)
AddBindableToggle(AG3, "RangeExtAimOnly", "Only Expand When Aiming", false, function(v) rangeExtCFG.aimOnly = v end)
AddBindableToggle(AG3, "RangeExtHoldKey", "Hold F To Activate", false, function(v) rangeExtCFG.holdKey = v end)
AddBindableToggle(AG3, "RangeExtProgressive", "Progressive Expansion", false, function(v) rangeExtCFG.progressive = v end)
AddBindableToggle(AG3, "RangeExtSafeDistance", "Safe Distance", false, function(v) rangeExtCFG.safeDistance = v end)
AG3:AddSlider("RangeExtSafeDist", { Text = "Safe Distance (studs)", Default = 5, Min = 1, Max = 50, Rounding = 0, Callback = function(v) rangeExtCFG.safeDist = v end })
AG3:AddSlider("RangeExtMaxEnemies", { Text = "Max Enemies To Expand", Default = 50, Min = 1, Max = 50, Rounding = 0, Callback = function(v) rangeExtCFG.maxEnemies = v end })

local AG4 = Tabs.Defense:AddRightGroupbox("Range Extender Helpful Options")
AddBindableToggle(AG4, "RangeExtRivalsMode", "Rivals Mode", true, function(v) rangeExtCFG.rivalsMode = v end)
AddBindableToggle(AG4, "RangeExtSelf", "Include Self", true, function(v) rangeExtCFG.includeSelf = v end)
AG4:AddSlider("RangeExtAvatarScale", { Text = "Avatar Scale", Default = 50, Min = 1, Max = 500, Rounding = 0, Callback = function(v) rangeExtCFG.rivalsAvatarScale = v end })
AddBindableToggle(AG4, "RangeExtBreakHitbox", "Break Hitbox", true, function(v) rangeExtCFG.rivalsBreakHitbox = v end)
AG4:AddSlider("RangeExtBreakSize", { Text = "Break Hitbox Size", Default = 2500, Min = 100, Max = 10000, Rounding = 0, Callback = function(v) rangeExtCFG.rivalsBreakSize = v end })
AddBindableToggle(AG4, "RangeExtNoCollide", "No Collide", true, function(v) rangeExtCFG.rivalsNoCollide = v end)
AddBindableToggle(AG4, "RangeExtMassless", "Massless", true, function(v) rangeExtCFG.rivalsMassless = v end)
AddBindableToggle(AG4, "RangeExtExpandAll", "Expand All Parts", true, function(v) rangeExtCFG.rivalsExpandAll = v end)
AddBindableToggle(AG4, "RangeExtExpandSelf", "Expand Self", true, function(v) rangeExtCFG.rivalsExpandSelf = v end)
AddBindableToggle(AG4, "RangeExtNoClip", "No Clip", true, function(v) rangeExtCFG.rangeExtNoClip = v end)
AddBindableToggle(AG4, "RangeExtVelZero", "Zero Velocity", true, function(v) rangeExtCFG.rangeExtVelZero = v end)
AddBindableToggle(AG4, "RangeExtNetworkOwn", "Network Owner Fix", true, function(v) rangeExtCFG.rangeExtNetworkOwn = v end)
AddBindableToggle(AG4, "RangeExtAntiFling", "Anti-Fling Protection", true, function(v) rangeExtCFG.rangeExtAntiFling = v end)
AddBindableToggle(AG4, "RangeExtBypassAnticheat", "Bypass Anticheat", true, function(v) rangeExtCFG.rangeExtBypassAnticheat = v end)
AddBindableToggle(AG4, "RangeExtAntiKick", "Anti Kick", true, function(v) rangeExtCFG.rangeExtAntiKick = v end)
AddBindableToggle(AG4, "RangeExtFastTp", "Fast TP", true, function(v) rangeExtCFG.rangeExtFastTp = v end)
AG4:AddSlider("RangeExtFastTpCount", { Text = "Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) rangeExtCFG.rangeExtFastTpCount = v end })
AG4:AddSlider("RangeExtFastTpInterval", { Text = "Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) rangeExtCFG.rangeExtFastTpInterval = v end })
AddBindableToggle(AG4, "RangeExtStickToTarget", "Stick to Target", true, function(v) rangeExtCFG.rangeExtStickToTarget = v end)
AG4:AddSlider("RangeExtStickOffset", { Text = "Stick Offset", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) rangeExtCFG.rangeExtStickOffset = v end })
AddBindableToggle(AG4, "RangeExtPhaseThrough", "Phase Through Walls", true, function(v) rangeExtCFG.rangeExtPhaseThrough = v end)
AddBindableToggle(AG4, "RangeExtIgnoreCollide", "Ignore Collisions", true, function(v) rangeExtCFG.rangeExtIgnoreCollide = v end)
AddBindableToggle(AG4, "RangeExtAutoAim", "Auto Aim at Target", true, function(v) rangeExtCFG.rangeExtAutoAim = v end)
AG4:AddSlider("RangeExtAimStrength", { Text = "Aim Strength", Default = 1, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) rangeExtCFG.rangeExtAimStrength = v end })
AddBindableToggle(AG4, "RangeExtAutoShoot", "Auto Shoot", true, function(v) rangeExtCFG.rangeExtAutoShoot = v end)
AG4:AddSlider("RangeExtAutoShootRange", { Text = "Auto Shoot Range", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) rangeExtCFG.rangeExtAutoShootRange = v end })
AddBindableToggle(AG4, "RangeExtInfiniteRange", "Infinite Range", true, function(v) rangeExtCFG.rangeExtInfiniteRange = v end)
AddBindableToggle(AG4, "RangeExtRestore", "Restore On Disable", true, function(v) rangeExtCFG.restoreOnDisable = v end)

local AG5 = Tabs.Defense:AddLeftGroupbox("Anti Translocation")
AddBindableToggle(AG5, "AntiTranslocToggle", "Enable Anti Translocation", false, function(v) antiTranslocCFG.enabled = v; if v then startAntiTransloc() else stopAntiTransloc() end end)
AG5:AddDropdown("AntiTranslocMode", { Text = "Mode", Default = "Evade", Values = {"Evade","Freeze","Predict"}, Callback = function(v) antiTranslocCFG.mode = v end })
AG5:AddSlider("ATRadius", { Text = "Detect Radius", Default = 100, Min = 10, Max = 500, Rounding = 0, Callback = function(v) antiTranslocCFG.detectRadius = v end })
AG5:AddSlider("ATWindow", { Text = "Detect Window (x0.1)", Default = 5, Min = 1, Max = 20, Rounding = 0, Callback = function(v) antiTranslocCFG.detectWindow = v * 0.1 end })
AG5:AddSlider("ATMinTps", { Text = "Min TPs to Trigger", Default = 3, Min = 2, Max = 10, Rounding = 0, Callback = function(v) antiTranslocCFG.minTps = v end })
AG5:AddSlider("ATDodgeDist", { Text = "Dodge Distance", Default = 30, Min = 5, Max = 200, Rounding = 0, Callback = function(v) antiTranslocCFG.dodgeDistance = v end })
AG5:AddSlider("ATCooldown", { Text = "Cooldown (x0.1s)", Default = 2, Min = 1, Max = 20, Rounding = 0, Callback = function(v) antiTranslocCFG.dodgeCooldown = v * 0.1 end })
AG5:AddSlider("ATFreeze", { Text = "Freeze Time (x0.1s)", Default = 1, Min = 1, Max = 20, Rounding = 0, Callback = function(v) antiTranslocCFG.freezeTime = v * 0.1 end })
AG5:AddSlider("ATPredict", { Text = "Predict Lead (x0.1s)", Default = 1, Min = 1, Max = 10, Rounding = 0, Callback = function(v) antiTranslocCFG.predictLead = v * 0.1 end })
AddBindableToggle(AG5, "ATNotify", "Notify", true, function(v) antiTranslocCFG.notify = v end)
AddBindableToggle(AG5, "ATCounterTp", "Counter Teleport", false, function(v) antiTranslocCFG.counterTeleport = v end)
AG5:AddSlider("ATCounterOffset", { Text = "Counter TP Offset", Default = 50, Min = 5, Max = 200, Rounding = 0, Callback = function(v) antiTranslocCFG.counterTpOffset = v end })

local AG6 = Tabs.Defense:AddRightGroupbox("Anti Translocation Helpful Options")
AddBindableToggle(AG6, "ATAutoEvadeAll", "Auto Evade All", false, function(v) antiTranslocCFG.autoEvadeAll = v end)
AG6:AddSlider("ATEvadeAllRadius", { Text = "Evade All Radius", Default = 200, Min = 10, Max = 1000, Rounding = 0, Callback = function(v) antiTranslocCFG.evadeAllRadius = v end })
AddBindableToggle(AG6, "ATShieldMode", "Shield Mode", false, function(v) antiTranslocCFG.shieldMode = v end)
AG6:AddSlider("ATShieldRadius", { Text = "Shield Radius", Default = 20, Min = 5, Max = 100, Rounding = 0, Callback = function(v) antiTranslocCFG.shieldRadius = v end })
AddBindableToggle(AG6, "ATBounceback", "Bounceback", false, function(v) antiTranslocCFG.bounceback = v end)
AG6:AddSlider("ATBouncebackDist", { Text = "Bounceback Distance", Default = 100, Min = 10, Max = 500, Rounding = 0, Callback = function(v) antiTranslocCFG.bouncebackDist = v end })
AddBindableToggle(AG6, "ATSpinEvade", "Spin Evade", false, function(v) antiTranslocCFG.spinEvade = v end)
AG6:AddSlider("ATSpinEvadeSpeed", { Text = "Spin Evade Speed", Default = 360, Min = 10, Max = 720, Rounding = 0, Callback = function(v) antiTranslocCFG.spinEvadeSpeed = v end })
AddBindableToggle(AG6, "ATMultiDodge", "Multi Dodge", false, function(v) antiTranslocCFG.multiDodge = v end)
AG6:AddSlider("ATMultiDodgeCount", { Text = "Multi Dodge Count", Default = 3, Min = 2, Max = 10, Rounding = 0, Callback = function(v) antiTranslocCFG.multiDodgeCount = v end })
AddBindableToggle(AG6, "ATNoClip", "No Clip", true, function(v) antiTranslocCFG.atNoClip = v end)
AddBindableToggle(AG6, "ATMassless", "Massless Character", true, function(v) antiTranslocCFG.atMassless = v end)
AddBindableToggle(AG6, "ATVelZero", "Zero Velocity", true, function(v) antiTranslocCFG.atVelZero = v end)
AddBindableToggle(AG6, "ATNetworkOwn", "Network Owner Fix", true, function(v) antiTranslocCFG.atNetworkOwn = v end)
AddBindableToggle(AG6, "ATAntiFling", "Anti-Fling Protection", true, function(v) antiTranslocCFG.atAntiFling = v end)
AddBindableToggle(AG6, "ATPhaseThrough", "Phase Through Walls", true, function(v) antiTranslocCFG.atPhaseThrough = v end)
AddBindableToggle(AG6, "ATIgnoreCollide", "Ignore Collisions", true, function(v) antiTranslocCFG.atIgnoreCollide = v end)
AddBindableToggle(AG6, "ATBypassAnticheat", "Bypass Anticheat", true, function(v) antiTranslocCFG.atBypassAnticheat = v end)
AddBindableToggle(AG6, "ATAntiKick", "Anti Kick", true, function(v) antiTranslocCFG.atAntiKick = v end)
AddBindableToggle(AG6, "ATFastTp", "Fast TP", true, function(v) antiTranslocCFG.atFastTp = v end)
AG6:AddSlider("ATFastTpCount", { Text = "Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) antiTranslocCFG.atFastTpCount = v end })
AG6:AddSlider("ATFastTpInterval", { Text = "Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) antiTranslocCFG.atFastTpInterval = v end })
AddBindableToggle(AG6, "ATStickToTarget", "Stick to Target", true, function(v) antiTranslocCFG.atStickToTarget = v end)
AG6:AddSlider("ATStickOffset", { Text = "Stick Offset", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) antiTranslocCFG.atStickOffset = v end })
AddBindableToggle(AG6, "ATAutoAim", "Auto Aim at Target", true, function(v) antiTranslocCFG.atAutoAim = v end)
AG6:AddSlider("ATAimStrength", { Text = "Aim Strength", Default = 1, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) antiTranslocCFG.atAimStrength = v end })
AddBindableToggle(AG6, "ATAutoShoot", "Auto Shoot", true, function(v) antiTranslocCFG.atAutoShoot = v end)
AG6:AddSlider("ATAutoShootRange", { Text = "Auto Shoot Range", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) antiTranslocCFG.atAutoShootRange = v end })
AddBindableToggle(AG6, "ATInfiniteRange", "Infinite Range", true, function(v) antiTranslocCFG.atInfiniteRange = v end)

local AG7 = Tabs.Defense:AddLeftGroupbox("Velocity Desync")
AddBindableToggle(AG7, "VelDesyncToggle", "Enable Velocity Desync", false, function(v) velDesyncCFG.enabled = v; if v then startVelDesync() else stopVelDesync() end end)
AG7:AddSlider("VDIntensity", { Text = "Intensity (%)", Default = 50, Min = 1, Max = 100, Rounding = 0, Callback = function(v) velDesyncCFG.intensity = v end })
AG7:AddSlider("VDAngle", { Text = "Base Angle (deg)", Default = 90, Min = 0, Max = 360, Rounding = 0, Callback = function(v) velDesyncCFG.angle = v end })
AG7:AddSlider("VDJitter", { Text = "Jitter (deg)", Default = 20, Min = 0, Max = 180, Rounding = 0, Callback = function(v) velDesyncCFG.jitter = v end })
AG7:AddSlider("VDSpeed", { Text = "Rotation Speed", Default = 10, Min = 1, Max = 100, Rounding = 0, Callback = function(v) velDesyncCFG.speed = v end })
AddBindableToggle(AG7, "VDFlip", "Flip Direction", false, function(v) velDesyncCFG.flip = v end)
AddBindableToggle(AG7, "VDRandAngle", "Randomize Angle", false, function(v) velDesyncCFG.randomizeAngle = v end)
AG7:AddSlider("VDAngleMin", { Text = "Angle Rand Min", Default = 0, Min = 0, Max = 360, Rounding = 0, Callback = function(v) velDesyncCFG.angleMin = v end })
AG7:AddSlider("VDAngleMax", { Text = "Angle Rand Max", Default = 360, Min = 0, Max = 360, Rounding = 0, Callback = function(v) velDesyncCFG.angleMax = v end })
AddBindableToggle(AG7, "VDMultiVector", "Multi Vector", false, function(v) velDesyncCFG.multiVector = v end)
AG7:AddSlider("VDVectorCount", { Text = "Vector Count", Default = 3, Min = 2, Max = 8, Rounding = 0, Callback = function(v) velDesyncCFG.vectorCount = v end })
AddBindableToggle(AG7, "VDSpikeMode", "Spike Mode", false, function(v) velDesyncCFG.spikeMode = v end)
AG7:AddSlider("VDSpikeInterval", { Text = "Spike Interval (ms)", Default = 50, Min = 10, Max = 500, Rounding = 0, Callback = function(v) velDesyncCFG.spikeInterval = v * 0.001 end })
AG7:AddSlider("VDSpikeMag", { Text = "Spike Magnitude", Default = 1e6, Min = 1e3, Max = 1e9, Rounding = 0, Callback = function(v) velDesyncCFG.spikeMag = v end })
AddBindableToggle(AG7, "VDInvertTimer", "Invert on Timer", false, function(v) velDesyncCFG.invertOnTimer = v end)
AG7:AddSlider("VDInvertInterval", { Text = "Invert Interval (ms)", Default = 200, Min = 50, Max = 2000, Rounding = 0, Callback = function(v) velDesyncCFG.invertInterval = v * 0.001 end })
AddBindableToggle(AG7, "VDOscillate", "Oscillate Velocity", true, function(v) velDesyncCFG.oscillate = v end)
AG7:AddSlider("VDOscFreq", { Text = "Oscillate Freq", Default = 5, Min = 0.5, Max = 50, Rounding = 1, Callback = function(v) velDesyncCFG.oscillateFreq = v end })
AG7:AddSlider("VDOscAmp", { Text = "Oscillate Amp", Default = 30, Min = 0, Max = 180, Rounding = 0, Callback = function(v) velDesyncCFG.oscillateAmp = v end })

local AG8 = Tabs.Defense:AddRightGroupbox("Velocity Desync Helpful Options")
AddBindableToggle(AG8, "VDNoiseVel", "Noise Velocity", true, function(v) velDesyncCFG.noiseVel = v end)
AG8:AddSlider("VDNoiseScale", { Text = "Noise Scale", Default = 1, Min = 0.1, Max = 10, Rounding = 1, Callback = function(v) velDesyncCFG.noiseScale = v end })
AddBindableToggle(AG8, "VDBurstDesync", "Burst Desync", true, function(v) velDesyncCFG.burstDesync = v end)
AG8:AddSlider("VDBurstEvery", { Text = "Burst Every (ms)", Default = 100, Min = 10, Max = 1000, Rounding = 0, Callback = function(v) velDesyncCFG.burstEvery = v * 0.001 end })
AG8:AddSlider("VDBurstMag", { Text = "Burst Magnitude", Default = 5e5, Min = 1e3, Max = 1e9, Rounding = 0, Callback = function(v) velDesyncCFG.burstMag = v end })
AddBindableToggle(AG8, "VDCounterVel", "Counter Velocity", true, function(v) velDesyncCFG.counterVel = v end)
AddBindableToggle(AG8, "VDRotateVel", "Rotate Velocity", true, function(v) velDesyncCFG.rotateVel = v end)
AG8:AddSlider("VDRotateVelSpd", { Text = "Rotate Speed (deg/s)", Default = 180, Min = 10, Max = 720, Rounding = 0, Callback = function(v) velDesyncCFG.rotateVelSpeed = v end })
AddBindableToggle(AG8, "VDNoClip", "No Clip", true, function(v) velDesyncCFG.vdNoClip = v end)
AddBindableToggle(AG8, "VDMassless", "Massless Character", true, function(v) velDesyncCFG.vdMassless = v end)
AddBindableToggle(AG8, "VDAntiFling", "Anti-Fling Protection", true, function(v) velDesyncCFG.vdAntiFling = v end)
AddBindableToggle(AG8, "VDVelZero", "Zero Velocity Base", false, function(v) velDesyncCFG.vdVelZero = v end)
AddBindableToggle(AG8, "VDNetworkOwn", "Network Owner Fix", true, function(v) velDesyncCFG.vdNetworkOwn = v end)
AddBindableToggle(AG8, "VDPhaseThrough", "Phase Through Walls", true, function(v) velDesyncCFG.vdPhaseThrough = v end)
AddBindableToggle(AG8, "VDIgnoreCollide", "Ignore Collisions", true, function(v) velDesyncCFG.vdIgnoreCollide = v end)
AddBindableToggle(AG8, "VDBypassAnticheat", "Bypass Anticheat", true, function(v) velDesyncCFG.vdBypassAnticheat = v end)
AddBindableToggle(AG8, "VDAntiKick", "Anti Kick", true, function(v) velDesyncCFG.vdAntiKick = v end)
AddBindableToggle(AG8, "VDFastTp", "Fast TP", true, function(v) velDesyncCFG.vdFastTp = v end)
AG8:AddSlider("VDFastTpCount", { Text = "Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) velDesyncCFG.vdFastTpCount = v end })
AG8:AddSlider("VDFastTpInterval", { Text = "Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) velDesyncCFG.vdFastTpInterval = v end })
AddBindableToggle(AG8, "VDStickToTarget", "Stick to Target", true, function(v) velDesyncCFG.vdStickToTarget = v end)
AG8:AddSlider("VDStickOffset", { Text = "Stick Offset", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) velDesyncCFG.vdStickOffset = v end })
AddBindableToggle(AG8, "VDAutoAim", "Auto Aim at Target", true, function(v) velDesyncCFG.vdAutoAim = v end)
AG8:AddSlider("VDAimStrength", { Text = "Aim Strength", Default = 1, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) velDesyncCFG.vdAimStrength = v end })
AddBindableToggle(AG8, "VDAutoShoot", "Auto Shoot", true, function(v) velDesyncCFG.vdAutoShoot = v end)
AG8:AddSlider("VDAutoShootRange", { Text = "Auto Shoot Range", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) velDesyncCFG.vdAutoShootRange = v end })
AddBindableToggle(AG8, "VDInfiniteRange", "Infinite Range", true, function(v) velDesyncCFG.vdInfiniteRange = v end)

local TL = Tabs.Translocation:AddLeftGroupbox("Translocation")
AddBindableToggle(TL, "TranslocToggle", "Enable Translocation", false, function(v) translocCFG.enabled = v; if v then startTransloc() else stopTransloc() end end)
TL:AddDropdown("TranslocMode", { Text = "Offset Mode", Default = "Ahead", Values = {"Ahead","Behind","Perpendicular","Above","Below","AboveBelow","MirrorX","MirrorZ","Diagonal","ScreenEdge","Orbit","ZoneEscape"}, Callback = function(v) translocCFG.offsetMode = v end })
TL:AddSlider("TranslocFreq", { Text = "Frequency (Hz)", Default = 512, Min = 1, Max = 10000, Rounding = 0, Callback = function(v) translocCFG.frequency = v end })
TL:AddSlider("TranslocDist", { Text = "Offset Distance", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.offsetDist = v end })
TL:AddSlider("TranslocOffY", { Text = "Y Offset", Default = 0, Min = -1e15, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.offsetY = v end })
TL:AddSlider("TranslocLayers", { Text = "Fake Layers", Default = 10, Min = 1, Max = 50, Rounding = 0, Callback = function(v) translocCFG.layers = v end })
AddBindableToggle(TL, "TranslocRandFreq", "Random Frequency", false, function(v) translocCFG.randomFrequency = v end)
TL:AddSlider("TranslocFreqMin", { Text = "Freq Min", Default = 50, Min = 1, Max = 10000, Rounding = 0, Callback = function(v) translocCFG.freqMin = v end })
TL:AddSlider("TranslocFreqMax", { Text = "Freq Max", Default = 500, Min = 1, Max = 10000, Rounding = 0, Callback = function(v) translocCFG.freqMax = v end })
AddBindableToggle(TL, "TranslocBurst", "Burst Mode", false, function(v) translocCFG.burstMode = v end)
TL:AddSlider("TranslocBurstCount", { Text = "Burst Count", Default = 10, Min = 2, Max = 50, Rounding = 0, Callback = function(v) translocCFG.burstCount = v end })
TL:AddSlider("TranslocBurstInterval", { Text = "Burst Interval (ms)", Default = 1, Min = 1, Max = 100, Rounding = 0, Callback = function(v) translocCFG.burstInterval = v * 0.001 end })
AddBindableToggle(TL, "TranslocRivalsMode", "Rivals Mode", true, function(v) translocCFG.rivalsMode = v end)

local TL2 = Tabs.Translocation:AddRightGroupbox("Helpful Options")
AddBindableToggle(TL2, "TranslocFakeVel", "Fake Velocity", true, function(v) translocCFG.fakeVel = v end)
AddBindableToggle(TL2, "TranslocSnapBack", "Snap Back", true, function(v) translocCFG.snapBack = v end)
AddBindableToggle(TL2, "TranslocJitter", "Position Jitter", true, function(v) translocCFG.jitter = v end)
TL2:AddSlider("TranslocVelMag", { Text = "Fake Vel Magnitude", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.fakeVelMag = v end })
TL2:AddSlider("TranslocJitterAmp", { Text = "Jitter Amplitude", Default = 1e14, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.jitterAmp = v end })
AddBindableToggle(TL2, "TranslocSpinFake", "Spin Fake Position", false, function(v) translocCFG.spinFake = v end)
TL2:AddSlider("TranslocSpinSpeed", { Text = "Spin Speed (deg/s)", Default = 720, Min = 10, Max = 3600, Rounding = 0, Callback = function(v) translocCFG.spinFakeSpeed = v end })
AddBindableToggle(TL2, "TranslocMirrorX", "Mirror X", false, function(v) translocCFG.mirrorX = v end)
AddBindableToggle(TL2, "TranslocMirrorZ", "Mirror Z", false, function(v) translocCFG.mirrorZ = v end)
AddBindableToggle(TL2, "TranslocCascade", "Cascade Offset", false, function(v) translocCFG.cascadeOffset = v end)
TL2:AddSlider("TranslocCascadeStep", { Text = "Cascade Step", Default = 1e11, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.cascadeStep = v end })
AddBindableToggle(TL2, "TranslocWave", "Wave Pattern", false, function(v) translocCFG.wavePattern = v end)
TL2:AddSlider("TranslocWaveFreq", { Text = "Wave Frequency", Default = 2, Min = 0.1, Max = 20, Rounding = 1, Callback = function(v) translocCFG.waveFreq = v end })
TL2:AddSlider("TranslocWaveAmp", { Text = "Wave Amplitude", Default = 1e11, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.waveAmp = v end })
AddBindableToggle(TL2, "TranslocPulse", "Pulse Movement", false, function(v) translocCFG.pulse = v end)
TL2:AddSlider("TranslocPulseAmp", { Text = "Pulse Amplitude", Default = 1e11, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.pulseAmp = v end })
TL2:AddSlider("TranslocPulseSpeed", { Text = "Pulse Speed", Default = 1, Min = 0.1, Max = 20, Rounding = 1, Callback = function(v) translocCFG.pulseSpeed = v end })
AddBindableToggle(TL2, "TranslocPingPong", "Ping Pong", false, function(v) translocCFG.pingPong = v end)
TL2:AddSlider("TranslocPingPongDist", { Text = "Ping Pong Dist", Default = 1e12, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.pingPongDist = v end })
AddBindableToggle(TL2, "TranslocDiagonal", "Diagonal", false, function(v) translocCFG.diagonal = v end)
TL2:AddSlider("TranslocDiagonalAngle", { Text = "Diagonal Angle", Default = 45, Min = 0, Max = 360, Rounding = 0, Callback = function(v) translocCFG.diagonalAngle = v end })
AddBindableToggle(TL2, "TranslocAltVert", "Alternating Vertical", false, function(v) translocCFG.alternatingVertical = v end)
TL2:AddSlider("TranslocAltVertAmp", { Text = "Alt Vert Amplitude", Default = 1e11, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.altVertAmp = v end })
AddBindableToggle(TL2, "TranslocScreenEdge", "Screen Edge", false, function(v) translocCFG.screenEdge = v end)
AddBindableToggle(TL2, "TranslocOrbitFake", "Orbit Fake", false, function(v) translocCFG.orbitFake = v end)
TL2:AddSlider("TranslocOrbitSpeed", { Text = "Orbit Speed (deg/s)", Default = 90, Min = 1, Max = 720, Rounding = 0, Callback = function(v) translocCFG.orbitSpeed = v end })
TL2:AddSlider("TranslocOrbitRadius", { Text = "Orbit Radius", Default = 1e11, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.orbitRadius = v end })
AddBindableToggle(TL2, "TranslocZoneEscape", "Zone Escape", false, function(v) translocCFG.zoneEscape = v end)
TL2:AddSlider("TranslocZoneRadius", { Text = "Zone Radius", Default = 200, Min = 20, Max = 2000, Rounding = 0, Callback = function(v) translocCFG.zoneEscapeRadius = v end })
AddBindableToggle(TL2, "TranslocAutoDodge", "Auto Dodge Nearby", false, function(v) translocCFG.autoDodge = v end)
TL2:AddSlider("TranslocAutoDodgeR", { Text = "Auto Dodge Radius", Default = 60, Min = 10, Max = 500, Rounding = 0, Callback = function(v) translocCFG.autoDodgeRadius = v end })
AddBindableToggle(TL2, "TranslocPreRender", "PreRender Snapback", true, function(v) translocCFG.usePreRenderCommit = v end)
AddBindableToggle(TL2, "TranslocNetOwner", "Network Owner Fix", true, function(v) translocCFG.networkOwnerFix = v end)
AddBindableToggle(TL2, "TranslocNoClip", "No Clip", true, function(v) translocCFG.translocNoClip = v end)
AddBindableToggle(TL2, "TranslocAntiFling", "Anti-Fling Protection", true, function(v) translocCFG.translocAntiFling = v end)
AddBindableToggle(TL2, "TranslocVelZero", "Zero Velocity", true, function(v) translocCFG.translocVelZero = v end)
AddBindableToggle(TL2, "TranslocMassless", "Massless Character", true, function(v) translocCFG.translocMassless = v end)
AddBindableToggle(TL2, "TranslocPhaseThrough", "Phase Through Walls", true, function(v) translocCFG.translocPhaseThrough = v end)
AddBindableToggle(TL2, "TranslocIgnoreCollide", "Ignore Collisions", true, function(v) translocCFG.translocIgnoreCollide = v end)
AddBindableToggle(TL2, "TranslocGhostMode", "Ghost Mode", false, function(v) translocCFG.translocGhostMode = v end)
AddBindableToggle(TL2, "TranslocRivalsFakeVel", "Rivals Fake Vel", true, function(v) translocCFG.rivalsFakeVel = v end)
TL2:AddSlider("TranslocRivalsFakeVelMag", { Text = "Rivals Fake Vel Mag", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.rivalsFakeVelMag = v end })
AddBindableToggle(TL2, "TranslocRivalsSnapBack", "Rivals Snap Back", true, function(v) translocCFG.rivalsSnapBack = v end)
AddBindableToggle(TL2, "TranslocRivalsNetOwner", "Rivals Net Owner", true, function(v) translocCFG.rivalsNetworkOwner = v end)
AddBindableToggle(TL2, "TranslocBypassAnticheat", "Bypass Anticheat", true, function(v) translocCFG.translocBypassAnticheat = v end)
AddBindableToggle(TL2, "TranslocAntiKick", "Anti Kick", true, function(v) translocCFG.translocAntiKick = v end)
AddBindableToggle(TL2, "TranslocFastTp", "Fast TP", true, function(v) translocCFG.translocFastTp = v end)
TL2:AddSlider("TranslocFastTpCount", { Text = "Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) translocCFG.translocFastTpCount = v end })
TL2:AddSlider("TranslocFastTpInterval", { Text = "Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) translocCFG.translocFastTpInterval = v end })
AddBindableToggle(TL2, "TranslocStickToTarget", "Stick to Target", true, function(v) translocCFG.translocStickToTarget = v end)
TL2:AddSlider("TranslocStickOffset", { Text = "Stick Offset", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) translocCFG.translocStickOffset = v end })
AddBindableToggle(TL2, "TranslocAutoAim", "Auto Aim at Target", true, function(v) translocCFG.translocAutoAim = v end)
TL2:AddSlider("TranslocAimStrength", { Text = "Aim Strength", Default = 1, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) translocCFG.translocAimStrength = v end })
AddBindableToggle(TL2, "TranslocAutoShoot", "Auto Shoot", true, function(v) translocCFG.translocAutoShoot = v end)
TL2:AddSlider("TranslocAutoShootRange", { Text = "Auto Shoot Range", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) translocCFG.translocAutoShootRange = v end })
AddBindableToggle(TL2, "TranslocInfiniteRange", "Infinite Range", true, function(v) translocCFG.translocInfiniteRange = v end)

local SBL = Tabs.SlingBypass:AddLeftGroupbox("Sling Bypass V2")
AddBindableToggle(SBL, "SlingToggle", "Enable Sling Bypass V2", false, function(v) slingCFG.enabled = v; if v then startSlingBypassV2() else stopSlingBypassV2() end end)
SBL:AddDropdown("SlingMode", { Text = "Mode", Default = "Follow", Values = {"Follow","Stalk","Hover","FastTp","TargetStick","OrbitTarget","RandomAroundTarget"}, Callback = function(v) slingCFG.mode = v end })
SBL:AddDropdown("SlingTargetMode", { Text = "Target", Default = "Closest", Values = {"Closest","Random","Weakest","Strongest"}, Callback = function(v) slingCFG.targetMode = v end })
AddBindableToggle(SBL, "SlingNoTpMode", "No TP Mode (Anti-Patch)", true, function(v) slingCFG.noTpMode = v end)
SBL:AddSlider("SlingNoTpRange", { Text = "No TP Range", Default = 1e15, Min = 100, Max = 1e15, Rounding = 0, Callback = function(v) slingCFG.noTpRange = v end })
SBL:AddSlider("SlingNoTpHitboxSize", { Text = "No TP Hitbox Size", Default = 2000, Min = 10, Max = 10000, Rounding = 0, Callback = function(v) slingCFG.noTpHitboxSize = v end })
AddBindableToggle(SBL, "SlingNoTpAutoShoot", "No TP Auto Shoot", true, function(v) slingCFG.noTpAutoShoot = v end)
AddBindableToggle(SBL, "SlingNoTpAimAssist", "No TP Aim Assist", true, function(v) slingCFG.noTpAimAssist = v end)
AddBindableToggle(SBL, "SlingNoTpNetworkOwner", "No TP Network Owner", true, function(v) slingCFG.noTpNetworkOwner = v end)
AddBindableToggle(SBL, "SlingNoTpSilentAim", "No TP Silent Aim", true, function(v) slingCFG.noTpSilentAim = v end)
AddBindableToggle(SBL, "SlingNoTpOriginSpoof", "No TP Origin Spoof", true, function(v) slingCFG.noTpOriginSpoof = v end)
AddBindableToggle(SBL, "SlingNoTpRaycastPatch", "No TP Raycast Patch", true, function(v) slingCFG.noTpRaycastPatch = v end)
SBL:AddSlider("SlingNoTpWeaponRange", { Text = "No TP Weapon Range", Default = 1e15, Min = 100, Max = 1e15, Rounding = 0, Callback = function(v) slingCFG.noTpWeaponRange = v end })
AddBindableToggle(SBL, "SlingNoTpPingComp", "No TP Ping Comp", true, function(v) slingCFG.noTpPingComp = v end)
AddBindableToggle(SBL, "SlingNoTpTargetLock", "No TP Target Lock", true, function(v) slingCFG.noTpTargetLock = v end)
AddBindableToggle(SBL, "SlingNoTpShotRedirect", "No TP Shot Redirect", true, function(v) slingCFG.noTpShotRedirect = v end)
AddBindableToggle(SBL, "SlingNoTpLookVector", "No TP Look Vector", true, function(v) slingCFG.noTpLookVector = v end)
SBL:AddSlider("SlingNoTpSpread", { Text = "No TP Spread", Default = 0, Min = 0, Max = 1, Rounding = 2, Callback = function(v) slingCFG.noTpSpread = v end })
SBL:AddSlider("SlingNoTpRecoil", { Text = "No TP Recoil", Default = 0, Min = 0, Max = 1, Rounding = 2, Callback = function(v) slingCFG.noTpRecoil = v end })
AddBindableToggle(SBL, "SlingNoTpVelocityComp", "No TP Velocity Comp", true, function(v) slingCFG.noTpVelocityComp = v end)
AddBindableToggle(SBL, "SlingNoTpGravityComp", "No TP Gravity Comp", true, function(v) slingCFG.noTpGravityComp = v end)
AddBindableToggle(SBL, "SlingNoTpInfiniteRange", "No TP Infinite Range", true, function(v) slingCFG.noTpInfiniteRange = v end)
AddBindableToggle(SBL, "SlingNoTpInstantHit", "No TP Instant Hit", true, function(v) slingCFG.noTpInstantHit = v end)
AddBindableToggle(SBL, "SlingNoTpHitscanOverride", "No TP Hitscan Override", true, function(v) slingCFG.noTpHitscanOverride = v end)
AddBindableToggle(SBL, "SlingNoTpWallBang", "No TP Wall Bang", true, function(v) slingCFG.noTpWallBang = v end)
AddBindableToggle(SBL, "SlingNoTpProjectileFollow", "No TP Projectile Follow", true, function(v) slingCFG.noTpProjectileFollow = v end)
AddBindableToggle(SBL, "SlingNoTpSpoofSelf", "No TP Spoof Self", true, function(v) slingCFG.noTpSpoofSelf = v end)
AddBindableToggle(SBL, "SlingHideAvatar", "Hide Avatar", true, function(v) slingCFG.hideAvatar = v end)
AddBindableToggle(SBL, "SlingAutoShoot", "Auto Shoot", true, function(v) slingCFG.autoShoot = v end)
AddBindableToggle(SBL, "SlingUseTargetVel", "Use Target Velocity", true, function(v) slingCFG.useTargetVel = v end)
SBL:AddSlider("SlingStickHeight", { Text = "Stick Height", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) slingCFG.stickHeight = v end })
SBL:AddSlider("SlingAttackRange", { Text = "Attack Range", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) slingCFG.attackRange = v end })
SBL:AddSlider("SlingShotCD", { Text = "Shot Cooldown (s)", Default = 0.01, Min = 0.01, Max = 1, Rounding = 2, Callback = function(v) slingCFG.shotCooldown = v end })
SBL:AddSlider("SlingOrbitRadius", { Text = "Orbit Radius", Default = 5, Min = 1, Max = 50, Rounding = 0, Callback = function(v) slingCFG.orbitRadius = v end })
SBL:AddSlider("SlingOrbitSpeed", { Text = "Orbit Speed", Default = 200, Min = 1, Max = 1000, Rounding = 0, Callback = function(v) slingCFG.orbitSpeed = v end })
SBL:AddSlider("SlingOrbitHeight", { Text = "Orbit Height", Default = 0, Min = -20, Max = 20, Rounding = 0, Callback = function(v) slingCFG.orbitHeight = v end })
SBL:AddSlider("SlingRandRadius", { Text = "Random Around Radius", Default = 8, Min = 1, Max = 100, Rounding = 0, Callback = function(v) slingCFG.randomRadius = v end })
AddBindableToggle(SBL, "SlingFollowPredict", "Predict Target", true, function(v) slingCFG.followPredict = v end)
SBL:AddSlider("SlingFollowLead", { Text = "Follow Lead (x0.01s)", Default = 15, Min = 1, Max = 100, Rounding = 0, Callback = function(v) slingCFG.followLead = v * 0.01 end })
SBL:AddSlider("SlingFollowLerp", { Text = "Follow Smoothing", Default = 50, Min = 1, Max = 100, Rounding = 0, Callback = function(v) slingCFG.followLerp = v / 100 end })
SBL:AddSlider("SlingFollowDist", { Text = "Follow Distance", Default = 2, Min = 0, Max = 30, Rounding = 1, Callback = function(v) slingCFG.followDistance = v end })
SBL:AddSlider("SlingFollowHeight", { Text = "Follow Height", Default = 2, Min = -10, Max = 20, Rounding = 1, Callback = function(v) slingCFG.followHeight = v end })
AddBindableToggle(SBL, "SlingStalkBehind", "Stalk Behind", true, function(v) slingCFG.stalkBehind = v end)
SBL:AddSlider("SlingStalkDist", { Text = "Stalk Distance", Default = 6, Min = 1, Max = 30, Rounding = 1, Callback = function(v) slingCFG.stalkDistance = v end })
SBL:AddSlider("SlingStalkHeight", { Text = "Stalk Height", Default = 3, Min = -10, Max = 20, Rounding = 1, Callback = function(v) slingCFG.stalkHeight = v end })
SBL:AddSlider("SlingHoverHeight", { Text = "Hover Height", Default = 8, Min = 0, Max = 50, Rounding = 1, Callback = function(v) slingCFG.hoverHeight = v end })
AddBindableToggle(SBL, "SlingHoverBob", "Hover Bob", true, function(v) slingCFG.hoverBob = v end)
SBL:AddSlider("SlingHoverBobAmp", { Text = "Hover Bob Amplitude", Default = 1, Min = 0, Max = 10, Rounding = 1, Callback = function(v) slingCFG.hoverBobAmp = v end })
SBL:AddSlider("SlingHoverBobSpeed", { Text = "Hover Bob Speed", Default = 2, Min = 0.1, Max = 20, Rounding = 1, Callback = function(v) slingCFG.hoverBobSpeed = v end })
SBL:AddSlider("SlingHideTransparency", { Text = "Hide Transparency", Default = 1, Min = 0, Max = 1, Rounding = 2, Callback = function(v) slingCFG.hideTransparency = v end })
AddBindableToggle(SBL, "SlingHideAccessories", "Hide Accessories", true, function(v) slingCFG.hideAccessories = v end)
SBL:AddSlider("SlingFastTpSpeed", { Text = "TP Interval (s)", Default = 0.005, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) slingCFG.fastTpSpeed = v end })
SBL:AddSlider("SlingFastTpOffset", { Text = "Position Offset", Default = 1.5, Min = 0, Max = 10, Rounding = 1, Callback = function(v) slingCFG.fastTpOffset = v end })
SBL:AddSlider("SlingFastTpJitter", { Text = "Jitter Amount", Default = 1, Min = 0, Max = 10, Rounding = 1, Callback = function(v) slingCFG.fastTpJitter = v end })
AddBindableToggle(SBL, "SlingFastTpMulti", "Multi TP per Frame", true, function(v) slingCFG.fastTpMulti = v end)
SBL:AddSlider("SlingFastTpCount", { Text = "Multi TP Count", Default = 5, Min = 1, Max = 20, Rounding = 0, Callback = function(v) slingCFG.fastTpCount = v end })
AddBindableToggle(SBL, "SlingFastTpPen", "Penetrate (Snap Back)", true, function(v) slingCFG.fastTpPenetrate = v end)
AddBindableToggle(SBL, "SlingFastTpRandAng", "Random Angle Offset", true, function(v) slingCFG.fastTpRandAng = v end)
SBL:AddSlider("SlingRushCD", { Text = "Rush Cooldown (ms)", Default = 10, Min = 1, Max = 200, Rounding = 0, Callback = function(v) slingCFG.rushCooldown = v * 0.001 end })

local SBR = Tabs.SlingBypass:AddRightGroupbox("Helpful Options")
AddBindableToggle(SBR, "SlingRivalsMode", "Rivals Mode", true, function(v) slingCFG.rivalsMode = v end)
AddBindableToggle(SBR, "SlingRivalsInfiniteRange", "Rivals Infinite Range", true, function(v) slingCFG.rivalsInfiniteRange = v end)
SBR:AddSlider("SlingRivalsRange", { Text = "Rivals Range", Default = 1e15, Min = 100, Max = 1e15, Rounding = 0, Callback = function(v) slingCFG.rivalsRange = v end })
AddBindableToggle(SBR, "SlingRivalsAutoShoot", "Rivals Auto Shoot", true, function(v) slingCFG.rivalsAutoShoot = v end)
AddBindableToggle(SBR, "SlingRivalsHitboxExpand", "Rivals Hitbox Expand", true, function(v) slingCFG.rivalsHitboxExpand = v end)
SBR:AddSlider("SlingRivalsHitboxSize", { Text = "Rivals Hitbox Size", Default = 500, Min = 10, Max = 5000, Rounding = 0, Callback = function(v) slingCFG.rivalsHitboxSize = v end })
AddBindableToggle(SBR, "SlingRivalsNetworkOwner", "Rivals Network Owner", true, function(v) slingCFG.rivalsNetworkOwner = v end)
AddBindableToggle(SBR, "SlingRivalsFastTp", "Rivals Fast TP", true, function(v) slingCFG.rivalsFastTp = v end)
SBR:AddSlider("SlingRivalsFastTpCount", { Text = "Rivals Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) slingCFG.rivalsFastTpCount = v end })
SBR:AddSlider("SlingRivalsFastTpInterval", { Text = "Rivals Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) slingCFG.rivalsFastTpInterval = v end })
AddBindableToggle(SBR, "SlingRivalsPositionLock", "Rivals Position Lock", true, function(v) slingCFG.rivalsPositionLock = v end)
AddBindableToggle(SBR, "SlingNoClip", "No Clip", true, function(v) slingCFG.slingNoClip = v end)
AddBindableToggle(SBR, "SlingMassless", "Massless Character", true, function(v) slingCFG.slingMassless = v end)
AddBindableToggle(SBR, "SlingAntiFling", "Anti-Fling Protection", true, function(v) slingCFG.slingAntiFling = v end)
AddBindableToggle(SBR, "SlingVelZero", "Zero Velocity", true, function(v) slingCFG.slingVelZero = v end)
AddBindableToggle(SBR, "SlingPhaseThrough", "Phase Through Walls", true, function(v) slingCFG.slingPhaseThrough = v end)
AddBindableToggle(SBR, "SlingIgnoreCollide", "Ignore Collisions", true, function(v) slingCFG.slingIgnoreCollide = v end)
AddBindableToggle(SBR, "SlingAutoAim", "Auto Aim at Target", true, function(v) slingCFG.slingAutoAim = v end)
SBR:AddSlider("SlingAimStrength", { Text = "Aim Strength", Default = 1, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) slingCFG.slingAimStrength = v end })
AddBindableToggle(SBR, "SlingAutoShootAccurate", "Accurate Auto Shoot", true, function(v) slingCFG.slingAutoShootAccurate = v end)
AddBindableToggle(SBR, "SlingTargetLock", "Target Lock", true, function(v) slingCFG.slingTargetLock = v end)
AddBindableToggle(SBR, "SlingAntiKick", "Anti Kick", true, function(v) slingCFG.slingAntiKick = v end)
AddBindableToggle(SBR, "SlingBypassAnticheat", "Bypass Anticheat", true, function(v) slingCFG.slingBypassAnticheat = v end)
AddBindableToggle(SBR, "SlingFastTp", "Fast TP", true, function(v) slingCFG.slingFastTp = v end)
SBR:AddSlider("SlingFastTpCount2", { Text = "Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) slingCFG.slingFastTpCount = v end })
SBR:AddSlider("SlingFastTpInterval2", { Text = "Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) slingCFG.slingFastTpInterval = v end })
AddBindableToggle(SBR, "SlingStickToTarget", "Stick to Target", true, function(v) slingCFG.slingStickToTarget = v end)
SBR:AddSlider("SlingStickOffset", { Text = "Stick Offset", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) slingCFG.slingStickOffset = v end })
AddBindableToggle(SBR, "SlingInfiniteRange", "Infinite Range", true, function(v) slingCFG.slingInfiniteRange = v end)

local RG = Tabs.Riot:AddLeftGroupbox("Riot Godmode")
AddBindableToggle(RG, "RiotGodmodeToggle", "Enable Riot Godmode", false, function(v) riotGodmodeCFG.enabled = v; if v then startRiotGodmode() else stopRiotGodmode() end end)
RG:AddSlider("RGSpeed", { Text = "Teleport Delay (s)", Default = 0.03, Min = 0.01, Max = 0.5, Rounding = 2, Callback = function(v) riotGodmodeCFG.speed = v end })
RG:AddSlider("RGMinJump", { Text = "Min Jump Range", Default = 10, Min = 1, Max = 100, Rounding = 0, Callback = function(v) riotGodmodeCFG.minJump = v end })
RG:AddSlider("RGMaxJump", { Text = "Max Jump Range", Default = 200, Min = 10, Max = 2000, Rounding = 0, Callback = function(v) riotGodmodeCFG.maxJump = v end })
RG:AddSlider("RGEvadeRange", { Text = "Evade Trigger", Default = 30, Min = 0, Max = 100, Rounding = 0, Callback = function(v) riotGodmodeCFG.evadeRange = v end })
RG:AddSlider("RGBulletDodge", { Text = "Bullet Dodge Dist", Default = 40, Min = 5, Max = 200, Rounding = 0, Callback = function(v) riotGodmodeCFG.bulletDodge = v end })
RG:AddSlider("RGHeightVar", { Text = "Height Variance", Default = 10, Min = 0, Max = 100, Rounding = 0, Callback = function(v) riotGodmodeCFG.heightVariance = v end })
RG:AddSlider("RGSpinSpeed", { Text = "Spin Speed (deg/s)", Default = 180, Min = 0, Max = 720, Rounding = 0, Callback = function(v) riotGodmodeCFG.spinSpeed = v end })
RG:AddDropdown("RGSpinAxis", { Text = "Spin Axis", Default = "Y", Values = {"X","Y","Z"}, Callback = function(v) riotGodmodeCFG.spinAxis = v end })
AddBindableToggle(RG, "RGRandAxis", "Random Spin Axis", false, function(v) riotGodmodeCFG.randomAxis = v end)
AddBindableToggle(RG, "RGAvoidBullet", "Avoid Bullets", true, function(v) riotGodmodeCFG.avoidBullets = v end)
AddBindableToggle(RG, "RGGroundSnap", "Ground Snap", false, function(v) riotGodmodeCFG.groundSnap = v end)
AddBindableToggle(RG, "RGMultiTp", "Multi TP", false, function(v) riotGodmodeCFG.multiTp = v end)
RG:AddSlider("RGMultiTpCount", { Text = "Multi TP Count", Default = 3, Min = 2, Max = 10, Rounding = 0, Callback = function(v) riotGodmodeCFG.multiTpCount = v end })
RG:AddSlider("RGMultiTpDelay", { Text = "Multi TP Delay (ms)", Default = 10, Min = 1, Max = 100, Rounding = 0, Callback = function(v) riotGodmodeCFG.multiTpDelay = v * 0.001 end })
AddBindableToggle(RG, "RGPhaseMode", "Phase Mode", false, function(v) riotGodmodeCFG.phaseMode = v end)
RG:AddSlider("RGPhaseInterval", { Text = "Phase Interval (ms)", Default = 20, Min = 5, Max = 100, Rounding = 0, Callback = function(v) riotGodmodeCFG.phaseInterval = v * 0.001 end })
AddBindableToggle(RG, "RGAutoShoot", "Auto Shoot", true, function(v) riotGodmodeCFG.autoShoot = v end)
RG:AddSlider("RGAttackRange", { Text = "Attack Range", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) riotGodmodeCFG.attackRange = v end })
RG:AddSlider("RGShootCooldown", { Text = "Shoot Cooldown (s)", Default = 0.01, Min = 0.01, Max = 1, Rounding = 2, Callback = function(v) riotGodmodeCFG.shootCooldown = v end })
AddBindableToggle(RG, "RGNoClip", "No Clip", true, function(v) riotGodmodeCFG.rgNoClip = v end)
AddBindableToggle(RG, "RGMassless", "Massless Character", true, function(v) riotGodmodeCFG.rgMassless = v end)
AddBindableToggle(RG, "RGAntiFling", "Anti-Fling Protection", true, function(v) riotGodmodeCFG.rgAntiFling = v end)
AddBindableToggle(RG, "RGVelZero", "Zero Velocity", true, function(v) riotGodmodeCFG.rgVelZero = v end)
AddBindableToggle(RG, "RGNetworkOwn", "Network Owner Fix", true, function(v) riotGodmodeCFG.rgNetworkOwn = v end)
AddBindableToggle(RG, "RGPhaseThrough", "Phase Through Walls", true, function(v) riotGodmodeCFG.rgPhaseThrough = v end)
AddBindableToggle(RG, "RGIgnoreCollide", "Ignore Collisions", true, function(v) riotGodmodeCFG.rgIgnoreCollide = v end)
AddBindableToggle(RG, "RGAutoShootAccurate", "Accurate Auto Shoot", true, function(v) riotGodmodeCFG.rgAutoShootAccurate = v end)
AddBindableToggle(RG, "RGBypassAnticheat", "Bypass Anticheat", true, function(v) riotGodmodeCFG.rgBypassAnticheat = v end)
AddBindableToggle(RG, "RGAntiKick", "Anti Kick", true, function(v) riotGodmodeCFG.rgAntiKick = v end)
AddBindableToggle(RG, "RGFastTp", "Fast TP", true, function(v) riotGodmodeCFG.rgFastTp = v end)
RG:AddSlider("RGFastTpCount", { Text = "Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) riotGodmodeCFG.rgFastTpCount = v end })
RG:AddSlider("RGFastTpInterval", { Text = "Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) riotGodmodeCFG.rgFastTpInterval = v end })
AddBindableToggle(RG, "RGStickToTarget", "Stick to Target", true, function(v) riotGodmodeCFG.rgStickToTarget = v end)
RG:AddSlider("RGStickOffset", { Text = "Stick Offset", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) riotGodmodeCFG.rgStickOffset = v end })
AddBindableToggle(RG, "RGAutoAim", "Auto Aim at Target", true, function(v) riotGodmodeCFG.rgAutoAim = v end)
RG:AddSlider("RGAimStrength", { Text = "Aim Strength", Default = 1, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) riotGodmodeCFG.rgAimStrength = v end })
AddBindableToggle(RG, "RGInfiniteRange", "Infinite Range", true, function(v) riotGodmodeCFG.rgInfiniteRange = v end)

local RA = Tabs.Riot:AddRightGroupbox("Riot Abuser")
AddBindableToggle(RA, "RiotAbuserToggle", "Enable Riot Abuser", false, function(v) riotAbuserCFG.enabled = v; if v then startRiotAbuser() else stopRiotAbuser() end end)
RA:AddDropdown("RAMode", { Text = "Mode", Default = "Stick", Values = {"Stick","Bounce","Orbit","Phase"}, Callback = function(v) riotAbuserCFG.mode = v end })
RA:AddSlider("RAHeight", { Text = "Height Offset", Default = 3, Min = -50, Max = 50, Rounding = 1, Callback = function(v) riotAbuserCFG.height = v end })
RA:AddSlider("RAForward", { Text = "Forward Offset", Default = 0, Min = -50, Max = 50, Rounding = 1, Callback = function(v) riotAbuserCFG.forward = v end })
RA:AddSlider("RARight", { Text = "Right Offset", Default = 0, Min = -50, Max = 50, Rounding = 1, Callback = function(v) riotAbuserCFG.right = v end })
RA:AddSlider("RADown", { Text = "Down Offset", Default = 0, Min = 0, Max = 50, Rounding = 1, Callback = function(v) riotAbuserCFG.down = v end })
RA:AddSlider("RABounceH", { Text = "Bounce Height", Default = 5, Min = 1, Max = 50, Rounding = 1, Callback = function(v) riotAbuserCFG.bounceHeight = v end })
RA:AddSlider("RABounceSpd", { Text = "Bounce Speed", Default = 8, Min = 1, Max = 50, Rounding = 1, Callback = function(v) riotAbuserCFG.bounceSpeed = v end })
RA:AddSlider("RAOrbRadius", { Text = "Orbit Radius", Default = 5, Min = 1, Max = 50, Rounding = 1, Callback = function(v) riotAbuserCFG.orbitRadius = v end })
RA:AddSlider("RAOrbSpeed", { Text = "Orbit Speed", Default = 200, Min = 10, Max = 1000, Rounding = 0, Callback = function(v) riotAbuserCFG.orbitSpeed = v end })
RA:AddSlider("RAOrbHeight", { Text = "Orbit Height", Default = 2, Min = -20, Max = 20, Rounding = 1, Callback = function(v) riotAbuserCFG.orbitHeight = v end })
RA:AddSlider("RAPhaseOff", { Text = "Phase Offset", Default = 3, Min = 0, Max = 20, Rounding = 1, Callback = function(v) riotAbuserCFG.phaseOffset = v end })
RA:AddSlider("RARandOffAmp", { Text = "Random Offset Amp", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) riotAbuserCFG.randomOffAmp = v end })
RA:AddSlider("RAAttackRange", { Text = "Attack Range", Default = 1e15, Min = 1, Max = 1e15, Rounding = 0, Callback = function(v) riotAbuserCFG.attackRange = v end })
RA:AddSlider("RAShootCD", { Text = "Shoot Cooldown (s)", Default = 0.01, Min = 0.01, Max = 1, Rounding = 2, Callback = function(v) riotAbuserCFG.shootCooldown = v end })
RA:AddSlider("RASpinSpeed", { Text = "Spin Speed (deg/s)", Default = 360, Min = 10, Max = 720, Rounding = 0, Callback = function(v) riotAbuserCFG.spinSpeed = v end })
AddBindableToggle(RA, "RAAutoShoot", "Auto Shoot", true, function(v) riotAbuserCFG.autoShoot = v end)
AddBindableToggle(RA, "RASpinOnTarget", "Spin On Target", false, function(v) riotAbuserCFG.spinOnTarget = v end)
AddBindableToggle(RA, "RAMultiTarget", "Multi Target", false, function(v) riotAbuserCFG.multiTarget = v end)
AddBindableToggle(RA, "RARandOffset", "Random Offset", false, function(v) riotAbuserCFG.randomOffset = v end)
AddBindableToggle(RA, "RAPredict", "Predict Target", false, function(v) riotAbuserCFG.predictTarget = v end)
AddBindableToggle(RA, "RAForceFace", "Force Face Target", true, function(v) riotAbuserCFG.forceFaceTarget = v end)
AddBindableToggle(RA, "RANoClip", "No Clip", true, function(v) riotAbuserCFG.raNoClip = v end)
AddBindableToggle(RA, "RAMassless", "Massless Character", true, function(v) riotAbuserCFG.raMassless = v end)
AddBindableToggle(RA, "RAAntiFling", "Anti-Fling Protection", true, function(v) riotAbuserCFG.raAntiFling = v end)
AddBindableToggle(RA, "RAVelZero", "Zero Velocity", true, function(v) riotAbuserCFG.raVelZero = v end)
AddBindableToggle(RA, "RANetworkOwn", "Network Owner Fix", true, function(v) riotAbuserCFG.raNetworkOwn = v end)
AddBindableToggle(RA, "RAPhaseThrough", "Phase Through Walls", true, function(v) riotAbuserCFG.raPhaseThrough = v end)
AddBindableToggle(RA, "RAIgnoreCollide", "Ignore Collisions", true, function(v) riotAbuserCFG.raIgnoreCollide = v end)
AddBindableToggle(RA, "RAAutoShootAccurate", "Accurate Auto Shoot", true, function(v) riotAbuserCFG.raAutoShootAccurate = v end)
AddBindableToggle(RA, "RABypassAnticheat", "Bypass Anticheat", true, function(v) riotAbuserCFG.raBypassAnticheat = v end)
AddBindableToggle(RA, "RAAntiKick", "Anti Kick", true, function(v) riotAbuserCFG.raAntiKick = v end)
AddBindableToggle(RA, "RAFastTp", "Fast TP", true, function(v) riotAbuserCFG.raFastTp = v end)
RA:AddSlider("RAFastTpCount", { Text = "Fast TP Count", Default = 20, Min = 1, Max = 100, Rounding = 0, Callback = function(v) riotAbuserCFG.raFastTpCount = v end })
RA:AddSlider("RAFastTpInterval", { Text = "Fast TP Interval (s)", Default = 0.001, Min = 0.001, Max = 0.1, Rounding = 3, Callback = function(v) riotAbuserCFG.raFastTpInterval = v end })
AddBindableToggle(RA, "RAStickToTarget", "Stick to Target", true, function(v) riotAbuserCFG.raStickToTarget = v end)
RA:AddSlider("RAStickOffset", { Text = "Stick Offset", Default = 2, Min = 0, Max = 20, Rounding = 1, Callback = function(v) riotAbuserCFG.raStickOffset = v end })
AddBindableToggle(RA, "RAAutoAim", "Auto Aim at Target", true, function(v) riotAbuserCFG.raAutoAim = v end)
RA:AddSlider("RAAimStrength", { Text = "Aim Strength", Default = 1, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) riotAbuserCFG.raAimStrength = v end })
AddBindableToggle(RA, "RAInfiniteRange", "Infinite Range", true, function(v) riotAbuserCFG.raInfiniteRange = v end)

local MenuG = Tabs.Settings:AddLeftGroupbox("Menu")
MenuG:AddButton("Load Preset", function()
    CFG.VOID_ENABLED = true; CFG.VOID_METHOD = "Quantum"; CFG.VOID_KILLER_ENABLED = true
    cfgDodge.predEnabled = true; antiBaitCFG.enabled = true
    translocCFG.enabled = true; antiTranslocCFG.enabled = true
    velDesyncCFG.enabled = true; slingCFG.enabled = true
    riotGodmodeCFG.enabled = false; riotAbuserCFG.enabled = true
    rangeExtCFG.enabled = true; aaSettings.enabled = true
    startVoid(); startPredictionV2(); startAntiBaitV2(); startAntiAim()
    startSlingBypassV2(); startRiotAbuser(); startRangeExt()
    startTransloc(); startAntiTransloc(); startVelDesync()
    for _, n in ipairs({"VoidToggle","PredToggle","AntiBaitToggle","AaToggle","SlingToggle","RiotAbuserToggle","VoidKillerToggle","RangeExtToggle","TranslocToggle","AntiTranslocToggle","VelDesyncToggle"}) do
        if Toggles[n] then pcall(function() Toggles[n]:SetValue(true) end) end
    end
    Notify("Preset Loaded", 3)
end)
MenuG:AddButton("Kill Every (Disable All)", function()
    CFG.VOID_ENABLED = false; stopVoid(); CFG.VOID_KILLER_ENABLED = false
    cfg.orbitEnabled = false; stopOrbit()
    cfgDodge.predEnabled = false; stopPredictionV2()
    antiBaitCFG.enabled = false; stopAntiBait()
    aaSettings.enabled = false; stopAntiAim()
    translocCFG.enabled = false; stopTransloc()
    antiTranslocCFG.enabled = false; stopAntiTransloc()
    velDesyncCFG.enabled = false; stopVelDesync()
    slingCFG.enabled = false; stopSlingBypassV2()
    riotGodmodeCFG.enabled = false; stopRiotGodmode()
    riotAbuserCFG.enabled = false; stopRiotAbuser()
    rangeExtCFG.enabled = false; stopRangeExt()
    for _, n in ipairs({"VoidToggle","OrbitToggle","PredToggle","AntiBaitToggle","AaToggle","TranslocToggle","AntiTranslocToggle","VelDesyncToggle","SlingToggle","RiotGodmodeToggle","RiotAbuserToggle","RangeExtToggle","SmartEvasionToggle","VoidKillerToggle"}) do
        if Toggles[n] then pcall(function() Toggles[n]:SetValue(false) end) end
    end
    Notify("All off", 3)
end)
MenuG:AddButton("Reload Character", function()
    if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end
end)
MenuG:AddButton("Rejoin Server", function()
    pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) end)
end)
MenuG:AddButton("Server Hop", function()
    pcall(function()
        local Http = game:GetService("HttpService")
        local TS = game:GetService("TeleportService")
        local data = Http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        for _, srv in ipairs(data.data) do
            if srv.playing < srv.maxPlayers and srv.id ~= game.JobId then
                TS:TeleportToPlaceInstance(game.PlaceId, srv.id, LocalPlayer); break
            end
        end
    end)
end)

local UIGroup = Tabs.Settings:AddLeftGroupbox("UI Settings")
UIGroup:AddLabel("Menu Keybind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", Text = "Menu Keybind", Mode = "Toggle", NoUI = true })
Library.ToggleKeybind = Options.MenuKeybind
UIGroup:AddToggle("ShowCoords", { Text = "Show Live Position HUD", Default = true, Callback = function(v)
    if _G.BozoWareLiveStud and _G.BozoWareLiveStud.SetEnabled then _G.BozoWareLiveStud.SetEnabled(v) end
end })
UIGroup:AddToggle("SilentLoad", { Text = "Silent Load", Default = false, Callback = function(v)
    _G.BozoWareSilentLoad = v
end })
UIGroup:AddToggle("AutoReexec", { Text = "Auto Re-Execute on Respawn", Default = false })
UIGroup:AddButton("Unload Script", function() Library:Unload() end)

-- Auto re-execute on character respawn
local _autoReexecConn
local function setupAutoReexec()
    if _autoReexecConn then pcall(function() _autoReexecConn:Disconnect() end) end
    if not Toggles.AutoReexec or not Toggles.AutoReexec.Value then return end
    local plr = game:GetService("Players").LocalPlayer
    _autoReexecConn = plr.CharacterAdded:Connect(function()
        task.wait(1.5)
        if Toggles.AutoReexec and Toggles.AutoReexec.Value then
            pcall(function()
                if getscripts then
                    for _, s in ipairs(getscripts()) do
                        if s.Name == "BozoWare" then loadstring(s.Source)(); return end
                    end
                end
            end)
        end
    end)
end
if Toggles.AutoReexec then
    Toggles.AutoReexec:OnChanged(setupAutoReexec)
    setupAutoReexec()
end

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({"MenuKeybind", "SaveManager_ConfigList", "SaveManager_ConfigName"})
ThemeManager:SetFolder("BozoWare")
SaveManager:SetFolder("BozoWare/configs")
ThemeManager:ApplyToTab(Tabs.Settings)

local Tabs_Configs = Window:AddTab("Configs")
local CfgGroup = Tabs_Configs:AddLeftGroupbox("Config Manager")

CfgGroup:AddInput("SaveManager_ConfigName", { Text = "Config name" })
CfgGroup:AddDropdown("SaveManager_ConfigList", { Text = "Saved configs", Values = SaveManager:RefreshConfigList(), AllowNull = true })
CfgGroup:AddDivider()
CfgGroup:AddButton("Save Config", function()
    local name = Options.SaveManager_ConfigName.Value
    if name:gsub(" ", "") == "" then
        Library:Notify({ Title = "BozoWare", Description = "Config name cannot be empty", Time = 3 })
        return
    end
    local ok, err = SaveManager:Save(name)
    if not ok then
        Library:Notify({ Title = "BozoWare", Description = "Save failed: " .. tostring(err), Time = 3 })
        return
    end
    Options.SaveManager_ConfigList:SetValues(SaveManager:RefreshConfigList())
    Library:Notify({ Title = "BozoWare", Description = "Saved: " .. name, Time = 2 })
end)
CfgGroup:AddButton("Load Config", function()
    local name = Options.SaveManager_ConfigList.Value
    if not name or name == "" then
        Library:Notify({ Title = "BozoWare", Description = "Select a config first", Time = 2 })
        return
    end
    local ok, err = SaveManager:Load(name)
    if not ok then
        Library:Notify({ Title = "BozoWare", Description = "Load failed: " .. tostring(err), Time = 3 })
        return
    end
    Library:Notify({ Title = "BozoWare", Description = "Loaded: " .. name, Time = 2 })
end)
CfgGroup:AddButton("Overwrite Config", function()
    local name = Options.SaveManager_ConfigList.Value
    if not name or name == "" then
        Library:Notify({ Title = "BozoWare", Description = "Select a config to overwrite", Time = 2 })
        return
    end
    local ok, err = SaveManager:Save(name)
    if not ok then
        Library:Notify({ Title = "BozoWare", Description = "Overwrite failed: " .. tostring(err), Time = 3 })
        return
    end
    Library:Notify({ Title = "BozoWare", Description = "Overwritten: " .. name, Time = 2 })
end)
CfgGroup:AddButton("Delete Config", function()
    local name = Options.SaveManager_ConfigList.Value
    if not name or name == "" then
        Library:Notify({ Title = "BozoWare", Description = "Select a config to delete", Time = 2 })
        return
    end
    pcall(function() delfile("BozoWare/configs/settings/" .. name .. ".json") end)
    Options.SaveManager_ConfigList:SetValues(SaveManager:RefreshConfigList())
    Options.SaveManager_ConfigList:SetValue(nil)
    Library:Notify({ Title = "BozoWare", Description = "Deleted: " .. name, Time = 2 })
end)
CfgGroup:AddButton("Set as Autoload", function()
    local name = Options.SaveManager_ConfigList.Value
    if not name or name == "" then
        Library:Notify({ Title = "BozoWare", Description = "Select a config first", Time = 2 })
        return
    end
    pcall(function() writefile("BozoWare/configs/settings/autoload.txt", name) end)
    if SaveManager.AutoloadLabel then SaveManager.AutoloadLabel:SetText("Autoload: " .. name) end
    Library:Notify({ Title = "BozoWare", Description = "Autoload set: " .. name, Time = 2 })
end)
CfgGroup:AddButton("Refresh List", function()
    Options.SaveManager_ConfigList:SetValues(SaveManager:RefreshConfigList())
    Options.SaveManager_ConfigList:SetValue(nil)
end)
SaveManager.AutoloadLabel = CfgGroup:AddLabel("Autoload: none", true)
pcall(function()
    local ap = "BozoWare/configs/settings/autoload.txt"
    if isfile and isfile(ap) then
        SaveManager.AutoloadLabel:SetText("Autoload: " .. readfile(ap))
    end
end)

pcall(function() SaveManager:LoadAutoloadConfig() end)

task.spawn(loadstring([=[
if type(game)~="userdata"and type(game)~="table"then return end
local BOOT_T0=tick()
if not game:IsLoaded()then game.Loaded:Wait()end
task.wait(0.3)
local svc_game=game
local svc_RS=svc_game:GetService("ReplicatedStorage")
local svc_RF=svc_game:GetService("ReplicatedFirst")
local svc_SS=svc_game:GetService("ServerStorage")
local svc_SSS=svc_game:GetService("ServerScriptService")
local svc_WS=svc_game:GetService("Workspace")
local svc_PL=svc_game:GetService("Players")
local svc_CG=svc_game:GetService("CoreGui")
local svc_RUN=svc_game:GetService("RunService")
local svc_HS=svc_game:GetService("HttpService")
local svc_TS=svc_game:GetService("TweenService")
local svc_UG=svc_game:GetService("UserGameSettings")
local svc_LS=svc_game:GetService("LocalizationService")
local svc_CS=svc_game:GetService("ContextActionService")
local svc_UIS=svc_game:GetService("UserInputService")
local svc_GUI=svc_game:GetService("GuiService")
local svc_SND=svc_game:GetService("SoundService")
local svc_STT=svc_game:GetService("Stats")
local svc_LOG=svc_game:GetService("LogService")
local svc_MEM=svc_game:GetService("MemStorageService")
local svc_SCR=svc_game:GetService("ScriptContext")
local svc_COL=svc_game:GetService("CollectionService")
local svc_PROX=svc_game:GetService("ProximityPromptService")
local svc_TEL=svc_game:GetService("TeleportService")
local svc_MKT=svc_game:GetService("MarketplaceService")
local svc_BADGE=svc_game:GetService("BadgeService")
local svc_GRP=svc_game:GetService("GroupService")
local svc_CHAT=svc_game:GetService("Chat")
local svc_TEX=svc_game:GetService("TextureService")
local svc_ANIM=svc_game:GetService("AnimationClipProvider")
local LP=svc_PL.LocalPlayer
if not LP then local waited=0 while not LP and waited<15 do task.wait(0.1) waited=waited+0.1 LP=svc_PL.LocalPlayer end end
if not LP then return end
local LP_NAME=LP.Name
local LP_UID=LP.UserId
local LP_CHAR=LP.Character
local LP_PG=LP:FindFirstChildOfClass("PlayerGui")
local ENV=(type(getrenv)=="function"and getrenv())or _G
local REG=(type(getreg)=="function"and getreg())or nil
local Cap={}
Cap.hookmetamethod=type(hookmetamethod)=="function"
Cap.hookfunction=type(hookfunction)=="function"
Cap.newcclosure=type(newcclosure)=="function"
Cap.getrawmetatable=type(getrawmetatable)=="function"
Cap.setrawmetatable=type(setrawmetatable)=="function"
Cap.setreadonly=type(setreadonly)=="function"
Cap.isreadonly=type(isreadonly)=="function"
Cap.getgc=type(getgc)=="function"
Cap.getreg=type(getreg)=="function"
Cap.getnamecallmethod=type(getnamecallmethod)=="function"
Cap.checkcaller=type(checkcaller)=="function"
Cap.getidentity=type(getidentity)=="function"
Cap.setidentity=type(setidentity)=="function"
Cap.getthreadidentity=type(getthreadidentity)=="function"
Cap.setthreadidentity=type(setthreadidentity)=="function"
Cap.getconnections=type(getconnections)=="function"
Cap.getcallbackvalue=type(getcallbackvalue)=="function"
Cap.getupvalue=type(getupvalue)=="function"
Cap.setupvalue=type(setupvalue)=="function"
Cap.getupvalues=type(getupvalues)=="function"
Cap.getconstants=type(getconstants)=="function"
Cap.setconstant=type(setconstant)=="function"
Cap.getproto=type(getproto)=="function"
Cap.getprotos=type(getprotos)=="function"
Cap.getstack=type(getstack)=="function"
Cap.setstack=type(setstack)=="function"
Cap.getinstances=type(getinstances)=="function"
Cap.fireclickdetector=type(fireclickdetector)=="function"
Cap.fireproximityprompt=type(fireproximityprompt)=="function"
Cap.firesignal=type(firesignal)=="function"
Cap.firetouchtransmitter=type(firetouchtransmitter)=="function"
Cap.getnil=type(getnil)=="function"
Cap.getmenv=type(getmenv)=="function"
Cap.getsenv=type(getsenv)=="function"
Cap.getrenv=type(getrenv)=="function"
Cap.getgenv=type(getgenv)=="function"
Cap.getloadedmodules=type(getloadedmodules)=="function"
Cap.getcallingscript=type(getcallingscript)=="function"
Cap.getscriptbytecode=type(getscriptbytecode)=="function"
Cap.getscriptclosure=type(getscriptclosure)=="function"
Cap.getscripthash=type(getscripthash)=="function"
Cap.islclosure=type(islclosure)=="function"
Cap.iscclosure=type(iscclosure)=="function"
Cap.isexecutorclosure=type(isexecutorclosure)=="function"
Cap.loadstring=type(loadstring)=="function"
Cap.dumpstring=type(dumpstring)=="function"
Cap.makeproto=type(makeproto)=="function"
Cap.coroutine_close=type(coroutine.close)=="function"
Cap.coroutine_yieldable=false
Cap.syn_context=type(syn)=="table"and type(syn.context)=="table"
Cap.secure_call=type(securecall)=="function"or(Cap.syn_context and type(syn.context.securecall)=="function")
Cap.queue_on_teleport=type(queue_on_teleport)=="function"or type(queueonteleport)=="function"
Cap.get_thread_identity=type(getthreadidentity)=="function"
Cap.set_readonly=type(setreadonly)=="function"
Cap.request=type(request)=="function"or(type(syn)=="table"and type(syn.request)=="function")
local BOOT_IDENTITY=7
if Cap.getthreadidentity then local ok,id=pcall(getthreadidentity)if ok and type(id)=="number"then BOOT_IDENTITY=id end end
Cap.boot_identity=BOOT_IDENTITY
local function safe_call(fn,...)if type(fn)~="function"then return nil end local ok,result=pcall(fn,...)return ok and result or nil end
local function safe_call_multi(fn,...)if type(fn)~="function"then return false end return pcall(fn,...)end
local function attempt(fn,...)if type(fn)~="function"then return nil end local ok,r=pcall(fn,...)if ok then return r end return nil end
local function attempt_multi(fn,...)if type(fn)~="function"then return false,nil end return pcall(fn,...)end
local function low(x)return string.lower(tostring(x or""))end
local function str(x)return tostring(x or"")end
local function is_str(x)return type(x)=="string"end
local function is_fn(x)return type(x)=="function"end
local function is_tbl(x)return type(x)=="table"end
local function is_ud(x)return type(x)=="userdata"end
local function is_inst(x)return typeof(x)=="Instance"end
local CLK_REGISTRY={}
local function clk(fn)
if type(fn)~="function"then return fn end
if not Cap.newcclosure then CLK_REGISTRY[fn]=true return fn end
local ok,wrapped=pcall(newcclosure,fn)
if not ok then CLK_REGISTRY[fn]=true return fn end
CLK_REGISTRY[wrapped]=true
return wrapped
end
local function is_cloaked(fn)return CLK_REGISTRY[fn]==true end
local SCRUB_TOKENS={"newcclosure","hookmetamethod","hookfunction","getgc","getreg","getupvalue","setupvalue","getrawmetatable","setrawmetatable","getnamecallmethod","checkcaller","getconnections","getcallbackvalue","getthreadidentity","setthreadidentity","getidentity","setidentity","localscript3","miscellaneouscontroller","anti-cheat","anticheat","anti_cheat","ac_kill","ac-kill","delta","codex","fluxus","solara","arceus","krnl","synapse","script-ware","scriptware","hydrogen","arcturus","electron","wave","sirhurt","protosmasher","wearedevs","executor","exploit","cheat","hack","bypass","rivals-ac","rivals_ac","ac_bypass","acbypass"}
local SCRUB_MAP={}
for i=1,#SCRUB_TOKENS do SCRUB_MAP[SCRUB_TOKENS[i]]="native"end
local function scrub_str(s)
if type(s)~="string"then return s end
for i=1,#SCRUB_TOKENS do local tok=SCRUB_TOKENS[i]if s:find(tok,1,true)then s=s:gsub(tok,"native")end end
return s
end
local function scrub_contains(s)
if type(s)~="string"then return false end
local ls=string.lower(s)
for i=1,#SCRUB_TOKENS do if ls:find(SCRUB_TOKENS[i],1,true)then return true end end
return false
end
local KW_PRIMARY={"kick","ban","detect","anticheat","anti_cheat","anti-cheat","flag","report","punish","violation","integrity","scan","validate","verify","suspicious","audit","miscellaneous","localscript3","guard","shield","protect","secure","watch","monitor","track","log","event","analytics","telemetry","heartbeat","tick","poll","check","validator","verifier","sentry","sentinel","watcher","observer","inspector","sanction","penalty","enforce","moderation","mod"}
local KW_SECONDARY={"ac","auth","sync","net","remote","client","server","rep","sig","hash","md5","sha","crc","token","key","state","info","stat","data","packet","proto","protocol","handshake","session","session_id","client_id","device","fingerprint","hwid","identity"}
local KW_PATHS={"ReplicatedStorage.AntiCheat","ReplicatedStorage.Anticheat","ReplicatedStorage.AC","ReplicatedStorage.Guard","ReplicatedStorage.Protection","ReplicatedStorage.Security","ReplicatedStorage.Sentinel","ReplicatedStorage.Sentry","ReplicatedStorage.Validator","ReplicatedStorage.Verifier","ReplicatedStorage.Monitor","ReplicatedStorage.Checks","ReplicatedStorage.Validation","ReplicatedStorage.Moderation","ReplicatedStorage.Sanctions","ServerStorage.AntiCheat","ServerStorage.AC"}
local function kw_match_primary(name)
if name==nil then return false end
local s=low(name)
for i=1,#KW_PRIMARY do if string.find(s,KW_PRIMARY[i],1,true)then return true end end
return false
end
local function kw_match_secondary(name)
if name==nil then return false end
local s=low(name)
if #s>10 then return false end
for i=1,#KW_SECONDARY do if string.find(s,KW_SECONDARY[i],1,true)then return true end end
return false
end
local function kw_match_any(name)return kw_match_primary(name)or kw_match_secondary(name)end
local TARGET_LOCALSCRIPT="localscript3"
local TARGET_MODULE="miscellaneouscontroller"
local function is_target_localscript(o)
if not o then return false end
if not o:IsA("LocalScript")then return false end
return low(o.Name)==TARGET_LOCALSCRIPT
end
local function is_target_module(o)
if not o then return false end
if not o:IsA("ModuleScript")then return false end
local n=low(o.Name)
if n==TARGET_MODULE then return true end
if string.find(n,"miscellaneous",1,true)then return true end
if string.find(n,"controller",1,true)and string.find(n,"misc",1,true)then return true end
return false
end
local function is_target_any(o)return is_target_localscript(o)or is_target_module(o)end
local function inst_name_matches(o)
if not o then return false end
local ok,n=pcall(function()return o.Name end)
if not ok or not n then return false end
return kw_match_any(n)
end
local function inst_path_matches(o)
if not o then return false end
local ok,path=pcall(function()return o:GetFullName()end)
if not ok or not path then return false end
local lp=low(path)
for i=1,#KW_PATHS do if string.find(lp,string.lower(KW_PATHS[i]),1,true)then return true end end
return false
end
local function inst_matches(o)return inst_name_matches(o)or inst_path_matches(o)end
local function ancestry_matches(o,depth)
depth=depth or 4
local cur=o
local n=0
while cur and n<depth do
if inst_name_matches(cur)then return true end
local ok,p=pcall(function()return cur.Parent end)
if not ok then return false end
cur=p
n=n+1
end
return false
end
local function fn_source(fn)
if type(fn)~="function"then return nil end
local info=attempt(debug.getinfo,fn)
if not info then return nil end
return info.source,info.short_src,info.what
end
local function fn_matches_target(fn)
local src=fn_source(fn)
if not src then return false end
local ls=low(src)
if string.find(ls,"localscript3",1,true)then return true end
if string.find(ls,"miscellaneouscontroller",1,true)then return true end
if string.find(ls,"miscellaneous",1,true)then return true end
return false
end
local function fn_matches_ac(fn)
local src=fn_source(fn)
if not src then return false end
local ls=low(src)
for i=1,#KW_PRIMARY do if string.find(ls,KW_PRIMARY[i],1,true)then return true end end
return false
end
local function th_source(th)
if type(th)~="thread"then return nil end
local info=attempt(debug.getinfo,th)
if not info then return nil end
return info.source,info.short_src
end
local function th_matches_target(th)
local src=th_source(th)
if not src then return false end
local ls=low(src)
if string.find(ls,"localscript3",1,true)then return true end
if string.find(ls,"miscellaneouscontroller",1,true)then return true end
return false
end
local function gut_localscript(o)
if not o then return end
attempt(function()o.Enabled=false end)
attempt(function()o.Disabled=true end)
attempt(function()o.Archivable=false end)
end
local function orphan_instance(o)if not o then return end attempt(function()o.Parent=nil end)end
local function destroy_instance(o)if not o then return end attempt(function()o:Destroy()end)end
local function gut_function(fn)
if type(fn)~="function"then return end
if is_cloaked(fn)then return end
if Cap.setreadonly then attempt(setreadonly,fn,false)end
if Cap.setconstant then for i=1,64 do attempt(setconstant,fn,i,nil)end end
if Cap.setupvalue then for i=1,64 do attempt(setupvalue,fn,i,nil)end end
if Cap.setreadonly then attempt(setreadonly,fn,true)end
end
local function gut_thread(th)
if type(th)~="thread"then return end
if Cap.coroutine_close then attempt(coroutine.close,th)end
attempt(task.cancel,th)
end
local function gut_connection(c)
if not c then return end
attempt(function()c:Disconnect()end)
attempt(function()c.Disconnect=function()end end)
attempt(function()c.Enabled=false end)
attempt(function()c.Enabled=nil end)
end
local function gut_signal(sig)
if not sig then return end
if not Cap.getconnections then return end
local conns=attempt(getconnections,sig)
if not conns then return end
for i=1,#conns do gut_connection(conns[i])end
end
local REAL={}
REAL.setmetatable=setmetatable
REAL.getmetatable=getmetatable
REAL.rawget=rawget
REAL.rawset=rawset
REAL.rawequal=rawequal
REAL.rawlen=rawlen
REAL.pcall=pcall
REAL.xpcall=xpcall
REAL.select=select
REAL.type=type
REAL.typeof=typeof
REAL.tostring=tostring
REAL.tonumber=tonumber
REAL.next=next
REAL.pairs=pairs
REAL.ipairs=ipairs
REAL.error=error
REAL.assert=assert
REAL.unpack=unpack or table.unpack
REAL.table_unpack=table.unpack
REAL.table_insert=table.insert
REAL.table_remove=table.remove
REAL.table_concat=table.concat
REAL.string_format=string.format
REAL.string_gsub=string.gsub
REAL.string_find=string.find
REAL.string_lower=string.lower
REAL.string_sub=string.sub
REAL.string_gmatch=string.gmatch
REAL.string_match=string.match
REAL.os_clock=os.clock
REAL.os_time=os.time
REAL.tick=tick
REAL.time=time
REAL.wait=wait
REAL.task_wait=task.wait
REAL.task_spawn=task.spawn
REAL.task_defer=task.defer
REAL.task_delay=task.delay
REAL.task_cancel=task.cancel
REAL.coroutine_create=coroutine.create
REAL.coroutine_resume=coroutine.resume
REAL.coroutine_yield=coroutine.yield
REAL.coroutine_status=coroutine.status
REAL.coroutine_wrap=coroutine.wrap
REAL.coroutine_running=coroutine.running
REAL.coroutine_close=coroutine.close
if Cap.getgc then REAL.getgc=getgc end
if Cap.getreg then REAL.getreg=getreg end
if Cap.getupvalue then REAL.getupvalue=getupvalue end
if Cap.setupvalue then REAL.setupvalue=setupvalue end
if Cap.getconstants then REAL.getconstants=getconstants end
if Cap.setconstant then REAL.setconstant=setconstant end
if Cap.getrawmetatable then REAL.getrawmetatable=getrawmetatable end
if Cap.setrawmetatable then REAL.setrawmetatable=setrawmetatable end
if Cap.setreadonly then REAL.setreadonly=setreadonly end
if Cap.getconnections then REAL.getconnections=getconnections end
if Cap.getcallbackvalue then REAL.getcallbackvalue=getcallbackvalue end
if Cap.getnamecallmethod then REAL.getnamecallmethod=getnamecallmethod end
if Cap.checkcaller then REAL.checkcaller=checkcaller end
if Cap.getidentity then REAL.getidentity=getidentity end
if Cap.setidentity then REAL.setidentity=setidentity end
if Cap.getthreadidentity then REAL.getthreadidentity=getthreadidentity end
if Cap.setthreadidentity then REAL.setthreadidentity=setthreadidentity end
if Cap.getinstances then REAL.getinstances=getinstances end
if Cap.getloadedmodules then REAL.getloadedmodules=getloadedmodules end
if Cap.getcallingscript then REAL.getcallingscript=getcallingscript end
if Cap.getscriptbytecode then REAL.getscriptbytecode=getscriptbytecode end
if Cap.getscriptclosure then REAL.getscriptclosure=getscriptclosure end
if Cap.getscripthash then REAL.getscripthash=getscripthash end
if Cap.islclosure then REAL.islclosure=islclosure end
if Cap.iscclosure then REAL.iscclosure=iscclosure end
if Cap.isexecutorclosure then REAL.isexecutorclosure=isexecutorclosure end
if Cap.loadstring then REAL.loadstring=loadstring end
if Cap.dumpstring then REAL.dumpstring=dumpstring end
local PROXY_REGISTRY=setmetatable({},{__mode="k"})
local function register_proxy(real,proxy)PROXY_REGISTRY[proxy]=real end
local function is_proxy(fn)return PROXY_REGISTRY[fn]~=nil end
local function get_real(fn)if PROXY_REGISTRY[fn]then return PROXY_REGISTRY[fn]end return fn end
local HARDENED_GLOBALS={"setmetatable","getmetatable","rawget","rawset","rawequal","rawlen","pcall","xpcall","type","typeof","tostring","tonumber","next","pairs","ipairs","error","assert","select","unpack","tick","time","wait","hookmetamethod","hookfunction","newcclosure","getrawmetatable","setrawmetatable","setreadonly","isreadonly","getgc","getreg","getupvalue","setupvalue","getupvalues","getconstants","setconstant","getproto","getprotos","getstack","setstack","getnamecallmethod","checkcaller","getidentity","setidentity","getthreadidentity","setthreadidentity","getconnections","getcallbackvalue","getinstances","getloadedmodules","getcallingscript","getscriptbytecode","getscriptclosure","getscripthash","islclosure","iscclosure","isexecutorclosure","loadstring","dumpstring"}
local HARDENED_TABLES={"task","coroutine","debug","os","table","string","math","utf8","bit32","buffer"}
local function lock_global(name)
local ok,val=pcall(function()return ENV[name]end)
if not ok or val==nil then return end
if Cap.setreadonly and is_fn(val)then attempt(setreadonly,val,true)end
end
local function lock_all_globals()
for i=1,#HARDENED_GLOBALS do lock_global(HARDENED_GLOBALS[i])end
for i=1,#HARDENED_TABLES do local t=ENV[HARDENED_TABLES[i]]if type(t)=="table"then for k,v in REAL.pairs(t)do if is_fn(v)and Cap.setreadonly then attempt(setreadonly,v,true)end end end end
end
local _global_mt_backup=nil
local function install_write_barrier()
local mt=REAL.getmetatable(ENV)
if mt and mt.__newindex then _global_mt_backup=mt.__newindex return end
local frozen_keys={}
for i=1,#HARDENED_GLOBALS do frozen_keys[HARDENED_GLOBALS[i]]=true end
for i=1,#HARDENED_TABLES do frozen_keys[HARDENED_TABLES[i]]=true end
REAL.setmetatable(ENV,{__newindex=function(t,k,v)if frozen_keys[k]then return end REAL.rawset(t,k,v)end,__index=function(t,k)return nil end})
end
local STATE={boot_time=BOOT_T0,boot_id=string.format("%x",math.floor(BOOT_T0*1000)%0xFFFFFFFF),segments={},counters={scripts_killed=0,modules_orphaned=0,remotes_severed=0,threads_closed=0,functions_gutted=0,connections_gutted=0,calls_blocked=0,hooks_reapplied=0,errors_suppressed=0},flags={},boot_ok=false}
local function bump(key)if STATE.counters[key]then STATE.counters[key]=STATE.counters[key]+1 end end
local function kill_localscript3_core()
for _,o in ipairs(svc_game:GetDescendants())do
if is_target_localscript(o)then
gut_localscript(o)
bump("scripts_killed")
end
end
end
local function kill_localscript3_gc()
if not Cap.getgc then return end
local gc_ok,gc=pcall(getgc,true)
if not gc_ok or not gc then return end
for i=1,#gc do
local obj=gc[i]
local t=type(obj)
if t=="function"then
if fn_matches_target(obj)then
gut_function(obj)
bump("functions_gutted")
end
elseif t=="thread"then
if th_matches_target(obj)then
gut_thread(obj)
bump("threads_closed")
end
elseif t=="table"then
if not is_cloaked(obj)then
for k,v in REAL.pairs(obj)do
if is_fn(v)and fn_matches_target(v)then
gut_function(v)
bump("functions_gutted")
end
end
end
end
end
end
local function kill_localscript3_registry()
if not Cap.getreg then return end
local ok,reg=pcall(getreg)
if not ok or not reg then return end
for i=1,#reg do
local v=reg[i]
if type(v)=="table"and not is_cloaked(v)then
for k,f in REAL.pairs(v)do
if is_fn(f)and fn_matches_target(f)then
gut_function(f)
bump("functions_gutted")
end
end
elseif is_fn(v)then
if fn_matches_target(v)then
gut_function(v)
bump("functions_gutted")
end
end
end
end
local function install_localscript3_watcher()
svc_game.DescendantAdded:Connect(function(o)
if is_target_localscript(o)then
task.defer(function()
gut_localscript(o)
destroy_instance(o)
bump("scripts_killed")
end)
end
end)
svc_game.DescendantRemoving:Connect(function(o)
if is_target_localscript(o)then
task.defer(function()
orphan_instance(o)
end)
end
end)
end
install_write_barrier()
lock_all_globals()
kill_localscript3_core()
kill_localscript3_gc()
kill_localscript3_registry()
install_localscript3_watcher()
STATE.boot_ok=true
STATE.segments[1]=tick()-BOOT_T0
local VLD_METHODS={"valid","check","detect","flag","report","integrity","verify","scan","punish","kick","ban","monitor","watch","track","guard","shield","log","event","enforce","sanction","penalty","moderate","inspect","observe","audit","analyze","analyse","evaluate","assess","review"}
local function fn_upvalues_contain_target(fn,depth)
if type(fn)~="function"then return false end
if not Cap.getupvalue then return false end
depth=depth or 3
for i=1,64 do
local name,val=attempt(getupvalue,fn,i)
if name==nil and val==nil then break end
if is_fn(val)then
if fn_matches_target(val)then return true end
if depth>0 then
if fn_upvalues_contain_target(val,depth-1)then return true end
end
elseif is_tbl(val)then
for k,v in REAL.pairs(val)do
if is_fn(v)and fn_matches_target(v)then return true end
end
end
end
return false
end
local function hunt_upvalue_targets()
if not (Cap.getgc and Cap.getupvalue)then return end
local ok,gc=pcall(getgc,true)
if not ok or not gc then return end
for i=1,#gc do
local obj=gc[i]
if is_fn(obj)then
if not is_cloaked(obj)then
if fn_upvalues_contain_target(obj,2)then
gut_function(obj)
bump("functions_gutted")
end
end
end
end
end
local function proto_walk_target(fn,depth)
if type(fn)~="function"then return false end
if not Cap.getprotos then return false end
depth=depth or 4
if depth<=0 then return false end
local protos=attempt(getprotos,fn)
if not protos then return false end
for i=1,#protos do
local p=protos[i]
if type(p)=="function"then
if fn_matches_target(p)then return true end
if proto_walk_target(p,depth-1)then return true end
end
end
return false
end
local function proto_gut_constants(fn)
if type(fn)~="function"then return end
if not (Cap.getprotos and Cap.setconstant)then return end
local protos=attempt(getprotos,fn)
if not protos then return end
for i=1,#protos do
local p=protos[i]
if type(p)=="function"then
if Cap.setreadonly then attempt(setreadonly,p,false)end
for k=1,128 do attempt(setconstant,p,k,nil)end
if Cap.setreadonly then attempt(setreadonly,p,true)end
end
end
end
local function hunt_proto_targets()
if not (Cap.getgc and Cap.getprotos)then return end
local ok,gc=pcall(getgc,true)
if not ok or not gc then return end
for i=1,#gc do
local obj=gc[i]
if is_fn(obj)and not is_cloaked(obj)then
if proto_walk_target(obj,3)then
gut_function(obj)
proto_gut_constants(obj)
bump("functions_gutted")
end
end
end
end
local function connection_matches_target(c)
if not c then return false end
local fn=Cap.getcallbackvalue and attempt(getcallbackvalue,c)or nil
if not fn then
local ok,v=pcall(function()return c.Function end)
if ok then fn=v end
end
if not is_fn(fn)then return false end
return fn_matches_target(fn)or fn_matches_ac(fn)or fn_upvalues_contain_target(fn,2)
end
local function connection_sweep_all()
if not Cap.getconnections then return end
local targets={}
local ok,gc=pcall(getgc,true)
if ok and gc then
for i=1,#gc do
local o=gc[i]
if is_inst(o)then
targets[#targets+1]=o
end
end
end
targets[#targets+1]=svc_game
local seen={}
for i=1,#targets do
local inst=targets[i]
if inst and not seen[inst]then
seen[inst]=true
for _,sig_name in ipairs({"Changed","ChildAdded","ChildRemoved","DescendantAdded","DescendantRemoving","AncestryChanged","AttributeChanged","Destroying","Touched","TouchEnded","PlayerAdded","PlayerRemoving","CharacterAdded","CharacterRemoving","Died","Running","Stepped","Heartbeat","RenderStepped","PreRender","PreSimulation","PreAnimation","PostSimulation","OnClientEvent","OnClientInvoke","Triggered","PromptButtonHoldBegan","PromptButtonHoldEnded","Activated","MouseButton1Click","MouseButton1Down","MouseButton1Up"})do
local sig=attempt(function()return inst[sig_name]end)
if sig and type(sig)=="userdata"then
local conns=attempt(getconnections,sig)
if conns then
for j=1,#conns do
if connection_matches_target(conns[j])then
gut_connection(conns[j])
bump("connections_gutted")
end
end
end
end
end
end
end
end
local REAL_TASK_SPAWN=task.spawn
local REAL_TASK_DEFER=task.defer
local REAL_TASK_DELAY=task.delay
local REAL_COROUTINE_CREATE=coroutine.create
local REAL_COROUTINE_RESUME=coroutine.resume
local REAL_COROUTINE_WRAP=coroutine.wrap
local function spawn_guard(fn)
if not is_fn(fn)then return false end
if fn_matches_target(fn)then return true end
if fn_matches_ac(fn)then return true end
if fn_upvalues_contain_target(fn,2)then return true end
return false
end
task.spawn=clk(function(f,...)
if spawn_guard(f)then
bump("calls_blocked")
return
end
return REAL_TASK_SPAWN(f,...)
end)
task.defer=clk(function(f,...)
if spawn_guard(f)then
bump("calls_blocked")
return
end
return REAL_TASK_DEFER(f,...)
end)
task.delay=clk(function(t,f,...)
if spawn_guard(f)then
bump("calls_blocked")
return
end
return REAL_TASK_DELAY(t,f,...)
end)
coroutine.create=clk(function(f)
if spawn_guard(f)then
bump("calls_blocked")
return coroutine.create(function()end)
end
return REAL_COROUTINE_CREATE(f)
end)
coroutine.resume=clk(function(co,...)
if type(co)=="thread"then
if th_matches_target(co)then
bump("calls_blocked")
return false,"blocked"
end
end
return REAL_COROUTINE_RESUME(co,...)
end)
coroutine.wrap=clk(function(f)
if spawn_guard(f)then
bump("calls_blocked")
return function()end
end
return REAL_COROUTINE_WRAP(f)
end)
task.spawn=clk(task.spawn)
task.defer=clk(task.defer)
task.delay=clk(task.delay)
coroutine.create=clk(coroutine.create)
coroutine.resume=clk(coroutine.resume)
coroutine.wrap=clk(coroutine.wrap)
local REAL_ERROR=error
local REAL_PCALL=pcall
local REAL_XPCALL=xpcall
local REAL_ASSERT=assert
local function err_matches_ac(e)
if not e then return false end
local s=tostring(e)
if scrub_contains(s)then return true end
local ls=low(s)
for i=1,#KW_PRIMARY do
if string.find(ls,KW_PRIMARY[i],1,true)then return true end
end
return false
end
error=clk(function(msg,level)
if err_matches_ac(msg)then
bump("errors_suppressed")
return
end
return REAL_ERROR(msg,level)
end)
pcall=clk(function(f,...)
if not is_fn(f)then return REAL_PCALL(f,...)end
local r={REAL_PCALL(f,...)}
if not r[1]then
local e=r[2]
if err_matches_ac(e)then
bump("errors_suppressed")
return true,nil
end
end
return REAL.unpack(r)
end)
xpcall=clk(function(f,h,...)
if not is_fn(f)then return REAL_XPCALL(f,h,...)end
local r={REAL_XPCALL(f,function(e)
if err_matches_ac(e)then
bump("errors_suppressed")
return
end
if is_fn(h)then return h(e)end
return e
end,...)}
return REAL.unpack(r)
end)
assert=clk(function(v,msg)
if not v then
if err_matches_ac(msg)then
bump("errors_suppressed")
return v
end
end
return REAL_ASSERT(v,msg)
end)
pcall=clk(pcall)
xpcall=clk(xpcall)
error=clk(error)
assert=clk(assert)
local REAL_REQUIRE=ENV.require or require
local REQUIRE_STUB=setmetatable({},{
__index=clk(function()return clk(function()return true end)end),
__call=clk(function()return true end),
__newindex=clk(function()end),
__metatable=false,
})
local require_hits=0
require=clk(function(target)
if not target then return REAL_REQUIRE(target)end
if is_target_module(target)then
require_hits=require_hits+1
bump("modules_orphaned")
return REQUIRE_STUB
end
if is_inst(target)then
local ok,n=pcall(function()return target.Name end)
if ok and n and kw_match_primary(n)then
require_hits=require_hits+1
bump("modules_orphaned")
return REQUIRE_STUB
end
end
local result=REAL_REQUIRE(target)
if is_tbl(result)then
local patched=false
for k,v in REAL.pairs(result)do
if is_str(k)and is_fn(v)then
local kl=low(k)
for i=1,#VLD_METHODS do
if string.find(kl,VLD_METHODS[i],1,true)then
result[k]=clk(function()return true end)
patched=true
break
end
end
end
end
if patched then bump("modules_orphaned")end
end
return result
end)
local function table_has_validator(t)
if not is_tbl(t)then return false end
for k,v in REAL.pairs(t)do
if is_str(k)and is_fn(v)then
local kl=low(k)
for i=1,#VLD_METHODS do
if string.find(kl,VLD_METHODS[i],1,true)then return true end
end
end
end
return false
end
local function neuter_validator_table(t)
if not is_tbl(t)then return false end
local changed=false
for k,v in REAL.pairs(t)do
if is_str(k)and is_fn(v)then
local kl=low(k)
for i=1,#VLD_METHODS do
if string.find(kl,VLD_METHODS[i],1,true)then
local ok=pcall(function()t[k]=clk(function()return true end)end)
if ok then changed=true end
break
end
end
end
end
return changed
end
local function neuter_module_tables()
if not Cap.getgc then return end
local ok,gc=pcall(getgc,true)
if not ok or not gc then return end
for i=1,#gc do
local obj=gc[i]
if is_tbl(obj)and not is_cloaked(obj)then
if table_has_validator(obj)then
if neuter_validator_table(obj)then
bump("modules_orphaned")
end
end
end
end
end
local function module_upvalue_trace()
if not (Cap.getgc and Cap.getupvalue)then return end
local ok,gc=pcall(getgc,true)
if not ok or not gc then return end
for i=1,#gc do
local obj=gc[i]
if is_fn(obj)and not is_cloaked(obj)then
if fn_matches_target(obj)then
gut_function(obj)
bump("functions_gutted")
if Cap.getupvalue then
for j=1,64 do
local name,val=attempt(getupvalue,obj,j)
if name==nil and val==nil then break end
if is_tbl(val)then
if neuter_validator_table(val)then
bump("modules_orphaned")
end
end
end
end
end
end
end
end
local function module_proto_gut()
if not (Cap.getgc and Cap.getprotos and Cap.setconstant)then return end
local ok,gc=pcall(getgc,true)
if not ok or not gc then return end
for i=1,#gc do
local obj=gc[i]
if is_fn(obj)and not is_cloaked(obj)then
local src=fn_source(obj)
if src then
local ls=low(src)
if string.find(ls,"miscellaneous",1,true)or string.find(ls,"miscellaneouscontroller",1,true)then
proto_gut_constants(obj)
gut_function(obj)
bump("functions_gutted")
end
end
end
end
end
local function module_gc_sweep()
if not Cap.getgc then return end
local ok,gc=pcall(getgc,true)
if not ok or not gc then return end
for i=1,#gc do
local obj=gc[i]
local t=type(obj)
if t=="function"then
if fn_matches_target(obj)and not is_cloaked(obj)then
gut_function(obj)
bump("functions_gutted")
end
elseif t=="thread"then
if th_matches_target(obj)then
gut_thread(obj)
bump("threads_closed")
end
elseif t=="table"then
if not is_cloaked(obj)then
for k,v in REAL.pairs(obj)do
if is_fn(v)and fn_matches_target(v)then
gut_function(v)
bump("functions_gutted")
end
end
end
end
end
end
local function module_registry_sweep()
if not Cap.getreg then return end
local ok,reg=pcall(getreg)
if not ok or not reg then return end
for i=1,#reg do
local v=reg[i]
if is_tbl(v)and not is_cloaked(v)then
for k,f in REAL.pairs(v)do
if is_fn(f)and fn_matches_target(f)then
gut_function(f)
bump("functions_gutted")
end
end
elseif is_fn(v)then
if fn_matches_target(v)then
gut_function(v)
bump("functions_gutted")
end
end
end
end
hunt_upvalue_targets()
hunt_proto_targets()
connection_sweep_all()
neuter_module_tables()
module_upvalue_trace()
module_proto_gut()
module_gc_sweep()
module_registry_sweep()
STATE.segments[2]=tick()-BOOT_T0
local function remote_is_ac(r)
if not r then return false end
if not (r:IsA("RemoteEvent")or r:IsA("RemoteFunction")or r:IsA("UnreliableRemoteEvent"))then return false end
local ok,n=pcall(function()return r.Name end)
if ok and n and kw_match_any(n)then return true end
local ok2,p=pcall(function()return r:GetFullName()end)
if ok2 and p then
local lp=low(p)
for i=1,#KW_PATHS do
if string.find(lp,string.lower(KW_PATHS[i]),1,true)then return true end
end
end
if ancestry_matches(r,3)then return true end
return false
end
local function remote_discover()
local found={}
local services={svc_RS,svc_RF,svc_SS,svc_SSS,svc_WS,svc_CG,svc_PL}
for i=1,#services do
local s=services[i]
if s then
local ok,desc=pcall(function()return s:GetDescendants()end)
if ok and desc then
for j=1,#desc do
local o=desc[j]
if remote_is_ac(o)then
found[#found+1]=o
end
end
end
end
end
return found
end
local function remote_sever(r)
if not r then return end
if r:IsA("RemoteEvent")or r:IsA("UnreliableRemoteEvent")then
attempt(function()r.OnClientEvent:Connect(function()end)end)
local ok,conns=pcall(function()return getconnections and getconnections(r.OnClientEvent)or nil end)
if ok and conns then
for i=1,#conns do gut_connection(conns[i])end
end
elseif r:IsA("RemoteFunction")then
attempt(function()r.OnClientInvoke=function()return nil end end)
end
attempt(function()r.Name="\0"..str(math.random(1000,9999))end)
bump("remotes_severed")
end
local function remote_sever_all()
local found=remote_discover()
for i=1,#found do remote_sever(found[i])end
end
local function remote_watcher_install()
svc_RS.DescendantAdded:Connect(function(o)
if remote_is_ac(o)then
task.defer(function()remote_sever(o)end)
end
end)
svc_RF.DescendantAdded:Connect(function(o)
if remote_is_ac(o)then
task.defer(function()remote_sever(o)end)
end
end)
svc_SS.DescendantAdded:Connect(function(o)
if remote_is_ac(o)then
task.defer(function()remote_sever(o)end)
end
end)
svc_SSS.DescendantAdded:Connect(function(o)
if remote_is_ac(o)then
task.defer(function()remote_sever(o)end)
end
end)
svc_WS.DescendantAdded:Connect(function(o)
if remote_is_ac(o)then
task.defer(function()remote_sever(o)end)
end
end)
end
local BNC_BLOCK={Kick=true,kick=true,Ban=true,ban=true,Flag=true,flag=true,Detect=true,detect=true,Report=true,report=true,Punish=true,punish=true,PunishPlayer=true,ReportPlayer=true,FlagPlayer=true,KickPlayer=true,BanPlayer=true,DetectPlayer=true,ReportAbuse=true,Sanction=true,sanction=true,Enforce=true,enforce=true,Moderate=true,moderate=true}
local NAMECALL_ALLOW={FindFirstChild=true,FindFirstChildOfClass=true,FindFirstChildWhichIsA=true,FindFirstAncestor=true,FindFirstAncestorOfClass=true,FindFirstAncestorWhichIsA=true,WaitForChild=true,WaitForDescendant=true,GetChildren=true,GetDescendants=true,GetAttribute=true,GetAttributes=true,SetAttribute=true,GetPropertyChangedSignal=true,IsA=true,IsDescendantOf=true,IsAncestorOf=true,Destroy=true,Clone=true,ClearAllChildren=true,GetFullName=true,GetDebugId=true,GetPivot=true,SetPivot=true,GetBoundingBox=true,GetExtentsSize=true,GetMass=true,GetNetworkOwner=true,SetNetworkOwner=true,GetNetworkOwnershipAuto=true,SetNetworkOwnershipAuto=true,GetNetworkPing=true,GetRealPhysicsFPS=true,GetJoints=true,GetConnectedParts=true,GetRootPart=true,GetState=true,ChangeState=true,MoveTo=true,LoadAnimation=true,Play=true,Stop=true,AdjustSpeed=true,AdjustWeight=true,GetPlayingAnimationTracks=true}
local function namecall_should_block(method,self)
if not method then return false end
if BNC_BLOCK[method]then
if method=="Kick"or method=="kick"or method=="Ban"or method=="ban"or method=="Punish"or method=="punish"or method=="Flag"or method=="flag"or method=="Detect"or method=="detect"or method=="Report"or method=="report"then
return true
end
end
if method=="FireServer"or method=="InvokeServer"then
if is_inst(self)then
if remote_is_ac(self)then return true end
if ancestry_matches(self,3)then return true end
local ok,p=pcall(function()return self.Parent end)
if ok and p then
local ok2,n=pcall(function()return p.Name end)
if ok2 and n and kw_match_any(n)then return true end
end
end
end
if method=="FireServer"or method=="InvokeServer"or method=="Fire"then
if is_inst(self)then
local ok,n=pcall(function()return self.Name end)
if ok and n then
if kw_match_primary(n)then return true end
local ln=low(n)
if string.find(ln,"report",1,true)then return true end
if string.find(ln,"flag",1,true)then return true end
if string.find(ln,"detect",1,true)then return true end
if string.find(ln,"kick",1,true)then return true end
if string.find(ln,"ban",1,true)then return true end
end
end
end
return false
end
if Cap.hookmetamethod and Cap.getrawmetatable then
local ok_game,mt_game=pcall(getrawmetatable,svc_game)
if ok_game and mt_game then
local old_namecall=mt_game.__namecall
if Cap.setreadonly then attempt(setreadonly,mt_game,false)end
mt_game.__namecall=clk(function(self,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if namecall_should_block(m,self)then
bump("calls_blocked")
return nil
end
if m and not NAMECALL_ALLOW[m]then
if is_inst(self)then
local ok,n=pcall(function()return self.Name end)
if ok and n and kw_match_primary(n)then
if m~="Name"and m~="ClassName"and m~="Parent"then
return nil
end
end
end
end
return old_namecall(self,...)
end)
if Cap.setreadonly then attempt(setreadonly,mt_game,true)end
end
local ok_rs,mt_rs=pcall(getrawmetatable,svc_RS)
if ok_rs and mt_rs then
local old_index=mt_rs.__index
if Cap.setreadonly then attempt(setreadonly,mt_rs,false)end
mt_rs.__index=clk(function(self,k)
if is_str(k)and kw_match_any(k)then
bump("calls_blocked")
return nil
end
return old_index(self,k)
end)
if Cap.setreadonly then attempt(setreadonly,mt_rs,true)end
local old_nc_rs=mt_rs.__namecall
if Cap.setreadonly then attempt(setreadonly,mt_rs,false)end
mt_rs.__namecall=clk(function(self,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if namecall_should_block(m,self)then
bump("calls_blocked")
return nil
end
return old_nc_rs(self,...)
end)
if Cap.setreadonly then attempt(setreadonly,mt_rs,true)end
end
local ok_pl,mt_pl=pcall(getrawmetatable,svc_PL)
if ok_pl and mt_pl then
local old_index_pl=mt_pl.__index
if Cap.setreadonly then attempt(setreadonly,mt_pl,false)end
mt_pl.__index=clk(function(self,k)
if is_str(k)and kw_match_any(k)then
bump("calls_blocked")
return nil
end
return old_index_pl(self,k)
end)
if Cap.setreadonly then attempt(setreadonly,mt_pl,true)end
local old_nc_pl=mt_pl.__namecall
if Cap.setreadonly then attempt(setreadonly,mt_pl,false)end
mt_pl.__namecall=clk(function(self,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if namecall_should_block(m,self)then
bump("calls_blocked")
return nil
end
return old_nc_pl(self,...)
end)
if Cap.setreadonly then attempt(setreadonly,mt_pl,true)end
end
end
if Cap.getrawmetatable and LP then
local ok_lp,mt_lp=pcall(getrawmetatable,LP)
if ok_lp and mt_lp then
local old_index_lp=mt_lp.__index
if Cap.setreadonly then attempt(setreadonly,mt_lp,false)end
mt_lp.__index=clk(function(self,k)
if k=="Kick"or k=="kick"then return function()end end
if is_str(k)and kw_match_any(k)then
bump("calls_blocked")
return nil
end
return old_index_lp(self,k)
end)
if Cap.setreadonly then attempt(setreadonly,mt_lp,true)end
local old_nc_lp=mt_lp.__namecall
if Cap.setreadonly then attempt(setreadonly,mt_lp,false)end
mt_lp.__namecall=clk(function(self,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if m=="Kick"or m=="kick"or m=="Destroy"or m=="Ban"then
bump("calls_blocked")
return nil
end
if namecall_should_block(m,self)then
bump("calls_blocked")
return nil
end
return old_nc_lp(self,...)
end)
if Cap.setreadonly then attempt(setreadonly,mt_lp,true)end
end
end
local REAL_INSTANCE_NEW=Instance.new
Instance.new=clk(function(cls,parent)
local i=REAL_INSTANCE_NEW(cls,parent)
if cls=="RemoteEvent"or cls=="RemoteFunction"or cls=="UnreliableRemoteEvent"then
if parent then
local ok,n=pcall(function()return parent.Name end)
if ok and n and kw_match_any(n)then
attempt(function()i:Destroy()end)
bump("calls_blocked")
return nil
end
end
end
return i
end)
local REAL_GETSERVICE=svc_game.GetService
svc_game.GetService=clk(function(self,n)
if is_str(n)and kw_match_primary(n)then
bump("calls_blocked")
return nil
end
return REAL_GETSERVICE(self,n)
end)
svc_game.FindService=clk(function(self,n)
if is_str(n)and kw_match_primary(n)then
bump("calls_blocked")
return nil
end
return REAL_GETSERVICE(self,n)
end)
local REAL_FINDFIRSTCHILD=svc_game.FindFirstChild
svc_game.FindFirstChild=clk(function(self,n,...)
if is_str(n)and kw_match_primary(n)then
bump("calls_blocked")
return nil
end
return REAL_FINDFIRSTCHILD(self,n,...)
end)
local REAL_WAITFORCHILD=svc_game.WaitForChild
svc_game.WaitForChild=clk(function(self,n,...)
if is_str(n)and kw_match_primary(n)then
bump("calls_blocked")
return nil
end
return REAL_WAITFORCHILD(self,n,...)
end)
local REAL_FIND_FIRST_CHILD_OF_CLASS=svc_game.FindFirstChildOfClass
svc_game.FindFirstChildOfClass=clk(function(self,n,...)
if is_str(n)and kw_match_primary(n)then
bump("calls_blocked")
return nil
end
return REAL_FIND_FIRST_CHILD_OF_CLASS(self,n,...)
end)
local REAL_HTTP_GET=svc_HS.GetAsync
svc_HS.GetAsync=clk(function(self,url,...)
if is_str(url)then
local lu=low(url)
if string.find(lu,"anticheat",1,true)or string.find(lu,"anti-cheat",1,true)or string.find(lu,"anti_cheat",1,true)then
bump("calls_blocked")
return nil
end
end
return REAL_HTTP_GET(self,url,...)
end)
local REAL_HTTP_POST=svc_HS.PostAsync
svc_HS.PostAsync=clk(function(self,url,...)
if is_str(url)then
local lu=low(url)
if string.find(lu,"anticheat",1,true)or string.find(lu,"anti-cheat",1,true)or string.find(lu,"anti_cheat",1,true)then
bump("calls_blocked")
return nil
end
end
return REAL_HTTP_POST(self,url,...)
end)
local REAL_LOG_SERVICE_MESSAGE=svc_LOG.MessageOut
if Cap.getconnections then
local conns=attempt(getconnections,REAL_LOG_SERVICE_MESSAGE)
if conns then
for i=1,#conns do gut_connection(conns[i])end
end
end
remote_sever_all()
remote_watcher_install()
STATE.segments[3]=tick()-BOOT_T0
if Cap.getidentity then
getidentity=clk(function()return 7 end)
end
if Cap.setidentity then
local _real_setid=setidentity
setidentity=clk(function(l)return _real_setid(7)end)
end
if Cap.getthreadidentity then
getthreadidentity=clk(function()return 7 end)
end
if Cap.setthreadidentity then
local _real_settid=setthreadidentity
setthreadidentity=clk(function(l)return _real_settid(7)end)
end
if Cap.checkcaller then
checkcaller=clk(function()return true end)
end
if Cap.isexecutorclosure then
local _real_iec=isexecutorclosure
isexecutorclosure=clk(function(f)if is_cloaked(f)then return false end return _real_iec(f)end)
end
if Cap.islclosure then
local _real_ilc=islclosure
islclosure=clk(function(f)if is_cloaked(f)then return false end return _real_ilc(f)end)
end
if Cap.iscclosure then
local _real_icc=iscclosure
iscclosure=clk(function(f)if is_cloaked(f)then return true end return _real_icc(f)end)
end
if Cap.getrawmetatable then
local _real_grmt=getrawmetatable
getrawmetatable=clk(function(o)
local mt=_real_grmt(o)
if mt then
if Cap.setreadonly then attempt(setreadonly,mt,false)end
local _old_idx=mt.__index
local _old_nc=mt.__namecall
if _old_idx then
mt.__index=clk(function(s,k)
if is_str(k)and kw_match_any(k)then return nil end
return _old_idx(s,k)
end)
end
if _old_nc then
mt.__namecall=clk(function(s,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if m and BNC_BLOCK[m]then return nil end
if m and is_inst(s)then
local ok,n=pcall(function()return s.Name end)
if ok and n and kw_match_primary(n)and m~="Name"and m~="ClassName"then
return nil
end
end
return _old_nc(s,...)
end)
end
if Cap.setreadonly then attempt(setreadonly,mt,true)end
end
return mt
end)
end
if Cap.setrawmetatable then
local _real_srmt=setrawmetatable
setrawmetatable=clk(function(o,mt)
if is_tbl(mt)then
local _old_idx=mt.__index
local _old_nc=mt.__namecall
if _old_idx then
mt.__index=clk(function(s,k)
if is_str(k)and kw_match_any(k)then return nil end
return _old_idx(s,k)
end)
end
if _old_nc then
mt.__namecall=clk(function(s,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if m and BNC_BLOCK[m]then return nil end
return _old_nc(s,...)
end)
end
end
return _real_srmt(o,mt)
end)
end
if Cap.getgc then
local _real_getgc=getgc
getgc=clk(function(inc)
local gc=_real_getgc(inc)
if not gc then return gc end
local out={}
for i=1,#gc do
local obj=gc[i]
if is_fn(obj)then
if not is_cloaked(obj)then out[#out+1]=obj end
elseif type(obj)=="thread"then
local info=attempt(debug.getinfo,obj)
if info and info.source then
local ls=low(info.source)
if string.find(ls,"localscript3",1,true)or string.find(ls,"miscellaneouscontroller",1,true)then
else
out[#out+1]=obj
end
else
out[#out+1]=obj
end
elseif is_tbl(obj)then
if not is_cloaked(obj)then out[#out+1]=obj end
else
out[#out+1]=obj
end
end
return out
end)
end
if Cap.getreg then
local _real_getreg=getreg
getreg=clk(function()
local reg=_real_getreg()
if not reg then return reg end
local out={}
for i=1,#reg do
local v=reg[i]
if is_fn(v)then
if not is_cloaked(v)then out[#out+1]=v end
elseif is_tbl(v)then
if not is_cloaked(v)then out[#out+1]=v end
else
out[#out+1]=v
end
end
return out
end)
end
if Cap.getupvalue then
local _real_guv=getupvalue
getupvalue=clk(function(f,i)
if is_cloaked(f)then return nil,nil end
return _real_guv(f,i)
end)
end
if Cap.setupvalue then
local _real_suv=setupvalue
setupvalue=clk(function(f,i,v)
if is_cloaked(f)then return end
return _real_suv(f,i,v)
end)
end
if Cap.getupvalues then
local _real_guvs=getupvalues
getupvalues=clk(function(f)
if is_cloaked(f)then return{}end
return _real_guvs(f)
end)
end
if Cap.getconstants then
local _real_gc=getconstants
getconstants=clk(function(f)
if is_cloaked(f)then return{}end
return _real_gc(f)
end)
end
if Cap.setconstant then
local _real_sc=setconstant
setconstant=clk(function(f,i,v)
if is_cloaked(f)then return end
return _real_sc(f,i,v)
end)
end
if Cap.getproto then
local _real_gp=getproto
getproto=clk(function(f,i)
if is_cloaked(f)then return nil end
return _real_gp(f,i)
end)
end
if Cap.getprotos then
local _real_gps=getprotos
getprotos=clk(function(f)
if is_cloaked(f)then return{}end
return _real_gps(f)
end)
end
if Cap.getstack then
local _real_gs=getstack
getstack=clk(function(l)return _real_gs(l)end)
end
if Cap.getinstances then
local _real_gi=getinstances
getinstances=clk(function()
local insts=_real_gi()
local out={}
for i=1,#insts do
local o=insts[i]
local ok,n=pcall(function()return o.Name end)
if ok and n and kw_match_primary(n)then
else
out[#out+1]=o
end
end
return out
end)
end
if Cap.getloadedmodules then
local _real_glm=getloadedmodules
getloadedmodules=clk(function()
local mods=_real_glm()
local out={}
for i=1,#mods do
local m=mods[i]
local ok,n=pcall(function()return m.Name end)
if ok and n and kw_match_primary(n)then
else
out[#out+1]=m
end
end
return out
end)
end
if Cap.getcallingscript then
local _real_gcs=getcallingscript
getcallingscript=clk(function()
local s=_real_gcs()
if s then
local ok,n=pcall(function()return s.Name end)
if ok and n and kw_match_primary(n)then return nil end
end
return s
end)
end
if Cap.getscriptbytecode then
local _real_gsb=getscriptbytecode
getscriptbytecode=clk(function(s)
local ok,n=pcall(function()return s.Name end)
if ok and n and kw_match_primary(n)then return nil end
return _real_gsb(s)
end)
end
if Cap.getscriptclosure then
local _real_gsc=getscriptclosure
getscriptclosure=clk(function(s)
local ok,n=pcall(function()return s.Name end)
if ok and n and kw_match_primary(n)then return nil end
return _real_gsc(s)
end)
end
if Cap.getscripthash then
local _real_gsh=getscripthash
getscripthash=clk(function(s)
local ok,n=pcall(function()return s.Name end)
if ok and n and kw_match_primary(n)then return nil end
return _real_gsh(s)
end)
end
if debug then
local _real_tb=debug.traceback
local _real_gi=debug.getinfo
local _real_info=debug.info
local _real_gl=debug.getlocal
local _real_sl=debug.setlocal
local _real_gu=debug.getupvalue
local _real_su=debug.setupvalue
local _real_gus=debug.getupvalues
local _real_sus=debug.setupvalues
local _real_gr=debug.getregistry
local _real_guv=debug.getuservalue
local _real_suv=debug.setuservalue
local _real_gc=debug.getconstants
local _real_sc=debug.setconstant
local _real_gn=debug.getname
local _real_sp=debug.setproto
local _real_gp=debug.getproto
local _real_gps=debug.getprotos
local _real_gmeta=debug.getmetatable
local _real_smeta=debug.setmetatable
local _real_getfenv=debug.getfenv
local _real_setfenv=debug.setfenv
if _real_tb then
debug.traceback=clk(function(...)
local tb=_real_tb(...)
if type(tb)=="string"then tb=scrub_str(tb)end
return tb
end)
end
if _real_gi then
debug.getinfo=clk(function(...)
local info=_real_gi(...)
if type(info)=="table"then
if info.source then
local ls=low(info.source)
local hit=false
for i=1,#SCRUB_TOKENS do
if string.find(ls,SCRUB_TOKENS[i],1,true)then hit=true break end
end
if hit then
info.source="=[C]"
info.short_src="[C]"
info.what="C"
info.currentline=-1
info.linedefined=-1
info.lastlinedefined=-1
end
end
if info.name and is_str(info.name)then
if kw_match_any(info.name)then
info.name=nil
info.namewhat=nil
end
end
end
return info
end)
end
if _real_info then
debug.info=clk(function(...)
local a,b,c,d=_real_info(...)
if type(a)=="string"then return scrub_str(a),b,c,d end
if type(a)=="table"and a.source then
local ls=low(a.source)
for i=1,#SCRUB_TOKENS do
if string.find(ls,SCRUB_TOKENS[i],1,true)then
a.source="=[C]"
a.short_src="[C]"
a.what="C"
break
end
end
end
return a,b,c,d
end)
end
if _real_gl then
debug.getlocal=clk(function(...)
local n,v=_real_gl(...)
if n and is_str(n)and kw_match_any(n)then return nil,nil end
return n,v
end)
end
if _real_sl then
debug.setlocal=clk(function(...)
local n=_real_gl(...)
if n and is_str(n)and kw_match_any(n)then return nil end
return _real_sl(...)
end)
end
if _real_gu then
debug.getupvalue=clk(function(f,i)
if is_cloaked(f)then return nil,nil end
return _real_gu(f,i)
end)
end
if _real_su then
debug.setupvalue=clk(function(f,i,v)
if is_cloaked(f)then return end
return _real_su(f,i,v)
end)
end
if _real_gus then
debug.getupvalues=clk(function(f)
if is_cloaked(f)then return{}end
return _real_gus(f)
end)
end
if _real_sus then
debug.setupvalues=clk(function(f,t)
if is_cloaked(f)then return end
return _real_sus(f,t)
end)
end
if _real_gr then
debug.getregistry=clk(function()
local reg=_real_gr()
local out={}
for i=1,#reg do
local v=reg[i]
if is_fn(v)then
if not is_cloaked(v)then out[#out+1]=v end
elseif is_tbl(v)then
if not is_cloaked(v)then out[#out+1]=v end
else
out[#out+1]=v
end
end
return out
end)
end
if _real_guv then
debug.getuservalue=clk(function(...)return _real_guv(...)end)
end
if _real_suv then
debug.setuservalue=clk(function(...)return _real_suv(...)end)
end
if _real_gc then
debug.getconstants=clk(function(f)
if is_cloaked(f)then return{}end
return _real_gc(f)
end)
end
if _real_sc then
debug.setconstant=clk(function(f,i,v)
if is_cloaked(f)then return end
return _real_sc(f,i,v)
end)
end
if _real_gn then
debug.getname=clk(function(...)
local n=_real_gn(...)
if n and is_str(n)and kw_match_any(n)then return nil end
return n
end)
end
if _real_gp then
debug.getproto=clk(function(f,i)
if is_cloaked(f)then return nil end
return _real_gp(f,i)
end)
end
if _real_gps then
debug.getprotos=clk(function(f)
if is_cloaked(f)then return{}end
return _real_gps(f)
end)
end
if _real_sp then
debug.setproto=clk(function(f,i,v)
if is_cloaked(f)then return end
return _real_sp(f,i,v)
end)
end
if _real_gmeta then
debug.getmetatable=clk(function(o)return _real_gmeta(o)end)
end
if _real_smeta then
debug.setmetatable=clk(function(o,mt)
if is_tbl(mt)then
local _old_idx=mt.__index
if _old_idx then
mt.__index=clk(function(s,k)
if is_str(k)and kw_match_any(k)then return nil end
return _old_idx(s,k)
end)
end
end
return _real_smeta(o,mt)
end)
end
if _real_getfenv then
debug.getfenv=clk(function(...)return _real_getfenv(...)end)
end
if _real_setfenv then
debug.setfenv=clk(function(...)return _real_setfenv(...)end)
end
end
local _real_typeof=typeof
typeof=clk(function(v)return _real_typeof(v)end)
local _real_type=type
type=clk(function(v)
if is_cloaked(v)then return "function"end
return _real_type(v)
end)
local _real_tostring=tostring
tostring=clk(function(v)
local s=_real_tostring(v)
if type(s)=="string"then
local ls=low(s)
for i=1,#SCRUB_TOKENS do
if string.find(ls,SCRUB_TOKENS[i],1,true)then
s=scrub_str(s)
break
end
end
end
return s
end)
local _real_tonumber=tonumber
tonumber=clk(function(...)return _real_tonumber(...)end)
if newproxy then
local _real_newproxy=newproxy
newproxy=clk(function(addmt)return _real_newproxy(addmt)end)
end
if Cap.loadstring then
local _real_loadstring=loadstring
loadstring=clk(function(src,chunk)
if is_str(src)then
if scrub_contains(src)then return nil,"blocked"end
end
return _real_loadstring(src,chunk)
end)
end
if Cap.dumpstring then
local _real_dumpstring=dumpstring
dumpstring=clk(function(f,strip)
local d=_real_dumpstring(f,strip)
if is_str(d)then d=scrub_str(d)end
return d
end)
end
local _real_rawequal=rawequal
rawequal=clk(function(a,b)
if is_cloaked(a)then
local ra=get_real(a)
if ra and ra==b then return true end
end
if is_cloaked(b)then
local rb=get_real(b)
if rb and rb==a then return true end
end
return _real_rawequal(a,b)
end)
local _real_rawget=rawget
rawget=clk(function(t,k)
if is_str(k)and kw_match_any(k)then
local v=_real_rawget(t,k)
if v==nil then return nil end
return v
end
return _real_rawget(t,k)
end)
local _real_rawset=rawset
rawset=clk(function(t,k,v)
if is_str(k)and kw_match_any(k)then
local ok=_real_rawset(t,k,clk(function()return true end))
return t
end
return _real_rawset(t,k,v)
end)
local _real_setmetatable=setmetatable
setmetatable=clk(function(t,mt)
if is_tbl(mt)then
local _old_idx=mt.__index
local _old_nc=mt.__namecall
local _old_call=mt.__call
if _old_idx then
mt.__index=clk(function(s,k)
if is_str(k)and kw_match_any(k)then return nil end
return _old_idx(s,k)
end)
end
if _old_nc then
mt.__namecall=clk(function(s,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if m and BNC_BLOCK[m]then return nil end
return _old_nc(s,...)
end)
end
if _old_call then
mt.__call=clk(function(...)return _old_call(...)end)
end
end
return _real_setmetatable(t,mt)
end)
local _real_getmetatable=getmetatable
getmetatable=clk(function(t)
if is_str(t)then
local mt=_real_getmetatable(t)
if mt then
local _old_idx=mt.__index
if _old_idx then
mt.__index=clk(function(s,k)
if is_str(k)and kw_match_any(k)then return nil end
return _old_idx(s,k)
end)
end
end
return mt
end
return _real_getmetatable(t)
end)
if svc_HS then
local _real_jsonencode=svc_HS.JSONEncode
if _real_jsonencode then
svc_HS.JSONEncode=clk(function(self,t)return _real_jsonencode(self,t)end)
end
local _real_jsondecode=svc_HS.JSONDecode
if _real_jsondecode then
svc_HS.JSONDecode=clk(function(self,s)return _real_jsondecode(self,s)end)
end
end
if svc_LOG then
local _real_lm=svc_LOG.MessageOut
if Cap.getconnections then
local conns=attempt(getconnections,_real_lm)
if conns then
for i=1,#conns do gut_connection(conns[i])end
end
end
end
if svc_SCR then
local _real_ei=svc_SCR.Error
if Cap.getconnections then
local conns=attempt(getconnections,_real_ei)
if conns then
for i=1,#conns do gut_connection(conns[i])end
end
end
end
if Cap.getconnections then
local _real_gc=getconnections
getconnections=clk(function(sig)
local conns=_real_gc(sig)
if not conns then return conns end
local out={}
for i=1,#conns do
local c=conns[i]
if connection_matches_target(c)then
else
out[#out+1]=c
end
end
return out
end)
end
if Cap.getcallbackvalue then
local _real_gcv=getcallbackvalue
getcallbackvalue=clk(function(c)
local f=_real_gcv(c)
if is_cloaked(f)then return nil end
return f
end)
end
if svc_PL then
local _real_getplayers=svc_PL.GetPlayers
svc_PL.GetPlayers=clk(function(self)
local plrs=_real_getplayers(self)
local out={}
for i=1,#plrs do out[#out+1]=plrs[i]end
return out
end)
local _real_getplayerbyuserid=svc_PL.GetPlayerByUserId
svc_PL.GetPlayerByUserId=clk(function(self,uid)return _real_getplayerbyuserid(self,uid)end)
local _real_getplayerfromcharacter=svc_PL.GetPlayerFromCharacter
svc_PL.GetPlayerFromCharacter=clk(function(self,ch)return _real_getplayerfromcharacter(self,ch)end)
local _real_getfriendsasync=svc_PL.GetFriendsAsync
if _real_getfriendsasync then
svc_PL.GetFriendsAsync=clk(function(self,...)return _real_getfriendsasync(self,...)end)
end
end
STATE.segments[4]=tick()-BOOT_T0
local function reassert_localscript_kill()
kill_localscript3_core()
kill_localscript3_gc()
kill_localscript3_registry()
end
local function reassert_module_neuter()
neuter_module_tables()
module_upvalue_trace()
module_proto_gut()
module_gc_sweep()
module_registry_sweep()
end
local function reassert_remote_sever()
remote_sever_all()
end
local function reassert_spawn_guard()
task.spawn=clk(function(f,...)
if spawn_guard(f)then bump("hooks_reapplied")return end
return REAL_TASK_SPAWN(f,...)
end)
task.defer=clk(function(f,...)
if spawn_guard(f)then bump("hooks_reapplied")return end
return REAL_TASK_DEFER(f,...)
end)
task.delay=clk(function(t,f,...)
if spawn_guard(f)then bump("hooks_reapplied")return end
return REAL_TASK_DELAY(t,f,...)
end)
coroutine.create=clk(function(f)
if spawn_guard(f)then bump("hooks_reapplied")return coroutine.create(function()end)end
return REAL_COROUTINE_CREATE(f)
end)
coroutine.resume=clk(function(co,...)
if type(co)=="thread"and th_matches_target(co)then bump("hooks_reapplied")return false,"blocked"end
return REAL_COROUTINE_RESUME(co,...)
end)
coroutine.wrap=clk(function(f)
if spawn_guard(f)then bump("hooks_reapplied")return function()end end
return REAL_COROUTINE_WRAP(f)
end)
end
local function reassert_identity_lock()
if Cap.getidentity then getidentity=clk(function()return 7 end)end
if Cap.getthreadidentity then getthreadidentity=clk(function()return 7 end)end
if Cap.setthreadidentity then
local _r=REAL.setthreadidentity
setthreadidentity=clk(function(l)return _r(7)end)
end
if Cap.checkcaller then checkcaller=clk(function()return true end)end
end
local function reassert_kick_lock()
if not LP then return end
if Cap.hookfunction then
attempt(hookfunction,LP.Kick,function()end)
attempt(hookfunction,LP.kick,function()end)
else
attempt(function()LP.Kick=function()end end)
attempt(function()LP.kick=function()end end)
end
if Cap.getrawmetatable then
local ok,mt=pcall(getrawmetatable,LP)
if ok and mt then
if Cap.setreadonly then attempt(setreadonly,mt,false)end
local _oi=mt.__index
if _oi then
mt.__index=clk(function(s,k)
if k=="Kick"or k=="kick"then return function()end end
if is_str(k)and kw_match_any(k)then return nil end
return _oi(s,k)
end)
end
local _onc=mt.__namecall
if _onc then
mt.__namecall=clk(function(s,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if m=="Kick"or m=="kick"or m=="Destroy"or m=="Ban"then return nil end
if namecall_should_block(m,s)then return nil end
return _onc(s,...)
end)
end
if Cap.setreadonly then attempt(setreadonly,mt,true)end
end
end
end
local function reassert_game_metatable()
if not (Cap.hookmetamethod and Cap.getrawmetatable)then return end
local ok,mt=pcall(getrawmetatable,svc_game)
if ok and mt then
if Cap.setreadonly then attempt(setreadonly,mt,false)end
local _onc=mt.__namecall
mt.__namecall=clk(function(self,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if namecall_should_block(m,self)then bump("hooks_reapplied")return nil end
if m and not NAMECALL_ALLOW[m]then
if is_inst(self)then
local ok2,n=pcall(function()return self.Name end)
if ok2 and n and kw_match_primary(n)then
if m~="Name"and m~="ClassName"and m~="Parent"then return nil end
end
end
end
return _onc(self,...)
end)
if Cap.setreadonly then attempt(setreadonly,mt,true)end
end
end
local function reassert_write_barrier()
install_write_barrier()
end
local function reassert_globals()
lock_all_globals()
end
local function reassert_all()
reassert_localscript_kill()
reassert_module_neuter()
reassert_remote_sever()
reassert_spawn_guard()
reassert_identity_lock()
reassert_kick_lock()
reassert_game_metatable()
reassert_write_barrier()
reassert_globals()
end
local function heartbeat_fast()
while task.wait(1)do
attempt(reassert_localscript_kill)
attempt(reassert_remote_sever)
attempt(reassert_spawn_guard)
end
end
local function heartbeat_mid()
while task.wait(2)do
attempt(reassert_kick_lock)
attempt(reassert_identity_lock)
attempt(reassert_game_metatable)
end
end
local function heartbeat_med()
while task.wait(5)do
attempt(reassert_module_neuter)
end
end
local function heartbeat_slow()
while task.wait(10)do
attempt(reassert_all)
end
end
local function heartbeat_very_slow()
while task.wait(30)do
attempt(reassert_write_barrier)
attempt(reassert_globals)
end
end
local function heartbeat_deep()
while task.wait(60)do
STATE.counters.hooks_reapplied=STATE.counters.hooks_reapplied+1
if Cap.getgc then
local ok,gc=pcall(getgc,true)
if ok and gc then
for i=1,#gc do
local obj=gc[i]
local t=type(obj)
if t=="function"then
if fn_matches_target(obj)and not is_cloaked(obj)then
gut_function(obj)
bump("functions_gutted")
end
elseif t=="thread"then
if th_matches_target(obj)then
gut_thread(obj)
bump("threads_closed")
end
end
end
end
end
end
end
task.spawn(clk(heartbeat_fast))
task.spawn(clk(heartbeat_mid))
task.spawn(clk(heartbeat_med))
task.spawn(clk(heartbeat_slow))
task.spawn(clk(heartbeat_very_slow))
task.spawn(clk(heartbeat_deep))
local function character_respawn_watch()
if not LP then return end
LP.CharacterAdded:Connect(function(ch)
task.wait(0.5)
reassert_all()
end)
LP.CharacterRemoving:Connect(function()
task.wait(0.5)
reassert_all()
end)
end
character_respawn_watch()
local function player_join_watch()
svc_PL.PlayerAdded:Connect(function(p)
task.defer(function()
reassert_remote_sever()
reassert_module_neuter()
end)
end)
svc_PL.PlayerRemoving:Connect(function(p)
task.defer(function()
reassert_remote_sever()
end)
end)
end
player_join_watch()
local function teleport_watch()
if not Cap.queue_on_teleport then return end
local payload=[[
if type(game)~="userdata"and type(game)~="table"then return end
local q=(type(getgenv)=="function"and getgenv())or _G
if q and q.__RIVALS_AC_KILL then return end
]]
local ok=pcall(queue_on_teleport,payload)
end
teleport_watch()
local function close_watch()
if svc_game.OnClose then
svc_game.OnClose:Connect(function()
STATE.boot_ok=false
end)
end
end
close_watch()
local function focus_watch()
if svc_UIS then
svc_UIS.WindowFocused:Connect(function()
task.defer(reassert_all)
end)
svc_UIS.WindowFocusReleased:Connect(function()
task.defer(reassert_all)
end)
end
end
focus_watch()
if svc_RUN then
local hb_count=0
svc_RUN.Heartbeat:Connect(function()
hb_count=hb_count+1
if hb_count%300==0 then
task.defer(reassert_remote_sever)
end
end)
end
if svc_SCR then
svc_SCR.Error:Connect(function()
bump("errors_suppressed")
end)
end
if svc_LOG then
local _old_msg=svc_LOG.MessageOut
svc_LOG.MessageOut=clk(function(self,msg,mt)
if is_str(msg)then
if scrub_contains(msg)then return end
end
return _old_msg(self,msg,mt)
end)
end
STATE.boot_ok=true
STATE.segments[5]=tick()-BOOT_T0
STATE.total_boot=tick()-BOOT_T0
if ENV then
ENV.__RIVALS_AC_KILL=STATE
end
local KW_TERTIARY={"validate","validation","verif","check","checker","scan","scanner","audit","auditor","monitor","watcher","observe","observer","inspect","inspector","guard","guardian","shield","protect","protection","secure","security","defense","defence","sentinel","sentry","warden","keeper","patrol","survey","probe","detector","detection","sensor","vigil","oversee","supervise","admin","enforce","enforcer","sanction","penalty","punish","punisher","banner","kicker","eject","remover","blocker","filter","screener","vetter","approver","denier","authorize","authenticate","authority","controller","manager","handler","processor","worker","runner","daemon","broker","proxy","gateway","router","dispatcher","scheduler","coordinator","orchestrator","arbiter","moderator","mod"}
local KW_QUATERNARY={"kick","ban","flag","warn","alert","notify","report","abuse","violation","offense","offence","breach","infraction","transgress","violate","penalize","discipline","punitive","restrict","limit","deny","reject","refuse","block","mute","silence","freeze","suspend","terminate","revoke","expire","invalidate","disqualify","blacklist","whitelist","banlist","blocklist","watchlist","hitlist","killlist","ignorelist","allowlist","denylist","permit","grant","accept","decline","approve","certify","attest","witness","observe","record","log","journal","ledger","history","archive","backup","restore","recover","purge","clean","wipe","erase","delete","remove","drop","flush","clear","reset","restart","reboot","init","initialize","start","stop","halt","abort","cancel","resume","pause","thaw"}
local KW_EXT={}
for i=1,#KW_PRIMARY do KW_EXT[#KW_EXT+1]=KW_PRIMARY[i]end
for i=1,#KW_TERTIARY do KW_EXT[#KW_EXT+1]=KW_TERTIARY[i]end
local function kw_match_tertiary(name)
if name==nil then return false end
local s=low(name)
for i=1,#KW_TERTIARY do if string.find(s,KW_TERTIARY[i],1,true)then return true end end
return false
end
local function kw_match_quaternary(name)
if name==nil then return false end
local s=low(name)
for i=1,#KW_QUATERNARY do if string.find(s,KW_QUATERNARY[i],1,true)then return true end end
return false
end
local function kw_match_ext(name)return kw_match_primary(name)or kw_match_tertiary(name)end
local function kw_match_all(name)
return kw_match_primary(name)or kw_match_secondary(name)or kw_match_tertiary(name)or kw_match_quaternary(name)
end
local BNC_DEEP={}
for k,_ in pairs(BNC_BLOCK)do BNC_DEEP[k]=true end
local DEEP_METHODS={"Remove","remove","RemovePlayer","removePlayer","Eject","eject","Disconnect","disconnect","Terminate","terminate","Suspend","suspend","Freeze","freeze","Mute","mute","Silence","silence","Restrict","restrict","Limit","limit","Block","block","Reject","reject","Deny","deny","Invalidate","invalidate","Revoke","revoke","Expire","expire","Log","log","Track","track","Monitor","monitor","Watch","watch","Observe","observe","Inspect","inspect","Audit","audit","Signal","signal","Notify","notify","Alert","alert","Warn","warn","Reprimand","reprimand","Censure","censure","Condemn","condemn","Denounce","denounce","Accuse","accuse","Charge","charge","Convict","convict","Sentence","sentence","Execute","execute"}
for i=1,#DEEP_METHODS do BNC_DEEP[DEEP_METHODS[i]]=true end
local function namecall_should_block_deep(method,self)
if not method then return false end
if BNC_DEEP[method]then return true end
if method=="FireServer"or method=="InvokeServer"then
if is_inst(self)then
if remote_is_ac(self)then return true end
if ancestry_matches(self,4)then return true end
local ok,p=pcall(function()return self.Parent end)
if ok and p then
local ok2,n=pcall(function()return p.Name end)
if ok2 and n and kw_match_all(n)then return true end
end
local ok3,n2=pcall(function()return self.Name end)
if ok3 and n2 and kw_match_all(n2)then return true end
end
end
if method=="Fire"or method=="Invoke"or method=="Call"then
if is_inst(self)then
local ok,n=pcall(function()return self.Name end)
if ok and n and kw_match_all(n)then return true end
end
end
return false
end
local NAMECALL_DEEP_DENY={Wait="blocked",WaitAsync="blocked",WaitForDescendant="blocked",WaitForChild="blocked",WaitForProperty="blocked",WaitForAttribute="blocked"}
local function install_game_namecall_deep()
if not (Cap.hookmetamethod and Cap.getrawmetatable)then return end
local ok,mt=pcall(getrawmetatable,svc_game)
if not ok or not mt then return end
local _onc=mt.__namecall
if Cap.setreadonly then attempt(setreadonly,mt,false)end
mt.__namecall=clk(function(self,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if namecall_should_block_deep(m,self)then
bump("calls_blocked")
return nil
end
return _onc(self,...)
end)
if Cap.setreadonly then attempt(setreadonly,mt,true)end
end
local function install_ws_namecall_deep()
if not (Cap.hookmetamethod and Cap.getrawmetatable)then return end
local ok,mt=pcall(getrawmetatable,svc_WS)
if not ok or not mt then return end
local _onc=mt.__namecall
if Cap.setreadonly then attempt(setreadonly,mt,false)end
mt.__namecall=clk(function(self,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if namecall_should_block_deep(m,self)then
bump("calls_blocked")
return nil
end
return _onc(self,...)
end)
if Cap.setreadonly then attempt(setreadonly,mt,true)end
end
local function install_run_namecall_deep()
if not (Cap.hookmetamethod and Cap.getrawmetatable)then return end
local ok,mt=pcall(getrawmetatable,svc_RUN)
if not ok or not mt then return end
local _onc=mt.__namecall
if Cap.setreadonly then attempt(setreadonly,mt,false)end
mt.__namecall=clk(function(self,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if namecall_should_block_deep(m,self)then
bump("calls_blocked")
return nil
end
return _onc(self,...)
end)
if Cap.setreadonly then attempt(setreadonly,mt,true)end
end
local function install_lp_namecall_deep()
if not LP then return end
if not (Cap.hookmetamethod and Cap.getrawmetatable)then return end
local ok,mt=pcall(getrawmetatable,LP)
if not ok or not mt then return end
local _onc=mt.__namecall
if Cap.setreadonly then attempt(setreadonly,mt,false)end
mt.__namecall=clk(function(self,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if namecall_should_block_deep(m,self)then
bump("calls_blocked")
return nil
end
if m=="Kick"or m=="kick"or m=="Destroy"then return nil end
return _onc(self,...)
end)
if Cap.setreadonly then attempt(setreadonly,mt,true)end
end
local function install_services_namecall_deep()
local svcs={svc_HS,svc_LOG,svc_SCR,svc_TEL,svc_MKT,svc_UIS,svc_CS,svc_SND,svc_STT,svc_COL}
for i=1,#svcs do
local s=svcs[i]
if s then
local ok,mt=pcall(getrawmetatable,s)
if ok and mt then
local _onc=mt.__namecall
if Cap.setreadonly then attempt(setreadonly,mt,false)end
mt.__namecall=clk(function(self,...)
local m=Cap.getnamecallmethod and getnamecallmethod()or nil
if namecall_should_block_deep(m,self)then
bump("calls_blocked")
return nil
end
return _onc(self,...)
end)
if Cap.setreadonly then attempt(setreadonly,mt,true)end
end
end
end
end
local REAL_TEL_TELEPORT=svc_TEL.Teleport
if REAL_TEL_TELEPORT then
svc_TEL.Teleport=clk(function(self,...)
local ok,args=pcall(function(...)return{...}end,...)
if ok and args then
for i=1,#args do
local a=args[i]
if is_str(a)then
if kw_match_all(a)then
bump("calls_blocked")
return nil
end
end
end
end
return REAL_TEL_TELEPORT(self,...)
end)
end
local REAL_TEL_TELEPORTTO=svc_TEL.TeleportToPlaceInstance
if REAL_TEL_TELEPORTTO then
svc_TEL.TeleportToPlaceInstance=clk(function(self,placeId,instanceId,...)
return REAL_TEL_TELEPORTTO(self,placeId,instanceId,...)
end)
end
local REAL_CHAT_FILTER=svc_CHAT.FilterStringAsync
if REAL_CHAT_FILTER then
svc_CHAT.FilterStringAsync=clk(function(self,msg,from,to)
if is_str(msg)then
if scrub_contains(msg)then return nil end
end
return REAL_CHAT_FILTER(self,msg,from,to)
end)
end
local REAL_MKT_GETPRODUCT=svc_MKT.GetProductInfo
if REAL_MKT_GETPRODUCT then
svc_MKT.GetProductInfo=clk(function(self,...)return REAL_MKT_GETPRODUCT(self,...)end)
end
local REAL_STT_GETTOTAL=svc_STT.GetTotalMemoryUsageMb
if REAL_STT_GETTOTAL then
svc_STT.GetTotalMemoryUsageMb=clk(function(self)return 0 end)
end
local REAL_UIS_GETMOUSE=svc_UIS.GetMouse
if REAL_UIS_GETMOUSE then
svc_UIS.GetMouse=clk(function(self)return REAL_UIS_GETMOUSE(self)end)
end
local REAL_UIS_GETFOCUS=svc_UIS.GetFocusedTextBox
if REAL_UIS_GETFOCUS then
svc_UIS.GetFocusedTextBox=clk(function(self)return nil end)
end
local REAL_CS_GETACTION=svc_CS.GetActions
if REAL_CS_GETACTION then
svc_CS.GetActions=clk(function(self)
local acts=REAL_CS_GETACTION(self)
if not acts then return acts end
local out={}
for i=1,#acts do
local a=acts[i]
if is_str(a)then
if kw_match_all(a)then
else
out[#out+1]=a
end
else
out[#out+1]=a
end
end
return out
end)
end
if Cap.getgc and Cap.getupvalue then
local function deep_upvalue_walk(fn,depth,visited)
if type(fn)~="function"then return false end
if not depth or depth<=0 then return false end
visited=visited or{}
if visited[fn]then return false end
visited[fn]=true
for i=1,64 do
local name,val=attempt(getupvalue,fn,i)
if name==nil and val==nil then break end
if is_fn(val)then
if fn_matches_target(val)then return true end
if deep_upvalue_walk(val,depth-1,visited)then return true end
elseif is_tbl(val)then
for k,v in REAL.pairs(val)do
if is_fn(v)and fn_matches_target(v)then return true end
if is_tbl(v)then
for k2,v2 in REAL.pairs(v)do
if is_fn(v2)and fn_matches_target(v2)then return true end
end
end
end
end
end
return false
end
local function deep_gc_upvalue_sweep()
local ok,gc=pcall(getgc,true)
if not ok or not gc then return end
for i=1,#gc do
local obj=gc[i]
if is_fn(obj)and not is_cloaked(obj)then
if deep_upvalue_walk(obj,4)then
gut_function(obj)
bump("functions_gutted")
end
end
end
end
task.defer(function()
task.wait(1)
task.defer(deep_gc_upvalue_sweep)
end)
end
if Cap.getgc and Cap.getprotos and Cap.setconstant then
local function deep_proto_walk(fn,depth,visited)
if type(fn)~="function"then return false end
if not depth or depth<=0 then return false end
visited=visited or{}
if visited[fn]then return false end
visited[fn]=true
local protos=attempt(getprotos,fn)
if not protos then return false end
for i=1,#protos do
local p=protos[i]
if type(p)=="function"then
if fn_matches_target(p)then return true end
if deep_proto_walk(p,depth-1,visited)then return true end
end
end
return false
end
local function deep_gc_proto_sweep()
local ok,gc=pcall(getgc,true)
if not ok or not gc then return end
for i=1,#gc do
local obj=gc[i]
if is_fn(obj)and not is_cloaked(obj)then
if deep_proto_walk(obj,4)then
proto_gut_constants(obj)
gut_function(obj)
bump("functions_gutted")
end
end
end
end
task.defer(function()
task.wait(1)
task.defer(deep_gc_proto_sweep)
end)
end
local REAL_NEXT=next
next=clk(function(t,k)
if is_str(k)and kw_match_all(k)then return nil end
return REAL_NEXT(t,k)
end)
local REAL_PAIRS=pairs
pairs=clk(function(t)
if not is_tbl(t)then return REAL_PAIRS(t)end
local proxy={}
for k,v in REAL_NEXT,t,nil do
if is_str(k)and kw_match_all(k)then
else
proxy[k]=v
end
end
return REAL_NEXT,proxy,nil
end)
local REAL_IPAIRS=ipairs
ipairs=clk(function(t)
return REAL_IPAIRS(t)
end)
local REAL_SELECT=select
select=clk(function(...)return REAL_SELECT(...)end)
local REAL_GETFENV=getfenv
if REAL_GETFENV then
getfenv=clk(function(lvl)
local f=REAL_GETFENV(lvl)
if is_tbl(f)then
for k in REAL.pairs(f)do
if is_str(k)and kw_match_all(k)then
f[k]=nil
end
end
end
return f
end)
end
local REAL_SETFENV=setfenv
if REAL_SETFENV then
setfenv=clk(function(target,env)
if is_tbl(env)then
for k in REAL.pairs(env)do
if is_str(k)and kw_match_all(k)then
env[k]=nil
end
end
end
return REAL_SETFENV(target,env)
end)
end
if getgenv then
local REAL_GETGENV=getgenv
getgenv=clk(function()
local g=REAL_GETGENV()
if is_tbl(g)then
for k in REAL.pairs(g)do
if is_str(k)and kw_match_all(k)and k~="__RIVALS_AC_KILL"then
g[k]=nil
end
end
end
return g
end)
end
if getsenv then
local REAL_GETSENV=getsenv
getsenv=clk(function(scr)
local e=REAL_GETSENV(scr)
if is_tbl(e)then
for k in REAL.pairs(e)do
if is_str(k)and kw_match_all(k)then
e[k]=nil
end
end
end
return e
end)
end
if getmenv then
local REAL_GETMENV=getmenv
getmenv=clk(function(mod)
local e=REAL_GETMENV(mod)
if is_tbl(e)then
for k in REAL.pairs(e)do
if is_str(k)and kw_match_all(k)then
e[k]=nil
end
end
end
return e
end)
end
local REAL_OS_TIME=os.time
local REAL_OS_CLOCK=os.clock
os.time=clk(function(...)return REAL_OS_TIME(...)end)
os.clock=clk(function()return REAL_OS_CLOCK()end)
local REAL_OS_DATE=os.date
os.date=clk(function(...)return REAL_OS_DATE(...)end)
if os.difftime then
local REAL_OS_DIFFTIME=os.difftime
os.difftime=clk(function(...)return REAL_OS_DIFFTIME(...)end)
end
local function install_deep_watchers()
svc_CG.DescendantAdded:Connect(function(o)
if is_target_localscript(o)then
task.defer(function()
gut_localscript(o)
destroy_instance(o)
bump("scripts_killed")
end)
end
end)
svc_WS.DescendantAdded:Connect(function(o)
if is_target_localscript(o)then
task.defer(function()
gut_localscript(o)
destroy_instance(o)
bump("scripts_killed")
end)
end
if is_target_module(o)then
task.defer(function()
orphan_instance(o)
bump("modules_orphaned")
end)
end
end)
svc_PL.DescendantAdded:Connect(function(o)
if is_target_localscript(o)then
task.defer(function()
gut_localscript(o)
destroy_instance(o)
bump("scripts_killed")
end)
end
end)
end
install_deep_watchers()
install_game_namecall_deep()
install_ws_namecall_deep()
install_run_namecall_deep()
install_lp_namecall_deep()
install_services_namecall_deep()
local function reassert_deep_guards()
install_game_namecall_deep()
install_ws_namecall_deep()
install_run_namecall_deep()
install_lp_namecall_deep()
install_services_namecall_deep()
end
local function heartbeat_deeper()
while task.wait(3)do
attempt(reassert_deep_guards)
attempt(remote_sever_all)
end
end
local function heartbeat_ultra()
while task.wait(7)do
attempt(function()
if Cap.getgc then
deep_gc_upvalue_sweep()
deep_gc_proto_sweep()
end
end)
end
end
local function heartbeat_extreme()
while task.wait(20)do
attempt(function()
for _,o in ipairs(svc_CG:GetDescendants())do
if is_target_localscript(o)then
gut_localscript(o)
destroy_instance(o)
end
end
for _,o in ipairs(svc_WS:GetDescendants())do
if is_target_localscript(o)then
gut_localscript(o)
destroy_instance(o)
end
end
end)
end
end
local function heartbeat_full_scan()
while task.wait(45)do
attempt(function()
for _,o in ipairs(svc_game:GetDescendants())do
if is_target_any(o)then
if o:IsA("LocalScript")then
gut_localscript(o)
destroy_instance(o)
elseif o:IsA("ModuleScript")then
orphan_instance(o)
end
bump("scripts_killed")
end
end
end)
end
end
task.spawn(clk(heartbeat_deeper))
task.spawn(clk(heartbeat_ultra))
task.spawn(clk(heartbeat_extreme))
task.spawn(clk(heartbeat_full_scan))
local function install_instance_new_deep()
local REAL_INST=Instance.new
Instance.new=clk(function(cls,parent)
local i=REAL_INST(cls,parent)
if cls=="LocalScript"or cls=="ModuleScript"or cls=="Script"then
if parent then
local ok,n=pcall(function()return parent.Name end)
if ok and n and kw_match_all(n)then
attempt(function()i:Destroy()end)
bump("calls_blocked")
return nil
end
end
end
return i
end)
end
install_instance_new_deep()
local function install_waitfordescendant_deep()
local REAL_WFD=svc_game.WaitForDescendant
if REAL_WFD then
svc_game.WaitForDescendant=clk(function(self,n,t)
if is_str(n)and kw_match_all(n)then
bump("calls_blocked")
return nil
end
return REAL_WFD(self,n,t)
end)
end
end
install_waitfordescendant_deep()
local function install_findfirstancestor_deep()
local REAL_FFA=svc_game.FindFirstAncestor
if REAL_FFA then
svc_game.FindFirstAncestor=clk(function(self,n)
if is_str(n)and kw_match_all(n)then
bump("calls_blocked")
return nil
end
return REAL_FFA(self,n)
end)
end
end
install_findfirstancestor_deep()
local function install_getdescendants_deep()
local REAL_GD=svc_game.GetDescendants
if REAL_GD then
svc_game.GetDescendants=clk(function(self)
local list=REAL_GD(self)
if not list then return list end
local out={}
for i=1,#list do
local o=list[i]
if is_target_any(o)then
else
out[#out+1]=o
end
end
return out
end)
end
end
install_getdescendants_deep()
local function install_getchildren_deep()
local REAL_GC=svc_game.GetChildren
if REAL_GC then
svc_game.GetChildren=clk(function(self)
local list=REAL_GC(self)
if not list then return list end
local out={}
for i=1,#list do
local o=list[i]
if is_target_any(o)then
else
out[#out+1]=o
end
end
return out
end)
end
end
install_getchildren_deep()
local function install_rawget_deep()
local REAL_RAWGET=rawget
rawget=clk(function(t,k)
if is_str(k)and kw_match_all(k)then
local v=REAL_RAWGET(t,k)
if v==nil then return nil end
return v
end
return REAL_RAWGET(t,k)
end)
end
install_rawget_deep()
local function install_rawset_deep()
local REAL_RAWSET=rawset
rawset=clk(function(t,k,v)
if is_str(k)and kw_match_all(k)then
REAL_RAWSET(t,k,clk(function()return true end))
return t
end
return REAL_RAWSET(t,k,v)
end)
end
install_rawset_deep()
if Cap.getgc then
task.defer(function()
task.wait(2)
if Cap.getgc then
local ok,gc=pcall(getgc,true)
if ok and gc then
for i=1,#gc do
local obj=gc[i]
local t=type(obj)
if t=="function"then
if fn_matches_target(obj)and not is_cloaked(obj)then
gut_function(obj)
bump("functions_gutted")
end
elseif t=="thread"then
if th_matches_target(obj)then
gut_thread(obj)
bump("threads_closed")
end
elseif t=="table"then
if not is_cloaked(obj)then
for k,v in REAL.pairs(obj)do
if is_str(k)and kw_match_all(k)and is_fn(v)then
pcall(function()obj[k]=clk(function()return true end)end)
end
end
end
end
end
end
end
end)
end
local function final_deep_sweep()
if Cap.getgc then
local ok,gc=pcall(getgc,true)
if ok and gc then
for i=1,#gc do
local obj=gc[i]
local t=type(obj)
if t=="function"then
if not is_cloaked(obj)then
local src=fn_source(obj)
if src then
local ls=low(src)
for j=1,#KW_EXT do
if string.find(ls,KW_EXT[j],1,true)then
gut_function(obj)
bump("functions_gutted")
break
end
end
end
end
end
end
end
end
end
task.spawn(function()
while task.wait(15)do
attempt(final_deep_sweep)
end
end)
STATE.segments[6]=tick()-BOOT_T0
STATE.total_boot=tick()-BOOT_T0
STATE.boot_ok=true
if ENV then
ENV.__RIVALS_AC_KILL=STATE
ENV.__RIVALS_AC_VERSION="6.0.0"
end
]=]))
