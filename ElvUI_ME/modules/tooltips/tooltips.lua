local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local TT = E:GetModule('Tooltip')

function TT:GameTooltipStatusBar_OnValueChanged(tt, value)
	if not value then return end
	local min, max = tt:GetMinMaxValues()
	
	if (value < min) or (value > max) then
		return
	end
	local _, unit = GameTooltip:GetUnit()
	
	-- fix target of target returning nil
	if (not unit) then
		local GMF = GetMouseFocus()
		unit = GMF and GMF:GetAttribute("unit")
	end

	if tt.text then
		if unit then
			min, max = UnitHealth(unit), UnitHealthMax(unit)
			tt.text:Show()
			local hp = (min).." / "..(max)
			if UnitIsDeadOrGhost(unit) then
				tt.text:SetText(DEAD)
			else
				tt.text:SetText(hp)
			end
		else
			tt.text:Hide()
		end
	end
end