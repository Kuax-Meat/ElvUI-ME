local E, L, DF = unpack(select(2, ...)); --Engine
local M = E:NewModule('Misc', 'AceEvent-3.0');

E.Misc = M;
local UIErrorsFrame = UIErrorsFrame;

function M:ErrorFrameToggle(event)
	if event == 'PLAYER_REGEN_DISABLED' then
		UIErrorsFrame:UnregisterEvent('UI_ERROR_MESSAGE')
	else
		UIErrorsFrame:RegisterEvent('UI_ERROR_MESSAGE')
	end
end

function M:COMBAT_LOG_EVENT_UNFILTERED(_, _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID, spellName)
	if not (event == "SPELL_INTERRUPT" and sourceGUID == UnitGUID('player')) then return end
	
	if E.db.core.interruptAnnounce == "PARTY" then
		if GetRealNumPartyMembers() > 0 then
			SendChatMessage(INTERRUPTED.." "..destName.."'s \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "PARTY", nil, nil)
		end
	elseif E.db.core.interruptAnnounce == "RAID" then
		if GetRealNumRaidMembers() > 0 then
			SendChatMessage(INTERRUPTED.." "..destName.."'s \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "RAID", nil, nil)		
		elseif GetRealNumPartyMembers() > 0 then
			SendChatMessage(INTERRUPTED.." "..destName.."'s \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "PARTY", nil, nil)
		end	
	elseif E.db.core.interruptAnnounce == "SAY" then
		if GetRealNumRaidMembers() > 0 then
			SendChatMessage(INTERRUPTED.." "..destName.."'s \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "SAY", nil, nil)		
		elseif GetRealNumPartyMembers() > 0 then
			SendChatMessage(INTERRUPTED.." "..destName.."'s \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "SAY", nil, nil)
		end		
	end
end

function M:MERCHANT_SHOW()
	local autoRepair = E.db.core.autoRepair
	if IsShiftKeyDown() or autoRepair == 'NONE' or not CanMerchantRepair() then return end
	
	local cost, possible = GetRepairAllCost()
	local withdrawLimit = GetGuildBankWithdrawMoney();
	if autoRepair == 'GUILD' and (not CanGuildBankRepair() or cost > withdrawLimit) then
		autoRepair = 'PLAYER'
	end
		
	if cost > 0 then
		if possible then
			RepairAllItems(autoRepair == 'GUILD')
			local c, s, g = cost%100, math.floor((cost%10000)/100), math.floor(cost/10000)
			
			if autoRepair == 'GUILD' then
				E:Print(L['Your items have been repaired using guild bank funds for: ']..GetCoinTextureString(cost, 12))
			else
				E:Print(L['Your items have been repaired for: ']..GetCoinTextureString(cost, 12))
			end
		else
			E:Print(L["You don't have enough money to repair."])
		end
	end
end

function M:ForceProfanity()
	local isOnline = BNConnected()
	if(isOnline) then
		BNSetMatureLanguageFilter(false)
	end
	
	SetCVar("profanityFilter", 0)
end

function M:Initialize()
	self:LoadRaidMarker()
	self:LoadExpRepBar()
	self:LoadMirrorBars()
	self:LoadLoot()
	self:LoadLootRoll()
	self:RegisterEvent('MERCHANT_SHOW')
	self:RegisterEvent('PLAYER_REGEN_DISABLED', 'ErrorFrameToggle')
	self:RegisterEvent('PLAYER_REGEN_ENABLED', 'ErrorFrameToggle')
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	
	--%TEMP BLIZZARD FIX%
	self:RegisterEvent('CVAR_UPDATE', 'ForceProfanity')
	self:RegisterEvent('BN_MATURE_LANGUAGE_FILTER', 'ForceProfanity')
end

E:RegisterModule(M:GetName())