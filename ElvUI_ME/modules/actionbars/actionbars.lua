local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local AB = E:GetModule('ActionBars');

function AB:AdjustBarPos()
	if E.db.meat.actionbarlayout == true and E.global.actionbar.enable == true then
		ElvUI_Bar2:Point('TOP', ElvUI_Bar1, 'TOP', 0, 0)
	end
end

function AB:MakeShadows()
	if E.global.actionbar.enable == true and not ElvUI_Bar1.backdrop.shadow then
		ElvUI_Bar1.backdrop:CreateShadow('Default')
		ElvUI_Bar2.backdrop:CreateShadow('Default')
		ElvUI_Bar3.backdrop:CreateShadow('Default')
		ElvUI_Bar4.backdrop:CreateShadow('Default')
		ElvUI_Bar5.backdrop:CreateShadow('Default')
	end
end