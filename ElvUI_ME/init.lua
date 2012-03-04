local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local MEAT = E:NewModule('MEAT', 'AceEvent-3.0')
local LO = E:GetModule('Layout');
local AB = E:GetModule('ActionBars');
local DT = E:GetModule('DataTexts')
local A = E:GetModule('Auras');
local M = E:GetModule('Maps');
local CH = E:GetModule('Chat')

local LSM = LibStub("LibSharedMedia-3.0")

function MEAT:MinimapLocationPanels()
	local x,y = GetPlayerMapPosition("player")
	x = math.floor(100 * x)
	y = math.floor(100 * y)	
	
	ElvuiLoc.zone = ElvuiLoc:CreateFontString(nil, "Overlay")
	ElvuiLoc.zone:FontTemplate(E["meat"].font, E.db.meat.fontsize, E.db.meat.fontflag)
	ElvuiLoc.zone:SetPoint("CENTER")
	ElvuiLoc.zone:SetText(strsub(GetMinimapZoneText(),1,36))
	ElvuiLoc:EnableMouse(true)
	ElvuiLoc:SetScript("OnMouseDown", function() ToggleFrame(WorldMapFrame) end)
	
	
	ElvuiLocX.coord = ElvuiLocX:CreateFontString(nil, "Overlay")
	ElvuiLocX.coord:FontTemplate(E["meat"].font, E.db.meat.fontsize, E.db.meat.fontflag)
	ElvuiLocX.coord:SetPoint("CENTER", ElvuiLocX, "CENTER")
	ElvuiLocX.coord:SetText(x)	
	ElvuiLocX.coord:SetTextColor(unpack(E["media"].rgbvaluecolor))
	
	ElvuiLocY.coord = ElvuiLocY:CreateFontString(nil, "Overlay")
	ElvuiLocY.coord:FontTemplate(E["meat"].font, E.db.meat.fontsize, E.db.meat.fontflag)
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

function MEAT:SetupMedia()
	E["meat"].font = LSM:Fetch("font", E.db['meat'].font)
	E["media"].whisper = LSM:Fetch("sound", E.db["meat"].whispersound)
end

function MEAT:WhisperAlarm(event)
	if event == "CHAT_MSG_WHISPER" or "CHAT_MSG_BN_WHISPER" then
		if E.db.meat.whisper == true then
			PlaySoundFile(E["media"].whisper, "Master")
		end
	end
end

function MEAT:UpdateMedia()
	AB:UpdateABFont()
	CH:UpdateTabFont()
	DT:UpdateFontStyle()
	A:UpdateFontStyle()

	LeftChatToggleButton.text:FontTemplate(E["meat"].font, E.db.meat.fontsize, E.db.meat.fontflag)
	RightChatToggleButton.text:FontTemplate(E["meat"].font, E.db.meat.fontsize, E.db.meat.fontflag)
	ElvConfigToggle.text:FontTemplate(E["meat"].font, E.db.meat.fontsize, E.db.meat.fontflag)
end

function MEAT:Initialize()
	E["meat"] = {};

	local DBFholder = CreateFrame("Frame", "DBFAurasHolder", E.UIParent)
	DBFholder:Point("TOPRIGHT", E.UIParent, "TOPRIGHT", -((E.MinimapSize + 4) + E.RBRWidth + 7), -(4 + E.MinimapHeight))
	DBFholder:Width(456)
	DBFholder:Height(30)
	E:CreateMover(DBFAurasHolder, "DAurasMover", "Debuff Auras Frame", false, A.DAurasPostDrag)
	DBFAurasHolder.ClearAllPoints = E.noop
	DBFAurasHolder.SetPoint = E.noop
	DBFAurasHolder.SetAllPoints = E.noop

	--Setup Media
	self:SetupMedia()

	--Build MEAT EDITION
	E:GetModule('Blizzard'):HandleBubbles()
	LO:CreatePanels()
	self:LoadDefaultSetting()
	AB:AdjustBarPos()
	AB:MakeShadows()
	DT:PanelLayoutOptions2()
	DT:LoadDataTexts()
	self:MinimapLocationPanels()

	--Update Media
	self:UpdateMedia()

	--RegisterEvent
	self:RegisterEvent('CHAT_MSG_BN_WHISPER', 'WhisperAlarm')
	self:RegisterEvent('CHAT_MSG_WHISPER', 'WhisperAlarm')
	--self:Autogreed()
	self:Autorelease()
end

E:RegisterModule(MEAT:GetName())