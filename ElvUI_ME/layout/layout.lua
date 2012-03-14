local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local LO = E:GetModule('Layout');
local DT = E:GetModule('DataTexts')

function LO:TogglePanels()
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

function LO:CreatePanels()
	-- Adjust layer sequence
	LeftChatPanel:SetFrameStrata("LOW")
	RightChatPanel:SetFrameStrata("LOW")
		
	-- building new panels
	local f = CreateFrame("Frame", "Uppanels", E.UIParent)
	f:SetHeight(23)
	f:SetWidth(E.UIParent:GetWidth() + (E.mult * 2))
	f:SetPoint("TOPLEFT", E.UIParent, "TOPLEFT", -E.mult, E.mult)
	f:SetPoint("TOPRIGHT", E.UIParent, "TOPRIGHT", E.mult, E.mult)
	f:SetFrameStrata("BACKGROUND")
	f:SetFrameLevel(0)
	f:SetTemplate("Transparent")
	--f:CreateShadow("Default")
	
	local f = CreateFrame("Frame", "ElvuiLoc", Uppanels)
	f:SetHeight(23)
	f:SetWidth(165)
	f:SetFrameStrata("BACKGROUND")
	f:SetFrameLevel(2)
	f:SetTemplate("Default", true)
	--f:CreateShadow("Default")
	f:Point("CENTER", Uppanels, "BOTTOM")	
	--f.text = f:CreateFontString(nil, 'OVERLAY')
	--f.text:FontTemplate()
	--f.text:SetPoint('CENTER')
	--f.text:SetJustifyH('CENTER')
	--f.text:SetFormattedText("%sElvUI|r v%s%s|r : Meat Edition", E["media"].hexvaluecolor, E["media"].hexvaluecolor, E.version)

	local f = CreateFrame("Frame", "ElvuiLocX", ElvuiLoc)
	f:SetHeight(23)
	f:SetWidth(E.MinimapSize / 6)
	f:SetFrameLevel(2)
	f:SetTemplate("Default", true)
	--f:CreateShadow("Default")
	f:Point("RIGHT", ElvuiLoc, "LEFT", -2, 0)	
	
	local f = CreateFrame("Frame", "ElvuiLocY", ElvuiLoc)
	f:SetHeight(23)
	f:SetWidth(E.MinimapSize / 6)
	f:SetFrameLevel(2)
	f:SetTemplate("Default", true)
	--f:CreateShadow("Default")
	f:Point("LEFT", ElvuiLoc, "RIGHT", 2, 0)
	
	local leftDTbar = CreateFrame("Frame", "TOPLEFTDT", Uppanels)
	leftDTbar:SetHeight(23)
	leftDTbar:SetWidth(165 / 1.3)
	leftDTbar:SetFrameStrata("BACKGROUND")
	leftDTbar:SetFrameLevel(2)
	leftDTbar:SetTemplate("Default", true)
	--leftDTbar:CreateShadow("Default")
	leftDTbar:Point("RIGHT", ElvuiLocX, "LEFT", -6, 0)
	DT:RegisterPanel(leftDTbar, 1, 'ANCHOR_BOTTOM', 0, -4)	
	
	local rightDTbar = CreateFrame("Frame", "TOPRIGHTDT", Uppanels)
	rightDTbar:SetHeight(23)
	rightDTbar:SetWidth(165 / 1.3)
	rightDTbar:SetFrameStrata("BACKGROUND")
	rightDTbar:SetFrameLevel(2)
	rightDTbar:SetTemplate("Default", true)
	--rightDTbar:CreateShadow("Default")
	rightDTbar:Point("LEFT", ElvuiLocY, "RIGHT", 6, 0)
	DT:RegisterPanel(rightDTbar, 1, 'ANCHOR_BOTTOM', 0, -4)	
	
	--[[
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
	upperpanels.text:FontTemplate()
	upperpanels.text:SetPoint('CENTER')
	upperpanels.text:SetJustifyH('CENTER')
	upperpanels.text:SetFormattedText("%sElvUI|r v%s%s|r : Meat Edition", E["media"].hexvaluecolor, E["media"].hexvaluecolor, E.version)
	]]--
	
	local bottompanels = CreateFrame("Frame", "Downpanels", E.UIParent)
	bottompanels:SetHeight(23)
	bottompanels:SetWidth(E.UIParent:GetWidth() + (E.mult * 2))
	bottompanels:SetPoint("TOPLEFT", E.UIParent, "BOTTOMLEFT", -2, 18)
	bottompanels:SetPoint("BOTTOMRIGHT", E.UIParent, "BOTTOMRIGHT", 2, -2)
	bottompanels:SetFrameStrata("BACKGROUND")
	bottompanels:SetFrameLevel(0)
	bottompanels:CreateBackdrop("Transparent")
	--bottompanels.backdrop:CreateShadow("Default")
	bottompanels.backdrop:SetFrameStrata("BACKGROUND")
	bottompanels.backdrop:SetFrameLevel(0)
	
	self:TogglePanels()
end