--------------------------------------------------------------------------
-- Auto-Release when dead in Battleground.
--------------------------------------------------------------------------

local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local MEAT = E:GetModule('MEAT');

function MEAT:Autorelease()
	if E.db.meat.autorelease ~= true then return end
	local autoreleasepvp = CreateFrame("frame")
	autoreleasepvp:RegisterEvent("PLAYER_DEAD")
	autoreleasepvp:SetScript("OnEvent", function(self, event)
		local soulstone = GetSpellInfo(20707)
		if ((E.myclass ~= "SHAMAN") and not (soulstone and UnitBuff("player", soulstone))) and MiniMapBattlefieldFrame.status == "active" then
			RepopMe()
		end
	end)
end