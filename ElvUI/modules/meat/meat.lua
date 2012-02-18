local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB
local MT = E:NewModule('Meat', 'AceTimer-3.0', 'AceHook-3.0', 'AceEvent-3.0')

function MT:Initialize()
	if not E.db.meat then E.db.meat = {}; print("DB Initialized.") end
	E.meat = MT
	if not self.db then self.db = E.db.meat end
	print("Meat Edition Initialize Completed.")
	
	self:CreatePanels()
end

function MT:TogglePanels()
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

function MT:CreatePanels()
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
E:RegisterModule(MT:GetName())