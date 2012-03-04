local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local CH = E:GetModule('Chat')

local function StyleTabFont(frame)
	local name = frame:GetName()
	local tab = _G[name..'Tab']
	
	tab.text = _G[name.."TabText"]
	tab.text:FontTemplate(E["meat"].font, E.db.meat.fontsize, E.db.meat.fontflag)
end

function CH:UpdateTabFont()
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		StyleTabFont(frame)
	end
end