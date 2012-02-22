local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local MEAT = E:GetModule('MEAT')
local DT = E:GetModule('DataTexts')

local datatexts = {}

L['TOPLEFTDT'] = '상단 로고 좌측 패널';
L['TOPRIGHTDT'] = '상단 로고 우측 패널';

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
	name = L["|cffff139bMeat Edition|r"],
	childGroups = "select",
	get = function(info) return E.db.meat[ info[#info] ] end,
	set = function(info, value) E.db.meat[ info[#info] ] = value; end,
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["|cffff139bMeat Edition|r 1.01 Release"],
		},
		intro = {
			order = 2,
			type = "description",
			name = L["|cffff139bMeat Edition|r의 모든 코드는 |cff599fffElv|r와 |cff599fffMeat|r가 작성하였습니다. (Special Credit: odine)"],
		},
		reinstall = {
			order = 3,
			type = 'execute',
			name = L['재설치'],
			desc = L['Meat Edition을 재설치합니다.'],
			func = function() E.db.meat.setup = false; StaticPopup_Show("CONFIG_RL"); end,
		},
		note = {
			order = 4,
			type = "group",
			name = L["기능 및 변경사항"],
			guiInline = true,
			args = {
				notes = {
					order = 1,
					type = "description",
					name = L["|cff599fff2012/2/22 - 1.0 Release|r\n  |cffff139b* Features|r\n   1. 기본 레이아웃 변경\n   2. 마이크로 바\n   3. 버프 알림기\n   4. 정보문자 패널 추가 등"],
				},
			},
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
					name = L["상단 패널"],
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('Layout'):TogglePanels(); end
				},
				bottompanels = {
					order = 2,
					type = "toggle",
					name = L["하단 패널"],
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('Layout'):TogglePanels(); end
				},
				actionbarlayout = {
					order = 3,
					type = "toggle",
					name = L["액션바 고정"],
					desc = L['바2를 바1 위에 끼워넣고 모든 바를 1번 바에 종속시킵니다.'],
					set = function(info, value) E.db.meat[ info[#info] ] = value; E:GetModule('ActionBars'):AdjustBarPos(); StaticPopup_Show("CONFIG_RL"); end
				},
			},
		},
		medias = {
			order = 6,
			type = "group",
			name = L["미디어"],
			guiInline = true,
			args = {
				font = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 1,
					name = L["채팅창 글꼴"],
					desc = L["채팅창 글꼴 설정"],
					values = AceGUIWidgetLSMlists.font,	
					set = function(info, value) E.db.meat[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL"); end,
				},
			},
		},
		microbar = {
			type = "group",
			order = 7,
			name = L["마이크로 바"],
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
					desc = L['The frame is not shown unless you mouse over the frame.'],
					disabled = function() return not E.db.actionbar.enable or not E.db.meat.microbar.enable end,
				},
			},
		},
	},
}