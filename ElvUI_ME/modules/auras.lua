local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local A = E:GetModule('Auras');

local warningTime = 5
local btnspace = -4
local aurapos = "RIGHT"
local mainhand, offhand

function A:UpdateDebuffAnchors(buttonName, index)
	local debuff = _G[buttonName..index];
	if debuff:IsProtected() then return end -- uhh ohhh
	self:StyleBuffs(buttonName, index, true)
	local dtype = select(5, UnitDebuff("player",index))      
	local color
	if (dtype ~= nil) then
		color = DebuffTypeColor[dtype]
	else
		color = DebuffTypeColor["none"]
	end
	debuff.backdrop:SetBackdropBorderColor(color.r * 0.6, color.g * 0.6, color.b * 0.6)
	debuff:ClearAllPoints()
	if aurapos == "RIGHT" then
		if index == 1 then
			debuff:SetPoint("BOTTOMRIGHT", DBFAurasHolder, "BOTTOMRIGHT", 0, 0)
		else
			debuff:SetPoint("RIGHT", _G[buttonName..(index-1)], "LEFT", btnspace, 0)
		end
	else
		if index == 1 then
			debuff:SetPoint("BOTTOMLEFT", DBFAurasHolder, "BOTTOMLEFT", 0, 0)
		else
			debuff:SetPoint("LEFT", _G[buttonName..(index-1)], "RIGHT", -(btnspace), 0)
		end	
	end
	
	if index > self.db.perRow then
		debuff:Hide()
	else
		debuff:Show()
	end	
end