﻿local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB

P["meat"] = {
	["upperpanels"] = true,
	["bottompanels"] = true,
	["setup"] = false,
	["microbar"] = {
		["enable"] = true,
		["mouseover"] = false,
	},
	["actionbarlayout"] = true,
	["showtalent"] = true,
	["whisper"] = true,
	["whispersound"] = "ElvUI Warning",
	["autogreed"] = true,
	["autorelease"] = true,
}

P['datatexts'] = {
	['panels'] = {
		['LeftChatDataPanel'] = {
			['left'] = 'Armor',
			['middle'] = 'Durability',
			['right'] = 'Avoidance',
		},
		['RightChatDataPanel'] = {
			['left'] = 'System',
			['middle'] = 'Time',	
			['right'] = 'Gold',
		},
		['LeftMiniPanel'] = 'Guild',
		['RightMiniPanel'] = 'Friends',
		['TOPLEFTDT'] = 'Attack Power',
		['TOPRIGHTDT'] = 'Spec Switch',
	},
	['localtime'] = true,
	['time24'] = false,
	['specswap'] = true,
}