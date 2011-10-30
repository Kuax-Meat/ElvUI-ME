local E, C, L, DB = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if C["tooltip"].enable ~= true then return end

local SlotName = {
		"Head","Neck","Shoulder","Back","Chest","Wrist",
		"Hands","Waist","Legs","Feet","Finger0","Finger1",
		"Trinket0","Trinket1","MainHand","SecondaryHand","Ranged","Ammo"
	}

local function GetItemLVL(unit)
	local total, item = 0, 0;

	for i in pairs(SlotName) do
		local slot = GetInventoryItemLink(unit, GetInventorySlotInfo(SlotName[i] .. "Slot"));
		if (slot ~= nil) then
			item = item + 1;
			total = total + select(4, GetItemInfo(slot))
		end
	end
	if (item > 0) then
		return floor(total / item);
	end
	return 0;
end

GameTooltip:HookScript("OnTooltipSetUnit", function(self, ...)
	if C["tooltip"].itemlevel then
		local garbagecount = 0;
		local _, unit = GameTooltip:GetUnit();
		
		if (unit and CanInspect(unit)) then
			if (not ((InspectFrame and InspectFrame:IsShown()) or (Examiner and Examiner:IsShown()))) then
				NotifyInspect(unit);
				GameTooltip:AddLine(L.tooltip_itemlevel..":|cffffffff "..GetItemLVL(unit)..L.tooltip_equip.."|r");
				ClearInspectPlayer(unit);
				GameTooltip:Show();
			end		
		end
	end
end)
