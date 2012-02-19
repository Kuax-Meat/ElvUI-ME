local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB
local MEAT = E:GetModule('MEAT')


E.Options.args.meat = {
	type = "group",
	name = L["|cffff139bMeat Edition|r"],
	childGroups = "select",
	get = function(info) return E.db.meat[ info[#info] ] end,
	set = function(info, value) E.db.meat[ info[#info] ] = value; end,
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["|cffff139bMeat Edition|r 3.2b-26c"],
		},
		intro = {
			order = 2,
			type = "description",
			name = L["|cffff139bMeat Edition|r의 설정을 조절합니다. (BETA)"],
		},
		generals = {
			order = 3,
			type = "group",
			name = L["General"],
			guiInline = true,
			args = {
				upperpanels = {
					order = 1,
					type = "toggle",
					name = L["상단 패널"],
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('MEAT'):TogglePanels(); end
				},
				bottompanels = {
					order = 2,
					type = "toggle",
					name = L["하단 패널"],
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('MEAT'):TogglePanels(); end
				},
			},
		},
		medias = {
			order = 4,
			type = "group",
			name = L["미디어"],
			guiInline = true,
			args = {
				font = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 1,
					name = L["전역 글꼴"],
					desc = L["정보문자/행동 단축바/버프창 글꼴 설정"],
					values = AceGUIWidgetLSMlists.font,	
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('MEAT'):SetupFont(); StaticPopup_Show("CONFIG_RL"); end,
				},
				fontsize = {
					order = 2,
					name = L["Font Size"],
					type = "range",
					min = 6, max = 22, step = 1,
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('MEAT'):SetupFont(); StaticPopup_Show("CONFIG_RL"); end,
				},	
			},
		},
	},
}