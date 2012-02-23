local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local MEAT = E:NewModule('MEAT', 'AceEvent-3.0')
local LO = E:GetModule('Layout');
local AB = E:GetModule('ActionBars');
local DT = E:GetModule('DataTexts')
local A = E:GetModule('Auras');
local M = E:GetModule('Maps');

local LSM = LibStub("LibSharedMedia-3.0")

function MEAT:MinimapLocationPanels()
	local x,y = GetPlayerMapPosition("player")
	x = math.floor(100 * x)
	y = math.floor(100 * y)	
	
	ElvuiLoc.zone = ElvuiLoc:CreateFontString(nil, "Overlay")
	ElvuiLoc.zone:FontTemplate()
	ElvuiLoc.zone:SetPoint("CENTER")
	ElvuiLoc.zone:SetText(strsub(GetMinimapZoneText(),1,36))
	ElvuiLoc:EnableMouse(true)
	ElvuiLoc:SetScript("OnMouseDown", function() ToggleFrame(WorldMapFrame) end)
	
	
	ElvuiLocX.coord = ElvuiLocX:CreateFontString(nil, "Overlay")
	ElvuiLocX.coord:FontTemplate()
	ElvuiLocX.coord:SetPoint("CENTER", ElvuiLocX, "CENTER")
	ElvuiLocX.coord:SetText(x)	
	ElvuiLocX.coord:SetTextColor(unpack(E["media"].rgbvaluecolor))
	
	ElvuiLocY.coord = ElvuiLocY:CreateFontString(nil, "Overlay")
	ElvuiLocY.coord:FontTemplate()
	ElvuiLocY.coord:SetPoint("CENTER", ElvuiLocY, "CENTER")
	ElvuiLocY.coord:SetText(y)	
	ElvuiLocY.coord:SetTextColor(unpack(E["media"].rgbvaluecolor))
	
	ElvuiLoc:SetScript("OnUpdate", function(self, elapsed)
		if(self.elapsed and self.elapsed > 0.2) then
			local x,y = GetPlayerMapPosition("player")
			x = math.floor(100 * x)
			y = math.floor(100 * y)			
			self.zone:SetText(strsub(GetMinimapZoneText(),1,36))
			self.zone:SetTextColor(M:GetLocTextColor())
			
			if x ==0 and y==0 then
				ElvuiLocX.coord:SetText("??")
				ElvuiLocY.coord:SetText("??")
			else
				ElvuiLocX.coord:SetText(x)
				ElvuiLocY.coord:SetText(y)				
			end
			self.elapsed = 0
		else
			self.elapsed = (self.elapsed or 0) + elapsed
		end	
	end)
	
	self:MinimapLocToggle()
end

function MEAT:MinimapLocToggle()
	if E.db.meat.upperpanels == true then
		Minimap.location:Hide()
		ElvuiLoc.zone:Show()
		ElvuiLocX.coord:Show()
		ElvuiLocY.coord:Show()
	else
		Minimap.location:Show()
		ElvuiLoc.zone:Hide()
		ElvuiLocX.coord:Hide()
		ElvuiLocY.coord:Hide()
	end
end

function MEAT:Initialize()
	local DBFholder = CreateFrame("Frame", "DBFAurasHolder", E.UIParent)
	DBFholder:Point("TOPRIGHT", E.UIParent, "TOPRIGHT", -((E.MinimapSize + 4) + E.RBRWidth + 7), -(4 + E.MinimapHeight))
	DBFholder:Width(456)
	DBFholder:Height(30)
	E:CreateMover(DBFAurasHolder, "DAurasMover", "Debuff Auras Frame", false, A.DAurasPostDrag)
	
	E:GetModule('Blizzard'):HandleBubbles()
	LO:CreatePanels()
	AB:UpdateABFont()
	self:LoadDefaultSetting()
	AB:AdjustBarPos()
	AB:MakeShadows()
	DT:PanelLayoutOptions2()
	DT:LoadDataTexts()
	self:MinimapLocationPanels()
end

E:RegisterModule(MEAT:GetName())