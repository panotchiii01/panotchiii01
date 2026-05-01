-- Panotchi UI (Red/Black)
-- LocalScript in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local camera = workspace.CurrentCamera
local mouse = player:GetMouse()

pcall(function()
	if setfpscap then
		setfpscap(200)
	end
end)

local function safeSetClipboard(text)
	pcall(function()
		if setclipboard then
			setclipboard(text)
		end
	end)
end

local function clamp01(v)
	return math.clamp(v, 0, 1)
end

local function keyToText(keyCode)
	return keyCode and keyCode.Name or "Unknown"
end

local old = playerGui:FindFirstChild("PanotchiUI")
if old then
	old:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "PanotchiUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(700, 430)
main.Position = UDim2.new(0.5, -350, 0.5, -215)
main.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
main.BackgroundTransparency = 0.1
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(190, 15, 20)
mainStroke.Thickness = 2
mainStroke.Transparency = 0.05
mainStroke.Parent = main

local top = Instance.new("Frame")
top.Name = "TopBar"
top.Size = UDim2.new(1, 0, 0, 56)
top.BackgroundColor3 = Color3.fromRGB(14, 10, 10)
top.BackgroundTransparency = 0.08
top.BorderSizePixel = 0
top.Parent = main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 12)
topCorner.Parent = top

local topFix = Instance.new("Frame")
topFix.Size = UDim2.new(1, 0, 0, 14)
topFix.Position = UDim2.new(0, 0, 1, -14)
topFix.BackgroundColor3 = top.BackgroundColor3
topFix.BackgroundTransparency = top.BackgroundTransparency
topFix.BorderSizePixel = 0
topFix.Parent = top

local topLine = Instance.new("Frame")
topLine.Size = UDim2.new(1, 0, 0, 2)
topLine.Position = UDim2.new(0, 0, 1, -2)
topLine.BackgroundColor3 = Color3.fromRGB(200, 20, 20)
topLine.BorderSizePixel = 0
topLine.Parent = top

local titleShadow = Instance.new("TextLabel")
titleShadow.BackgroundTransparency = 1
titleShadow.Position = UDim2.new(0, 16, 0, 8)
titleShadow.Size = UDim2.new(0, 320, 0, 36)
titleShadow.Font = Enum.Font.Arcade
titleShadow.Text = "PANOTCHI"
titleShadow.TextColor3 = Color3.fromRGB(120, 0, 0)
titleShadow.TextSize = 30
titleShadow.TextXAlignment = Enum.TextXAlignment.Left
titleShadow.Parent = top

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 14, 0, 6)
title.Size = UDim2.new(0, 320, 0, 36)
title.Font = Enum.Font.Arcade
title.Text = "PANOTCHI"
title.TextColor3 = Color3.fromRGB(245, 245, 245)
title.TextStrokeColor3 = Color3.fromRGB(185, 15, 20)
title.TextStrokeTransparency = 0
title.TextSize = 30
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = top

local sideBrand = Instance.new("TextLabel")
sideBrand.BackgroundTransparency = 1
sideBrand.Position = UDim2.new(1, -170, 0, 16)
sideBrand.Size = UDim2.new(0, 150, 0, 24)
sideBrand.Font = Enum.Font.Arcade
sideBrand.Text = "SIX SEVEN"
sideBrand.TextColor3 = Color3.fromRGB(220, 25, 30)
sideBrand.TextStrokeColor3 = Color3.fromRGB(40, 0, 0)
sideBrand.TextStrokeTransparency = 0.2
sideBrand.TextSize = 16
sideBrand.TextXAlignment = Enum.TextXAlignment.Right
sideBrand.Parent = top

local leftPanel = Instance.new("Frame")
leftPanel.Size = UDim2.new(0, 190, 1, -72)
leftPanel.Position = UDim2.new(0, 10, 0, 60)
leftPanel.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
leftPanel.BackgroundTransparency = 0.08
leftPanel.BorderSizePixel = 0
leftPanel.Parent = main

local leftCorner = Instance.new("UICorner")
leftCorner.CornerRadius = UDim.new(0, 10)
leftCorner.Parent = leftPanel

local leftStroke = Instance.new("UIStroke")
leftStroke.Color = Color3.fromRGB(180, 20, 20)
leftStroke.Thickness = 1
leftStroke.Transparency = 0.2
leftStroke.Parent = leftPanel

local tabs = Instance.new("Frame")
tabs.BackgroundTransparency = 1
tabs.Position = UDim2.new(0, 10, 0, 10)
tabs.Size = UDim2.new(1, -20, 1, -20)
tabs.Parent = leftPanel

local tabsLayout = Instance.new("UIListLayout")
tabsLayout.FillDirection = Enum.FillDirection.Vertical
tabsLayout.Padding = UDim.new(0, 8)
tabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabsLayout.Parent = tabs

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -210, 1, -72)
content.Position = UDim2.new(0, 204, 0, 60)
content.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
content.BackgroundTransparency = 0.08
content.BorderSizePixel = 0
content.Parent = main

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 10)
contentCorner.Parent = content

local contentStroke = Instance.new("UIStroke")
contentStroke.Color = Color3.fromRGB(180, 20, 20)
contentStroke.Thickness = 1
contentStroke.Transparency = 0.2
contentStroke.Parent = content

local pageTitle = Instance.new("TextLabel")
pageTitle.BackgroundTransparency = 1
pageTitle.Position = UDim2.new(0, 14, 0, 10)
pageTitle.Size = UDim2.new(1, -28, 0, 24)
pageTitle.Font = Enum.Font.Arcade
pageTitle.TextSize = 18
pageTitle.TextXAlignment = Enum.TextXAlignment.Left
pageTitle.TextColor3 = Color3.fromRGB(220, 20, 20)
pageTitle.Text = "LOCK"
pageTitle.Parent = content

local function makePanel(name, scrollable)
	if scrollable then
		local panel = Instance.new("ScrollingFrame")
		panel.Name = name
		panel.BackgroundTransparency = 1
		panel.Position = UDim2.new(0, 14, 0, 42)
		panel.Size = UDim2.new(1, -28, 1, -52)
		panel.Visible = false
		panel.CanvasSize = UDim2.fromOffset(0, 0)
		panel.ScrollBarThickness = 5
		panel.ScrollingDirection = Enum.ScrollingDirection.Y
		panel.AutomaticCanvasSize = Enum.AutomaticSize.None
		panel.Parent = content

		local pad = Instance.new("UIPadding")
		pad.PaddingBottom = UDim.new(0, 10)
		pad.Parent = panel

		local list = Instance.new("UIListLayout")
		list.FillDirection = Enum.FillDirection.Vertical
		list.Padding = UDim.new(0, 10)
		list.SortOrder = Enum.SortOrder.LayoutOrder
		list.Parent = panel

		list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			panel.CanvasSize = UDim2.fromOffset(0, list.AbsoluteContentSize.Y + 10)
		end)

		return panel
	end

	local panel = Instance.new("Frame")
	panel.Name = name
	panel.BackgroundTransparency = 1
	panel.Position = UDim2.new(0, 14, 0, 42)
	panel.Size = UDim2.new(1, -28, 1, -52)
	panel.Visible = false
	panel.Parent = content

	local list = Instance.new("UIListLayout")
	list.FillDirection = Enum.FillDirection.Vertical
	list.Padding = UDim.new(0, 10)
	list.SortOrder = Enum.SortOrder.LayoutOrder
	list.Parent = panel

	return panel
end

local function makeLabel(parent, text, size)
	local l = Instance.new("TextLabel")
	l.BackgroundTransparency = 1
	l.Size = UDim2.new(1, 0, 0, 20)
	l.Font = Enum.Font.Arcade
	l.TextSize = size or 13
	l.TextXAlignment = Enum.TextXAlignment.Left
	l.TextColor3 = Color3.fromRGB(170, 170, 170)
	l.Text = text
	l.Parent = parent
	return l
end

local function makeButton(parent, text, width)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0, width or 220, 0, 34)
	b.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
	b.BackgroundTransparency = 0.08
	b.BorderSizePixel = 0
	b.AutoButtonColor = false
	b.Text = text
	b.Font = Enum.Font.Arcade
	b.TextSize = 13
	b.TextColor3 = Color3.fromRGB(235, 235, 235)
	b.Parent = parent

	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 7)
	c.Parent = b

	local s = Instance.new("UIStroke")
	s.Color = Color3.fromRGB(170, 20, 20)
	s.Thickness = 1
	s.Transparency = 0.2
	s.Parent = b
	return b
end

local function makeSlider(parent, labelText, width)
	local holder = Instance.new("Frame")
	holder.BackgroundTransparency = 1
	holder.Size = UDim2.new(1, 0, 0, 44)
	holder.Parent = parent

	local label = Instance.new("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(1, 0, 0, 18)
	label.Font = Enum.Font.Arcade
	label.TextSize = 12
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextColor3 = Color3.fromRGB(175, 175, 175)
	label.Text = labelText
	label.Parent = holder

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, width or 330, 0, 20)
	frame.Position = UDim2.new(0, 0, 0, 22)
	frame.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
	frame.BorderSizePixel = 0
	frame.Parent = holder

	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 7)
	c.Parent = frame

	local s = Instance.new("UIStroke")
	s.Color = Color3.fromRGB(170, 20, 20)
	s.Thickness = 1
	s.Transparency = 0.2
	s.Parent = frame

	local fill = Instance.new("Frame")
	fill.Size = UDim2.new(0, 0, 1, 0)
	fill.BackgroundColor3 = Color3.fromRGB(210, 20, 25)
	fill.BorderSizePixel = 0
	fill.Parent = frame

	local fillCorner = Instance.new("UICorner")
	fillCorner.CornerRadius = UDim.new(0, 7)
	fillCorner.Parent = fill

	local knob = Instance.new("Frame")
	knob.AnchorPoint = Vector2.new(0.5, 0.5)
	knob.Size = UDim2.fromOffset(10, 24)
	knob.Position = UDim2.new(0, 0, 0.5, 0)
	knob.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
	knob.BorderSizePixel = 0
	knob.Parent = frame

	local knobCorner = Instance.new("UICorner")
	knobCorner.CornerRadius = UDim.new(1, 0)
	knobCorner.Parent = knob

	local slider = {
		label = label,
		frame = frame,
		fill = fill,
		knob = knob,
		dragging = false,
	}

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			slider.dragging = true
		end
	end)

	frame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			slider.dragging = false
		end
	end)

	return slider
end

local function setSliderVisual(slider, value, minV, maxV, labelPrefix, fmt)
	local t = clamp01((value - minV) / (maxV - minV))
	slider.fill.Size = UDim2.new(t, 0, 1, 0)
	slider.knob.Position = UDim2.new(t, 0, 0.5, 0)
	slider.label.Text = string.format("%s: " .. fmt, labelPrefix, value)
end

local function sliderValueFromMouse(slider, mousePos, minV, maxV)
	local absPos = slider.frame.AbsolutePosition
	local absSize = slider.frame.AbsoluteSize
	local rx = clamp01((mousePos.X - absPos.X) / absSize.X)
	return minV + rx * (maxV - minV)
end

local visualsPanel = makePanel("VisualsPanel", false)
local lockPanel = makePanel("LockPanel", true)
local triggerPanel = makePanel("TriggerPanel", false)
local settingsPanel = makePanel("SettingsPanel", false)

local highlightBtn = makeButton(visualsPanel, "HIGHLIGHT ESP: OFF", 240)
local boxBtn = makeButton(visualsPanel, "BOX ESP: OFF", 240)
local healthBtn = makeButton(visualsPanel, "HEALTH ESP: OFF", 240)
local distanceBtn = makeButton(visualsPanel, "DISTANCE ESP: OFF", 240)

makeLabel(lockPanel, "LOCK KEYBIND")
local keybindButton = makeButton(lockPanel, "BIND KEY: Q", 220)

makeLabel(lockPanel, "TARGET PART")
local partButton = makeButton(lockPanel, "PART: HUMANOIDROOTPART", 300)

local smoothingSlider = makeSlider(lockPanel, "SMOOTHING", 340)
local predictSlider = makeSlider(lockPanel, "PREDICTION TIME", 340)
local fovSlider = makeSlider(lockPanel, "LOCK FOV", 340)

makeLabel(lockPanel, "FOV COLOR (RGB)")
local fovRSlider = makeSlider(lockPanel, "FOV COLOR R", 340)
local fovGSlider = makeSlider(lockPanel, "FOV COLOR G", 340)
local fovBSlider = makeSlider(lockPanel, "FOV COLOR B", 340)

local fovVisibleToggle = makeButton(lockPanel, "SHOW FOV CIRCLE: ON", 240)
local downedCheckToggle = makeButton(lockPanel, "DOWNED CHECK: ON", 240)
local predictToggle = makeButton(lockPanel, "AUTO PREDICT: OFF", 240)

local statusLabel = makeLabel(lockPanel, "STATUS: OFF", 13)
statusLabel.TextColor3 = Color3.fromRGB(200, 80, 80)

makeLabel(triggerPanel, "TRIGGER BOT")
local triggerToggle = makeButton(triggerPanel, "TRIGGER: OFF", 220)
local wallCheckToggle = makeButton(triggerPanel, "WALL CHECK: ON", 220)
local delaySlider = makeSlider(triggerPanel, "TRIGGER DELAY", 340)
local triggerStatus = makeLabel(triggerPanel, "STATUS: OFF", 12)
triggerStatus.TextColor3 = Color3.fromRGB(200, 80, 80)

makeLabel(settingsPanel, "HUB KEYBIND")
local hubKeyButton = makeButton(settingsPanel, "HUB KEY: F1", 220)

makeLabel(settingsPanel, "SESSION TOOLS")
local rejoinButton = makeButton(settingsPanel, "REJOIN", 150)
local fpsBoostButton = makeButton(settingsPanel, "LIGHT FPS BOOST", 200)
local copyGameIdButton = makeButton(settingsPanel, "COPY GAME ID", 180)
local copyJobIdButton = makeButton(settingsPanel, "COPY JOB ID", 180)

local tabButtons = {}
local activeTab

local function makeTab(name, order)
	local b = Instance.new("TextButton")
	b.LayoutOrder = order
	b.Size = UDim2.new(1, 0, 0, 42)
	b.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
	b.BackgroundTransparency = 0.08
	b.BorderSizePixel = 0
	b.AutoButtonColor = false
	b.Text = "  " .. string.upper(name)
	b.Font = Enum.Font.Arcade
	b.TextSize = 13
	b.TextXAlignment = Enum.TextXAlignment.Left
	b.TextColor3 = Color3.fromRGB(170, 170, 170)
	b.Parent = tabs

	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 7)
	c.Parent = b

	local s = Instance.new("UIStroke")
	s.Color = Color3.fromRGB(170, 20, 20)
	s.Thickness = 1
	s.Transparency = 0.45
	s.Parent = b

	tabButtons[name] = { button = b, stroke = s }
	return b
end

local visualsTab = makeTab("Visuals", 1)
local lockTab = makeTab("Lock", 2)
local triggerTab = makeTab("Trigger Bot", 3)
local settingsTab = makeTab("Settings", 4)

local function setTab(tabName)
	if activeTab == tabName then
		return
	end
	activeTab = tabName

	for name, item in pairs(tabButtons) do
		local on = name == tabName
		TweenService:Create(item.button, TweenInfo.new(0.12), {
			BackgroundColor3 = on and Color3.fromRGB(200, 20, 20) or Color3.fromRGB(18, 18, 22),
			TextColor3 = on and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(170, 170, 170),
		}):Play()
		TweenService:Create(item.stroke, TweenInfo.new(0.12), {
			Transparency = on and 0.05 or 0.45,
		}):Play()
	end

	pageTitle.Text = string.upper(tabName)
	visualsPanel.Visible = tabName == "Visuals"
	lockPanel.Visible = tabName == "Lock"
	triggerPanel.Visible = tabName == "Trigger Bot"
	settingsPanel.Visible = tabName == "Settings"
end

visualsTab.MouseButton1Click:Connect(function()
	setTab("Visuals")
end)
lockTab.MouseButton1Click:Connect(function()
	setTab("Lock")
end)
triggerTab.MouseButton1Click:Connect(function()
	setTab("Trigger Bot")
end)
settingsTab.MouseButton1Click:Connect(function()
	setTab("Settings")
end)

local lockKeyCode = Enum.KeyCode.Q
local waitingForLockBind = false
local lockEnabled = false
local lockTarget = nil
local lockFOV = 220
local minFov, maxFov = 50, 500

local fovVisible = true
local fovR, fovG, fovB = 220, 20, 20
local fovColor = Color3.fromRGB(fovR, fovG, fovB)
local downedCheckEnabled = true

local parts = { "HumanoidRootPart", "Head", "UpperTorso", "LowerTorso", "Torso" }
local partIndex = 1
local selectedPartName = parts[partIndex]

local smoothing = 0.0
local minSmoothing, maxSmoothing = -100.0, 100.0

local predictEnabled = false
local predictTime = 0.10
local minPredict, maxPredict = 0.00, 0.40

local triggerEnabled = false
local triggerWallCheck = true
local triggerDelay = 0.00
local minDelay, maxDelay = 0.00, 0.30
local triggerLastShot = 0

local hubKeyCode = Enum.KeyCode.F1
local waitingForHubBind = false
local fpsBoostApplied = false

local highlightEspEnabled = false
local boxEspEnabled = false
local healthEspEnabled = false
local distanceEspEnabled = false
local espCache = {}

local fovCircle = Instance.new("Frame")
fovCircle.Name = "FOVCircle"
fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
fovCircle.Position = UDim2.fromOffset(0, 0)
fovCircle.Size = UDim2.fromOffset(lockFOV * 2, lockFOV * 2)
fovCircle.BackgroundTransparency = 1
fovCircle.BorderSizePixel = 0
fovCircle.ZIndex = 999
fovCircle.Parent = gui

local fovCircleCorner = Instance.new("UICorner")
fovCircleCorner.CornerRadius = UDim.new(1, 0)
fovCircleCorner.Parent = fovCircle

local fovCircleStroke = Instance.new("UIStroke")
fovCircleStroke.Thickness = 2
fovCircleStroke.Transparency = 0.1
fovCircleStroke.Color = fovColor
fovCircleStroke.Parent = fovCircle

local knockedTokens = {
	["ko"] = true,
	["k.o"] = true,
	["knocked"] = true,
	["knockedout"] = true,
	["downed"] = true,
	["dbno"] = true,
}

local knockValueNames = {
	"KO",
	"K.O",
	"Knocked",
	"KnockedOut",
	"IsKnocked",
	"Downed",
	"IsDowned",
	"DBNO",
}

local function getRoot(character)
	return character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso"))
end

local function getTargetPartFromCharacter(character)
	if not character then
		return nil
	end
	return character:FindFirstChild(selectedPartName)
end

local function isTruthyValueObject(obj)
	if obj:IsA("BoolValue") then
		return obj.Value == true
	end
	if obj:IsA("IntValue") or obj:IsA("NumberValue") then
		return obj.Value > 0
	end
	if obj:IsA("StringValue") then
		local text = string.lower(tostring(obj.Value or ""))
		return knockedTokens[text] == true
	end
	return false
end

local function hasKnockedSignals(container)
	if not container then
		return false
	end

	for _, name in ipairs(knockValueNames) do
		local child = container:FindFirstChild(name)
		if child and isTruthyValueObject(child) then
			return true
		end
		local attr = container:GetAttribute(name)
		if typeof(attr) == "boolean" and attr then
			return true
		end
		if typeof(attr) == "number" and attr > 0 then
			return true
		end
		if typeof(attr) == "string" and knockedTokens[string.lower(attr)] then
			return true
		end
	end

	return false
end

local function isPlayerDowned(character, humanoid)
	if not downedCheckEnabled then
		return false
	end
	if not character or not humanoid then
		return false
	end
	if humanoid.Health <= 0 then
		return true
	end
	if hasKnockedSignals(character) or hasKnockedSignals(humanoid) then
		return true
	end
	return false
end

local function canTargetPlayer(otherPlayer)
	if otherPlayer == player then
		return false
	end
	local character = otherPlayer.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if not character or not humanoid then
		return false
	end
	if humanoid.Health <= 0 then
		return false
	end
	if isPlayerDowned(character, humanoid) then
		return false
	end
	return true
end

local function updateLockStatus()
	if lockEnabled and lockTarget and lockTarget.Parent then
		statusLabel.TextColor3 = Color3.fromRGB(90, 220, 90)
		statusLabel.Text = "STATUS: ON (" .. string.upper(lockTarget.Name) .. ")"
	elseif lockEnabled then
		statusLabel.TextColor3 = Color3.fromRGB(230, 170, 70)
		statusLabel.Text = "STATUS: ON"
	else
		statusLabel.TextColor3 = Color3.fromRGB(200, 80, 80)
		statusLabel.Text = "STATUS: OFF"
	end
end

local function updateTriggerStatus(hitName)
	if triggerEnabled then
		triggerStatus.TextColor3 = Color3.fromRGB(90, 220, 90)
		if hitName then
			triggerStatus.Text = "STATUS: ON (" .. string.upper(hitName) .. ")"
		else
			triggerStatus.Text = "STATUS: ON"
		end
	else
		triggerStatus.TextColor3 = Color3.fromRGB(200, 80, 80)
		triggerStatus.Text = "STATUS: OFF"
	end
end

local function updateVisualButtons()
	highlightBtn.Text = "HIGHLIGHT ESP: " .. (highlightEspEnabled and "ON" or "OFF")
	boxBtn.Text = "BOX ESP: " .. (boxEspEnabled and "ON" or "OFF")
	healthBtn.Text = "HEALTH ESP: " .. (healthEspEnabled and "ON" or "OFF")
	distanceBtn.Text = "DISTANCE ESP: " .. (distanceEspEnabled and "ON" or "OFF")
end

local function updateFovColor()
	fovColor = Color3.fromRGB(
		math.floor(math.clamp(fovR, 0, 255)),
		math.floor(math.clamp(fovG, 0, 255)),
		math.floor(math.clamp(fovB, 0, 255))
	)
	fovCircleStroke.Color = fovColor
end

local function updateFovCircle()
	local mousePos = UIS:GetMouseLocation()
	fovCircle.Position = UDim2.fromOffset(mousePos.X, mousePos.Y)
	fovCircle.Size = UDim2.fromOffset(lockFOV * 2, lockFOV * 2)
	fovCircle.Visible = fovVisible
	fovCircleStroke.Color = fovColor
end

local function isTargetWithinFOV(targetPart)
	if not targetPart then
		return false
	end
	local mousePos = UIS:GetMouseLocation()
	local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
	if not onScreen then
		return false
	end
	local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
	return dist <= lockFOV
end

local function getClosestPlayerToMouse()
	local mousePos = UIS:GetMouseLocation()
	local closestPlayer = nil
	local closestDist = math.huge

	for _, otherPlayer in ipairs(Players:GetPlayers()) do
		if canTargetPlayer(otherPlayer) then
			local character = otherPlayer.Character
			local targetPart = getTargetPartFromCharacter(character)
			if targetPart then
				local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
				if onScreen then
					local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
					if dist < closestDist and dist <= lockFOV then
						closestDist = dist
						closestPlayer = otherPlayer
					end
				end
			end
		end
	end
	return closestPlayer
end

local function getPlayerFromPart(part)
	if not part then
		return nil
	end
	local model = part:FindFirstAncestorOfClass("Model")
	if not model then
		return nil
	end
	return Players:GetPlayerFromCharacter(model)
end

local function hasWallBlocking(targetPart, targetCharacter)
	if not targetPart or not targetCharacter then
		return true
	end
	local origin = camera.CFrame.Position
	local direction = targetPart.Position - origin

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Blacklist
	params.FilterDescendantsInstances = { player.Character }
	params.IgnoreWater = true

	local hit = workspace:Raycast(origin, direction, params)
	if not hit then
		return false
	end
	return not hit.Instance:IsDescendantOf(targetCharacter)
end

local function fireMouseClick()
	if typeof(mouse1click) == "function" then
		mouse1click()
		return
	end
	local pos = UIS:GetMouseLocation()
	VirtualUser:CaptureController()
	VirtualUser:Button1Down(Vector2.new(pos.X, pos.Y), camera.CFrame)
	VirtualUser:Button1Up(Vector2.new(pos.X, pos.Y), camera.CFrame)
end

local function applyLightFpsBoost()
	if fpsBoostApplied then
		return
	end
	fpsBoostApplied = true

	pcall(function()
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 100000
		Lighting.Brightness = math.max(1, Lighting.Brightness * 0.8)
	end)

	for _, obj in ipairs(Lighting:GetDescendants()) do
		if obj:IsA("BloomEffect")
			or obj:IsA("BlurEffect")
			or obj:IsA("SunRaysEffect")
			or obj:IsA("ColorCorrectionEffect")
			or obj:IsA("DepthOfFieldEffect")
		then
			obj.Enabled = false
		elseif obj:IsA("Atmosphere") then
			obj.Density = 0
		end
	end
end

local function clearEspFor(plr)
	local data = espCache[plr]
	if not data then
		return
	end
	for _, obj in pairs(data) do
		if typeof(obj) == "Instance" and obj.Parent then
			obj:Destroy()
		end
	end
	espCache[plr] = nil
end

local function getEspData(plr)
	local data = espCache[plr]
	if data then
		return data
	end
	data = {}
	espCache[plr] = data
	return data
end

Players.PlayerRemoving:Connect(function(plr)
	clearEspFor(plr)
end)

highlightBtn.MouseButton1Click:Connect(function()
	highlightEspEnabled = not highlightEspEnabled
	updateVisualButtons()
end)

boxBtn.MouseButton1Click:Connect(function()
	boxEspEnabled = not boxEspEnabled
	updateVisualButtons()
end)

healthBtn.MouseButton1Click:Connect(function()
	healthEspEnabled = not healthEspEnabled
	updateVisualButtons()
end)

distanceBtn.MouseButton1Click:Connect(function()
	distanceEspEnabled = not distanceEspEnabled
	updateVisualButtons()
end)

keybindButton.MouseButton1Click:Connect(function()
	waitingForLockBind = true
	keybindButton.Text = "PRESS A KEY..."
end)

partButton.MouseButton1Click:Connect(function()
	partIndex += 1
	if partIndex > #parts then
		partIndex = 1
	end
	selectedPartName = parts[partIndex]
	partButton.Text = "PART: " .. string.upper(selectedPartName)
end)

predictToggle.MouseButton1Click:Connect(function()
	predictEnabled = not predictEnabled
	predictToggle.Text = "AUTO PREDICT: " .. (predictEnabled and "ON" or "OFF")
end)

fovVisibleToggle.MouseButton1Click:Connect(function()
	fovVisible = not fovVisible
	fovVisibleToggle.Text = "SHOW FOV CIRCLE: " .. (fovVisible and "ON" or "OFF")
	updateFovCircle()
end)

downedCheckToggle.MouseButton1Click:Connect(function()
	downedCheckEnabled = not downedCheckEnabled
	downedCheckToggle.Text = "DOWNED CHECK: " .. (downedCheckEnabled and "ON" or "OFF")
end)

triggerToggle.MouseButton1Click:Connect(function()
	triggerEnabled = not triggerEnabled
	triggerToggle.Text = "TRIGGER: " .. (triggerEnabled and "ON" or "OFF")
	updateTriggerStatus()
end)

wallCheckToggle.MouseButton1Click:Connect(function()
	triggerWallCheck = not triggerWallCheck
	wallCheckToggle.Text = "WALL CHECK: " .. (triggerWallCheck and "ON" or "OFF")
end)

hubKeyButton.MouseButton1Click:Connect(function()
	waitingForHubBind = true
	hubKeyButton.Text = "PRESS A KEY..."
end)

rejoinButton.MouseButton1Click:Connect(function()
	TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
end)

fpsBoostButton.MouseButton1Click:Connect(function()
	applyLightFpsBoost()
end)

copyGameIdButton.MouseButton1Click:Connect(function()
	safeSetClipboard(tostring(game.PlaceId))
end)

copyJobIdButton.MouseButton1Click:Connect(function()
	safeSetClipboard(tostring(game.JobId))
end)

UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then
		return
	end

	if waitingForLockBind then
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode ~= Enum.KeyCode.Unknown then
			lockKeyCode = input.KeyCode
			keybindButton.Text = "BIND KEY: " .. string.upper(keyToText(lockKeyCode))
			waitingForLockBind = false
		end
		return
	end

	if waitingForHubBind then
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode ~= Enum.KeyCode.Unknown then
			hubKeyCode = input.KeyCode
			hubKeyButton.Text = "HUB KEY: " .. string.upper(keyToText(hubKeyCode))
			waitingForHubBind = false
		end
		return
	end

	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == hubKeyCode then
		main.Visible = not main.Visible
		return
	end

	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == lockKeyCode then
		lockEnabled = not lockEnabled
		if lockEnabled then
			lockTarget = getClosestPlayerToMouse()
		else
			lockTarget = nil
		end
		updateLockStatus()
	end
end)

UIS.InputChanged:Connect(function(input)
	if input.UserInputType ~= Enum.UserInputType.MouseMovement then
		return
	end
	local mousePos = input.Position

	if smoothingSlider.dragging then
		smoothing = sliderValueFromMouse(smoothingSlider, mousePos, minSmoothing, maxSmoothing)
		setSliderVisual(smoothingSlider, smoothing, minSmoothing, maxSmoothing, "SMOOTHING", "%.0f")
	end

	if predictSlider.dragging then
		predictTime = sliderValueFromMouse(predictSlider, mousePos, minPredict, maxPredict)
		setSliderVisual(predictSlider, predictTime, minPredict, maxPredict, "PREDICTION TIME", "%.2f")
	end

	if fovSlider.dragging then
		lockFOV = math.floor(sliderValueFromMouse(fovSlider, mousePos, minFov, maxFov))
		setSliderVisual(fovSlider, lockFOV, minFov, maxFov, "LOCK FOV", "%.0f")
		updateFovCircle()
	end

	if fovRSlider.dragging then
		fovR = math.floor(sliderValueFromMouse(fovRSlider, mousePos, 0, 255))
		setSliderVisual(fovRSlider, fovR, 0, 255, "FOV COLOR R", "%.0f")
		updateFovColor()
	end

	if fovGSlider.dragging then
		fovG = math.floor(sliderValueFromMouse(fovGSlider, mousePos, 0, 255))
		setSliderVisual(fovGSlider, fovG, 0, 255, "FOV COLOR G", "%.0f")
		updateFovColor()
	end

	if fovBSlider.dragging then
		fovB = math.floor(sliderValueFromMouse(fovBSlider, mousePos, 0, 255))
		setSliderVisual(fovBSlider, fovB, 0, 255, "FOV COLOR B", "%.0f")
		updateFovColor()
	end

	if delaySlider.dragging then
		triggerDelay = sliderValueFromMouse(delaySlider, mousePos, minDelay, maxDelay)
		setSliderVisual(delaySlider, triggerDelay, minDelay, maxDelay, "TRIGGER DELAY", "%.3f")
	end
end)

RunService.RenderStepped:Connect(function(dt)
	updateFovCircle()

	if lockEnabled then
		if not lockTarget or not lockTarget.Parent or not canTargetPlayer(lockTarget) then
			lockTarget = getClosestPlayerToMouse()
		end

		local character = lockTarget and lockTarget.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local targetPart = getTargetPartFromCharacter(character)

		if not character
			or not humanoid
			or humanoid.Health <= 0
			or not targetPart
			or isPlayerDowned(character, humanoid)
			or not isTargetWithinFOV(targetPart)
		then
			lockTarget = getClosestPlayerToMouse()
			character = lockTarget and lockTarget.Character
			humanoid = character and character:FindFirstChildOfClass("Humanoid")
			targetPart = getTargetPartFromCharacter(character)
		end

		if character
			and humanoid
			and humanoid.Health > 0
			and targetPart
			and not isPlayerDowned(character, humanoid)
			and isTargetWithinFOV(targetPart)
		then
			local camPos = camera.CFrame.Position
			local targetPos = targetPart.Position

			if predictEnabled then
				local vel = targetPart.AssemblyLinearVelocity
				targetPos = targetPos + vel * predictTime
			end

			local currentLook = camera.CFrame.LookVector
			local desiredLook = (targetPos - camPos).Unit

			local currentYaw = math.atan2(-currentLook.Z, currentLook.X)
			local desiredYaw = math.atan2(-desiredLook.Z, desiredLook.X)

			local currentPitch = math.asin(math.clamp(currentLook.Y, -1, 1))
			local desiredPitch = math.asin(math.clamp(desiredLook.Y, -1, 1))

			local yawDelta = desiredYaw - currentYaw
			yawDelta = (yawDelta + math.pi) % (2 * math.pi) - math.pi

			local response = 0.05 + ((smoothing + 100) / 200) * 29.95
			local alpha = math.clamp(response * dt, 0, 1)

			local newYaw = currentYaw + yawDelta * alpha
			local newPitch = currentPitch + (desiredPitch - currentPitch) * alpha
			newPitch = math.clamp(newPitch, math.rad(-89), math.rad(89))

			local cosPitch = math.cos(newPitch)
			local lookVector = Vector3.new(
				math.cos(newYaw) * cosPitch,
				math.sin(newPitch),
				-math.sin(newYaw) * cosPitch
			)

			camera.CFrame = CFrame.lookAt(camPos, camPos + lookVector)
		end

		updateLockStatus()
	end

	if triggerEnabled then
		local now = os.clock()
		if now - triggerLastShot >= triggerDelay then
			local targetPart = mouse.Target
			local targetPlayer = getPlayerFromPart(targetPart)

			if targetPlayer and targetPlayer ~= player and canTargetPlayer(targetPlayer) then
				local char = targetPlayer.Character
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if hum and hum.Health > 0 and not isPlayerDowned(char, hum) then
					local blocked = triggerWallCheck and hasWallBlocking(targetPart, char) or false
					if not blocked then
						fireMouseClick()
						triggerLastShot = now
						updateTriggerStatus(targetPlayer.Name)
					end
				end
			end
		end
	end

	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= player then
			local char = plr.Character
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			local root = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso"))

			if char and hum and hum.Health > 0 and root then
				local data = getEspData(plr)

				if highlightEspEnabled then
					if not data.highlight then
						local h = Instance.new("Highlight")
						h.Name = "PanotchiHighlight"
						h.FillColor = Color3.fromRGB(220, 20, 20)
						h.FillTransparency = 0.6
						h.OutlineColor = Color3.fromRGB(255, 70, 70)
						h.OutlineTransparency = 0.15
						h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						h.Adornee = char
						h.Parent = gui
						data.highlight = h
					end
				elseif data.highlight then
					data.highlight:Destroy()
					data.highlight = nil
				end

				if boxEspEnabled then
					if not data.box then
						local box = Instance.new("BoxHandleAdornment")
						box.Name = "PanotchiBox"
						box.AlwaysOnTop = true
						box.ZIndex = 5
						box.Transparency = 0.65
						box.Color3 = Color3.fromRGB(220, 20, 20)
						box.Size = Vector3.new(4, 6, 2)
						box.Adornee = root
						box.Parent = gui
						data.box = box
					else
						data.box.Adornee = root
					end
				elseif data.box then
					data.box:Destroy()
					data.box = nil
				end

				local wantsText = healthEspEnabled or distanceEspEnabled
				if wantsText then
					if not data.billboard then
						local bb = Instance.new("BillboardGui")
						bb.Name = "PanotchiESPText"
						bb.Size = UDim2.fromOffset(130, 20)
						bb.StudsOffset = Vector3.new(0, 3.4, 0)
						bb.AlwaysOnTop = true
						bb.Adornee = root
						bb.Parent = gui

						local txt = Instance.new("TextLabel")
						txt.BackgroundTransparency = 1
						txt.Size = UDim2.fromScale(1, 1)
						txt.Font = Enum.Font.Arcade
						txt.TextSize = 10
						txt.TextColor3 = Color3.fromRGB(220, 20, 20)
						txt.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
						txt.TextStrokeTransparency = 0.2
						txt.Parent = bb

						data.billboard = bb
						data.text = txt
					end

					local myRoot = player.Character and getRoot(player.Character)
					local dist = myRoot and math.floor((myRoot.Position - root.Position).Magnitude) or 0

					local textParts = {}
					if healthEspEnabled then
						table.insert(textParts, ("HP:%d"):format(math.floor(hum.Health)))
					end
					if distanceEspEnabled then
						table.insert(textParts, ("D:%d"):format(dist))
					end

					data.billboard.Adornee = root
					data.text.Text = table.concat(textParts, " | ")
				else
					if data.billboard then
						data.billboard:Destroy()
						data.billboard = nil
						data.text = nil
					end
				end
			else
				clearEspFor(plr)
			end
		end
	end
end)

local dragging = false
local dragStart, startPos, dragInput

top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

top.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

setTab("Lock")
updateVisualButtons()
updateLockStatus()
updateTriggerStatus()

predictToggle.Text = "AUTO PREDICT: OFF"
wallCheckToggle.Text = "WALL CHECK: ON"
triggerToggle.Text = "TRIGGER: OFF"
fovVisibleToggle.Text = "SHOW FOV CIRCLE: ON"
downedCheckToggle.Text = "DOWNED CHECK: ON"

setSliderVisual(smoothingSlider, smoothing, minSmoothing, maxSmoothing, "SMOOTHING", "%.0f")
setSliderVisual(predictSlider, predictTime, minPredict, maxPredict, "PREDICTION TIME", "%.2f")
setSliderVisual(fovSlider, lockFOV, minFov, maxFov, "LOCK FOV", "%.0f")
setSliderVisual(fovRSlider, fovR, 0, 255, "FOV COLOR R", "%.0f")
setSliderVisual(fovGSlider, fovG, 0, 255, "FOV COLOR G", "%.0f")
setSliderVisual(fovBSlider, fovB, 0, 255, "FOV COLOR B", "%.0f")
setSliderVisual(delaySlider, triggerDelay, minDelay, maxDelay, "TRIGGER DELAY", "%.3f")

updateFovColor()
updateFovCircle()
