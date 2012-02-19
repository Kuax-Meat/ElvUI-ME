local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB
local MEAT = E:NewModule('MEAT', 'AceEvent-3.0')
local DT = E:GetModule('DataTexts');
local CH = E:GetModule('Chat');
local A = E:GetModule('Auras');
local M = E:GetModule('Maps');
local AB = E:GetModule('ActionBars');
local LSM = LibStub("LibSharedMedia-3.0")

function MEAT:Initialize()
	if not E.db.meat then E.db.meat = {}; print("DB Initialized.") end
	E.meat = MEAT
	if not self.db then self.db = E.db.meat end
	print("Meat Edition Initialize Completed.")
	
	self:CreatePanels()
	self:SetupDefault()
end

function MEAT:SetupDefault()
	if not E.db.meat.install then
		E.db["meat"] = {
			["font"] = "ElvUI Font",
			["fontsize"] = 12,
			["upperpanels"] = true,
			["bottompanels"] = true,
			["install"] = true
		}
	else
		print("Already ME installed.")
	end
	
	self:SetupFont()
end

function MEAT:SetupFont()
	DT:UpdateDTFont()
	CH:UpdateCHFont()
	A:UpdateAFont()
	M:UpdateMFont()
	AB:UpdateABFont()
end

function AB:StyleFont(button, noBackdrop)
	local name = button:GetName();
	local count = _G[name.."Count"];
	local hotkey = _G[name.."HotKey"];
	local macroName = _G[name.."Name"];
	
	if count then
		count:ClearAllPoints();
		count:SetPoint("BOTTOMRIGHT", 1, 0);
		count:FontTemplate(LSM:Fetch("font", E.db["meat"].font), E.db.meat.fontsize, 'OUTLINE');
	end
	
	if self.db.macrotext and macroName then
		macroName:ClearAllPoints();
		macroName:SetPoint("BOTTOM", 2, 2);
		macroName:FontTemplate(LSM:Fetch("font", E.db["meat"].font), E.db.meat.fontsize, 'OUTLINE');
	end
	
	if self.db.hotkeytext then
		hotkey:FontTemplate(LSM:Fetch("font", E.db["meat"].font), E.db.meat.fontsize, 'OUTLINE');
	end
end

function AB:UpdateABFont()
	for button, _ in pairs(self["handledbuttons"]) do
		if button then
			self:StyleFont(button, button.noBackdrop)
			--self:StyleFlyout(button)
		else
			self["handledbuttons"][button] = nil
		end
	end
end

function M:UpdateMFont()
	Minimap.location:FontTemplate(LSM:Fetch("font", E.db["meat"].font), E.db.meat.fontsize, 'OUTLINE')
end

function A:StyleBuffs(buttonName, index, debuff)
	local buff = _G[buttonName..index]
	local icon = _G[buttonName..index.."Icon"]
	local border = _G[buttonName..index.."Border"]
	local duration = _G[buttonName..index.."Duration"]
	local count = _G[buttonName..index.."Count"]
	if icon and not buff.backdrop then
		icon:SetTexCoord(unpack(E.TexCoords))
		icon:Point("TOPLEFT", buff, 2, -2)
		icon:Point("BOTTOMRIGHT", buff, -2, 2)
		
		buff:Size(30)
				
		duration:ClearAllPoints()
		duration:Point("BOTTOM", 0, -13)
		duration:FontTemplate(LSM:Fetch("font", E.db["meat"].font), E.db.meat.fontsize, 'OUTLINE')
		
		count:ClearAllPoints()
		count:Point("TOPLEFT", 1, -2)
		count:FontTemplate(LSM:Fetch("font", E.db["meat"].font), E.db.meat.fontsize, 'OUTLINE')
		
		buff:CreateBackdrop('Default')
		buff.backdrop:SetAllPoints()
		
		local highlight = buff:CreateTexture(nil, "HIGHLIGHT")
		highlight:SetTexture(1,1,1,0.45)
		highlight:SetAllPoints(icon)
	end
	if border then border:Hide() end
end

function A:UpdateAFont()
	local buttonName = "BuffButton"
	--local buff, previousBuff, aboveBuff;
	--local numBuffs = 0;
	--local index;
	for i=1, BUFF_ACTUAL_DISPLAY do
		local buff = _G[buttonName..i]
		if buff:IsProtected() then return end -- uhh ohhh
		self:StyleBuffs(buttonName, i, false)
	end
end

function DT:UpdateDTFont()
	for panelName, panel in pairs(DT.RegisteredPanels) do
		for i=1, panel.numPoints do
			local pointIndex = DT.PointLocation[i]
			panel.dataPanels[pointIndex].text:FontTemplate(LSM:Fetch("font", E.db["meat"].font), E.db.meat.fontsize, 'OUTLINE')
		end
	end
end

function CH:TabChat(frame)
	--if frame.styled then return end
	local name = frame:GetName()
	local tab = _G[name..'Tab']

	tab.text = _G[name.."TabText"]
	tab.text:FontTemplate(LSM:Fetch("font", E.db["meat"].font), E.db.meat.fontsize, 'OUTLINE')
end

function CH:UpdateCHFont()	
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		self:TabChat(frame)
	end	
end

function MEAT:TogglePanels()
	if E.db.meat.upperpanels then
		Uppanels:Show()
	else
		Uppanels:Hide()
	end
	
	if E.db.meat.bottompanels then
		Downpanels:Show()
	else
		Downpanels:Hide()
	end
end

function MEAT:CreatePanels()
	local upperpanels = CreateFrame("Frame", "Uppanels", E.UIParent)
	upperpanels:SetHeight(23)
	upperpanels:SetWidth(E.UIParent:GetWidth() + (E.mult * 2))
	upperpanels:SetPoint("TOPLEFT", E.UIParent, "TOPLEFT", -2, 2)
	upperpanels:SetPoint("BOTTOMRIGHT", E.UIParent, "TOPRIGHT", 2, -20)
	upperpanels:SetFrameStrata("BACKGROUND")
	upperpanels:SetFrameLevel(0)
	upperpanels:SetTemplate("Transparent")
	upperpanels:CreateShadow("Default")
	
	upperpanels.text = upperpanels:CreateFontString(nil, 'OVERLAY')
	upperpanels.text:FontTemplate(LSM:Fetch("font", E.db["meat"].font), E.db.meat.fontsize, 'OUTLINE')
	upperpanels.text:SetPoint('CENTER')
	upperpanels.text:SetJustifyH('CENTER')
	upperpanels.text:SetFormattedText("%sElvUI|r v%s%s|r : Meat Edition", E["media"].hexvaluecolor, E["media"].hexvaluecolor, E.version)
	
	local bottompanels = CreateFrame("Frame", "Downpanels", E.UIParent)
	bottompanels:SetHeight(23)
	bottompanels:SetWidth(E.UIParent:GetWidth() + (E.mult * 2))
	bottompanels:SetPoint("TOPLEFT", E.UIParent, "BOTTOMLEFT", -2, 18)
	bottompanels:SetPoint("BOTTOMRIGHT", E.UIParent, "BOTTOMRIGHT", 2, -2)
	bottompanels:SetFrameStrata("BACKGROUND")
	bottompanels:SetFrameLevel(0)
	bottompanels:CreateBackdrop("Transparent")
	bottompanels.backdrop:CreateShadow("Default")
	bottompanels.backdrop:SetFrameStrata("BACKGROUND")
	bottompanels.backdrop:SetFrameLevel(0)
	
	self:TogglePanels()
end
E:RegisterModule(MEAT:GetName())