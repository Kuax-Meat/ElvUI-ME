local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local MEAT = E:GetModule('MEAT')
local CT = E:GetModule('ClassTimers')

function MEAT:ConsShadow()
	if E.db.meat.shadows ~= true then return end

	-- Add Shadow to Default layout
	if not LeftChatPanel.backdrop.shadow then
		LeftChatPanel.backdrop:CreateShadow("Default")
		RightChatPanel.backdrop:CreateShadow("Default")

		Minimap.backdrop:SetFrameStrata("BACKGROUND")
		Minimap.backdrop:SetFrameLevel("2")
		Minimap.backdrop:CreateShadow("Default")
		LeftMiniPanel:CreateShadow("Default")
		RightMiniPanel:CreateShadow("Default")
		ElvConfigToggle:CreateShadow("Default")
		RaidBuffReminder:CreateShadow("Default")

		Uppanels:CreateShadow("Default")
		Downpanels.backdrop:CreateShadow("Default")
		ElvuiLoc:CreateShadow("Default")
		ElvuiLocX:CreateShadow("Default")
		ElvuiLocY:CreateShadow("Default")
		TOPLEFTDT:CreateShadow("Default")
		TOPRIGHTDT:CreateShadow("Default")
	end
	
	if E.global.actionbar.enable == true and not ElvUI_Bar1.backdrop.shadow then
		ElvUI_Bar1.backdrop:CreateShadow('Default')
		ElvUI_Bar2.backdrop:CreateShadow('Default')
		ElvUI_Bar3.backdrop:CreateShadow('Default')
		ElvUI_Bar4.backdrop:CreateShadow('Default')
		ElvUI_Bar5.backdrop:CreateShadow('Default')
		ElvUI_BarShapeShift.backdrop:CreateShadow('Default')
		ElvUI_BarPet.backdrop:CreateShadow('Default')
	end
end
