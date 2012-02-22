local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local MEAT = E:NewModule('MEAT', 'AceEvent-3.0')
local LO = E:GetModule('Layout');
local AB = E:GetModule('ActionBars');
local DT = E:GetModule('DataTexts')
local A = E:GetModule('Auras');

local LSM = LibStub("LibSharedMedia-3.0")

function MEAT:Initialize()
	local DBFholder = CreateFrame("Frame", "DBFAurasHolder", E.UIParent)
	DBFholder:Point("TOPRIGHT", E.UIParent, "TOPRIGHT", -((E.MinimapSize + 4) + E.RBRWidth + 7), -(4 + E.MinimapHeight))
	DBFholder:Width(456)
	DBFholder:Height(30)
	E:CreateMover(DBFAurasHolder, "DAurasMover", "Debuff Auras Frame", false, A.DAurasPostDrag)
	
	E:GetModule('Blizzard'):HandleBubbles()
	E:UpdateBlizzardFonts()
	LO:CreatePanels()
	AB:UpdateABFont()
	self:LoadDefaultSetting()
	AB:AdjustBarPos()
	AB:MakeShadows()
	DT:PanelLayoutOptions2()
	DT:LoadDataTexts()
end

E:RegisterModule(MEAT:GetName())