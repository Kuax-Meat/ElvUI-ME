local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB

function E:SetupResolution()
	E:UpdateAll()
	if InstallStepComplete then
		InstallStepComplete.message = L["Resolution Style Set"]
		InstallStepComplete:Show()		
	end
end

function E:SetupLayout(layout)
	--Datatexts
	E:CopyTable(E.db.datatexts.panels, P.datatexts.panels)
	if layout == 'tank' then
		E.db.datatexts.panels.LeftChatDataPanel.left = 'Armor';
		E.db.datatexts.panels.LeftChatDataPanel.right = 'Avoidance';
	elseif layout == 'healer' or layout == 'dpsCaster' then
		E.db.datatexts.panels.LeftChatDataPanel.left = 'Spell/Heal Power';
		E.db.datatexts.panels.LeftChatDataPanel.right = 'Haste';
	else
		E.db.datatexts.panels.LeftChatDataPanel.left = 'Attack Power';
		E.db.datatexts.panels.LeftChatDataPanel.right = 'Crit Chance';
	end
	
	E.db.layoutSet = layout
	
	E:UpdateAll()
	if InstallStepComplete then
		InstallStepComplete.message = L["Layout Set"]
		InstallStepComplete:Show()	
	end
end