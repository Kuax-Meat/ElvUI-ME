local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local MEAT = E:GetModule('MEAT')
local DT = E:GetModule('DataTexts')

local datatexts = {}
local version = GetAddOnMetadata("ElvUI_ME", "Version");

function DT:PanelLayoutOptions2()	
	for name, _ in pairs(DT.RegisteredDataTexts) do
		datatexts[name] = name
	end
	datatexts[''] = ''
	
	local table = E.Options.args.datatexts.args.panels.args
	local i = 0
	for pointLoc, tab in pairs(P.datatexts.panels) do
		i = i + 1
		if not _G[pointLoc] then table[pointLoc] = nil; return; end
		if type(tab) == 'table' then
			table[pointLoc] = {
				type = 'group',
				args = {},
				name = L[pointLoc] or pointLoc,
				guiInline = true,
				order = i + -10,
			}			
			for option, value in pairs(tab) do
				table[pointLoc].args[option] = {
					type = 'select',
					name = L[option] or option:upper(),
					values = datatexts,
					get = function(info) return E.db.datatexts.panels[pointLoc][ info[#info] ] end,
					set = function(info, value) E.db.datatexts.panels[pointLoc][ info[#info] ] = value; DT:LoadDataTexts() end,									
				}
			end
		elseif type(tab) == 'string' then
			table[pointLoc] = {
				type = 'select',
				name = L[pointLoc] or pointLoc,
				values = datatexts,
				get = function(info) return E.db.datatexts.panels[pointLoc] end,
				set = function(info, value) E.db.datatexts.panels[pointLoc] = value; DT:LoadDataTexts() end,	
			}						
		end
	end
end

E.Options.args.meat = {
	type = "group",
	name = L["Meat Edition"],
	childGroups = "select",
	get = function(info) return E.db.meat[ info[#info] ] end,
	set = function(info, value) E.db.meat[ info[#info] ] = value; end,
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["Meat Edition"]..format(" %s", version),
		},
		intro = {
			order = 2,
			type = "description",
			name = L["Meat Edition DESC"],
		},
		note = {
			order = 3,
			type = "group",
			name = L["ME Changelog"],
			guiInline = true,
			args = {
				notes = {
					order = 1,
					type = "description",
					name = L["ME Changelog DESC"],
				},
			},
		},
		reinstall = {
			order = 4,
			type = 'execute',
			name = L["ME Reinstall"],
			desc = L["ME Reinstall DESC"],
			func = function() E.db.meat.setup = false; StaticPopup_Show("CONFIG_RL"); end,
		},
		generals = {
			order = 5,
			type = "group",
			name = L["General"],
			guiInline = true,
			args = {
				upperpanels = {
					order = 1,
					type = "toggle",
					name = L["ME UPPANEL"],
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('Layout'):TogglePanels(); E:GetModule('MEAT'):MinimapLocToggle(); end
				},
				bottompanels = {
					order = 2,
					type = "toggle",
					name = L["ME BOTPANEL"],
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('Layout'):TogglePanels(); end
				},
				actionbarlayout = {
					order = 3,
					type = "toggle",
					name = L["ME AB FIX"],
					desc = L["ME AB FIX DESC"],
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('ActionBars'):AdjustBarPos(); StaticPopup_Show("CONFIG_RL"); end
				},
			},
		},
		medias = {
			order = 6,
			type = "group",
			name = L["Media"],
			guiInline = true,
			args = {
				font = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 1,
					name = L["ME Chatfont"],
					values = AceGUIWidgetLSMlists.font,	
					set = function(info, value) E.db.meat[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL"); end,
				},
			},
		},
		microbar = {
			type = "group",
			order = 7,
			name = L["ME Microbar"],
			guiInline = true,
			get = function(info) return E.db.meat.microbar[ info[#info] ] end,
			set = function(info, value) E.db.meat.microbar[ info[#info] ] = value; E:GetModule('ActionBars'):UpdateMicroBar(); end,
			args = {
				enable = {
					order = 1,
					type = 'toggle',
					name = L['Enable'],
				},
				mouseover = {
					type = "toggle",
					order = 11,
					name = L['Mouse Over'],
					disabled = function() return not E.global.actionbar.enable or not E.db.meat.microbar.enable end,
				},
			},
		},
	},
}