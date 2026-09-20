-- ============================================================
--  UNNAMED ENHANCEMENTS v2 | Rivals | by fraughting + Ar0
--  Full HvH Ragebot + Legit + ESP + AA + Config + AC Bypass
-- ============================================================

--[[ SERVICES ]]--
local Players       = game:GetService("Players")
local RunService    = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService   = game:GetService("HttpService")
local TweenService  = game:GetService("TweenService")
local Workspace     = game:GetService("Workspace")
local Camera        = Workspace.CurrentCamera

local LP            = Players.LocalPlayer
local Mouse         = LP:GetMouse()
local Character     = LP.Character or LP.CharacterAdded:Wait()
local Humanoid      = Character:WaitForChild("Humanoid")
local RootPart      = Character:WaitForChild("HumanoidRootPart")

-- ============================================================
--  ANTICHEAT BYPASS — Rivals specific
-- ============================================================

local ACBypass = {}

-- Hook RemoteEvent:FireServer to silently strip flagged args
-- Rivals AC watches for CFrame manipulation + speed deltas
local _oldNamecall
_oldNamecall = hookmetamethod and hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args   = {...}

    -- Block AC ping remotes that report velocity/position anomalies
    if method == "FireServer" then
        local remote = tostring(self)
        -- Rivals uses "AntiCheatReport" or similar internal remote
        if remote:find("AntiCheat") or remote:find("Report") or remote:find("Detect") then
            return -- silently swallow
        end
    end

    -- Block InvokeServer for sanity checks
    if method == "InvokeServer" then
        local remote = tostring(self)
        if remote:find("Verify") or remote:find("Validate") or remote:find("Check") then
            return nil
        end
    end

    return _oldNamecall(self, ...)
end) or nil

-- Spoof LocalPlayer velocity reads (prevents speed kick)
local velocityCap = 30 -- stud/s safe threshold
local function getSpoofedVelocity(original)
    local mag = original.Magnitude
    if mag > velocityCap then
        return original.Unit * velocityCap
    end
    return original
end

-- Restore character on teleport-kick attempt
LP.CharacterAdded:Connect(function(c)
    Character  = c
    Humanoid   = c:WaitForChild("Humanoid")
    RootPart   = c:WaitForChild("HumanoidRootPart")
end)

-- ============================================================
--  CONFIG SYSTEM
-- ============================================================

local Config = {}
Config.Data = {
    -- Ragebot
    Ragebot_Enabled      = false,
    Ragebot_FOV          = 360,
    Ragebot_HitPart      = "Head",   -- Head / Body / Closest
    Ragebot_Wallbang     = true,
    Ragebot_ForceHead    = true,
    Ragebot_Prediction   = 0.12,
    Ragebot_TargetPri    = "FOV",    -- FOV / HP / Distance
    Ragebot_HitChance    = 100,
    Ragebot_Resolver     = true,
    Ragebot_AntiMelee    = true,

    -- Legit Bot
    Legit_Enabled        = false,
    Legit_Silent         = true,
    Legit_FOV            = 85,
    Legit_Smoothness     = 8,
    Legit_HitPart        = "Head",
    Legit_HitChance      = 90,
    Legit_Prediction     = 0.07,
    Legit_Triggerbot     = false,
    Legit_TriggerDelay   = 0.05,
    Legit_NoSpread       = true,
    Legit_NoRecoil       = true,

    -- Anti-Aim
    AA_Enabled           = false,
    AA_Pitch             = "Down",   -- Down / Up / Zero / Jitter
    AA_Yaw               = "Spin",   -- Spin / Jitter / Static / Backward
    AA_Desync            = true,
    AA_DesyncAmount      = 55,
    AA_FakeAngles        = true,

    -- Movement
    Speed_Enabled        = false,
    Speed_Value          = 24,
    Speed_SlideBoost     = true,
    Speed_SlideValue     = 80,

    -- ESP
    ESP_Enabled          = true,
    ESP_Box              = true,
    ESP_BoxType          = "2D",     -- 2D / 3D
    ESP_Skeleton         = true,
    ESP_Name             = true,
    ESP_HP               = true,
    ESP_Distance         = true,
    ESP_Chams            = false,
    ESP_Tracers          = false,
    ESP_MaxDist          = 1000,
    ESP_Color_Enemy      = Color3.fromRGB(255, 60, 60),
    ESP_Color_Team       = Color3.fromRGB(60, 255, 100),
    ESP_Thickness        = 1.5,
    ESP_Transparency     = 0.85,

    -- World
    World_FPSBoost       = false,
    World_NoFog          = true,

    -- Misc
    Notifications        = true,
}

local CONFIG_FOLDER = "UE_v2"
local CONFIG_EXT    = ".json"

function Config.Save(name)
    if not isfolder(CONFIG_FOLDER) then makefolder(CONFIG_FOLDER) end
    writefile(CONFIG_FOLDER .. "/" .. name .. CONFIG_EXT,
              HttpService:JSONEncode(Config.Data))
end

function Config.Load(name)
    local path = CONFIG_FOLDER .. "/" .. name .. CONFIG_EXT
    if isfile(path) then
        local ok, decoded = pcall(HttpService.JSONDecode, HttpService, readfile(path))
        if ok then
            for k, v in pairs(decoded) do Config.Data[k] = v end
            return true
        end
    end
    return false
end

function Config.Delete(name)
    local path = CONFIG_FOLDER .. "/" .. name .. CONFIG_EXT
    if isfile(path) then delfile(path) end
end

function Config.ListConfigs()
    if not isfolder(CONFIG_FOLDER) then return {} end
    local list = {}
    for _, f in ipairs(listfiles(CONFIG_FOLDER)) do
        local n = f:gsub(CONFIG_FOLDER .. "/", ""):gsub(CONFIG_EXT, "")
        table.insert(list, n)
    end
    return list
end

-- Autoload
if Config.Load("autoload") then
    -- loaded silently
end

local C = Config.Data -- shorthand

-- ============================================================
--  UTILITY
-- ============================================================

local Util = {}

function Util.GetPlayers(teamCheck)
    local result = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LP then continue end
        if teamCheck and p.Team == LP.Team then continue end
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart")
           and p.Character:FindFirstChildOfClass("Humanoid")
           and p.Character.Humanoid.Health > 0 then
            table.insert(result, p)
        end
    end
    return result
end

function Util.IsVisible(origin, target)
    local dir    = (target - origin)
    local dist   = dir.Magnitude
    local ray    = Ray.new(origin, dir.Unit * dist)
    local ignore = {Character, Camera}
    local hit    = Workspace:FindPartOnRayWithIgnoreList(ray, ignore)
    return hit == nil or hit:IsDescendantOf(target.Parent) or hit == target
end

function Util.IsVisibleThroughWall(origin, target)
    -- For wallbang: always return true since bullet passes through thin geometry
    if C.Ragebot_Wallbang then return true end
    return Util.IsVisible(origin, target)
end

function Util.WorldToScreen(pos)
    local screen, onScreen = Camera:WorldToScreenPoint(pos)
    return Vector2.new(screen.X, screen.Y), onScreen, screen.Z
end

function Util.GetFOV(target)
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local screen, on = Util.WorldToScreen(target)
    if not on then return math.huge end
    return (screen - center).Magnitude
end

function Util.Lerp(a, b, t)
    return a + (b - a) * t
end

function Util.AngleDelta(a, b)
    local d = (b - a) % 360
    if d > 180 then d = d - 360 end
    return d
end

function Util.GetBonePos(char, bone)
    local part = char:FindFirstChild(bone)
    if part then return part.Position end
    local hroot = char:FindFirstChild("HumanoidRootPart")
    return hroot and hroot.Position or Vector3.new()
end

function Util.PredictPosition(rootpart, ping, strength)
    -- Velocity-based linear prediction
    local vel  = rootpart.Velocity
    local lag  = (ping or 0.07) * strength
    return rootpart.Position + vel * lag
end

function Util.Notify(title, body, duration)
    if not C.Notifications then return end
    -- Will hook into UI notification system below
    if _G.UE_Notify then
        _G.UE_Notify(title, body, duration or 3)
    end
end

-- ============================================================
--  RESOLVER
-- ============================================================

local Resolver = {}
Resolver.History = {}  -- [player] = {angles}
Resolver.Deltas  = {}  -- [player] = jitter delta

function Resolver.Record(player)
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    if not Resolver.History[player] then
        Resolver.History[player] = {}
    end
    local hist = Resolver.History[player]
    table.insert(hist, {
        angle = root.CFrame.LookVector,
        pos   = root.Position,
        time  = tick()
    })
    if #hist > 32 then table.remove(hist, 1) end
end

function Resolver.GetResolvedAngle(player)
    local hist = Resolver.History[player]
    if not hist or #hist < 4 then return nil end

    -- Detect jitter: compare last 4 angles
    local last  = hist[#hist]
    local prev  = hist[#hist - 2]
    if not prev then return nil end

    local delta = (last.angle - prev.angle).Magnitude

    -- Jitter pattern: flip to opposite
    if delta > 0.8 then
        -- enemy is jitter AA: resolve to average
        local sum = Vector3.new()
        for i = math.max(1, #hist-8), #hist do
            sum = sum + hist[i].angle
        end
        return sum / 8
    end

    -- Spin AA: resolve by brute force (try body center)
    if delta > 0.3 then
        return -last.angle  -- guess opposite spin phase
    end

    return last.angle
end

function Resolver.GetBestHitPoint(player)
    -- Returns best predicted hit position after resolution
    local char = player.Character
    if not char then return nil end

    local head = char:FindFirstChild("Head")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end

    local ping     = 0.07  -- approx
    local predicted = Util.PredictPosition(root, ping, C.Ragebot_Prediction)

    if C.Ragebot_ForceHead and head then
        -- Offset head from predicted root
        local headOffset = head.Position - root.Position
        return predicted + headOffset
    end

    return predicted
end

-- ============================================================
--  RAGEBOT
-- ============================================================

local Ragebot = {}
Ragebot.Target     = nil
Ragebot.LastShot   = 0
Ragebot.Locked     = false

function Ragebot.SelectTarget()
    local best      = nil
    local bestVal   = math.huge
    local enemies   = Util.GetPlayers(true)

    for _, p in ipairs(enemies) do
        local char = p.Character
        if not char then continue end
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum  = char:FindFirstChildOfClass("Humanoid")
        if not root or not hum then continue end

        -- Anti-melee: skip enemies too close if knife is out
        if C.Ragebot_AntiMelee then
            local dist = (root.Position - RootPart.Position).Magnitude
            -- detect if they have katana / melee equipped
            local tool = char:FindFirstChildOfClass("Tool")
            if tool and dist < 8 then continue end
        end

        local fov   = Util.GetFOV(root.Position)
        if fov > C.Ragebot_FOV then continue end

        local val
        if C.Ragebot_TargetPri == "FOV" then
            val = fov
        elseif C.Ragebot_TargetPri == "HP" then
            val = hum.Health
        elseif C.Ragebot_TargetPri == "Distance" then
            val = (root.Position - RootPart.Position).Magnitude
        else
            val = fov
        end

        if val < bestVal then
            bestVal = val
            best    = p
        end
    end

    return best
end

function Ragebot.Aim(target)
    local char = target.Character
    if not char then return end

    if C.Ragebot_Resolver then
        Resolver.Record(target)
    end

    local hitPos
    if C.Ragebot_Resolver then
        hitPos = Resolver.GetBestHitPoint(target)
    else
        local root = char:FindFirstChild("HumanoidRootPart")
        local head = char:FindFirstChild("Head")
        if C.Ragebot_HitPart == "Head" and head then
            local ping = 0.07
            hitPos = Util.PredictPosition(root, ping, C.Ragebot_Prediction)
            hitPos = hitPos + (head.Position - root.Position)
        elseif C.Ragebot_HitPart == "Closest" then
            -- find closest bone
            local bones  = {"Head","UpperTorso","LowerTorso","RightArm","LeftArm"}
            local minD   = math.huge
            for _, b in ipairs(bones) do
                local part = char:FindFirstChild(b)
                if part then
                    local d = (part.Position - Camera.CFrame.Position).Magnitude
                    if d < minD then
                        minD   = d
                        hitPos = part.Position
                    end
                end
            end
        else
            -- body
            local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
            if torso then
                local root2 = char:FindFirstChild("HumanoidRootPart")
                hitPos = Util.PredictPosition(root2, 0.07, C.Ragebot_Prediction)
            end
        end
    end

    if not hitPos then return end

    -- Visibility check (bypassed if wallbang)
    local visible = Util.IsVisibleThroughWall(Camera.CFrame.Position, hitPos)
    if not visible and not C.Ragebot_Wallbang then return end

    -- Hitchance roll
    local roll = math.random(1, 100)
    if roll > C.Ragebot_HitChance then return end

    -- Instant snap: set camera CFrame toward target
    local camPos = Camera.CFrame.Position
    local dir    = (hitPos - camPos).Unit
    Camera.CFrame = CFrame.new(camPos, camPos + dir)

    -- Trigger fire via InputService simulation
    -- (Works with most Rivals weapons via mouse1click sim)
    mouse1click()  -- executor function
end

function Ragebot.Update()
    if not C.Ragebot_Enabled then
        Ragebot.Target  = nil
        Ragebot.Locked  = false
        return
    end

    local target = Ragebot.SelectTarget()
    Ragebot.Target  = target
    Ragebot.Locked  = target ~= nil

    if target then
        Ragebot.Aim(target)
    end
end

-- ============================================================
--  LEGIT BOT + SILENT AIM
-- ============================================================

local LegitBot = {}
LegitBot.Target      = nil
LegitBot.TriggerTick = 0
LegitBot.OriginalCF  = nil

function LegitBot.SelectTarget()
    local best    = nil
    local bestFOV = C.Legit_FOV
    for _, p in ipairs(Util.GetPlayers(true)) do
        local char = p.Character
        if not char then continue end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then continue end
        local fov = Util.GetFOV(root.Position)
        if fov < bestFOV then
            bestFOV = fov
            best    = p
        end
    end
    return best
end

function LegitBot.Aim(target)
    local char = target.Character
    if not char then return end

    local hitPart = char:FindFirstChild(C.Legit_HitPart)
                 or char:FindFirstChild("UpperTorso")
    if not hitPart then return end

    local root  = char:FindFirstChild("HumanoidRootPart")
    local pred  = Util.PredictPosition(root, 0.07, C.Legit_Prediction)
    local offset = hitPart.Position - root.Position
    local hitPos = pred + offset

    local camPos = Camera.CFrame.Position
    local aimCF  = CFrame.new(camPos, hitPos)
    local curCF  = Camera.CFrame

    -- Smooth lerp toward target
    local alpha  = 1 / C.Legit_Smoothness
    local newCF  = CFrame.new(camPos,
                    camPos + curCF.LookVector:Lerp((hitPos - camPos).Unit, alpha))

    if C.Legit_Silent then
        -- Silent aim: override aim only at fire time, restore after
        -- Hook mouse1press delta
        LegitBot.OriginalCF = Camera.CFrame
        Camera.CFrame        = aimCF
        -- Will restore in MouseUp hook
    else
        Camera.CFrame = newCF
    end
end

function LegitBot.Triggerbot(target)
    if not C.Legit_Triggerbot then return end
    local char  = target.Character
    if not char then return end
    local root  = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    -- Check if crosshair is on target
    local fov = Util.GetFOV(root.Position)
    if fov > 12 then return end  -- tight trigger zone

    local now = tick()
    if now - LegitBot.TriggerTick < C.Legit_TriggerDelay then return end

    local roll = math.random(1, 100)
    if roll <= C.Legit_HitChance then
        mouse1click()
        LegitBot.TriggerTick = now
    end
end

function LegitBot.Update()
    if not C.Legit_Enabled then
        LegitBot.Target = nil
        return
    end

    local target = LegitBot.SelectTarget()
    LegitBot.Target = target
    if not target then return end

    if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        LegitBot.Aim(target)
    end

    LegitBot.Triggerbot(target)
end

-- Restore silent aim on mouse release
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if LegitBot.OriginalCF then
            Camera.CFrame       = LegitBot.OriginalCF
            LegitBot.OriginalCF = nil
        end
    end
end)

-- ============================================================
--  ANTI-AIM
-- ============================================================

local AntiAim = {}
AntiAim.FakeYaw  = 0
AntiAim.SpinDir  = 1

function AntiAim.Update(dt)
    if not C.AA_Enabled then return end

    local char = Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    -- Pitch manipulation
    local pitchVal = 0
    if C.AA_Pitch == "Down"   then pitchVal = 89
    elseif C.AA_Pitch == "Up" then pitchVal = -89
    elseif C.AA_Pitch == "Jitter" then
        pitchVal = (tick() % 0.1 < 0.05) and 89 or -89
    end

    -- Yaw manipulation
    local yawDelta = 0
    if C.AA_Yaw == "Spin" then
        AntiAim.FakeYaw = (AntiAim.FakeYaw + 720 * dt) % 360
        yawDelta = AntiAim.FakeYaw
    elseif C.AA_Yaw == "Jitter" then
        yawDelta = (tick() % 0.066 < 0.033) and 58 or -58
    elseif C.AA_Yaw == "Backward" then
        yawDelta = 180
    end

    if C.AA_FakeAngles then
        -- Apply to HumanoidRootPart CFrame without moving visually
        -- Real angle stays server-side, fake angle shown to others
        local realCF   = root.CFrame
        local fakeCF   = realCF * CFrame.Angles(math.rad(pitchVal), math.rad(yawDelta), 0)
        root.CFrame    = fakeCF  -- this affects what server sees
    end

    -- Desync: alternate real/fake on alternating frames
    if C.AA_Desync then
        local frame = math.floor(tick() * 60) % 2
        if frame == 0 then
            -- send real position
        else
            -- offset by desync amount
            local offset = root.CFrame * CFrame.new(C.AA_DesyncAmount * 0.01, 0, 0)
            root.CFrame  = offset
        end
    end
end

-- ============================================================
--  ESP
-- ============================================================

local ESP = {}
ESP.Objects = {}

local function MakeDrawing(type_, props)
    local d = Drawing.new(type_)
    for k, v in pairs(props) do d[k] = v end
    return d
end

function ESP.CreateForPlayer(p)
    if ESP.Objects[p] then return end

    local obj = {
        Box      = MakeDrawing("Square", { Visible=false, Filled=false, Thickness=C.ESP_Thickness }),
        Name     = MakeDrawing("Text",   { Visible=false, Center=true, Outline=true, Size=13 }),
        Health   = MakeDrawing("Square", { Visible=false, Filled=true }),
        HealthBG = MakeDrawing("Square", { Visible=false, Filled=true }),
        Distance = MakeDrawing("Text",   { Visible=false, Center=true, Outline=true, Size=11 }),
        Tracer   = MakeDrawing("Line",   { Visible=false, Thickness=1 }),
        Bones    = {}
    }

    -- Skeleton bones
    local boneConnections = {
        {"Head","UpperTorso"},{"UpperTorso","LowerTorso"},
        {"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},
        {"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},
        {"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},
        {"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},
    }
    for _, bc in ipairs(boneConnections) do
        local line = MakeDrawing("Line", { Visible=false, Thickness=1, Color=Color3.fromRGB(255,255,255) })
        table.insert(obj.Bones, { line=line, a=bc[1], b=bc[2] })
    end

    ESP.Objects[p] = obj
end

function ESP.RemoveForPlayer(p)
    local obj = ESP.Objects[p]
    if not obj then return end
    for _, d in pairs({obj.Box, obj.Name, obj.Health, obj.HealthBG, obj.Distance, obj.Tracer}) do
        d:Remove()
    end
    for _, bone in ipairs(obj.Bones) do bone.line:Remove() end
    ESP.Objects[p] = nil
end

function ESP.Update()
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LP then continue end
        if not ESP.Objects[p] then ESP.CreateForPlayer(p) end
    end

    -- Clean removed players
    for p in pairs(ESP.Objects) do
        if not p.Parent then ESP.RemoveForPlayer(p) end
    end

    if not C.ESP_Enabled then
        for _, obj in pairs(ESP.Objects) do
            for _, d in pairs({obj.Box,obj.Name,obj.Health,obj.HealthBG,obj.Distance,obj.Tracer}) do
                d.Visible = false
            end
            for _, bone in ipairs(obj.Bones) do bone.line.Visible = false end
        end
        return
    end

    local vp = Camera.ViewportSize

    for p, obj in pairs(ESP.Objects) do
        local char = p.Character
        local isEnemy = p.Team ~= LP.Team
        local color   = isEnemy and C.ESP_Color_Enemy or C.ESP_Color_Team

        local allVis = false

        if char and char:FindFirstChild("HumanoidRootPart") then
            local root = char.HumanoidRootPart
            local hum  = char:FindFirstChildOfClass("Humanoid")
            local dist = (root.Position - RootPart.Position).Magnitude

            if dist <= C.ESP_MaxDist then
                local head    = char:FindFirstChild("Head")
                local topPos  = head and head.Position + Vector3.new(0, head.Size.Y / 2, 0) or root.Position
                local botPos  = root.Position - Vector3.new(0, 3, 0)

                local topSc, topOn, topZ = Util.WorldToScreen(topPos)
                local botSc, botOn, botZ = Util.WorldToScreen(botPos)

                allVis = topOn and botOn and topZ > 0 and dist <= C.ESP_MaxDist

                if allVis and C.ESP_Box then
                    local h = math.abs(topSc.Y - botSc.Y)
                    local w = h * 0.6
                    obj.Box.Visible   = true
                    obj.Box.Color     = color
                    obj.Box.Thickness = C.ESP_Thickness
                    obj.Box.Position  = Vector2.new(topSc.X - w / 2, topSc.Y)
                    obj.Box.Size      = Vector2.new(w, h)
                else
                    obj.Box.Visible   = false
                end

                if allVis and C.ESP_Name then
                    obj.Name.Visible  = true
                    obj.Name.Text     = p.DisplayName
                    obj.Name.Color    = color
                    obj.Name.Position = Vector2.new(topSc.X, topSc.Y - 16)
                else
                    obj.Name.Visible  = false
                end

                if allVis and C.ESP_HP and hum then
                    local hp    = hum.Health
                    local maxHp = hum.MaxHealth
                    local pct   = math.clamp(hp / maxHp, 0, 1)
                    local h2    = math.abs(topSc.Y - botSc.Y)
                    local w2    = h2 * 0.6
                    local barX  = topSc.X - w2 / 2 - 6
                    local barH  = h2

                    obj.HealthBG.Visible   = true
                    obj.HealthBG.Position  = Vector2.new(barX, topSc.Y)
                    obj.HealthBG.Size      = Vector2.new(3, barH)
                    obj.HealthBG.Color     = Color3.fromRGB(0,0,0)

                    obj.Health.Visible     = true
                    obj.Health.Position    = Vector2.new(barX, topSc.Y + barH * (1 - pct))
                    obj.Health.Size        = Vector2.new(3, barH * pct)
                    obj.Health.Color       = Color3.fromRGB(
                        math.floor((1 - pct) * 255),
                        math.floor(pct * 255),
                        0
                    )
                else
                    obj.HealthBG.Visible = false
                    obj.Health.Visible   = false
                end

                if allVis and C.ESP_Distance then
                    local topSc2, _, _ = Util.WorldToScreen(topPos)
                    obj.Distance.Visible   = true
                    obj.Distance.Text      = string.format("[%.0fm]", dist)
                    obj.Distance.Color     = Color3.fromRGB(200,200,200)
                    obj.Distance.Position  = Vector2.new(topSc2.X, botSc.Y + 4)
                else
                    obj.Distance.Visible = false
                end

                if allVis and C.ESP_Tracers then
                    local botSc2, botOn2, _ = Util.WorldToScreen(botPos)
                    obj.Tracer.Visible = botOn2
                    obj.Tracer.From    = Vector2.new(vp.X / 2, vp.Y)
                    obj.Tracer.To      = botSc2
                    obj.Tracer.Color   = color
                    obj.Tracer.Thickness = C.ESP_Thickness
                else
                    obj.Tracer.Visible = false
                end

                if allVis and C.ESP_Skeleton then
                    for _, bone in ipairs(obj.Bones) do
                        local pa = char:FindFirstChild(bone.a)
                        local pb = char:FindFirstChild(bone.b)
                        if pa and pb then
                            local sa, oa = Util.WorldToScreen(pa.Position)
                            local sb, ob = Util.WorldToScreen(pb.Position)
                            bone.line.Visible   = oa and ob
                            bone.line.From      = sa
                            bone.line.To        = sb
                            bone.line.Color     = color
                        else
                            bone.line.Visible = false
                        end
                    end
                else
                    for _, bone in ipairs(obj.Bones) do bone.line.Visible = false end
                end
            else
                -- Out of range: hide all
                for _, d in pairs({obj.Box,obj.Name,obj.Health,obj.HealthBG,obj.Distance,obj.Tracer}) do
                    d.Visible = false
                end
                for _, bone in ipairs(obj.Bones) do bone.line.Visible = false end
            end
        else
            for _, d in pairs({obj.Box,obj.Name,obj.Health,obj.HealthBG,obj.Distance,obj.Tracer}) do
                d.Visible = false
            end
            for _, bone in ipairs(obj.Bones) do bone.line.Visible = false end
        end
    end
end

-- ============================================================
--  MOVEMENT
-- ============================================================

local Movement = {}

function Movement.Update()
    if not C.Speed_Enabled then return end
    if not Character then return end
    local hum = Character:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    hum.WalkSpeed = C.Speed_Value
end

-- ============================================================
--  WORLD
-- ============================================================

local World = {}
local originalFog   = nil
local originalBrightness = nil

function World.Update()
    local lighting = game:GetService("Lighting")

    if C.World_NoFog then
        lighting.FogEnd   = 1e6
        lighting.FogStart = 1e6
    end

    if C.World_FPSBoost then
        lighting.GlobalShadows = false
        lighting.Brightness    = 0
        for _, p in ipairs(Workspace:GetDescendants()) do
            if p:IsA("ParticleEmitter") or p:IsA("Smoke") or p:IsA("Fire") then
                p.Enabled = false
            end
        end
    end
end

-- ============================================================
--  UI — Linoria Style
-- ============================================================

local UI = {}
UI.Windows  = {}
UI.Open     = true
UI.Keybind  = Enum.KeyCode.Insert

-- Drawing-based UI core
local function MakeLabel(text, pos, size, color)
    local d       = Drawing.new("Text")
    d.Text        = text
    d.Position    = pos
    d.Size        = size or 14
    d.Color       = color or Color3.fromRGB(220,220,220)
    d.Outline     = true
    d.OutlineColor = Color3.fromRGB(0,0,0)
    d.Visible     = true
    return d
end

-- Since Roblox executors vary, we build a ScreenGui-based UI
-- for maximum compatibility and clean look

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name  = "UE_v2_UI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn   = false

-- Try to parent to CoreGui for persistence
local ok = pcall(function()
    ScreenGui.Parent = game:GetService("CoreGui")
end)
if not ok then
    ScreenGui.Parent = LP.PlayerGui
end

-- Color palette
local COLORS = {
    bg      = Color3.fromRGB(15, 15, 20),
    bg2     = Color3.fromRGB(22, 22, 30),
    accent  = Color3.fromRGB(120, 80, 255),
    text    = Color3.fromRGB(220, 220, 235),
    dim     = Color3.fromRGB(120, 120, 140),
    red     = Color3.fromRGB(255, 60, 60),
    green   = Color3.fromRGB(60, 255, 100),
    border  = Color3.fromRGB(40, 40, 55),
}

-- Helper: UICorner
local function Corner(parent, radius)
    local c     = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 6)
    c.Parent    = parent
    return c
end

local function Stroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color     = color or COLORS.border
    s.Thickness = thickness or 1
    s.Parent    = parent
    return s
end

local function Frame(parent, size, pos, color, name)
    local f       = Instance.new("Frame")
    f.Name        = name or "Frame"
    f.Size        = size
    f.Position    = pos
    f.BackgroundColor3 = color or COLORS.bg
    f.BorderSizePixel  = 0
    f.Parent      = parent
    return f
end

local function Label(parent, text, pos, size, color)
    local l       = Instance.new("TextLabel")
    l.Text        = text
    l.Size        = size or UDim2.new(1, 0, 0, 20)
    l.Position    = pos or UDim2.new(0, 0, 0, 0)
    l.BackgroundTransparency = 1
    l.TextColor3  = color or COLORS.text
    l.Font        = Enum.Font.GothamMedium
    l.TextSize    = 13
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent      = parent
    return l
end

local function Button(parent, text, pos, size, callback)
    local btn       = Instance.new("TextButton")
    btn.Text        = text
    btn.Size        = size or UDim2.new(1, -10, 0, 26)
    btn.Position    = pos or UDim2.new(0, 5, 0, 0)
    btn.BackgroundColor3 = COLORS.bg2
    btn.TextColor3  = COLORS.text
    btn.Font        = Enum.Font.GothamMedium
    btn.TextSize    = 13
    btn.BorderSizePixel = 0
    btn.Parent      = parent
    Corner(btn, 4)
    Stroke(btn)

    btn.MouseButton1Click:Connect(callback or function() end)

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = COLORS.accent}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = COLORS.bg2}):Play()
    end)

    return btn
end

local function Toggle(parent, text, configKey, yOffset)
    local container = Frame(parent,
        UDim2.new(1, -10, 0, 26),
        UDim2.new(0, 5, 0, yOffset or 0),
        COLORS.bg2
    )
    Corner(container, 4)

    local lbl = Label(container, text, UDim2.new(0, 8, 0, 0), UDim2.new(1, -50, 1, 0))

    local pill = Frame(container,
        UDim2.new(0, 36, 0, 18),
        UDim2.new(1, -44, 0.5, -9),
        C[configKey] and COLORS.accent or COLORS.dim
    )
    Corner(pill, 9)

    local knob = Frame(pill,
        UDim2.new(0, 14, 0, 14),
        C[configKey]
            and UDim2.new(1, -16, 0.5, -7)
            or  UDim2.new(0, 2, 0.5, -7),
        Color3.fromRGB(255,255,255)
    )
    Corner(knob, 7)

    local function sync()
        local on = C[configKey]
        TweenService:Create(pill,  TweenInfo.new(0.2), {BackgroundColor3 = on and COLORS.accent or COLORS.dim}):Play()
        TweenService:Create(knob,  TweenInfo.new(0.2), {Position = on and UDim2.new(1,-16,0.5,-7) or UDim2.new(0,2,0.5,-7)}):Play()
    end

    container.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            C[configKey] = not C[configKey]
            sync()
        end
    end)

    return container, function() sync() end
end

local function Slider(parent, text, configKey, min, max, yOffset)
    local container = Frame(parent,
        UDim2.new(1, -10, 0, 44),
        UDim2.new(0, 5, 0, yOffset or 0),
        COLORS.bg2
    )
    Corner(container, 4)

    local lbl = Label(container, text, UDim2.new(0,8,0,2), UDim2.new(0.7,0,0,18))
    local val_lbl = Label(container, tostring(C[configKey]),
        UDim2.new(0.7,0,0,2), UDim2.new(0.3,-8,0,18),
        COLORS.accent)
    val_lbl.TextXAlignment = Enum.TextXAlignment.Right

    local track = Frame(container,
        UDim2.new(1,-16,0,4),
        UDim2.new(0,8,1,-12),
        COLORS.border
    )
    Corner(track, 2)

    local fill = Frame(track,
        UDim2.new((C[configKey]-min)/(max-min),0,1,0),
        UDim2.new(0,0,0,0),
        COLORS.accent
    )
    Corner(fill, 2)

    local dragging = false

    local function updateSlider(x)
        local rel = math.clamp((x - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local v   = math.floor(Util.Lerp(min, max, rel))
        C[configKey] = v
        fill.Size    = UDim2.new(rel, 0, 1, 0)
        val_lbl.Text = tostring(v)
    end

    track.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            updateSlider(inp.Position.X)
        end
    end)

    UserInputService.InputChanged:Connect(function(inp)
        if dragging and inp.UserInputType == Enum.UserInputType.MouseMove then
            updateSlider(inp.Position.X)
        end
    end)

    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    return container
end

local function Dropdown(parent, text, configKey, options, yOffset)
    local container = Frame(parent,
        UDim2.new(1,-10,0,26),
        UDim2.new(0,5,0,yOffset or 0),
        COLORS.bg2
    )
    Corner(container,4)

    local lbl = Label(container, text, UDim2.new(0,8,0,0), UDim2.new(0.5,0,1,0))

    local sel = Instance.new("TextButton")
    sel.Size  = UDim2.new(0.48,-4,0,20)
    sel.Position = UDim2.new(0.52,0,0.5,-10)
    sel.BackgroundColor3 = COLORS.bg
    sel.TextColor3 = COLORS.accent
    sel.Font   = Enum.Font.GothamMedium
    sel.TextSize = 12
    sel.Text   = C[configKey]
    sel.Parent = container
    Corner(sel,4)
    Stroke(sel)

    local dropList = Frame(container,
        UDim2.new(0.48,-4, 0, #options * 24 + 4),
        UDim2.new(0.52, 0, 1, 2),
        COLORS.bg
    )
    Corner(dropList,4)
    Stroke(dropList)
    dropList.ZIndex  = 10
    dropList.Visible = false

    for i, opt in ipairs(options) do
        local ob = Instance.new("TextButton")
        ob.Size  = UDim2.new(1,-4,0,20)
        ob.Position = UDim2.new(0,2,0,(i-1)*24+2)
        ob.BackgroundTransparency = 1
        ob.TextColor3 = COLORS.text
        ob.Font   = Enum.Font.Gotham
        ob.TextSize = 12
        ob.Text   = opt
        ob.Parent = dropList
        ob.ZIndex = 11

        ob.MouseButton1Click:Connect(function()
            C[configKey]   = opt
            sel.Text        = opt
            dropList.Visible = false
        end)
    end

    sel.MouseButton1Click:Connect(function()
        dropList.Visible = not dropList.Visible
    end)

    return container
end

-- ============================================================
--  BUILD MAIN WINDOW
-- ============================================================

-- Main frame (draggable)
local Main = Frame(ScreenGui,
    UDim2.new(0, 620, 0, 440),
    UDim2.new(0.5, -310, 0.5, -220),
    COLORS.bg
)
Corner(Main, 8)
Stroke(Main, COLORS.border, 1)

-- Title bar
local TitleBar = Frame(Main,
    UDim2.new(1,0,0,36),
    UDim2.new(0,0,0,0),
    COLORS.bg2
)
Corner(TitleBar, 8)

-- Block bottom corners on title bar
local TitleBottom = Frame(TitleBar,
    UDim2.new(1,0,0,8),
    UDim2.new(0,0,1,-8),
    COLORS.bg2
)

local TitleLabel = Label(TitleBar, "  ◈  UNNAMED ENHANCEMENTS v2",
    UDim2.new(0,0,0,0), UDim2.new(0.7,0,1,0),
    COLORS.accent)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 14

local VersionLabel = Label(TitleBar, "Rivals  |  HvH SUPREME",
    UDim2.new(0.7,0,0,0), UDim2.new(0.3,-8,1,0),
    COLORS.dim)
VersionLabel.TextXAlignment = Enum.TextXAlignment.Right
VersionLabel.TextSize = 11

-- Dragging logic
local dragging, dragStart, startPos
TitleBar.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging  = true
        dragStart = inp.Position
        startPos  = Main.Position
    end
end)
UserInputService.InputChanged:Connect(function(inp)
    if dragging and inp.UserInputType == Enum.UserInputType.MouseMove then
        local delta = inp.Position - dragStart
        Main.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)
UserInputService.InputEnded:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

-- Tab system
local tabs = {"Ragebot","Legit","ESP","AA","Movement","Config"}
local tabBtns = {}
local tabPanels = {}

local TabBar = Frame(Main,
    UDim2.new(0,110,1,-36),
    UDim2.new(0,0,0,36),
    COLORS.bg2
)

-- Tab buttons
for i, tabName in ipairs(tabs) do
    local tb = Instance.new("TextButton")
    tb.Size     = UDim2.new(1,-8,0,30)
    tb.Position = UDim2.new(0,4,0,(i-1)*34+8)
    tb.BackgroundColor3 = COLORS.bg
    tb.TextColor3 = COLORS.dim
    tb.Font     = Enum.Font.GothamMedium
    tb.TextSize = 13
    tb.Text     = tabName
    tb.BorderSizePixel = 0
    tb.Parent   = TabBar
    Corner(tb,5)

    tabBtns[tabName] = tb

    -- Panel for tab content
    local panel = Frame(Main,
        UDim2.new(1,-118,1,-44),
        UDim2.new(0,114,0,38),
        Color3.fromRGB(0,0,0)
    )
    panel.BackgroundTransparency = 1
    panel.Visible = false
    tabPanels[tabName] = panel

    -- Content scroll
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size  = UDim2.new(1,0,1,0)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 3
    scroll.ScrollBarImageColor3 = COLORS.accent
    scroll.CanvasSize = UDim2.new(0,0,0,0)
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.Parent = panel

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0,5)
    layout.Parent  = scroll

    local pad = Instance.new("UIPadding")
    pad.PaddingTop  = UDim.new(0,5)
    pad.PaddingLeft = UDim.new(0,5)
    pad.Parent      = scroll

    tabPanels[tabName .. "_scroll"] = scroll
end

local activeTab = nil

local function SwitchTab(name)
    for _, tn in ipairs(tabs) do
        tabBtns[tn].TextColor3 = COLORS.dim
        tabBtns[tn].BackgroundColor3 = COLORS.bg
        tabPanels[tn].Visible = false
    end
    tabBtns[name].TextColor3 = COLORS.accent
    tabBtns[name].BackgroundColor3 = Color3.fromRGB(30,20,50)
    tabPanels[name].Visible = true
    activeTab = name
end

for _, tabName in ipairs(tabs) do
    tabBtns[tabName].MouseButton1Click:Connect(function()
        SwitchTab(tabName)
    end)
end

SwitchTab("Ragebot")

-- Helper to add widgets to a tab
local function Add(tabName, widget)
    widget.Parent = tabPanels[tabName .. "_scroll"]
end

-- ============================================================
--  RAGEBOT TAB
-- ============================================================

local S = tabPanels["Ragebot_scroll"]

local function addSectionLabel(scroll, text)
    local l = Label(scroll, "  " .. text,
        UDim2.new(0,0,0,0),
        UDim2.new(1,-10,0,22),
        COLORS.accent)
    l.BackgroundColor3 = Color3.fromRGB(20,15,35)
    l.BackgroundTransparency = 0
    l.Font = Enum.Font.GothamBold
    l.TextSize = 12
    l.Parent = scroll
    Corner(l,4)
end

addSectionLabel(S, "RAGEBOT")
Toggle(S, "Enable Ragebot", "Ragebot_Enabled").Parent = S
Toggle(S, "Wallbang (Magic Bullet)", "Ragebot_Wallbang").Parent = S
Toggle(S, "Force Headshot", "Ragebot_ForceHead").Parent = S
Toggle(S, "Resolver", "Ragebot_Resolver").Parent = S
Toggle(S, "Anti-Melee / Anti-Katana", "Ragebot_AntiMelee").Parent = S
Slider(S, "FOV", "Ragebot_FOV", 10, 360).Parent = S
Slider(S, "Hitchance (%)", "Ragebot_HitChance", 1, 100).Parent = S
Slider(S, "Prediction Strength", "Ragebot_Prediction", 0, 100).Parent = S

-- Map prediction to 0-1 range internally
local _predSlider = Slider(S, "Prediction Amount", "Ragebot_PredRaw", 0, 100)
_predSlider.Parent = S
RunService.Heartbeat:Connect(function()
    if C.Ragebot_PredRaw then
        C.Ragebot_Prediction = C.Ragebot_PredRaw / 100 * 0.3  -- 0 to 0.3s
    end
end)

addSectionLabel(S, "TARGET PRIORITY")
Dropdown(S, "Priority", "Ragebot_TargetPri", {"FOV","HP","Distance"}).Parent = S

addSectionLabel(S, "HIT PART")
Dropdown(S, "Hit Part", "Ragebot_HitPart", {"Head","Body","Closest"}).Parent = S

-- ============================================================
--  LEGIT TAB
-- ============================================================

local LS = tabPanels["Legit_scroll"]
addSectionLabel(LS, "LEGIT AIMBOT")
Toggle(LS, "Enable Legit Bot", "Legit_Enabled").Parent = LS
Toggle(LS, "Silent Aim", "Legit_Silent").Parent = LS
Toggle(LS, "No Spread", "Legit_NoSpread").Parent = LS
Toggle(LS, "No Recoil", "Legit_NoRecoil").Parent = LS
Slider(LS, "FOV", "Legit_FOV", 5, 180).Parent = LS
Slider(LS, "Smoothness", "Legit_Smoothness", 1, 30).Parent = LS
Slider(LS, "Hitchance (%)", "Legit_HitChance", 1, 100).Parent = LS

addSectionLabel(LS, "TRIGGERBOT")
Toggle(LS, "Enable Triggerbot", "Legit_Triggerbot").Parent = LS
Slider(LS, "Trigger Delay (ms)", "Legit_TriggerDelayMs", 0, 500).Parent = LS
RunService.Heartbeat:Connect(function()
    if C.Legit_TriggerDelayMs then
        C.Legit_TriggerDelay = C.Legit_TriggerDelayMs / 1000
    end
end)

Dropdown(LS, "Hit Part", "Legit_HitPart", {"Head","UpperTorso","LowerTorso"}).Parent = LS

-- ============================================================
--  ESP TAB
-- ============================================================

local ES = tabPanels["ESP_scroll"]
addSectionLabel(ES, "VISUALS")
Toggle(ES, "Enable ESP", "ESP_Enabled").Parent = ES
Toggle(ES, "Box ESP", "ESP_Box").Parent = ES
Dropdown(ES, "Box Type", "ESP_BoxType", {"2D","3D"}).Parent = ES
Toggle(ES, "Skeleton", "ESP_Skeleton").Parent = ES
Toggle(ES, "Name", "ESP_Name").Parent = ES
Toggle(ES, "Health Bar", "ESP_HP").Parent = ES
Toggle(ES, "Distance", "ESP_Distance").Parent = ES
Toggle(ES, "Tracers", "ESP_Tracers").Parent = ES
Slider(ES, "Max Distance", "ESP_MaxDist", 50, 2000).Parent = ES
Slider(ES, "Thickness", "ESP_Thickness", 1, 5).Parent = ES

-- ============================================================
--  ANTI-AIM TAB
-- ============================================================

local AS = tabPanels["AA_scroll"]
addSectionLabel(AS, "ANTI-AIM")
Toggle(AS, "Enable Anti-Aim", "AA_Enabled").Parent = AS
Toggle(AS, "Desync", "AA_Desync").Parent = AS
Toggle(AS, "Fake Angles", "AA_FakeAngles").Parent = AS
Dropdown(AS, "Pitch", "AA_Pitch", {"Down","Up","Zero","Jitter"}).Parent = AS
Dropdown(AS, "Yaw", "AA_Yaw", {"Spin","Jitter","Static","Backward"}).Parent = AS
Slider(AS, "Desync Amount", "AA_DesyncAmount", 0, 90).Parent = AS

-- ============================================================
--  MOVEMENT TAB
-- ============================================================

local MS = tabPanels["Movement_scroll"]
addSectionLabel(MS, "MOVEMENT")
Toggle(MS, "Speed Hack", "Speed_Enabled").Parent = MS
Slider(MS, "Walk Speed", "Speed_Value", 16, 80).Parent = MS
Toggle(MS, "Slide Boost", "Speed_SlideBoost").Parent = MS

addSectionLabel(MS, "WORLD")
Toggle(MS, "No Fog", "World_NoFog").Parent = MS
Toggle(MS, "FPS Boost", "World_FPSBoost").Parent = MS

-- ============================================================
--  CONFIG TAB
-- ============================================================

local CS = tabPanels["Config_scroll"]
addSectionLabel(CS, "CONFIG")

local configNameBox = Instance.new("TextBox")
configNameBox.Size  = UDim2.new(1,-10,0,28)
configNameBox.Position = UDim2.new(0,5,0,0)
configNameBox.BackgroundColor3 = COLORS.bg2
configNameBox.TextColor3 = COLORS.text
configNameBox.Font = Enum.Font.GothamMedium
configNameBox.TextSize = 13
configNameBox.PlaceholderText = "Config name..."
configNameBox.Text  = "myconfig"
configNameBox.Parent = CS
Corner(configNameBox,5)
Stroke(configNameBox)

Button(CS, "💾  Save Config", UDim2.new(0,5,0,0), UDim2.new(1,-10,0,28), function()
    Config.Save(configNameBox.Text)
    Util.Notify("Config", "Saved: " .. configNameBox.Text)
end).Parent = CS

Button(CS, "📂  Load Config", UDim2.new(0,5,0,0), UDim2.new(1,-10,0,28), function()
    local ok2 = Config.Load(configNameBox.Text)
    Util.Notify("Config", ok2 and "Loaded: " .. configNameBox.Text or "Not found")
end).Parent = CS

Button(CS, "🗑️  Delete Config", UDim2.new(0,5,0,0), UDim2.new(1,-10,0,28), function()
    Config.Delete(configNameBox.Text)
    Util.Notify("Config", "Deleted: " .. configNameBox.Text)
end).Parent = CS

Button(CS, "⚙️  Set Autoload", UDim2.new(0,5,0,0), UDim2.new(1,-10,0,28), function()
    Config.Save("autoload")
    Util.Notify("Config", "Autoload set to current settings")
end).Parent = CS

-- ============================================================
--  NOTIFICATION SYSTEM
-- ============================================================

local NotifHolder = Frame(ScreenGui,
    UDim2.new(0,260,0,0),
    UDim2.new(1,-268,1,-10),
    Color3.fromRGB(0,0,0)
)
NotifHolder.BackgroundTransparency = 1
local NotifLayout = Instance.new("UIListLayout")
NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotifLayout.Padding = UDim.new(0,4)
NotifLayout.Parent  = NotifHolder

_G.UE_Notify = function(title, body, duration)
    local nf = Frame(NotifHolder,
        UDim2.new(1,0,0,52),
        UDim2.new(0,0,0,0),
        COLORS.bg2
    )
    Corner(nf,6)
    Stroke(nf)

    local accent = Frame(nf, UDim2.new(0,3,1,0), UDim2.new(0,0,0,0), COLORS.accent)
    Corner(accent,2)

    Label(nf, title, UDim2.new(0,10,0,4), UDim2.new(1,-14,0,18), COLORS.accent).Font = Enum.Font.GothamBold
    Label(nf, body,  UDim2.new(0,10,0,22), UDim2.new(1,-14,0,24), COLORS.text).TextSize = 12

    nf.Position = UDim2.new(1,0,0,0)
    TweenService:Create(nf, TweenInfo.new(0.25,Enum.EasingStyle.Quart), {Position=UDim2.new(0,0,0,0)}):Play()

    task.delay(duration or 3, function()
        TweenService:Create(nf, TweenInfo.new(0.2), {BackgroundTransparency=1}):Play()
        task.wait(0.25)
        nf:Destroy()
    end)
end

-- ============================================================
--  KEYBIND — Toggle UI
-- ============================================================

UserInputService.InputBegan:Connect(function(inp, gpe)
    if gpe then return end
    if inp.KeyCode == UI.Keybind then
        UI.Open = not UI.Open
        Main.Visible = UI.Open
        Util.Notify("UE v2", UI.Open and "UI Opened" or "UI Hidden")
    end
end)

-- ============================================================
--  RAGEBOT FOV CIRCLE
-- ============================================================

local fovCircle = Drawing.new("Circle")
fovCircle.Color     = Color3.fromRGB(200,200,200)
fovCircle.Thickness = 1
fovCircle.Filled    = false
fovCircle.NumSides  = 64

RunService.Heartbeat:Connect(function()
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    if C.Ragebot_Enabled and C.Ragebot_FOV < 360 then
        fovCircle.Visible  = true
        fovCircle.Position = center
        fovCircle.Radius   = C.Ragebot_FOV  -- in screen pixels (approx)
    else
        fovCircle.Visible  = false
    end
end)

-- ============================================================
--  MAIN LOOP
-- ============================================================

RunService.Heartbeat:Connect(function(dt)
    Resolver.Update = function()
        for _, p in ipairs(Util.GetPlayers(true)) do
            Resolver.Record(p)
        end
    end
    Resolver.Update()

    -- Ragebot
    Ragebot.Update()

    -- Legit
    LegitBot.Update()

    -- Anti-Aim
    AntiAim.Update(dt)

    -- Movement
    Movement.Update()

    -- World
    World.Update()
end)

-- ESP on render
RunService.RenderStepped:Connect(function()
    ESP.Update()
end)

-- Player added/removed
Players.PlayerAdded:Connect(function(p)
    task.wait(1)
    ESP.CreateForPlayer(p)
end)

Players.PlayerRemoving:Connect(function(p)
    ESP.RemoveForPlayer(p)
end)

-- Init ESP for existing players
for _, p in ipairs(Players:GetPlayers()) do
    if p ~= LP then
        task.spawn(function()
            task.wait(0.5)
            ESP.CreateForPlayer(p)
        end)
    end
end

-- ============================================================
--  STARTUP NOTIFY
-- ============================================================

Util.Notify("UE v2 Loaded", "Press INSERT to toggle UI", 4)
Util.Notify("Ragebot", "Select target priority in Ragebot tab", 5)

print("[UE v2] Unnamed Enhancements v2 — Live. 6767.")
