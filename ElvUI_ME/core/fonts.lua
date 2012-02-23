local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local AB = E:GetModule('ActionBars');
local LSM = LibStub("LibSharedMedia-3.0")


-- Action Bar fontset
function AB:StyleFont(button, noBackdrop)
	local name = button:GetName();
	local count = _G[name.."Count"];
	local hotkey = _G[name.."HotKey"];
	local macroName = _G[name.."Name"];
	
	if count then
		count:ClearAllPoints();
		count:SetPoint("BOTTOMRIGHT", 1, 0);
		count:FontTemplate(LSM:Fetch("font", E.db['general'].font), E.db.actionbar.fontsize, 'OUTLINE');
	end
	
	if self.db.macrotext and macroName then
		macroName:ClearAllPoints();
		macroName:SetPoint("BOTTOM", 2, 2);
		macroName:FontTemplate(LSM:Fetch("font", E.db['general'].font), E.db.actionbar.fontsize, 'OUTLINE');
	end
	
	if self.db.hotkeytext then
		hotkey:FontTemplate(LSM:Fetch("font", E.db['general'].font), E.db.actionbar.fontsize, 'OUTLINE');
	end
end

function AB:UpdateABFont()
	if E.global.actionbar.enable ~= true then return end
	for button, _ in pairs(self["handledbuttons"]) do
		if button then
			self:StyleFont(button, button.noBackdrop)
			--self:StyleFlyout(button)
		else
			self["handledbuttons"][button] = nil
		end
	end
end


-- Blizz&chat fontset
local function SetFont(obj, font, size, style, r, g, b, sr, sg, sb, sox, soy)
	obj:SetFont(font, size, style)
	if sr and sg and sb then obj:SetShadowColor(sr, sg, sb) end
	if sox and soy then obj:SetShadowOffset(sox, soy) end
	if r and g and b then obj:SetTextColor(r, g, b)
	elseif r then obj:SetAlpha(r) end
end

function E:SetFrameFont(cf, fontSize)
	local font = LSM:Fetch("font", self.db['meat'].font)
	cf:SetFont(font, fontSize, nil)
end

function E:UpdateBlizzardFonts()	
	local NORMAL     = self["media"].normFont
	local COMBAT     = LSM:Fetch('font', self.global.general.dmgfont)
	local NUMBER     = self["media"].normFont
	local _, editBoxFontSize, _, _, _, _, _, _, _, _ = GetChatWindowInfo(1)
	
	UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12
	CHAT_FONT_HEIGHTS = {8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}
	
	ChatTypeInfo.RAID_WARNING.sticky = 1

	UNIT_NAME_FONT     = NORMAL
	NAMEPLATE_FONT     = NORMAL
	DAMAGE_TEXT_FONT   = COMBAT
	STANDARD_TEXT_FONT = NORMAL

	if self.eyefinity then
		-- damage are huge on eyefinity, so we disable it
		InterfaceOptionsCombatTextPanelTargetDamage:Hide()
		InterfaceOptionsCombatTextPanelPeriodicDamage:Hide()
		InterfaceOptionsCombatTextPanelPetDamage:Hide()
		InterfaceOptionsCombatTextPanelHealing:Hide()
		SetCVar("CombatLogPeriodicSpells",0)
		SetCVar("PetMeleeDamage",0)
		SetCVar("CombatDamage",0)
		SetCVar("CombatHealing",0)
		
		-- set an invisible font for xp, honor kill, etc
		local INVISIBLE = [=[Interface\Addons\ElvUI\media\fonts\Invisible.ttf]=]
		COMBAT = INVISIBLE
	end	
	
	-- Base fonts
	SetFont(GameTooltipHeader,                  NORMAL, E.db.general.fontsize)
	SetFont(NumberFont_OutlineThick_Mono_Small, NUMBER, E.db.general.fontsize, "OUTLINE")
	SetFont(NumberFont_Outline_Huge,            NUMBER, 28, "THICKOUTLINE", 28)
	SetFont(NumberFont_Outline_Large,           NUMBER, 15, "OUTLINE")
	SetFont(NumberFont_Outline_Med,             NUMBER, E.db.general.fontsize, "OUTLINE")
	SetFont(NumberFont_Shadow_Med,              NORMAL, E.db.general.fontsize) --chat editbox uses this
	SetFont(NumberFont_Shadow_Small,            NORMAL, E.db.general.fontsize)
	SetFont(QuestFont,                          NORMAL, E.db.general.fontsize)
	SetFont(QuestFont_Large,                    NORMAL, 14)
	SetFont(SystemFont_Large,                   NORMAL, 15)
	SetFont(SystemFont_Shadow_Huge1,			NORMAL, 20, "OUTLINE") -- Raid Warning, Boss emote frame too
	SetFont(SystemFont_Med1,                    NORMAL, E.db.general.fontsize)
	SetFont(SystemFont_Med3,                    NORMAL, E.db.general.fontsize)
	SetFont(SystemFont_OutlineThick_Huge2,      NORMAL, 20, "THICKOUTLINE")
	SetFont(SystemFont_Outline_Small,           NUMBER, E.db.general.fontsize, "OUTLINE")
	SetFont(SystemFont_Shadow_Large,            NORMAL, 15)
	SetFont(SystemFont_Shadow_Med1,             NORMAL, E.db.general.fontsize)
	SetFont(SystemFont_Shadow_Med3,             NORMAL, E.db.general.fontsize)
	SetFont(SystemFont_Shadow_Outline_Huge2,    NORMAL, 20, "OUTLINE")
	SetFont(SystemFont_Shadow_Small,            NORMAL, E.db.general.fontsize)
	SetFont(SystemFont_Small,                   NORMAL, E.db.general.fontsize)
	SetFont(SystemFont_Tiny,                    NORMAL, E.db.general.fontsize)
	SetFont(Tooltip_Med,                        NORMAL, E.db.general.fontsize)
	SetFont(Tooltip_Small,                      NORMAL, E.db.general.fontsize)
	SetFont(ZoneTextString,						NORMAL, 32, "OUTLINE")
	SetFont(SubZoneTextString,					NORMAL, 25, "OUTLINE")
	SetFont(PVPInfoTextString,					NORMAL, 22, "OUTLINE")
	SetFont(PVPArenaTextString,					NORMAL, 22, "OUTLINE")
	SetFont(CombatTextFont,                     COMBAT, 100, "OUTLINE") -- number here just increase the font quality.
	
	for i = 1, NUM_CHAT_WINDOWS do
		local cf = _G["ChatFrame" .. i]
		local _, fontSize = FCF_GetChatWindowInfo(i)
		self:SetFrameFont(cf, fontSize)
	end
end