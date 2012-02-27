local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local LSM = LibStub("LibSharedMedia-3.0")

if LSM == nil then return end

LSM:Register("font","ElvUI Font", [[Interface\AddOns\ElvUI_ME\media\fonts\base.ttf]], 255)
LSM:Register("font", "ElvUI Pixel", [[Interface\AddOns\ElvUI_ME\media\fonts\bitmap.ttf]], 255)
LSM:Register("font","ElvUI Alt-Combat 2", [[Interface\AddOns\ElvUI_ME\media\fonts\altcombat2.ttf]], 255)
LSM:Register("font","Tukui Combat", [[Interface\AddOns\ElvUI_ME\media\fonts\tukui_combat.ttf]], 255)
LSM:Register("sound","ElvUI SpecWarn", [[Interface\AddOns\ElvUI_ME\media\sounds\specwarn.mp3]])

DAMAGE_TEXT_FONT = LSM:Fetch('font', E.global.general.dmgfont)
UNIT_NAME_FONT = LSM:Fetch('font', E.db.general.font)
NAMEPLATE_FONT = LSM:Fetch('font', E.db.general.font)
STANDARD_TEXT_FONT = LSM:Fetch('font', E.db.general.font)