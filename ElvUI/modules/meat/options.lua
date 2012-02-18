local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB
local MT = E:GetModule('Meat')


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
			name = L["|cffff139bMeat Edition|r 3.2b-26b"],
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
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('Meat'):TogglePanels(); end
				},
				bottompanels = {
					order = 2,
					type = "toggle",
					name = L["하단 패널"],
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('Meat'):TogglePanels(); end
				},
			},
		},
	},
}