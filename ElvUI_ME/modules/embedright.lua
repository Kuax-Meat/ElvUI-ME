local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

function S:SetEmbedRight(addon)
	self:RemovePrevious(addon)
	if addon == 'OmenRecount' then
	elseif not IsAddOnLoaded(addon) then return; end

	if self.lastAddon == nil then self.lastAddon = addon; end

	if addon == 'Recount' then
		Recount:LockWindows(true)
		
		Recount_MainWindow:ClearAllPoints()
		Recount_MainWindow:SetPoint("BOTTOMLEFT", RightChatDataPanel, "TOPLEFT", 0, 4)

		if E.db.general.panelBackdrop == 'SHOWBOTH' or E.db.general.panelBackdrop == 'SHOWRIGHT' then
			Recount_MainWindow:SetWidth(E.db.general.panelWidth - 10)
			Recount_MainWindow:SetHeight(E.db.general.panelHeight - 26)
		else
			Recount_MainWindow:SetWidth(E.db.general.panelWidth)
			Recount_MainWindow:SetHeight(E.db.general.panelHeight - 20)		
		end		
		Recount_MainWindow:SetParent(RightChatPanel)	
		self.lastAddon = addon
	elseif addon == 'Omen' then
		Omen.db.profile.Locked = true
		Omen:UpdateGrips()
		if not Omen.oldUpdateGrips then
			Omen.oldUpdateGrips = Omen.UpdateGrips
		end
		Omen.UpdateGrips = function(...)
			local db = Omen.db.profile
			if S.db.embedRight == 'Omen' then
				Omen.VGrip1:ClearAllPoints()
				Omen.VGrip1:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip1, 0)
				Omen.VGrip1:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip1, 0)
				Omen.VGrip2:ClearAllPoints()
				Omen.VGrip2:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip2, 0)
				Omen.VGrip2:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip2, 0)
				Omen.Grip:Hide()
				if db.Locked then
					Omen.VGrip1:Hide()
					Omen.VGrip2:Hide()
				else
					Omen.VGrip1:Show()
					if db.Bar.ShowTPS then
						Omen.VGrip2:Show()
					else
						Omen.VGrip2:Hide()
					end
				end			
			else
				Omen.oldUpdateGrips(...)
			end
		end
		
		if not Omen.oldSetAnchors then
			Omen.oldSetAnchors = Omen.SetAnchors
		end
		Omen.SetAnchors = function(...)
			if S.db.embedRight == 'Omen' then return; end
			Omen.oldSetAnchors(...)
		end
		
		OmenAnchor:ClearAllPoints()
		OmenAnchor:SetPoint("BOTTOMLEFT", RightChatDataPanel, "TOPLEFT", 0, 4)
		
		if E.db.general.panelBackdrop == 'SHOWBOTH' or E.db.general.panelBackdrop == 'SHOWRIGHT' then
			OmenAnchor:SetWidth(E.db.general.panelWidth - 10)
			OmenAnchor:SetHeight(E.db.general.panelHeight - 35)
		else
			OmenAnchor:SetWidth(E.db.general.panelWidth)
			OmenAnchor:SetHeight(E.db.general.panelHeight - 29)		
		end
		
		OmenAnchor:SetParent(RightChatPanel)
		OmenAnchor:SetFrameStrata('LOW')
		if not OmenAnchor.SetFrameStrataOld then
			OmenAnchor.SetFrameStrataOld = OmenAnchor.SetFrameStrata
		end
		OmenAnchor.SetFrameStrata = E.noop
		
		local StartMoving = Omen.Title:GetScript('OnMouseDown')
		local StopMoving = Omen.Title:GetScript('OnMouseUp')
		Omen.Title:SetScript("OnMouseDown", function()
			if S.db.embedRight == 'Omen' then return end
			StartMoving()
		end)
		
		Omen.Title:SetScript("OnMouseUp", function()
			if S.db.embedRight == 'Omen' then return end
			StopMoving()
		end)	

		Omen.BarList:SetScript("OnMouseDown", function()
			if S.db.embedRight == 'Omen' then return end
			StartMoving()
		end)
		
		Omen.BarList:SetScript("OnMouseUp", function()
			if S.db.embedRight == 'Omen' then return end
			StopMoving()
		end)				
		
		self.lastAddon = addon
	elseif addon == 'Skada' then
		-- Update pre-existing displays
		table.wipe(skadaWindows)
		for _, window in ipairs(Skada:GetWindows()) do
			window:UpdateDisplay()
			tinsert(skadaWindows, window)
		end
	
		self:RemovePrevious(addon)

		function Skada:CreateWindow(name, db)
			Skada:CreateWindow_(name, db)
			
			table.wipe(skadaWindows)
			for _, window in ipairs(Skada:GetWindows()) do
				tinsert(skadaWindows, window)
			end	
			
			if S.db.embedRight == 'Skada' then
				S:EmbedSkada()
			end
		end
		
		function Skada:DeleteWindow(name)
			Skada:DeleteWindow_(name)
			
			table.wipe(skadaWindows)
			for _, window in ipairs(Skada:GetWindows()) do
				tinsert(skadaWindows, window)
			end	
			
			if S.db.embedRight == 'Skada' then
				S:EmbedSkada()
			end
		end
		
		self:EmbedSkada()
		self.lastAddon = addon
	elseif addon == 'OmenRecount' then
		OmenAnchor:ClearAllPoints()
		OmenAnchor:SetPoint('TOPLEFT', RightChatTab, 'BOTTOMLEFT', 0, -2)
		OmenAnchor:SetPoint('BOTTOMRIGHT', RightChatDataPanel, 'TOP', 0, 2)

		Recount_MainWindow:ClearAllPoints()
		Recount_MainWindow:SetPoint("BOTTOMLEFT", RightChatDataPanel, "TOP", 2, 2)
		Recount_MainWindow:SetPoint("TOPRIGHT", RightChatTab, "BOTTOMRIGHT", 0, 8)
		Omen.db.profile.TitleBar.Height = 19
		
		if (E.db.general.panelBackdrop == 'SHOWBOTH' or E.db.general.panelBackdrop == 'SHOWRIGHT') and not button then
			local button = CreateFrame('Button', 'OmenToggleSwitch', RightChatTab)
			button:Width(90)
			button:Height(RightChatTab:GetHeight() - 4)
			button:Point("RIGHT", RightChatTab, "RIGHT", -2, 0)
		
			button.tex = button:CreateTexture(nil, 'OVERLAY')
			button.tex:SetTexture([[Interface\AddOns\ElvUI\media\textures\vehicleexit.tga]])
			button.tex:Point('TOPRIGHT', -2, -2)
			button.tex:Height(button:GetHeight() - 4)
			button.tex:Width(16)
			
			button.text = button:CreateFontString(nil, "Overlay")
			button.text:FontTemplate()
			button.text:SetPoint('RIGHT', button.tex, 'LEFT')
			button.text:SetTextColor(unpack(E["media"].rgbvaluecolor))
		
			button:SetScript('OnEnter', function(self) button.text:SetText(L["ME Toggle"]..' Omen/Recount') end)
			button:SetScript('OnLeave', function(self) self.tex:Point('TOPRIGHT', -2, -2); button.text:SetText(nil) end)
			button:SetScript('OnMouseDown', function(self) self.tex:Point('TOPRIGHT', -4, -4) end)
			button:SetScript('OnMouseUp', function(self) self.tex:Point('TOPRIGHT', -2, -2) end)
			button:SetScript('OnClick', function(self) Omen:Toggle(); ToggleFrame(Recount_MainWindow) end)
		end	
	end
end
-- building Omen Recount Option
E.Options.args.skins = {
	type = "group",
	name = L["Skins"],
	childGroups = "select",
	args = {
		embedRight = {
			order = 2,
			type = 'select',
			name = L['Embedded Addon'],
			desc = L['Select an addon to embed to the right chat window. This will resize the addon to fit perfectly into the chat window, it will also parent it to the chat window so hiding the chat window will also hide the addon.'],
			values = {
				[''] = ' ',
				['Recount'] = "Recount",
				['Omen'] = "Omen",
				['Skada'] = "Skada",
				['OmenRecount'] = "OmenRecount"
			},
			get = function(info) return E.global.skins[ info[#info] ] end,
			set = function(info, value) E.global.skins[ info[#info] ] = value; S:SetEmbedRight(value) end,
		},
		bigwigs = {
			order = 3,
			type = 'group',
			name = 'BigWigs',
			get = function(info) return E.global.skins.bigwigs[ info[#info] ] end,
			set = function(info, value) E.global.skins.bigwigs[ info[#info] ] = value; end,
			args = {
				enable = {
					name = L['Enable'],
					type = 'toggle',
					order = 1,
					get = function(info) return E.global.skins.bigwigs[ info[#info] ] end,
					set = function(info, value) E.global.skins.bigwigs[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,					
				},
				spacing = {
					name = L['Spacing'],
					desc = L['The spacing in between bars.'],
					type = 'range',
					order = 2,
					min = 0, max = 25, step = 1,
				},
			},
		},
		ace3 = {
			order = 4,
			type = 'group',
			name = 'Ace3',
			get = function(info) return E.global.skins.ace3[ info[#info] ] end,
			set = function(info, value) E.global.skins.ace3[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,
			args = {
				enable = {
					name = L['Enable'],
					type = 'toggle',
					order = 1,				
				},			
			},
		},
		recount = {
			order = 5,
			type = 'group',
			name = 'Recount',
			get = function(info) return E.global.skins.recount[ info[#info] ] end,
			set = function(info, value) E.global.skins.recount[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,
			args = {
				enable = {
					name = L['Enable'],
					type = 'toggle',
					order = 1,				
				},			
			},
		},
		omen = {
			order = 6,
			type = 'group',
			name = 'Omen',
			get = function(info) return E.global.skins.omen[ info[#info] ] end,
			set = function(info, value) E.global.skins.omen[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,
			args = {
				enable = {
					name = L['Enable'],
					type = 'toggle',
					order = 1,				
				},			
			},
		},	
		skada = {
			order = 7,
			type = 'group',
			name = 'Skada',
			get = function(info) return E.global.skins.skada[ info[#info] ] end,
			set = function(info, value) E.global.skins.skada[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,
			args = {
				enable = {
					name = L['Enable'],
					type = 'toggle',
					order = 1,				
				},			
			},
		},	
		dxe = {
			order = 8,
			type = 'group',
			name = 'DXE',
			get = function(info) return E.global.skins.dxe[ info[#info] ] end,
			set = function(info, value) E.global.skins.dxe[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,
			args = {
				enable = {
					name = L['Enable'],
					type = 'toggle',
					order = 1,				
				},			
			},
		},	
		dbm = {
			order = 9,
			type = 'group',
			name = 'DBM',
			get = function(info) return E.global.skins.dbm[ info[#info] ] end,
			set = function(info, value) E.global.skins.dbm[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,
			args = {
				enable = {
					name = L['Enable'],
					type = 'toggle',
					order = 1,				
				},			
			},
		},	
		tinydps = {
			order = 10,
			type = 'group',
			name = 'TinyDPS',
			get = function(info) return E.global.skins.tinydps[ info[#info] ] end,
			set = function(info, value) E.global.skins.tinydps[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,
			args = {
				enable = {
					name = L['Enable'],
					type = 'toggle',
					order = 1,				
				},			
			},
		},		
		blizzard = {
			order = 300,
			type = 'group',
			name = 'Blizzard',
			get = function(info) return E.global.skins.blizzard[ info[#info] ] end,
			set = function(info, value) E.global.skins.blizzard[ info[#info] ] = value; StaticPopup_Show("CONFIG_RL") end,	
			args = {
				enable = {
					name = L['Enable'],
					type = 'toggle',
					order = 1,				
				},		
				encounterjournal = {
					type = "toggle",
					name = L["Encounter Journal"],
					desc = L["TOGGLESKIN_DESC"],
				},
				reforge = {
					type = "toggle",
					name = L["Reforge Frame"],
					desc = L["TOGGLESKIN_DESC"],
				},
				calendar = {
					type = "toggle",
					name = L["Calendar Frame"],
					desc = L["TOGGLESKIN_DESC"],
				},
				achievement = {
					type = "toggle",
					name = L["Achievement Frame"],
					desc = L["TOGGLESKIN_DESC"],
				},		
				lfguild = {
					type = "toggle",
					name = L["LF Guild Frame"],
					desc = L["TOGGLESKIN_DESC"],
				},	
				inspect = {
					type = "toggle",
					name = L["Inspect Frame"],
					desc = L["TOGGLESKIN_DESC"],
				},		
				binding = {
					type = "toggle",
					name = L["KeyBinding Frame"],
					desc = L["TOGGLESKIN_DESC"],
				},		
				gbank = {
					type = "toggle",
					name = L["Guild Bank"],
					desc = L["TOGGLESKIN_DESC"],
				},	
				archaeology = {
					type = "toggle",
					name = L["Archaeology Frame"],
					desc = L["TOGGLESKIN_DESC"],
				},	
				guildcontrol = {
					type = "toggle",
					name = L["Guild Control Frame"],
					desc = L["TOGGLESKIN_DESC"],
				},		
				guild = {
					type = "toggle",
					name = L["Guild Frame"],
					desc = L["TOGGLESKIN_DESC"],							
				},
				tradeskill = {
					type = "toggle",
					name = L["TradeSkill Frame"],
					desc = L["TOGGLESKIN_DESC"],							
				},	
				raid = {
					type = "toggle",
					name = L["Raid Frame"],
					desc = L["TOGGLESKIN_DESC"],									
				},
				talent = {
					type = "toggle",
					name = L["Talent Frame"],
					desc = L["TOGGLESKIN_DESC"],							
				},
				glyph = {
					type = "toggle",
					name = L["Glyph Frame"],
					desc = L["TOGGLESKIN_DESC"],							
				},
				auctionhouse = {
					type = "toggle",
					name = L["Auction Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				timemanager = {
					type = "toggle",
					name = L["Time Manager"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				barber = {
					type = "toggle",
					name = L["Barbershop Frame"],
					desc = L["TOGGLESKIN_DESC"],							
				},
				macro = {
					type = "toggle",
					name = L["Macro Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				debug = {
					type = "toggle",
					name = L["Debug Tools"],
					desc = L["TOGGLESKIN_DESC"],							
				},
				trainer = {
					type = "toggle",
					name = L["Trainer Frame"],
					desc = L["TOGGLESKIN_DESC"],							
				},		
				socket = {
					type = "toggle",
					name = L["Socket Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				achievement_popup = {
					type = "toggle",
					name = L["Achievement Popup Frames"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				bgscore = {
					type = "toggle",
					name = L["BG Score"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				merchant = {
					type = "toggle",
					name = L["Merchant Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				mail = {
					type = "toggle",
					name = L["Mail Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				help = {
					type = "toggle",
					name = L["Help Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				trade = {
					type = "toggle",
					name = L["Trade Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				gossip = {
					type = "toggle",
					name = L["Gossip Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				greeting = {
					type = "toggle",
					name = L["Greeting Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				worldmap = {
					type = "toggle",
					name = L["World Map"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				taxi = {
					type = "toggle",
					name = L["Taxi Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				lfd = {
					type = "toggle",
					name = L["LFD Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				quest = {
					type = "toggle",
					name = L["Quest Frames"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				petition = {
					type = "toggle",
					name = L["Petition Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				dressingroom = {
					type = "toggle",
					name = L["Dressing Room"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				pvp = {
					type = "toggle",
					name = L["PvP Frames"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				nonraid = {
					type = "toggle",
					name = L["Non-Raid Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				friends = {
					type = "toggle",
					name = L["Friends"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				spellbook = {
					type = "toggle",
					name = L["Spellbook"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				character = {
					type = "toggle",
					name = L["Character Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},
				lfr = {
					type = "toggle",
					name = L["LFR Frame"],
					desc = L["TOGGLESKIN_DESC"],
				},
				misc = {
					type = "toggle",
					name = L["Misc Frames"],
					desc = L["TOGGLESKIN_DESC"],								
				},		
				tabard = {
					type = "toggle",
					name = L["Tabard Frame"],
					desc = L["TOGGLESKIN_DESC"],								
				},		
				guildregistrar = {
					type = "toggle",
					name = L["Guild Registrar"],
					desc = L["TOGGLESKIN_DESC"],								
				},		
				bags = {
					type = "toggle",
					name = L["Bags"],
					desc = L["TOGGLESKIN_DESC"],									
				},				
			},
		},
	},
}