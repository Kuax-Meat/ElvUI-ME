local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

function DT:UpdateFontStyle()
	for panelName, panel in pairs(DT.RegisteredPanels) do
		for i=1, panel.numPoints do
			local pointIndex = DT.PointLocation[i]
			panel.dataPanels[pointIndex].text:FontTemplate(E["meat"].font, E.db.meat.fontsize, E.db.meat.fontflag)
		end
	end
end