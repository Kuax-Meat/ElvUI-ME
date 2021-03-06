local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

function UF:Build_Layout(value)
	if value == "Zeph" then
		if E.db.meat.zephlayout ~= true then
			E.db.meat.zephlayout = true
			E.db.meat.duffedlayout = false
			E.db.unitframe.units.player.power.width = "spaced"
			E.db.unitframe.units.player.power.height = 9
			E.db.unitframe.units.player.height = 42
			E.db.unitframe.units.player.classbar.fill = "spaced"
			E.db.unitframe.units.target.power.width = "spaced"
			E.db.unitframe.units.target.power.height = 9
			E.db.unitframe.units.target.height = 42
			E.db.unitframe.units.target.combobar.fill = "spaced"
			E.db.unitframe.units.targettarget.power.width = "spaced"
			E.db.unitframe.units.targettarget.power.height = 8
			E.db.unitframe.units.targettarget.power.offset = 6
			E.db.unitframe.units.focus.power.width = "spaced"
			E.db.unitframe.units.focus.power.height = 8
			E.db.unitframe.units.focus.power.offset = 6
		end
	elseif value == "Duffed" then
		if E.db.meat.duffedlayout ~= true then
			E.db.meat.zephlayout = false
			E.db.meat.duffedlayout = true
			E.db.unitframe.units.player.power.width = "fill"
			E.db.unitframe.units.player.power.height = 6
			E.db.unitframe.units.player.height = 48
			E.db.unitframe.units.player.classbar.fill = "fill"
			E.db.unitframe.units.target.power.width = "fill"
			E.db.unitframe.units.target.power.height = 6
			E.db.unitframe.units.target.height = 48
			E.db.unitframe.units.target.combobar.fill = "fill"
			E.db.unitframe.units.targettarget.power.width = "fill"
			E.db.unitframe.units.targettarget.power.height = 6
			E.db.unitframe.units.targettarget.power.offset = 0
			E.db.unitframe.units.focus.power.width = "fill"
			E.db.unitframe.units.focus.power.height = 6
			E.db.unitframe.units.focus.power.offset = 0
		end
	end
end

-----------------
-- Cons Shadow --
-----------------

function UF:Construct_HealthBar(frame, bg, text, textPos)
	local health = CreateFrame('StatusBar', nil, frame)	
	UF['statusbars'][health] = true
	
	health:SetFrameStrata("LOW")
	--health.frequentUpdates = true
	health.PostUpdate = self.PostUpdateHealth
	
	if bg then
		health.bg = health:CreateTexture(nil, 'BORDER')
		health.bg:SetAllPoints()
		health.bg:SetTexture(E["media"].blankTex)
		health.bg.multiplier = 0.25
	end
	
	if text then
		health.value = health:CreateFontString(nil, 'OVERLAY')
		UF['fontstrings'][health.value] = true
		health.value:SetParent(frame)
		
		local x = -2
		if textPos == 'LEFT' then
			x = 2
		end
		
		health.value:Point(textPos, health, textPos, x, 0)		
	end
	
	health.colorTapping = true	
	health.colorDisconnected = true
	health:CreateBackdrop('Default')	
	if E.db.meat.shadows == true and not health.backdrop.shadow then
		health.backdrop:CreateShadow('Default')
	end
	
	return health
end

function UF:Construct_PowerBar(frame, bg, text, textPos, lowtext)
	local power = CreateFrame('StatusBar', nil, frame)
	UF['statusbars'][power] = true
	
	--power.frequentUpdates = true
	power:SetFrameStrata("LOW")
	power.PostUpdate = self.PostUpdatePower

	if bg then
		power.bg = power:CreateTexture(nil, 'BORDER')
		power.bg:SetAllPoints()
		power.bg:SetTexture(E["media"].blankTex)
		power.bg.multiplier = 0.2
	end
	
	if text then
		power.value = power:CreateFontString(nil, 'OVERLAY')	
		UF['fontstrings'][power.value] = true
		power.value:SetParent(frame)
		
		local x = -2
		if textPos == 'LEFT' then
			x = 2
		end
		
		power.value:Point(textPos, frame.Health, textPos, x, 0)
	end
	
	if lowtext then
		power.LowManaText = power:CreateFontString(nil, 'OVERLAY')
		UF['fontstrings'][power.LowManaText] = true
		power.LowManaText:SetParent(frame)
		power.LowManaText:Point("BOTTOM", frame.Health, "BOTTOM", 0, 7)
		power.LowManaText:SetTextColor(0.69, 0.31, 0.31)
	end
	
	power.colorDisconnected = false
	power.colorTapping = false
	power:CreateBackdrop('Default')
	if E.db.meat.shadows == true and not power.backdrop.shadow then
		power.backdrop:CreateShadow('Default')
	end

	return power
end	

function UF:Construct_Portrait(frame)
	local portrait = CreateFrame("PlayerModel", nil, frame)
	portrait:SetFrameStrata('LOW')
	portrait:CreateBackdrop('Default')
	portrait.PostUpdate = self.PortraitUpdate

	portrait.overlay = CreateFrame("Frame", nil, frame)
	portrait.overlay:SetFrameLevel(frame:GetFrameLevel() - 5)
	
	if E.db.meat.shadows == true and not portrait.backdrop.shadow then
		portrait.backdrop:CreateShadow('Default')
	end

	return portrait
end

---------------
-- Update UF --
---------------

-- Focus Frame
function UF:Update_FocusFrame(frame, db)
	frame.db = db
	local BORDER = E:Scale(2)
	local SPACING = E:Scale(1)
	local UNIT_WIDTH = db.width
	local UNIT_HEIGHT = db.height
	
	local USE_POWERBAR = db.power.enable
	local USE_MINI_POWERBAR = db.power.width ~= 'fill' and USE_POWERBAR
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR
	local POWERBAR_OFFSET = db.power.offset
	local POWERBAR_HEIGHT = db.power.height
	local POWERBAR_WIDTH = db.width - (BORDER*2)
	
	local unit = self.unit
	
	frame.colors = ElvUF.colors
	frame:Size(UNIT_WIDTH, UNIT_HEIGHT)
	
	--Adjust some variables
	do
		if not USE_POWERBAR then
			POWERBAR_HEIGHT = 0
		end	
		
		if USE_MINI_POWERBAR then
			POWERBAR_WIDTH = POWERBAR_WIDTH / 2
		end
	end
	
	
	--Health
	do
		local health = frame.Health
		health.Smooth = self.db.smoothbars

		--Text
		if db.health.text then
			health.value:Show()
			
			local x, y = self:GetPositionOffset(db.health.position)
			health.value:ClearAllPoints()
			health.value:Point(db.health.position, health, db.health.position, x, y)
		else
			health.value:Hide()
		end
		
		--Colors
		health.colorSmooth = nil
		health.colorHealth = nil
		health.colorClass = nil
		health.colorReaction = nil
		if self.db['colors'].healthclass ~= true then
			if self.db['colors'].colorhealthbyvalue == true then
				health.colorSmooth = true
			else
				health.colorHealth = true
			end		
		else
			health.colorClass = true
			health.colorReaction = true
		end	
		
		--Position
		if E.db.meat.uflayout == "Zeph" then
			health:ClearAllPoints()
			health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, -BORDER)
			if USE_POWERBAR_OFFSET then			
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -(BORDER+POWERBAR_OFFSET), -BORDER)
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER+POWERBAR_OFFSET, BORDER+POWERBAR_OFFSET)
			elseif USE_MINI_POWERBAR then
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + (POWERBAR_HEIGHT/2))
			else
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + POWERBAR_HEIGHT)
			end
		elseif E.db.meat.uflayout == "Duffed" then
			health:ClearAllPoints()
			health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, -BORDER)
			if USE_POWERBAR_OFFSET then			
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -(BORDER+POWERBAR_OFFSET), -BORDER)
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER+POWERBAR_OFFSET, BORDER+POWERBAR_OFFSET)
			elseif USE_MINI_POWERBAR then
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + (POWERBAR_HEIGHT/2))
			else
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + POWERBAR_HEIGHT)
			end
		end
	end
	
	--Name
	do
		local name = frame.Name
		if db.name.enable then
			name:Show()
			
			if not db.power.hideonnpc then
				local x, y = self:GetPositionOffset(db.name.position)
				name:ClearAllPoints()
				name:Point(db.name.position, frame.Health, db.name.position, x, y)				
			end
		else
			name:Hide()
		end
	end	
	
	--Power
	do
		local power = frame.Power
		if USE_POWERBAR then
			if not frame:IsElementEnabled('Power') then
				frame:EnableElement('Power')
				power:Show()
			end		
			
			power.Smooth = self.db.smoothbars
			
			--Text
			if db.power.text then
				power.value:Show()
				
				local x, y = self:GetPositionOffset(db.power.position)
				power.value:ClearAllPoints()
				power.value:Point(db.power.position, frame.Health, db.power.position, x, y)			
			else
				power.value:Hide()
			end
			
			--Colors
			power.colorClass = nil
			power.colorReaction = nil	
			power.colorPower = nil
			if self.db['colors'].powerclass then
				power.colorClass = true
				power.colorReaction = true
			else
				power.colorPower = true
			end		
			
			--Position
			power:ClearAllPoints()
			if USE_POWERBAR_OFFSET then
				power:Point("TOPLEFT", frame, "TOPLEFT", BORDER, -POWERBAR_OFFSET)
				power:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -BORDER, BORDER)
				power:SetFrameStrata("LOW")
				power:SetFrameLevel(2)
			elseif USE_MINI_POWERBAR then
				power:Width(POWERBAR_WIDTH - BORDER*2)
				power:Height(POWERBAR_HEIGHT - BORDER*2)
				power:Point("LEFT", frame, "BOTTOMLEFT", (BORDER*2 + 4), BORDER + (POWERBAR_HEIGHT/2))
				power:SetFrameStrata("MEDIUM")
				power:SetFrameLevel(frame:GetFrameLevel() + 3)
			else
				power:Point("TOPLEFT", frame.Health.backdrop, "BOTTOMLEFT", BORDER, -(BORDER + SPACING))
				power:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -BORDER, BORDER)
			end
		elseif frame:IsElementEnabled('Power') then
			frame:DisableElement('Power')
			power:Hide()	
			power.value:Hide()
		end
	end
	
	--Auras Disable/Enable
	--Only do if both debuffs and buffs aren't being used.
	do
		if db.debuffs.enable or db.buffs.enable then
			if not frame:IsElementEnabled('Aura') then
				frame:EnableElement('Aura')
			end	
		else
			if frame:IsElementEnabled('Aura') then
				frame:DisableElement('Aura')
			end			
		end
		
		frame.Buffs:ClearAllPoints()
		frame.Debuffs:ClearAllPoints()
	end
	
	--Buffs
	do
		local buffs = frame.Buffs
		local rows = db.buffs.numrows
		
		if USE_POWERBAR_OFFSET then
			buffs:SetWidth(UNIT_WIDTH - POWERBAR_OFFSET)
		else
			buffs:SetWidth(UNIT_WIDTH)
		end
		
		if db.buffs.initialAnchor == "RIGHT" or db.buffs.initialAnchor == "LEFT" then
			rows = 1;
			buffs:SetWidth(UNIT_WIDTH / 2)
		end
		
		buffs.num = db.buffs.perrow * rows
		buffs.size = ((((buffs:GetWidth() - (buffs.spacing*(buffs.num/rows - 1))) / buffs.num)) * rows)

		local x, y = self:GetAuraOffset(db.buffs.initialAnchor, db.buffs.anchorPoint)
		local attachTo = self:GetAuraAnchorFrame(frame, db.buffs.attachTo)

		buffs:Point(db.buffs.initialAnchor, attachTo, db.buffs.anchorPoint, x, y)
		buffs:Height(buffs.size * rows)
		buffs.initialAnchor = db.buffs.initialAnchor
		buffs["growth-y"] = db.buffs['growth-y']
		buffs["growth-x"] = db.buffs['growth-x']

		if db.buffs.enable then			
			buffs:Show()
		else
			buffs:Hide()
		end
	end
	
	--Debuffs
	do
		local debuffs = frame.Debuffs
		local rows = db.debuffs.numrows
		
		if USE_POWERBAR_OFFSET then
			debuffs:SetWidth(UNIT_WIDTH - POWERBAR_OFFSET)
		else
			debuffs:SetWidth(UNIT_WIDTH)
		end
		
		if db.debuffs.initialAnchor == "RIGHT" or db.debuffs.initialAnchor == "LEFT" then
			rows = 1;
			debuffs:SetWidth(UNIT_WIDTH / 2)
		end
		
		debuffs.num = db.debuffs.perrow * rows
		debuffs.size = ((((debuffs:GetWidth() - (debuffs.spacing*(debuffs.num/rows - 1))) / debuffs.num)) * rows)

		local x, y = self:GetAuraOffset(db.debuffs.initialAnchor, db.debuffs.anchorPoint)
		local attachTo = self:GetAuraAnchorFrame(frame, db.debuffs.attachTo, db.buffs.attachTo == 'DEBUFFS' and db.debuffs.attachTo == 'BUFFS')

		debuffs:Point(db.debuffs.initialAnchor, attachTo, db.debuffs.anchorPoint, x, y)
		debuffs:Height(debuffs.size * rows)
		debuffs.initialAnchor = db.debuffs.initialAnchor
		debuffs["growth-y"] = db.debuffs['growth-y']
		debuffs["growth-x"] = db.debuffs['growth-x']

		if db.debuffs.enable then			
			debuffs:Show()
		else
			debuffs:Hide()
		end
	end	
	
	--Castbar
	do
		local castbar = frame.Castbar
		castbar:Width(db.castbar.width - 3)
		castbar:Height(db.castbar.height)

		--Icon
		if db.castbar.icon then
			castbar.Icon = castbar.ButtonIcon
			castbar.Icon.bg:Width(db.castbar.height + 4)
			castbar.Icon.bg:Height(db.castbar.height + 4)
			
			castbar:Width(db.castbar.width - castbar.Icon.bg:GetWidth() - 4)
			castbar.Icon.bg:Show()
		else
			castbar.ButtonIcon.bg:Hide()
			castbar.Icon = nil
		end
		
		if db.castbar.spark then
			castbar.Spark:Show()
		else
			castbar.Spark:Hide()
		end
		
		
		castbar:ClearAllPoints()
		-- FIX FOCUS CASTBAR POSITION
		if db.castbar.xOffset == 0 and db.castbar.yOffset == 0 then
			castbar:Point("CENTER", E.UIParent, "CENTER", 0, 170)
		else
			castbar:Point("TOPRIGHT", frame, "BOTTOMRIGHT", -(BORDER + db.castbar.xOffset), (-(BORDER*2+BORDER) + db.castbar.yOffset))
		end
		
		if db.castbar.enable and not frame:IsElementEnabled('Castbar') then
			frame:EnableElement('Castbar')
		elseif not db.castbar.enable and frame:IsElementEnabled('Castbar') then
			frame:DisableElement('Castbar')	
		end			
	end	
	
	--OverHealing
	do
		local healPrediction = frame.HealPrediction
		
		if db.healPrediction then
			if not frame:IsElementEnabled('HealPrediction') then
				frame:EnableElement('HealPrediction')
			end

			healPrediction.myBar:ClearAllPoints()
			healPrediction.myBar:Width(db.width - (BORDER*2))
			healPrediction.myBar:SetPoint('BOTTOMLEFT', frame.Health:GetStatusBarTexture(), 'BOTTOMRIGHT')
			healPrediction.myBar:SetPoint('TOPLEFT', frame.Health:GetStatusBarTexture(), 'TOPRIGHT')	

			healPrediction.otherBar:ClearAllPoints()
			healPrediction.otherBar:SetPoint('TOPLEFT', healPrediction.myBar:GetStatusBarTexture(), 'TOPRIGHT')	
			healPrediction.otherBar:SetPoint('BOTTOMLEFT', healPrediction.myBar:GetStatusBarTexture(), 'BOTTOMRIGHT')	
			healPrediction.otherBar:Width(db.width - (BORDER*2))
		else
			if frame:IsElementEnabled('HealPrediction') then
				frame:DisableElement('HealPrediction')
			end		
		end
	end	
		
	if not frame.mover then
		frame:ClearAllPoints()
		frame:Point('BOTTOMRIGHT', ElvUF_Target, 'TOPRIGHT', 0, 220) --Set to default position
	end
	
	frame:UpdateAllElements()
end


-- Player Frame
local CAN_HAVE_CLASSBAR = (E.myclass == "PALADIN" or E.myclass == "SHAMAN" or E.myclass == "DRUID" or E.myclass == "DEATHKNIGHT" or E.myclass == "WARLOCK")

function UF:Construct_PlayerFrame(frame)
	--frame.Threat = self:Construct_ThreatGlow(frame, true)
	
	frame.Health = self:Construct_HealthBar(frame, true, true, 'RIGHT')
	frame.Health.frequentUpdates = true;
	
	frame.Power = self:Construct_PowerBar(frame, true, true, 'LEFT', true)
	frame.Power.frequentUpdates = true;
	
	frame.Name = self:Construct_NameText(frame)
	
	frame.Portrait = self:Construct_Portrait(frame)
	
	frame.Buffs = self:Construct_Buffs(frame)
	
	frame.Debuffs = self:Construct_Debuffs(frame)
	
	frame.Castbar = self:Construct_Castbar(frame, 'LEFT')
	
	if E.myclass == "PALADIN" then
		frame.HolyPower = self:Construct_PaladinWarlockResourceBar(frame, E.myclass)
	elseif E.myclass == "WARLOCK" then
		frame.SoulShards = self:Construct_PaladinWarlockResourceBar(frame, E.myclass)
	elseif E.myclass == "DEATHKNIGHT" then
		frame.Runes = self:Construct_DeathKnightResourceBar(frame)
	elseif E.myclass == "SHAMAN" then
		frame.TotemBar = self:Construct_ShamanTotemBar(frame)
	elseif E.myclass == "DRUID" then
		frame.EclipseBar = self:Construct_DruidResourceBar(frame)
		frame.DruidAltMana = self:Construct_DruidAltManaBar(frame)
	end
	frame.RaidIcon = UF:Construct_RaidIcon(frame)
	frame.Resting = self:Construct_RestingIndicator(frame)
	frame.Combat = self:Construct_CombatIndicator(frame)
	frame.PvPText = self:Construct_PvPIndicator(frame)
	frame.AltPowerBar = self:Construct_AltPowerBar(frame)
	frame.DebuffHighlight = self:Construct_DebuffHighlight(frame)
	frame.HealPrediction = self:Construct_HealComm(frame)

	frame.CombatFade = true
end

function UF:Update_PlayerFrame(frame, db)
	frame.db = db
	local BORDER = E:Scale(2)
	local SPACING = E:Scale(1)
	local UNIT_WIDTH = db.width
	local UNIT_HEIGHT = db.height
	
	local USE_POWERBAR = db.power.enable
	local USE_MINI_POWERBAR = db.power.width ~= 'fill' and USE_POWERBAR
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR
	local POWERBAR_OFFSET = db.power.offset
	local POWERBAR_HEIGHT = db.power.height
	local POWERBAR_WIDTH = db.width - (BORDER*2)
	
	local USE_CLASSBAR = db.classbar.enable and CAN_HAVE_CLASSBAR
	local USE_MINI_CLASSBAR = db.classbar.fill == "spaced" and USE_CLASSBAR
	local CLASSBAR_HEIGHT = db.classbar.height
	local CLASSBAR_WIDTH = db.width - (BORDER*2)
	
	local USE_PORTRAIT = db.portrait.enable
	local USE_PORTRAIT_OVERLAY = db.portrait.overlay and USE_PORTRAIT
	local PORTRAIT_WIDTH = db.portrait.width
	
	local unit = self.unit
	
	frame.colors = ElvUF.colors
	frame:Size(UNIT_WIDTH, UNIT_HEIGHT)
	
	--Adjust some variables
	do
		if not USE_POWERBAR then
			POWERBAR_HEIGHT = 0
		end
		
		if USE_PORTRAIT_OVERLAY or not USE_PORTRAIT then
			PORTRAIT_WIDTH = 0
			if USE_POWERBAR_OFFSET then
				CLASSBAR_WIDTH = CLASSBAR_WIDTH - POWERBAR_OFFSET
			end			
		end
		
		if USE_PORTRAIT then
			CLASSBAR_WIDTH = math.ceil((UNIT_WIDTH - (BORDER*2)) - PORTRAIT_WIDTH)
			
			if USE_POWERBAR_OFFSET then
				CLASSBAR_WIDTH = CLASSBAR_WIDTH - POWERBAR_OFFSET
			end
		end
		
		if USE_POWERBAR_OFFSET then
			CLASSBAR_WIDTH = CLASSBAR_WIDTH - POWERBAR_OFFSET
		end

		if USE_MINI_CLASSBAR then
			CLASSBAR_WIDTH = CLASSBAR_WIDTH*2/3
		end	
		
		if USE_MINI_POWERBAR then
			POWERBAR_WIDTH = POWERBAR_WIDTH / 2
		end
	end
	
	--Threat
	--[[do
		local threat = frame.Threat
		
		local mini_classbarY = 0
		if USE_MINI_CLASSBAR then
			mini_classbarY = -(SPACING+(CLASSBAR_HEIGHT/2))
		end
		
		threat:ClearAllPoints()
		threat:SetBackdropBorderColor(0, 0, 0, 0)
		threat:Point("TOPLEFT", -4, 4+mini_classbarY)
		threat:Point("TOPRIGHT", 4, 4+mini_classbarY)
		
		if USE_MINI_POWERBAR then
			threat:Point("BOTTOMLEFT", -4, -4 + (POWERBAR_HEIGHT/2))
			threat:Point("BOTTOMRIGHT", 4, -4 + (POWERBAR_HEIGHT/2))		
		else
			threat:Point("BOTTOMLEFT", -4, -4)
			threat:Point("BOTTOMRIGHT", 4, -4)
		end

		if USE_POWERBAR_OFFSET then
			threat:Point("TOPRIGHT", 4-POWERBAR_OFFSET, 4+mini_classbarY)
			threat:Point("BOTTOMRIGHT", 4-POWERBAR_OFFSET, -4)	
		end		

		if USE_POWERBAR_OFFSET == true then
			if USE_PORTRAIT == true and not USE_PORTRAIT_OVERLAY then
				threat:Point("BOTTOMLEFT", frame.Portrait.backdrop, "BOTTOMLEFT", -4, -4)
			else
				threat:Point("BOTTOMLEFT", frame.Health, "BOTTOMLEFT", -5, -5)
			end
			threat:Point("BOTTOMRIGHT", frame.Health, "BOTTOMRIGHT", 5, -5)
		end				
	end
	]]--

	--Rest Icon
	do
		local rIcon = frame.Resting
		if db.restIcon then
			if not frame:IsElementEnabled('Resting') then
				frame:EnableElement('Resting')
			end				
		elseif frame:IsElementEnabled('Resting') then
			frame:DisableElement('Resting')
			rIcon:Hide()
		end
	end

	--Health
	do
		local health = frame.Health
		health.Smooth = self.db.smoothbars

		--Text
		if db.health.text then
			health.value:Show()
			
			local x, y = self:GetPositionOffset(db.health.position)
			health.value:ClearAllPoints()
			health.value:Point(db.health.position, health, db.health.position, x, y)
		else
			health.value:Hide()
		end
		
		--Colors
		health.colorSmooth = nil
		health.colorHealth = nil
		health.colorClass = nil
		health.colorReaction = nil
		if self.db['colors'].healthclass ~= true then
			if self.db['colors'].colorhealthbyvalue == true then
				health.colorSmooth = true
			else
				health.colorHealth = true
			end		
		else
			health.colorClass = true
			health.colorReaction = true
		end	
		
		--Position
		if E.db.meat.uflayout == "Zeph" then
			health:ClearAllPoints()
			health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, -BORDER)
			if USE_POWERBAR_OFFSET then
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -(BORDER+POWERBAR_OFFSET), -BORDER)
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER+POWERBAR_OFFSET)
			elseif USE_MINI_POWERBAR then
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + (POWERBAR_HEIGHT/2))
			else
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + POWERBAR_HEIGHT)
			end
		
			health.bg:ClearAllPoints()
			if not USE_PORTRAIT_OVERLAY then
				health:Point("TOPLEFT", PORTRAIT_WIDTH+BORDER, -BORDER)		
				health.bg:SetParent(health)
				health.bg:SetAllPoints()
			else
				health.bg:Point('BOTTOMLEFT', health:GetStatusBarTexture(), 'BOTTOMRIGHT')
				health.bg:Point('TOPRIGHT', health)		
				health.bg:SetParent(frame.Portrait.overlay)			
			end
		elseif E.db.meat.uflayout == "Duffed" then
			health:ClearAllPoints()
			health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, -18)
			if USE_POWERBAR_OFFSET then
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -(BORDER+POWERBAR_OFFSET), -BORDER)
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER+POWERBAR_OFFSET)
			elseif USE_MINI_POWERBAR then
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + (POWERBAR_HEIGHT/2))
			else
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + POWERBAR_HEIGHT)
			end
		
			health.bg:ClearAllPoints()
			if not USE_PORTRAIT_OVERLAY then
				health:Point("TOPLEFT", PORTRAIT_WIDTH+BORDER, -18)		
				health.bg:SetParent(health)
				health.bg:SetAllPoints()
			else
				health.bg:Point('BOTTOMLEFT', health:GetStatusBarTexture(), 'BOTTOMRIGHT')
				health.bg:Point('TOPRIGHT', health)		
				health.bg:SetParent(frame.Portrait.overlay)			
			end
		end

		if E.db.meat.uflayout == "Zeph" then
			if USE_CLASSBAR then
				local DEPTH
				if USE_MINI_CLASSBAR then
					DEPTH = -(BORDER+(CLASSBAR_HEIGHT/2))
				else
					DEPTH = -(BORDER+CLASSBAR_HEIGHT+SPACING)
				end
			
				if USE_POWERBAR_OFFSET then
					health:Point("TOPRIGHT", frame, "TOPRIGHT", -(BORDER+POWERBAR_OFFSET), DEPTH)
				else
					health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, DEPTH)
				end
			
				health:Point("TOPLEFT", frame, "TOPLEFT", PORTRAIT_WIDTH+BORDER, DEPTH)
			end
		elseif E.db.meat.uflayout == "Duffed" then
			if USE_CLASSBAR then
				local DEPTH
				if USE_MINI_CLASSBAR then
					DEPTH = -(BORDER+(CLASSBAR_HEIGHT/2))
				else
					DEPTH = -(BORDER+CLASSBAR_HEIGHT+SPACING)
				end
			
				if USE_POWERBAR_OFFSET then
					health:Point("TOPRIGHT", frame, "TOPRIGHT", -(BORDER+POWERBAR_OFFSET), DEPTH)
				else
					health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, -18)
				end
			
				health:Point("TOPLEFT", frame, "TOPLEFT", PORTRAIT_WIDTH+BORDER, -18)
			end
		end
	end
	
	--Name
	do
		local name = frame.Name
		if db.name.enable then
			name:Show()
			
			if not db.power.hideonnpc then
				local x, y = self:GetPositionOffset(db.name.position)
				name:ClearAllPoints()
				name:Point(db.name.position, frame.Health, db.name.position, x, y)				
			end
		else
			name:Hide()
		end
	end	
	
	--Power
	do
		local power = frame.Power
		if USE_POWERBAR then
			if not frame:IsElementEnabled('Power') then
				frame:EnableElement('Power')
				power:Show()
			end		
		
			power.Smooth = self.db.smoothbars
			
			--Text
			if db.power.text then
				power.value:Show()
				
				local x, y = self:GetPositionOffset(db.power.position)
				power.value:ClearAllPoints()
				power.value:Point(db.power.position, frame.Health, db.power.position, x, y)			
			else
				power.value:Hide()
			end
			
			--Colors
			power.colorClass = nil
			power.colorReaction = nil	
			power.colorPower = nil
			if self.db['colors'].powerclass then
				power.colorClass = true
				power.colorReaction = true
			else
				power.colorPower = true
			end		
			
			--Position
			power:ClearAllPoints()
			if USE_POWERBAR_OFFSET then
				power:Point("TOPRIGHT", frame.Health, "TOPRIGHT", POWERBAR_OFFSET, -POWERBAR_OFFSET)
				power:Point("BOTTOMLEFT", frame.Health, "BOTTOMLEFT", POWERBAR_OFFSET, -POWERBAR_OFFSET)
				power:SetFrameStrata("LOW")
				power:SetFrameLevel(2)
			elseif USE_MINI_POWERBAR then
				power:Width(POWERBAR_WIDTH - BORDER*2)
				power:Height(POWERBAR_HEIGHT - BORDER*2)
				power:Point("RIGHT", frame, "BOTTOMRIGHT", -(BORDER*2 + 4), BORDER + (POWERBAR_HEIGHT/2))
				power:SetFrameStrata("MEDIUM")
				power:SetFrameLevel(frame:GetFrameLevel() + 3)
			else
				power:Point("TOPLEFT", frame.Health.backdrop, "BOTTOMLEFT", BORDER, -(BORDER + SPACING))
				power:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -BORDER, BORDER)
			end
		elseif frame:IsElementEnabled('Power') then
			frame:DisableElement('Power')
			power:Hide()
			power.value:Hide()
		end
	end
	
	--Portrait
	do
		local portrait = frame.Portrait
		
		--Set Points
		if USE_PORTRAIT then
			if not frame:IsElementEnabled('Portrait') then
				frame:EnableElement('Portrait')
			end
			
			portrait:ClearAllPoints()
			
			if USE_PORTRAIT_OVERLAY then
				portrait:SetFrameLevel(frame.Health:GetFrameLevel() + 1)
				portrait:SetAllPoints(frame.Health)
				portrait:SetAlpha(0.3)
				portrait:Show()		
			else
				portrait:SetAlpha(1)
				portrait:Show()
				
				if USE_MINI_CLASSBAR and USE_CLASSBAR then
					portrait.backdrop:Point("TOPLEFT", frame, "TOPLEFT", 0, -((CLASSBAR_HEIGHT/2)))
				else
					portrait.backdrop:SetPoint("TOPLEFT", frame, "TOPLEFT")
				end		
				
				if (USE_MINI_POWERBAR and not USE_POWERBAR_OFFSET) or not USE_POWERBAR then --or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", -SPACING - 4, -((POWERBAR_HEIGHT/2) - BORDER))
				elseif (USE_POWERBAR_OFFSET and USE_MINI_POWERBAR) or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", -SPACING - 4, -POWERBAR_OFFSET)
				else
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Power.backdrop, "BOTTOMLEFT", -SPACING - 4, 0)
				end	

				portrait:Point('BOTTOMLEFT', portrait.backdrop, 'BOTTOMLEFT', BORDER, BORDER)		
				portrait:Point('TOPRIGHT', portrait.backdrop, 'TOPRIGHT', -BORDER, -BORDER)				
			end
		else
			if frame:IsElementEnabled('Portrait') then
				frame:DisableElement('Portrait')
				portrait:Hide()
			end		
		end
	end

	--Auras Disable/Enable
	--Only do if both debuffs and buffs aren't being used.
	do
		if db.debuffs.enable or db.buffs.enable then
			if not frame:IsElementEnabled('Aura') then
				frame:EnableElement('Aura')
			end	
		else
			if frame:IsElementEnabled('Aura') then
				frame:DisableElement('Aura')
			end			
		end
		
		frame.Buffs:ClearAllPoints()
		frame.Debuffs:ClearAllPoints()
	end
	
	--Buffs
	do
		local buffs = frame.Buffs
		local rows = db.buffs.numrows
		
		if USE_POWERBAR_OFFSET then
			buffs:SetWidth(UNIT_WIDTH - POWERBAR_OFFSET)
		else
			buffs:SetWidth(UNIT_WIDTH)
		end
		
		if db.buffs.initialAnchor == "RIGHT" or db.buffs.initialAnchor == "LEFT" then
			rows = 1;
			buffs:SetWidth(UNIT_WIDTH / 2)
		end
		
		buffs.num = db.buffs.perrow * rows
		buffs.size = ((((buffs:GetWidth() - (buffs.spacing*(buffs.num/rows - 1))) / buffs.num)) * rows)

		local x, y = self:GetAuraOffset(db.buffs.initialAnchor, db.buffs.anchorPoint)
		local attachTo = self:GetAuraAnchorFrame(frame, db.buffs.attachTo)

		buffs:Point(db.buffs.initialAnchor, attachTo, db.buffs.anchorPoint, x, y)
		buffs:Height(buffs.size * rows)
		buffs.initialAnchor = db.buffs.initialAnchor
		buffs["growth-y"] = db.buffs['growth-y']
		buffs["growth-x"] = db.buffs['growth-x']

		if db.buffs.enable then			
			buffs:Show()
		else
			buffs:Hide()
		end
	end
	
	--Debuffs
	do
		local debuffs = frame.Debuffs
		local rows = db.debuffs.numrows
		
		if USE_POWERBAR_OFFSET then
			debuffs:SetWidth(UNIT_WIDTH - POWERBAR_OFFSET)
		else
			debuffs:SetWidth(UNIT_WIDTH)
		end
		
		if db.debuffs.initialAnchor == "RIGHT" or db.debuffs.initialAnchor == "LEFT" then
			rows = 1;
			debuffs:SetWidth(UNIT_WIDTH / 2)
		end
		
		debuffs.num = db.debuffs.perrow * rows
		debuffs.size = ((((debuffs:GetWidth() - (debuffs.spacing*(debuffs.num/rows - 1))) / debuffs.num)) * rows)

		local x, y = self:GetAuraOffset(db.debuffs.initialAnchor, db.debuffs.anchorPoint)
		local attachTo = self:GetAuraAnchorFrame(frame, db.debuffs.attachTo, db.buffs.attachTo == 'DEBUFFS' and db.debuffs.attachTo == 'BUFFS')

		debuffs:Point(db.debuffs.initialAnchor, attachTo, db.debuffs.anchorPoint, x, y)
		debuffs:Height(debuffs.size * rows)
		debuffs.initialAnchor = db.debuffs.initialAnchor
		debuffs["growth-y"] = db.debuffs['growth-y']
		debuffs["growth-x"] = db.debuffs['growth-x']

		if db.debuffs.enable then			
			debuffs:Show()
		else
			debuffs:Hide()
		end
	end	
	
	--Castbar
	do
		local castbar = frame.Castbar
		castbar:Width(db.castbar.width - 3)
		castbar:Height(db.castbar.height)
		
		--Latency
		if db.castbar.latency then
			castbar.SafeZone = castbar.LatencyTexture
			castbar.LatencyTexture:Show()
		else
			castbar.SafeZone = nil
			castbar.LatencyTexture:Hide()
		end
		
		--Icon
		if db.castbar.icon then
			castbar.Icon = castbar.ButtonIcon
			castbar.Icon.bg:Width(db.castbar.height + 4)
			castbar.Icon.bg:Height(db.castbar.height + 4)
			
			castbar:Width(db.castbar.width - castbar.Icon.bg:GetWidth() - 5)
			castbar.Icon.bg:Show()
		else
			castbar.ButtonIcon.bg:Hide()
			castbar.Icon = nil
		end

		if db.castbar.spark then
			castbar.Spark:Show()
		else
			castbar.Spark:Hide()
		end
		
		castbar:Point("TOPRIGHT", frame, "BOTTOMRIGHT", -(BORDER + db.castbar.xOffset), -((BORDER*2+BORDER) + db.castbar.yOffset))
		
		if db.castbar.enable and not frame:IsElementEnabled('Castbar') then
			frame:EnableElement('Castbar')
		elseif not db.castbar.enable and frame:IsElementEnabled('Castbar') then
			frame:DisableElement('Castbar')	
		end			
	end
	
	--Resource Bars
	do
		if E.myclass == "PALADIN" then
			local bars = frame.HolyPower
			bars:ClearAllPoints()
			if USE_MINI_CLASSBAR then
				bars:Point("CENTER", frame.Health.backdrop, "TOP", -(BORDER*3 + 6), -SPACING)
				bars:SetFrameStrata("MEDIUM")
			else
				if E.db.meat.uflayout == "Zeph" then
					bars:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, BORDER+SPACING)
				elseif E.db.meat.uflayout == "Duffed" then
					bars:Point("TOPLEFT", frame.Power.backdrop, "BOTTOMLEFT", BORDER, -(BORDER+SPACING))
				end
				bars:SetFrameStrata("LOW")
			end
			bars:Width(CLASSBAR_WIDTH)
			bars:Height(CLASSBAR_HEIGHT - (BORDER*2))
		
			for i = 1, MAX_HOLY_POWER do
				bars[i]:SetHeight(bars:GetHeight())	
				bars[i]:SetWidth(E:Scale(bars:GetWidth() - 2)/MAX_HOLY_POWER)	
				bars[i]:GetStatusBarTexture():SetHorizTile(false)
				bars[i]:ClearAllPoints()
				if i == 1 then
					bars[i]:SetPoint("LEFT", bars)
				else
					if USE_MINI_CLASSBAR then
						bars[i]:Point("LEFT", bars[i-1], "RIGHT", SPACING+(BORDER*2)+8, 0)
					else
						bars[i]:Point("LEFT", bars[i-1], "RIGHT", SPACING, 0)
					end
				end
				
				if not USE_MINI_CLASSBAR then
					bars[i].backdrop:Hide()
				else
					bars[i].backdrop:Show()
				end
			end
			
			if not USE_MINI_CLASSBAR then
				bars.backdrop:Show()
			else
				bars.backdrop:Hide()			
			end		
			
			if USE_CLASSBAR and not frame:IsElementEnabled('HolyPower') then
				frame:EnableElement('HolyPower')
				bars:Show()
			elseif not USE_CLASSBAR and frame:IsElementEnabled('HolyPower') then
				frame:DisableElement('HolyPower')	
				bars:Hide()
			end		
			
		elseif E.myclass == "WARLOCK" then
			local bars = frame.SoulShards
			bars:ClearAllPoints()
			if USE_MINI_CLASSBAR then
				bars:Point("CENTER", frame.Health.backdrop, "TOP", -(BORDER*3 + 6), -SPACING)
				bars:SetFrameStrata("MEDIUM")
			else
				if E.db.meat.uflayout == "Zeph" then
					bars:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, BORDER+SPACING)
				elseif E.db.meat.uflayout == "Duffed" then
					bars:Point("TOPLEFT", frame.Power.backdrop, "BOTTOMLEFT", BORDER, -(BORDER+SPACING))
				end
				bars:SetFrameStrata("LOW")
			end
			bars:Width(CLASSBAR_WIDTH)
			bars:Height(CLASSBAR_HEIGHT - (BORDER*2))
		
			for i = 1, SHARD_BAR_NUM_SHARDS do
				bars[i]:SetHeight(bars:GetHeight())	
				bars[i]:SetWidth(E:Scale(bars:GetWidth() - 2)/SHARD_BAR_NUM_SHARDS)	
				bars[i]:ClearAllPoints()
				if i == 1 then
					bars[i]:SetPoint("LEFT", bars)
				else
					if USE_MINI_CLASSBAR then
						bars[i]:Point("LEFT", bars[i-1], "RIGHT", SPACING+(BORDER*2)+8, 0)
					else
						bars[i]:Point("LEFT", bars[i-1], "RIGHT", SPACING, 0)
					end
				end
				
				if not USE_MINI_CLASSBAR then
					bars[i].backdrop:Hide()
				else
					bars[i].backdrop:Show()
				end				
			end
			
			if not USE_MINI_CLASSBAR then
				bars.backdrop:Show()
			else
				bars.backdrop:Hide()			
			end
			
			if USE_CLASSBAR and not frame:IsElementEnabled('SoulShards') then
				frame:EnableElement('SoulShards')
				bars:Show()
			elseif not USE_CLASSBAR and frame:IsElementEnabled('SoulShards') then
				frame:DisableElement('SoulShards')
				bars:Hide()
			end					
		elseif E.myclass == "DEATHKNIGHT" then
			local runes = frame.Runes
			runes:ClearAllPoints()
			if USE_MINI_CLASSBAR then
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 3/2 --Multiply by reciprocal to reset previous setting
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 4/5
				runes:Point("CENTER", frame.Health.backdrop, "TOP", -(BORDER*3 + 8), -SPACING)
				runes:SetFrameStrata("MEDIUM")
			else
				if E.db.meat.uflayout == "Zeph" then
					runes:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, BORDER+SPACING)
				elseif E.db.meat.uflayout == "Duffed" then
					runes:Point("TOPLEFT", frame.Power.backdrop, "BOTTOMLEFT", BORDER, -(BORDER+SPACING))
				end
				runes:SetFrameStrata("LOW")
			end
			runes:Width(CLASSBAR_WIDTH)
			runes:Height(CLASSBAR_HEIGHT - (BORDER*2))			
			
			for i = 1, 6 do
				runes[i]:SetHeight(runes:GetHeight())
				runes[i]:SetWidth(E:Scale(runes:GetWidth() - 5) / 6)	
				if USE_MINI_CLASSBAR then
					runes[i].backdrop:Show()
				else
					runes[i].backdrop:Hide()	
				end
				
				runes[i]:ClearAllPoints()
				if i == 1 then
					runes[i]:SetPoint("LEFT", runes)
				else
					if USE_MINI_CLASSBAR then
						runes[i]:Point("LEFT", runes[i-1], "RIGHT", SPACING+(BORDER*2)+2, 0)
					else
						runes[i]:Point("LEFT", runes[i-1], "RIGHT", SPACING, 0)
					end
				end	
				
				if not USE_MINI_CLASSBAR then
					runes[i].backdrop:Hide()
				else
					runes[i].backdrop:Show()
				end					
			end
			
			if not USE_MINI_CLASSBAR then
				runes.backdrop:Show()
			else
				runes.backdrop:Hide()
			end		

			if USE_CLASSBAR and not frame:IsElementEnabled('Runes') then
				frame:EnableElement('Runes')
				runes:Show()
			elseif not USE_CLASSBAR and frame:IsElementEnabled('Runes') then
				frame:DisableElement('Runes')	
				runes:Hide()
				RuneFrame.Show = RuneFrame.Hide
				RuneFrame:Hide()				
			end					
		elseif E.myclass == "SHAMAN" then
			local totems = frame.TotemBar
			
			totems:ClearAllPoints()
			if not USE_MINI_CLASSBAR then
				if E.db.meat.uflayout == "Zeph" then
					totems:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, BORDER+SPACING)
				elseif E.db.meat.uflayout == "Duffed" then
					totems:Point("TOPLEFT", frame.Power.backdrop, "BOTTOMLEFT", BORDER, -(BORDER+SPACING))
				end
				totems:SetFrameStrata("LOW")
			else
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 3/2 --Multiply by reciprocal to reset previous setting
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 4/5
				totems:Point("CENTER", frame.Health.backdrop, "TOP", -(BORDER*3 + 6), -SPACING)
				totems:SetFrameStrata("MEDIUM")			
			end
			
			totems:Width(CLASSBAR_WIDTH)
			totems:Height(CLASSBAR_HEIGHT - (BORDER*2))

			for i=1, 4 do
				totems[i]:SetHeight(totems:GetHeight())
				totems[i]:SetWidth(E:Scale(totems:GetWidth() - 3) / 4)	

				if USE_MINI_CLASSBAR then
					totems[i].backdrop:Show()
				else
					totems[i].backdrop:Hide()
				end	
				
				totems[i]:ClearAllPoints()
				if i == 1 then
					totems[i]:SetPoint("LEFT", totems)
				else
					if USE_MINI_CLASSBAR then
						totems[i]:Point("LEFT", totems[i-1], "RIGHT", SPACING+(BORDER*2)+4, 0)
					else
						totems[i]:Point("LEFT", totems[i-1], "RIGHT", SPACING, 0)
					end
				end		

				if not USE_MINI_CLASSBAR then
					totems[i].backdrop:Hide()
				else
					totems[i].backdrop:Show()
				end						
			end
			
			if not USE_MINI_CLASSBAR then
				totems.backdrop:Show()
			else
				totems.backdrop:Hide()
			end		

			if USE_CLASSBAR and not frame:IsElementEnabled('TotemBar') then
				frame:EnableElement('TotemBar')
				totems:Show()
			elseif not USE_CLASSBAR and frame:IsElementEnabled('TotemBar') then
				frame:DisableElement('TotemBar')	
				totems:Hide()
			end					
		elseif E.myclass == "DRUID" then
			local eclipseBar = frame.EclipseBar

			eclipseBar:ClearAllPoints()
			if not USE_MINI_CLASSBAR then
				if E.db.meat.uflayout == "Zeph" then
					eclipseBar:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, BORDER+SPACING)
				elseif E.db.meat.uflayout == "Duffed" then
					eclipseBar:Point("TOPLEFT", frame.Power.backdrop, "BOTTOMLEFT", BORDER, -(BORDER+SPACING))
				end
				eclipseBar:SetFrameStrata("LOW")
			else		
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 3/2 --Multiply by reciprocal to reset previous setting
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 2/3			
				eclipseBar:Point("LEFT", frame.Health.backdrop, "TOPLEFT", (BORDER*2 + 4), 0)
				eclipseBar:SetFrameStrata("MEDIUM")						
			end

			eclipseBar:Width(CLASSBAR_WIDTH)
			eclipseBar:Height(CLASSBAR_HEIGHT - (BORDER*2))	
			
			--?? Apparent bug fix for the width after in-game settings change
			eclipseBar.LunarBar:SetMinMaxValues(0, 0)
			eclipseBar.SolarBar:SetMinMaxValues(0, 0)
			eclipseBar.LunarBar:Size(CLASSBAR_WIDTH, CLASSBAR_HEIGHT - (BORDER*2))			
			eclipseBar.SolarBar:Size(CLASSBAR_WIDTH, CLASSBAR_HEIGHT - (BORDER*2))	
			
			if USE_CLASSBAR and not frame:IsElementEnabled('EclipseBar') then
				frame:EnableElement('EclipseBar')
				eclipseBar:Show()
			elseif not USE_CLASSBAR and frame:IsElementEnabled('EclipseBar') then
				frame:DisableElement('EclipseBar')	
				eclipseBar:Hide()
			end					
		end
	end
	
	--Combat Fade
	do
		if db.combatfade and not frame:IsElementEnabled('CombatFade') then
			frame:EnableElement('CombatFade')
		elseif not db.combatfade and frame:IsElementEnabled('CombatFade') then
			frame:DisableElement('CombatFade')
		end		
	end
	
	--AltPower
	do
		local altpower = frame.AltPowerBar
		altpower:Point("TOP", E.UIParent, "TOP", 0, -70)
		altpower:Width(db.altpower.width)
		altpower:Height(db.altpower.height)	
		altpower.Smooth = self.db.smoothbars
		
		if db.altpower.enable and not frame:IsElementEnabled('AltPowerBar') then
			frame:EnableElement('AltPowerBar')
		elseif not db.altpower.enable and frame:IsElementEnabled('AltPowerBar') then
			frame:DisableElement('AltPowerBar')
		end			
	end
	
	--Debuff Highlight
	do
		local dbh = frame.DebuffHighlight
		if E.db.unitframe.debuffHighlighting then
			if not frame:IsElementEnabled('DebuffHighlight') then
				frame:EnableElement('DebuffHighlight')
			end
		else
			if frame:IsElementEnabled('DebuffHighlight') then
				frame:DisableElement('DebuffHighlight')
			end		
		end
	end
	
	--OverHealing
	do
		local healPrediction = frame.HealPrediction
		
		if db.healPrediction then
			if not frame:IsElementEnabled('HealPrediction') then
				frame:EnableElement('HealPrediction')
			end

			healPrediction.myBar:ClearAllPoints()
			healPrediction.myBar:Width(db.width - (BORDER*2))
			healPrediction.myBar:SetPoint('BOTTOMLEFT', frame.Health:GetStatusBarTexture(), 'BOTTOMRIGHT')
			healPrediction.myBar:SetPoint('TOPLEFT', frame.Health:GetStatusBarTexture(), 'TOPRIGHT')	

			healPrediction.otherBar:ClearAllPoints()
			healPrediction.otherBar:SetPoint('TOPLEFT', healPrediction.myBar:GetStatusBarTexture(), 'TOPRIGHT')	
			healPrediction.otherBar:SetPoint('BOTTOMLEFT', healPrediction.myBar:GetStatusBarTexture(), 'BOTTOMRIGHT')	
			healPrediction.otherBar:Width(db.width - (BORDER*2))
		else
			if frame:IsElementEnabled('HealPrediction') then
				frame:DisableElement('HealPrediction')
			end		
		end
	end
	
	frame.snapOffset = -(12 + db.castbar.height)
	
	if not frame.mover then
		frame:ClearAllPoints()
		frame:Point('BOTTOMLEFT', E.UIParent, 'BOTTOM', -400, 130) --Set to default position
	end

	frame:UpdateAllElements()
end

-- Target Frame
function UF:Update_TargetFrame(frame, db)
	frame.db = db
	local BORDER = E:Scale(2)
	local SPACING = E:Scale(1)	
	local UNIT_WIDTH = db.width
	local UNIT_HEIGHT = db.height
	
	local USE_POWERBAR = db.power.enable
	local USE_MINI_POWERBAR = db.power.width ~= 'fill' and USE_POWERBAR
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR
	local POWERBAR_OFFSET = db.power.offset
	local POWERBAR_HEIGHT = db.power.height
	local POWERBAR_WIDTH = db.width - (BORDER*2)
	
	local USE_COMBOBAR = db.combobar.enable
	local USE_MINI_COMBOBAR = db.combobar.fill == "spaced" and USE_COMBOBAR
	local COMBOBAR_HEIGHT = db.combobar.height
	local COMBOBAR_WIDTH = db.width - (BORDER*2)
	
	local USE_PORTRAIT = db.portrait.enable
	local USE_PORTRAIT_OVERLAY = db.portrait.overlay and USE_PORTRAIT
	local PORTRAIT_WIDTH = db.portrait.width
	
	local unit = self.unit
	
	frame.colors = ElvUF.colors
	frame:Size(UNIT_WIDTH, UNIT_HEIGHT)
		
	--Adjust some variables
	do
		if not USE_POWERBAR then
			POWERBAR_HEIGHT = 0
		end	
	
		if USE_PORTRAIT_OVERLAY or not USE_PORTRAIT then
			PORTRAIT_WIDTH = 0
			if USE_POWERBAR_OFFSET then
				COMBOBAR_WIDTH = COMBOBAR_WIDTH - POWERBAR_OFFSET
			end			
		elseif USE_PORTRAIT then
			COMBOBAR_WIDTH = math.ceil((UNIT_WIDTH - (BORDER*2)) - PORTRAIT_WIDTH)
			
			if USE_POWERBAR_OFFSET then
				COMBOBAR_WIDTH = COMBOBAR_WIDTH - POWERBAR_OFFSET
			end
		elseif USE_POWERBAR_OFFSET then
			COMBOBAR_WIDTH = COMBOBAR_WIDTH - POWERBAR_OFFSET
		end

		if USE_MINI_COMBOBAR then
			COMBOBAR_WIDTH = COMBOBAR_WIDTH * 4/5
		end	
		
		if USE_MINI_POWERBAR then
			POWERBAR_WIDTH = POWERBAR_WIDTH / 2
		end
	end
	
	--Health
	do
		local health = frame.Health
		health.Smooth = self.db.smoothbars

		--Text
		if db.health.text then
			health.value:Show()
			
			local x, y = self:GetPositionOffset(db.health.position)
			health.value:ClearAllPoints()
			health.value:Point(db.health.position, health, db.health.position, x, y)
		else
			health.value:Hide()
		end
		
		--Colors
		health.colorSmooth = nil
		health.colorHealth = nil
		health.colorClass = nil
		health.colorReaction = nil
		if self.db['colors'].healthclass ~= true then
			if self.db['colors'].colorhealthbyvalue == true then
				health.colorSmooth = true
			else
				health.colorHealth = true
			end		
		else
			health.colorClass = true
			health.colorReaction = true
		end	
		
		--Position
		if E.db.meat.uflayout == "Zeph" then
			health:ClearAllPoints()
			health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, -BORDER)
			if USE_POWERBAR_OFFSET then			
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER+POWERBAR_OFFSET, BORDER+POWERBAR_OFFSET)
			elseif USE_MINI_POWERBAR then
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + (POWERBAR_HEIGHT/2))
			else
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + POWERBAR_HEIGHT)
			end
		
			health.bg:ClearAllPoints()
			if not USE_PORTRAIT_OVERLAY then
				health:Point("TOPRIGHT", -(PORTRAIT_WIDTH+BORDER), -BORDER)
				health.bg:SetParent(health)
				health.bg:SetAllPoints()
			else
				health.bg:Point('BOTTOMLEFT', health:GetStatusBarTexture(), 'BOTTOMRIGHT')
				health.bg:Point('TOPRIGHT', health)		
				health.bg:SetParent(frame.Portrait.overlay)			
			end
		elseif E.db.meat.uflayout == "Duffed" then
			health:ClearAllPoints()
			health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, -18)
			if USE_POWERBAR_OFFSET then			
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER+POWERBAR_OFFSET, BORDER+POWERBAR_OFFSET)
			elseif USE_MINI_POWERBAR then
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + (POWERBAR_HEIGHT/2))
			else
				health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + POWERBAR_HEIGHT)
			end
		
			health.bg:ClearAllPoints()
			if not USE_PORTRAIT_OVERLAY then
				health:Point("TOPRIGHT", -(PORTRAIT_WIDTH+BORDER), -18)
				health.bg:SetParent(health)
				health.bg:SetAllPoints()
			else
				health.bg:Point('BOTTOMLEFT', health:GetStatusBarTexture(), 'BOTTOMRIGHT')
				health.bg:Point('TOPRIGHT', health)		
				health.bg:SetParent(frame.Portrait.overlay)			
			end
		end
	end
	
	--Name
	do
		local name = frame.Name
		if db.name.enable then
			name:Show()
			
			if not db.power.hideonnpc then
				local x, y = self:GetPositionOffset(db.name.position)
				name:ClearAllPoints()
				name:Point(db.name.position, frame.Health, db.name.position, x, y)				
			end
		else
			name:Hide()
		end
	end	
	
	--Power
	do
		local power = frame.Power
		
		if USE_POWERBAR then
			if not frame:IsElementEnabled('Power') then
				frame:EnableElement('Power')
				power:Show()
			end				
			power.Smooth = self.db.smoothbars
			
			--Text
			if db.power.text then
				power.value:Show()
				
				local x, y = self:GetPositionOffset(db.power.position)
				power.value:ClearAllPoints()
				power.value:Point(db.power.position, frame.Health, db.power.position, x, y)			
			else
				power.value:Hide()
			end
			
			--Colors
			power.colorClass = nil
			power.colorReaction = nil	
			power.colorPower = nil
			if self.db['colors'].powerclass then
				power.colorClass = true
				power.colorReaction = true
			else
				power.colorPower = true
			end		
			
			--Position
			power:ClearAllPoints()
			if USE_POWERBAR_OFFSET then
				power:Point("TOPLEFT", frame.Health, "TOPLEFT", -POWERBAR_OFFSET, -POWERBAR_OFFSET)
				power:Point("BOTTOMRIGHT", frame.Health, "BOTTOMRIGHT", -POWERBAR_OFFSET, -POWERBAR_OFFSET)
				power:SetFrameStrata("LOW")
				power:SetFrameLevel(2)
			elseif USE_MINI_POWERBAR then
				power:Width(POWERBAR_WIDTH - BORDER*2)
				power:Height(POWERBAR_HEIGHT - BORDER*2)
				power:Point("LEFT", frame, "BOTTOMLEFT", (BORDER*2 + 4), BORDER + (POWERBAR_HEIGHT/2))
				power:SetFrameStrata("MEDIUM")
				power:SetFrameLevel(frame:GetFrameLevel() + 3)
			else
				power:Point("TOPLEFT", frame.Health.backdrop, "BOTTOMLEFT", BORDER, -(BORDER + SPACING))
				power:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -(BORDER + PORTRAIT_WIDTH), BORDER)
			end
		elseif frame:IsElementEnabled('Power') then
			frame:DisableElement('Power')
			power:Hide()
			power.value:Hide()
		end
	end
	
	--Portrait
	do
		local portrait = frame.Portrait
		
		--Set Points
		if USE_PORTRAIT then
			if not frame:IsElementEnabled('Portrait') then
				frame:EnableElement('Portrait')
			end
			
			portrait:ClearAllPoints()
			
			if USE_PORTRAIT_OVERLAY then
				portrait:SetFrameLevel(frame.Health:GetFrameLevel() + 1)
				portrait:SetAllPoints(frame.Health)
				portrait:SetAlpha(0.3)
				portrait:Show()		
			else
				portrait:SetAlpha(1)
				portrait:Show()
				
				portrait.backdrop:ClearAllPoints()
				portrait.backdrop:SetPoint("TOPRIGHT", frame, "TOPRIGHT")
						
				if (USE_MINI_POWERBAR and not USE_POWERBAR_OFFSET) or not USE_POWERBAR then--or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMLEFT", frame.Health.backdrop, "BOTTOMRIGHT", SPACING + 4, -((POWERBAR_HEIGHT/2) - BORDER))
				elseif (USE_POWERBAR_OFFSET and USE_MINI_POWERBAR) or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMLEFT", frame.Health.backdrop, "BOTTOMRIGHT", SPACING + 4, -POWERBAR_OFFSET)
				else
					portrait.backdrop:Point("BOTTOMLEFT", frame.Power.backdrop, "BOTTOMRIGHT", SPACING + 4, 0)
				end	
							
				portrait:Point('BOTTOMLEFT', portrait.backdrop, 'BOTTOMLEFT', BORDER, BORDER)		
				portrait:Point('TOPRIGHT', portrait.backdrop, 'TOPRIGHT', -BORDER, -BORDER)				
			end
		else
			if frame:IsElementEnabled('Portrait') then
				frame:DisableElement('Portrait')
				portrait:Hide()
			end		
		end
	end

	--Auras Disable/Enable
	--Only do if both debuffs and buffs aren't being used.
	do
		if db.debuffs.enable or db.buffs.enable then
			if not frame:IsElementEnabled('Aura') then
				frame:EnableElement('Aura')
			end	
		else
			if frame:IsElementEnabled('Aura') then
				frame:DisableElement('Aura')
			end			
		end
		
		frame.Buffs:ClearAllPoints()
		frame.Debuffs:ClearAllPoints()
	end
	
	--Buffs
	do
		local buffs = frame.Buffs
		local rows = db.buffs.numrows
		
		if USE_POWERBAR_OFFSET then
			buffs:SetWidth(UNIT_WIDTH - POWERBAR_OFFSET)
		else
			buffs:SetWidth(UNIT_WIDTH)
		end
		
		if db.buffs.initialAnchor == "RIGHT" or db.buffs.initialAnchor == "LEFT" then
			rows = 1;
			buffs:SetWidth(UNIT_WIDTH / 2)
		end
		
		buffs.num = db.buffs.perrow * rows
		buffs.size = ((((buffs:GetWidth() - (buffs.spacing*(buffs.num/rows - 1))) / buffs.num)) * rows)

		local x, y = self:GetAuraOffset(db.buffs.initialAnchor, db.buffs.anchorPoint)
		local attachTo = self:GetAuraAnchorFrame(frame, db.buffs.attachTo)

		buffs:Point(db.buffs.initialAnchor, attachTo, db.buffs.anchorPoint, x, y)
		buffs:Height(buffs.size * rows)
		buffs.initialAnchor = db.buffs.initialAnchor
		buffs["growth-y"] = db.buffs['growth-y']
		buffs["growth-x"] = db.buffs['growth-x']

		if db.buffs.enable then			
			buffs:Show()
		else
			buffs:Hide()
		end
	end
	
	--Debuffs
	do
		local debuffs = frame.Debuffs
		local rows = db.debuffs.numrows
		
		if USE_POWERBAR_OFFSET then
			debuffs:SetWidth(UNIT_WIDTH - POWERBAR_OFFSET)
		else
			debuffs:SetWidth(UNIT_WIDTH)
		end
		
		if db.debuffs.initialAnchor == "RIGHT" or db.debuffs.initialAnchor == "LEFT" then
			rows = 1;
			debuffs:SetWidth(UNIT_WIDTH / 2)
		end
		
		debuffs.num = db.debuffs.perrow * rows
		debuffs.size = ((((debuffs:GetWidth() - (debuffs.spacing*(debuffs.num/rows - 1))) / debuffs.num)) * rows)

		local x, y = self:GetAuraOffset(db.debuffs.initialAnchor, db.debuffs.anchorPoint)
		local attachTo = self:GetAuraAnchorFrame(frame, db.debuffs.attachTo, db.buffs.attachTo == 'DEBUFFS' and db.debuffs.attachTo == 'BUFFS')

		debuffs:Point(db.debuffs.initialAnchor, attachTo, db.debuffs.anchorPoint, x, y)
		debuffs:Height(debuffs.size * rows)
		debuffs.initialAnchor = db.debuffs.initialAnchor
		debuffs["growth-y"] = db.debuffs['growth-y']
		debuffs["growth-x"] = db.debuffs['growth-x']

		if db.debuffs.enable then			
			debuffs:Show()
		else
			debuffs:Hide()
		end
	end	
	
	--Castbar
	do
		local castbar = frame.Castbar
		castbar:Width(db.castbar.width - 3)
		castbar:Height(db.castbar.height)
		
		--Icon
		if db.castbar.icon then
			castbar.Icon = castbar.ButtonIcon
			castbar.Icon.bg:Width(db.castbar.height + 4)
			castbar.Icon.bg:Height(db.castbar.height + 4)
			
			castbar:Width(db.castbar.width - castbar.Icon.bg:GetWidth() - 5)
			castbar.Icon.bg:Show()
		else
			castbar.ButtonIcon.bg:Hide()
			castbar.Icon = nil
		end
		
		if db.castbar.spark then
			castbar.Spark:Show()
		else
			castbar.Spark:Hide()
		end		
		
		castbar:ClearAllPoints()
		castbar:Point("TOPLEFT", frame, "BOTTOMLEFT", (BORDER + db.castbar.xOffset), (-(BORDER*2+BORDER) + db.castbar.yOffset))
		
		if db.castbar.enable and not frame:IsElementEnabled('Castbar') then
			frame:EnableElement('Castbar')
		elseif not db.castbar.enable and frame:IsElementEnabled('Castbar') then
			frame:DisableElement('Castbar')	
		end			
	end
	
	--Combo Bar
	do
		local CPoints = frame.CPoints
		CPoints:ClearAllPoints()
		if USE_MINI_COMBOBAR then
			CPoints:Point("CENTER", frame.Health.backdrop, "TOP", -(BORDER*3 + 6), -SPACING)
			CPoints:SetFrameStrata("MEDIUM")
		else
			if E.db.meat.uflayout == "Zeph" then
				CPoints:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, BORDER+SPACING)
			elseif E.db.meat.uflayout == "Duffed" then
				CPoints:Point("TOPLEFT", frame, "BOTTOMLEFT", BORDER, -(BORDER+SPACING))
			end
			CPoints:SetFrameStrata("LOW")
		end

		CPoints:Width(COMBOBAR_WIDTH)
		CPoints:Height(COMBOBAR_HEIGHT - (BORDER*2))			
		
		for i = 1, MAX_COMBO_POINTS do
			CPoints[i]:SetHeight(CPoints:GetHeight())
			CPoints[i]:SetWidth(E:Scale(CPoints:GetWidth() - (MAX_COMBO_POINTS - 1)) / MAX_COMBO_POINTS)	
			if USE_MINI_COMBOBAR then
				CPoints[i].backdrop:Show()
			else
				CPoints[i].backdrop:Hide()	
			end
			
			CPoints[i]:ClearAllPoints()
			if i == 1 then
				CPoints[i]:SetPoint("LEFT", CPoints)
			else
				if USE_MINI_COMBOBAR then
					CPoints[i]:Point("LEFT", CPoints[i-1], "RIGHT", SPACING+(BORDER*2)+2, 0)
				else
					CPoints[i]:Point("LEFT", CPoints[i-1], "RIGHT", SPACING, 0)
				end
			end	
			
			if not USE_MINI_COMBOBAR then
				CPoints[i].backdrop:Hide()
			else
				CPoints[i].backdrop:Show()
			end					
		end
		
		if not USE_MINI_COMBOBAR then
			CPoints.backdrop:Show()
		else
			CPoints.backdrop:Hide()
		end		

		if USE_COMBOBAR and not frame:IsElementEnabled('CPoints') then
			frame:EnableElement('CPoints')
		elseif not USE_COMBOBAR and frame:IsElementEnabled('CPoints') then
			frame:DisableElement('CPoints')	
			CPoints:Hide()
		end				
	end
	
	--Debuff Highlight
	do
		local dbh = frame.DebuffHighlight
		if E.db.unitframe.debuffHighlighting then
			if not frame:IsElementEnabled('DebuffHighlight') then
				frame:EnableElement('DebuffHighlight')
			end
		else
			if frame:IsElementEnabled('DebuffHighlight') then
				frame:DisableElement('DebuffHighlight')
			end		
		end
	end
	
	--OverHealing
	do
		local healPrediction = frame.HealPrediction
		
		if db.healPrediction then
			if not frame:IsElementEnabled('HealPrediction') then
				frame:EnableElement('HealPrediction')
			end

			healPrediction.myBar:ClearAllPoints()
			healPrediction.myBar:Width(db.width - (BORDER*2))
			healPrediction.myBar:SetPoint('BOTTOMLEFT', frame.Health:GetStatusBarTexture(), 'BOTTOMRIGHT')
			healPrediction.myBar:SetPoint('TOPLEFT', frame.Health:GetStatusBarTexture(), 'TOPRIGHT')	

			healPrediction.otherBar:ClearAllPoints()
			healPrediction.otherBar:SetPoint('TOPLEFT', healPrediction.myBar:GetStatusBarTexture(), 'TOPRIGHT')	
			healPrediction.otherBar:SetPoint('BOTTOMLEFT', healPrediction.myBar:GetStatusBarTexture(), 'BOTTOMRIGHT')	
			healPrediction.otherBar:Width(db.width - (BORDER*2))
		else
			if frame:IsElementEnabled('HealPrediction') then
				frame:DisableElement('HealPrediction')
			end		
		end
	end	
	
	frame.snapOffset = -(12 + db.castbar.height)
	
	if not frame.mover then
		frame:ClearAllPoints()
		frame:Point('BOTTOMRIGHT', E.UIParent, 'BOTTOM', 400, 130) --Set to default position
	end
	
	frame:UpdateAllElements()
end

-- TargetTarget Frame
function UF:Update_TargetTargetFrame(frame, db)
	frame.db = db
	local BORDER = E:Scale(2)
	local SPACING = E:Scale(1)
	local UNIT_WIDTH = db.width
	local UNIT_HEIGHT = db.height
	
	local USE_POWERBAR = db.power.enable
	local USE_MINI_POWERBAR = db.power.width ~= 'fill' and USE_POWERBAR
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR
	local POWERBAR_OFFSET = db.power.offset
	local POWERBAR_HEIGHT = db.power.height
	local POWERBAR_WIDTH = db.width - (BORDER*2)
	
	local unit = self.unit
	
	frame.colors = ElvUF.colors
	frame:Size(UNIT_WIDTH, UNIT_HEIGHT)
	
	--Adjust some variables
	do
		if not USE_POWERBAR then
			POWERBAR_HEIGHT = 0
		end	
		
		if USE_MINI_POWERBAR then
			POWERBAR_WIDTH = POWERBAR_WIDTH / 2
		end
	end
	
	
	--Health
	do
		local health = frame.Health
		health.Smooth = self.db.smoothbars

		--Text
		if db.health.text then
			health.value:Show()
			
			local x, y = self:GetPositionOffset(db.health.position)
			health.value:ClearAllPoints()
			health.value:Point(db.health.position, health, db.health.position, x, y)
		else
			health.value:Hide()
		end
		
		--Colors
		health.colorSmooth = nil
		health.colorHealth = nil
		health.colorClass = nil
		health.colorReaction = nil
		if self.db['colors'].healthclass ~= true then
			if self.db['colors'].colorhealthbyvalue == true then
				health.colorSmooth = true
			else
				health.colorHealth = true
			end		
		else
			health.colorClass = true
			health.colorReaction = true
		end	
		
		--Position
		health:ClearAllPoints()
		health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, -BORDER)
		if USE_POWERBAR_OFFSET then			
			health:Point("TOPRIGHT", frame, "TOPRIGHT", -(BORDER+POWERBAR_OFFSET), -BORDER)
			health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER+POWERBAR_OFFSET, BORDER+POWERBAR_OFFSET)
		elseif USE_MINI_POWERBAR then
			health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + (POWERBAR_HEIGHT/2))
		else
			health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER + POWERBAR_HEIGHT)
		end
	end
	
	--Name
	do
		local name = frame.Name
		if db.name.enable then
			name:Show()
			
			if not db.power.hideonnpc then
				local x, y = self:GetPositionOffset(db.name.position)
				name:ClearAllPoints()
				name:Point(db.name.position, frame.Health, db.name.position, x, y)				
			end
		else
			name:Hide()
		end
	end	
	
	--Power
	do
		local power = frame.Power
		if USE_POWERBAR then
			if not frame:IsElementEnabled('Power') then
				frame:EnableElement('Power')
				power:Show()
			end		
			
			power.Smooth = self.db.smoothbars
			
			--Text
			if db.power.text then
				power.value:Show()
				
				local x, y = self:GetPositionOffset(db.power.position)
				power.value:ClearAllPoints()
				power.value:Point(db.power.position, frame.Health, db.power.position, x, y)			
			else
				power.value:Hide()
			end
			
			--Colors
			power.colorClass = nil
			power.colorReaction = nil	
			power.colorPower = nil
			if self.db['colors'].powerclass then
				power.colorClass = true
				power.colorReaction = true
			else
				power.colorPower = true
			end		
			
			--Position
			power:ClearAllPoints()
			if USE_POWERBAR_OFFSET then
				power:Point("TOPLEFT", frame, "TOPLEFT", BORDER, -POWERBAR_OFFSET)
				power:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -BORDER, BORDER)
				power:SetFrameStrata("LOW")
				power:SetFrameLevel(2)
			elseif USE_MINI_POWERBAR then
				power:Width(POWERBAR_WIDTH - BORDER*2)
				power:Height(POWERBAR_HEIGHT - BORDER*2)
				power:Point("LEFT", frame, "BOTTOMLEFT", (BORDER*2 + 4), BORDER + (POWERBAR_HEIGHT/2))
				power:SetFrameStrata("MEDIUM")
				power:SetFrameLevel(frame:GetFrameLevel() + 3)
			else
				power:Point("TOPLEFT", frame.Health.backdrop, "BOTTOMLEFT", BORDER, -(BORDER + SPACING))
				power:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -BORDER, BORDER)
			end
		elseif frame:IsElementEnabled('Power') then
			frame:DisableElement('Power')
			power:Hide()	
			power.value:Hide()
		end
	end
	
	--Auras Disable/Enable
	--Only do if both debuffs and buffs aren't being used.
	do
		if db.debuffs.enable or db.buffs.enable then
			if not frame:IsElementEnabled('Aura') then
				frame:EnableElement('Aura')
			end	
		else
			if frame:IsElementEnabled('Aura') then
				frame:DisableElement('Aura')
			end			
		end
		
		frame.Buffs:ClearAllPoints()
		frame.Debuffs:ClearAllPoints()
	end
	
	--Buffs
	do
		local buffs = frame.Buffs
		local rows = db.buffs.numrows
		
		if USE_POWERBAR_OFFSET then
			buffs:SetWidth(UNIT_WIDTH - POWERBAR_OFFSET)
		else
			buffs:SetWidth(UNIT_WIDTH)
		end
		
		if db.buffs.initialAnchor == "RIGHT" or db.buffs.initialAnchor == "LEFT" then
			rows = 1;
			buffs:SetWidth(UNIT_WIDTH / 2)
		end
		
		buffs.num = db.buffs.perrow * rows
		buffs.size = ((((buffs:GetWidth() - (buffs.spacing*(buffs.num/rows - 1))) / buffs.num)) * rows)

		local x, y = self:GetAuraOffset(db.buffs.initialAnchor, db.buffs.anchorPoint)
		local attachTo = self:GetAuraAnchorFrame(frame, db.buffs.attachTo)

		buffs:Point(db.buffs.initialAnchor, attachTo, db.buffs.anchorPoint, x, y)
		buffs:Height(buffs.size * rows)
		buffs.initialAnchor = db.buffs.initialAnchor
		buffs["growth-y"] = db.buffs['growth-y']
		buffs["growth-x"] = db.buffs['growth-x']

		if db.buffs.enable then			
			buffs:Show()
		else
			buffs:Hide()
		end
	end
	
	--Debuffs
	do
		local debuffs = frame.Debuffs
		local rows = db.debuffs.numrows
		
		if USE_POWERBAR_OFFSET then
			debuffs:SetWidth(UNIT_WIDTH - POWERBAR_OFFSET)
		else
			debuffs:SetWidth(UNIT_WIDTH)
		end
		
		if db.debuffs.initialAnchor == "RIGHT" or db.debuffs.initialAnchor == "LEFT" then
			rows = 1;
			debuffs:SetWidth(UNIT_WIDTH / 2)
		end
		
		debuffs.num = db.debuffs.perrow * rows
		debuffs.size = ((((debuffs:GetWidth() - (debuffs.spacing*(debuffs.num/rows - 1))) / debuffs.num)) * rows)

		local x, y = self:GetAuraOffset(db.debuffs.initialAnchor, db.debuffs.anchorPoint)
		local attachTo = self:GetAuraAnchorFrame(frame, db.debuffs.attachTo, db.buffs.attachTo == 'DEBUFFS' and db.debuffs.attachTo == 'BUFFS')

		debuffs:Point(db.debuffs.initialAnchor, attachTo, db.debuffs.anchorPoint, x, y)
		debuffs:Height(debuffs.size * rows)
		debuffs.initialAnchor = db.debuffs.initialAnchor
		debuffs["growth-y"] = db.debuffs['growth-y']
		debuffs["growth-x"] = db.debuffs['growth-x']

		if db.debuffs.enable then			
			debuffs:Show()
		else
			debuffs:Hide()
		end
	end	
	
	frame.snapOffset = -(12 + self.db['units'].player.castbar.height)
	
	if not frame.mover then
		frame:ClearAllPoints()
		frame:Point('BOTTOM', E.UIParent, 'BOTTOM', 0, 130) --Set to default position
	end
	
	frame:UpdateAllElements()
end

-- Druid Portrait Setting
function UF:DruidResourceBarVisibilityUpdate(unit)
	local db = E.db['unitframe']['units'].player
	local health = self:GetParent().Health
	local frame = self:GetParent()
	local threat = frame.Threat
	local PORTRAIT_WIDTH = db.portrait.width
	local USE_PORTRAIT = db.portrait.enable
	local USE_PORTRAIT_OVERLAY = db.portrait.overlay and USE_PORTRAIT
	local eclipseBar = self:GetParent().EclipseBar
	local druidAltMana = self:GetParent().DruidAltMana
	local CLASSBAR_HEIGHT = db.classbar.height
	local USE_CLASSBAR = db.classbar.enable
	local USE_MINI_CLASSBAR = db.classbar.fill == "spaced" and USE_CLASSBAR
	local USE_POWERBAR = db.power.enable
	local USE_MINI_POWERBAR = db.power.width ~= 'fill' and USE_POWERBAR
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR
	local SPACING = E:Scale(1)
	local POWERBAR_HEIGHT = db.power.height
	local POWERBAR_OFFSET = db.power.offset
	local BORDER = E:Scale(2)
	
	if not USE_POWERBAR then
		POWERBAR_HEIGHT = 0
	end

	if USE_PORTRAIT_OVERLAY or not USE_PORTRAIT then
		PORTRAIT_WIDTH = 0
	end
	
	if USE_MINI_CLASSBAR then
		CLASSBAR_HEIGHT = CLASSBAR_HEIGHT / 2
	end
	if E.db.meat.uflayout == "Zeph" then
		if eclipseBar:IsShown() or druidAltMana:IsShown() then
			if db.power.offset ~= 0 then
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -(2+db.power.offset), -(2 + CLASSBAR_HEIGHT + 1))
			else
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -2, -(2 + CLASSBAR_HEIGHT + 1))
			end
			health:Point("TOPLEFT", frame, "TOPLEFT", PORTRAIT_WIDTH + 2, -(2 + CLASSBAR_HEIGHT + 1))	
		
		
			local mini_classbarY = 0
			if USE_MINI_CLASSBAR then
				mini_classbarY = -(SPACING+(CLASSBAR_HEIGHT))
			end		
			--[[
			threat:Point("TOPLEFT", -4, 4+mini_classbarY)
			threat:Point("TOPRIGHT", 4, 4+mini_classbarY)

			if USE_MINI_POWERBAR then
				threat:Point("BOTTOMLEFT", -4, -4 + (POWERBAR_HEIGHT/2))
				threat:Point("BOTTOMRIGHT", 4, -4 + (POWERBAR_HEIGHT/2))		
			else
				threat:Point("BOTTOMLEFT", -4, -4)
				threat:Point("BOTTOMRIGHT", 4, -4)
			end		

			if USE_POWERBAR_OFFSET then
				threat:Point("TOPRIGHT", 4-POWERBAR_OFFSET, 4+mini_classbarY)
				threat:Point("BOTTOMRIGHT", 4-POWERBAR_OFFSET, -4)	
			end
			]]--
			if db.portrait.enable and not db.portrait.overlay then
				local portrait = self:GetParent().Portrait
				portrait.backdrop:ClearAllPoints()
				if USE_MINI_CLASSBAR and USE_CLASSBAR then
					portrait.backdrop:Point("TOPLEFT", frame, "TOPLEFT", 0, -(CLASSBAR_HEIGHT + 1))
				else
					portrait.backdrop:SetPoint("TOPLEFT", frame, "TOPLEFT")
				end		
			
				if (USE_MINI_POWERBAR and not USE_POWERBAR_OFFSET) or not USE_POWERBAR then --or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", -SPACING - 4, -((POWERBAR_HEIGHT/2) - BORDER))
				elseif (USE_POWERBAR_OFFSET and USE_MINI_POWERBAR) or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", -SPACING - 4, -POWERBAR_OFFSET)
				else
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Power.backdrop, "BOTTOMLEFT", -SPACING - 4, 0)

				end					
			end
		else
			if db.power.offset ~= 0 then
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -(2 + db.power.offset), -2)
			else
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -2, -2)
			end
			health:Point("TOPLEFT", frame, "TOPLEFT", PORTRAIT_WIDTH + 2, -2)	

			if db.portrait.enable and not db.portrait.overlay then
				local portrait = self:GetParent().Portrait
				portrait.backdrop:ClearAllPoints()
				portrait.backdrop:Point("TOPLEFT", frame, "TOPLEFT")
			
				if (USE_MINI_POWERBAR and not USE_POWERBAR_OFFSET) or not USE_POWERBAR then --or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", -SPACING - 4, -((POWERBAR_HEIGHT/2) - BORDER))
				elseif (USE_POWERBAR_OFFSET and USE_MINI_POWERBAR) or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", -SPACING - 4, -POWERBAR_OFFSET)
				else
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Power.backdrop, "BOTTOMLEFT", -SPACING - 4, 0)

				end			
			end		
		end
	elseif E.db.meat.uflayout == "Duffed" then
		if eclipseBar:IsShown() or druidAltMana:IsShown() then
			if db.power.offset ~= 0 then
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -(2+db.power.offset), -(2 + CLASSBAR_HEIGHT + 1))
			else
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -2, -18)
			end
			health:Point("TOPLEFT", frame, "TOPLEFT", PORTRAIT_WIDTH + 2, -18)	
		
		
			local mini_classbarY = 0
			if USE_MINI_CLASSBAR then
				mini_classbarY = -(SPACING+(CLASSBAR_HEIGHT))
			end		
			--[[
			threat:Point("TOPLEFT", -4, 4+mini_classbarY)
			threat:Point("TOPRIGHT", 4, 4+mini_classbarY)

			if USE_MINI_POWERBAR then
				threat:Point("BOTTOMLEFT", -4, -4 + (POWERBAR_HEIGHT/2))
				threat:Point("BOTTOMRIGHT", 4, -4 + (POWERBAR_HEIGHT/2))		
			else
				threat:Point("BOTTOMLEFT", -4, -4)
				threat:Point("BOTTOMRIGHT", 4, -4)
			end		

			if USE_POWERBAR_OFFSET then
				threat:Point("TOPRIGHT", 4-POWERBAR_OFFSET, 4+mini_classbarY)
				threat:Point("BOTTOMRIGHT", 4-POWERBAR_OFFSET, -4)	
			end
			]]--
			if db.portrait.enable and not db.portrait.overlay then
				local portrait = self:GetParent().Portrait
				portrait.backdrop:ClearAllPoints()
				if USE_MINI_CLASSBAR and USE_CLASSBAR then
					portrait.backdrop:Point("TOPLEFT", frame, "TOPLEFT", 0, -(CLASSBAR_HEIGHT + 1))
				else
					portrait.backdrop:SetPoint("TOPLEFT", frame, "TOPLEFT")
				end		
			
				if USE_MINI_POWERBAR and not USE_POWERBAR_OFFSET then--or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", -SPACING - 4, -((POWERBAR_HEIGHT/2) - BORDER))
				elseif (USE_POWERBAR_OFFSET and USE_MINI_POWERBAR) or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", -SPACING - 4, -POWERBAR_OFFSET)
				else
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Power.backdrop, "BOTTOMLEFT", -SPACING - 4, 0)

				end					
			end
		else
			if db.power.offset ~= 0 then
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -(2 + db.power.offset), -2)
			else
				health:Point("TOPRIGHT", frame, "TOPRIGHT", -2, -18)
			end
			health:Point("TOPLEFT", frame, "TOPLEFT", PORTRAIT_WIDTH + 2, -18)	

			if db.portrait.enable and not db.portrait.overlay then
				local portrait = self:GetParent().Portrait
				portrait.backdrop:ClearAllPoints()
				portrait.backdrop:Point("TOPLEFT", frame, "TOPLEFT")
			
				if USE_MINI_POWERBAR and not USE_POWERBAR_OFFSET then--or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", -SPACING - 4, -((POWERBAR_HEIGHT/2) - BORDER))
				elseif (USE_POWERBAR_OFFSET and USE_MINI_POWERBAR) or USE_POWERBAR_OFFSET then
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Health.backdrop, "BOTTOMLEFT", -SPACING - 4, -POWERBAR_OFFSET)
				else
					portrait.backdrop:Point("BOTTOMRIGHT", frame.Power.backdrop, "BOTTOMLEFT", -SPACING - 4, 0)

				end			
			end		
		end
	end
end

-- Adjust Combobar (Target Frame)
function UF:UpdateComboDisplay(event, unit)
	if(unit == 'pet') then return end
	local db = UF.player.db
	local cpoints = self.CPoints
	local cp
	if (UnitHasVehicleUI("player") or UnitHasVehicleUI("vehicle")) then
		cp = GetComboPoints('vehicle', 'target')
	else
		cp = GetComboPoints('player', 'target')
	end


	for i=1, MAX_COMBO_POINTS do
		if(i <= cp) then
			cpoints[i]:SetAlpha(1)
			
			if i == MAX_COMBO_POINTS and db.classbar.fill == 'spaced' then
				for c = 1, MAX_COMBO_POINTS do
					cpoints[c].backdrop.shadow:Show()
					cpoints[c]:SetScript('OnUpdate', function(self)
						E:Flash(self.backdrop.shadow, 0.6)
					end)
				end
			else
				for c = 1, MAX_COMBO_POINTS do
					cpoints[c].backdrop.shadow:Hide()
					cpoints[c]:SetScript('OnUpdate', nil)
				end
			end
		else
			cpoints[i]:SetAlpha(.15)
			for c = 1, MAX_COMBO_POINTS do
				cpoints[c].backdrop.shadow:Hide()
				cpoints[c]:SetScript('OnUpdate', nil)
			end		
		end	
	end
	
	local BORDER = E:Scale(2)
	local SPACING = E:Scale(1)
	local db = E.db['unitframe']['units'].target
	local USE_COMBOBAR = db.combobar.enable
	local USE_MINI_COMBOBAR = db.combobar.fill == "spaced" and USE_COMBOBAR
	local COMBOBAR_HEIGHT = db.combobar.height
	local USE_PORTRAIT = db.portrait.enable
	local USE_PORTRAIT_OVERLAY = db.portrait.overlay and USE_PORTRAIT	
	local PORTRAIT_WIDTH = db.portrait.width
	

	if USE_PORTRAIT_OVERLAY or not USE_PORTRAIT then
		PORTRAIT_WIDTH = 0
	end

	if E.db.meat.uflayout == "Zeph" then
		if cpoints[1]:GetAlpha() == 1 then
			cpoints:Show()
			if USE_MINI_COMBOBAR then
				self.Portrait.backdrop:SetPoint("TOPRIGHT", self, "TOPRIGHT", 0, -((COMBOBAR_HEIGHT/2) + SPACING - BORDER))
				self.Health:Point("TOPRIGHT", self, "TOPRIGHT", -(BORDER+PORTRAIT_WIDTH), -(SPACING + (COMBOBAR_HEIGHT/2)))
			else
				self.Portrait.backdrop:SetPoint("TOPRIGHT", self, "TOPRIGHT")
				self.Health:Point("TOPRIGHT", self, "TOPRIGHT", -(BORDER+PORTRAIT_WIDTH), -(BORDER + SPACING + COMBOBAR_HEIGHT))
			end		

		else
			cpoints:Hide()
			self.Portrait.backdrop:SetPoint("TOPRIGHT", self, "TOPRIGHT")
			self.Health:Point("TOPRIGHT", self, "TOPRIGHT", -(BORDER+PORTRAIT_WIDTH), -BORDER)
		end
	elseif E.db.meat.uflayout == "Duffed" then
		if cpoints[1]:GetAlpha() == 1 then
			cpoints:Show()
			if USE_MINI_COMBOBAR then
				self.Portrait.backdrop:SetPoint("TOPRIGHT", self, "TOPRIGHT", 0, -((COMBOBAR_HEIGHT/2) + SPACING - BORDER))
				self.Health:Point("TOPRIGHT", self, "TOPRIGHT", -(BORDER+PORTRAIT_WIDTH), -18)
			else
				self.Portrait.backdrop:SetPoint("TOPRIGHT", self, "TOPRIGHT")
				self.Health:Point("TOPRIGHT", self, "TOPRIGHT", -(BORDER+PORTRAIT_WIDTH), -18)
			end		

		else
			cpoints:Hide()
			self.Portrait.backdrop:SetPoint("TOPRIGHT", self, "TOPRIGHT")
			self.Health:Point("TOPRIGHT", self, "TOPRIGHT", -(BORDER+PORTRAIT_WIDTH), -18)
		end
	end
end

------------------------
-- Re-Build Info Text --
------------------------

local function GetInfoText(frame, unit, r, g, b, min, max, reverse, type)
	local value
	local db = frame.db
	
	if not db then return '' end
	
	if db[type].text_format == 'blank' then
		return '';
	end
	
	if reverse then
		if type == 'health' then
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("|cff%02x%02x%02x%s|r\n|cffAF5050%.1f%%|r", r * 255, g * 255, b * 255, min, (min / max * 100))
				else
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, max)	
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max))	
				else
					value = format("|cff%02x%02x%02x%s|r |cffD7BEA5-|r |cffAF5050%s|r", r * 255, g * 255, b * 255, E:ShortValue(max), E:ShortValue(min))
				end
			elseif db[type].text_format == 'current' then
				value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(min))	
			elseif db[type].text_format == 'percent' then
				if min == max then
					value = ""
				else
					value = format("|cff%02x%02x%02x%.1f%%|r", r * 255, g * 255, b * 255, (min / max * 100))
				end
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max - min))
				end
			end	
		else
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("%s\n%.1f%%", min, (min / max * 100))
				else
					value = format("%s", max)	
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("%s", E:ShortValue(max))	
				else
					value = format("%s |cffD7BEA5-|r %s", E:ShortValue(max), E:ShortValue(min))
				end
			elseif db[type].text_format == 'current' then
				value = format("%s", E:ShortValue(min))	
			elseif db[type].text_format == 'percent' then
				if min == max then
					value = ""
				else
					value = format("%.1f%%", (min / max * 100))
				end
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r%s", E:ShortValue(max - min))
				end
			end			
		end
	else
		if type == 'health' then
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("|cff%02x%02x%02x%s|r\n|cffAF5050%.1f%%|r", r * 255, g * 255, b * 255, min, (min / max * 100))
				else
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, max)
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max))	
				else
					value = format("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%s|r", E:ShortValue(min), r * 255, g * 255, b * 255, E:ShortValue(max))
				end
			elseif db[type].text_format == 'current' then
				value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(min))	
			elseif db[type].text_format == 'percent' then
				if min == max then
					value = ""
				else
					value = format("|cff%02x%02x%02x%.1f%%|r", r * 255, g * 255, b * 255, (min / max * 100))
				end
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max - min))
				end
			end
		else
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("%s\n%.1f%%", min, (min / max * 100))
				else
					value = format("%s", max)
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("%s", E:ShortValue(max))	
				else
					value = format("%s |cffD7BEA5-|r %s", E:ShortValue(min), E:ShortValue(max))
				end
			elseif db[type].text_format == 'current' then
				value = format("%s", E:ShortValue(min))	
			elseif db[type].text_format == 'percent' then
				if min == max then
					value = ""
				else
					value = format("%.1f%%", (min / max * 100))
				end
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r%s", E:ShortValue(max - min))
				end
			end		
		end
	end
	
	return value
end

function UF:PostUpdateHealth(unit, min, max)
	local r, g, b = self:GetStatusBarColor()
	self.defaultColor = {r, g, b}
	
	if E.db['unitframe']['colors'].healthclass == true and E.db['unitframe']['colors'].colorhealthbyvalue == true and not (UnitIsTapped(unit) and not UnitIsTappedByPlayer(unit)) then
		local newr, newg, newb = ElvUF.ColorGradient(min, max, 1, 0, 0, 1, 1, 0, r, g, b)

		self:SetStatusBarColor(newr, newg, newb)
		if self.bg and self.bg.multiplier then
			local mu = self.bg.multiplier
			self.bg:SetVertexColor(newr * mu, newg * mu, newb * mu)
		end
	end

	if E.db['unitframe']['colors'].classbackdrop then
		local t
			if UnitIsPlayer(unit) then
				local _, class = UnitClass(unit)
				t = self:GetParent().colors.class[class]
			elseif UnitReaction(unit, 'player') then
				t = self:GetParent().colors.reaction[UnitReaction(unit, "player")]
			end

		if t then
			self.bg:SetVertexColor(t[1], t[2], t[3])
		end
	end
	
	--Backdrop
	if E.db['unitframe']['colors'].customhealthbackdrop then
		local backdrop = E.db['unitframe']['colors'].health_backdrop
		self.bg:SetVertexColor(backdrop.r, backdrop.g, backdrop.b)		
	end	
	
	if not self.value or self.value and not self.value:IsShown() then return end
	
	local connected, dead, ghost = UnitIsConnected(unit), UnitIsDead(unit), UnitIsGhost(unit)
	if not connected or dead or ghost then
		if not connected then
			self.value:SetText("|cffD7BEA5"..L['Offline'].."|r")
		elseif dead then
			self.value:SetText("|cffD7BEA5"..DEAD.."|r")
		elseif ghost then
			self.value:SetText("|cffD7BEA5"..L['Ghost'].."|r")
		end
		
		if self:GetParent().ResurrectIcon then
			self:GetParent().ResurrectIcon:SetAlpha(1)
		end
	else
		local r, g, b = ElvUF.ColorGradient(min, max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33)
		local reverse
		if unit == "target" then
			reverse = true
		end
		
		if self:GetParent().ResurrectIcon then
			self:GetParent().ResurrectIcon:SetAlpha(0)
		end

		self.value:SetJustifyH("RIGHT")
		self.value:SetText(GetInfoText(self:GetParent(), unit, r, g, b, min, max, reverse, 'health'))
	end
end

function UF:PostUpdatePower(unit, min, max)
	local pType, pToken, altR, altG, altB = UnitPowerType(unit)
	local color
	if pToken then
		color = ElvUF['colors'].power[pToken]
	else
	
	end
	local perc
	if max == 0 then
		perc = 0
	else
		perc = floor(min / max * 100)
	end
	
	if not self.value or self.value and not self.value:IsShown() then return end		
	
	self.value:SetJustifyH("LEFT")	

	if color then
		self.value:SetTextColor(color[1], color[2], color[3])
	else
		self.value:SetTextColor(altR, altG, altB, 1)
	end	
	
	local dead, ghost = UnitIsDead(unit), UnitIsGhost(unit)
	if min == 0 then 
		self.value:SetText() 
	else
		if (not UnitIsPlayer(unit) and not UnitPlayerControlled(unit) or not UnitIsConnected(unit)) and not (unit and unit:find("boss%d")) then
			self.value:SetText()
		elseif dead or ghost then
			self.value:SetText()
		else
			if pType == 0 then
				local reverse
				if unit == "player" then
					reverse = true
				end
				
				self.value:SetText(GetInfoText(self:GetParent(), unit, nil, nil, nil, min, max, reverse, 'power'))
			else
				self.value:SetText(max - (max - min))
			end
		end
	end

	local db = self:GetParent().db
	
	if self.LowManaText then
		if pToken == 'MANA' then
			if perc <= db.lowmana and not dead and not ghost then
				self.LowManaText:SetText(LOW..' '..MANA)
				E:Flash(self.LowManaText, 0.6)
			else
				self.LowManaText:SetText()
				E:StopFlash(self.LowManaText)
			end
		else
			self.LowManaText:SetText()
			E:StopFlash(self.LowManaText)
		end
	end
	
	if db and db['power'].hideonnpc then
		UF:PostNamePosition(self:GetParent(), unit)
	end	
end

----------------
-- Name Align --
----------------

function UF:PostNamePosition(frame, unit)
	if E.db.meat.uflayout == "Zeph" then
		if frame.Power.value:GetText() and UnitIsPlayer(unit) and frame.Power.value:IsShown() then
			local db = frame.db
		
			local position = db.name.position
			local x, y = self:GetPositionOffset(position)
			frame.Power.value:SetAlpha(1)
		
			frame.Name:ClearAllPoints()
			frame.Name:Point(position, frame.Health, position, x, y)	
		elseif frame.Power.value:IsShown() then
			frame.Power.value:SetAlpha(0)
		
			frame.Name:ClearAllPoints()
			frame.Name:SetPoint(frame.Power.value:GetPoint())
		end
	elseif E.db.meat.uflayout == "Duffed" then
		local db = frame.db
		
		local position = db.name.position
		local x, y = self:GetPositionOffset(position)

		if frame.Power.value:GetText() and UnitIsPlayer(unit) and frame.Power.value:IsShown() then
			frame.Power.value:SetAlpha(1)
		
			frame.Name:ClearAllPoints()
			frame.Name:Point('BOTTOMLEFT', frame.Health, 'TOPLEFT', x, 5)	
		elseif frame.Power.value:IsShown() then
			frame.Power.value:SetAlpha(1)
		
			frame.Name:ClearAllPoints()
			frame.Name:SetPoint('BOTTOMLEFT', frame.Health, 'TOPLEFT', x, 5)
		end
	end
end

function UF:Construct_NameText(frame)
	local name = frame:CreateFontString(nil, 'OVERLAY')
	UF['fontstrings'][name] = true
	if frame.unit == 'player' or frame.unit == 'target' then
		frame:Tag(name, '[Elv:getnamecolor][Elv:namelong] [Elv:diffcolor][level] [shortclassification]')
	elseif frame.unit == 'targettarget' or frame.unit == 'focus' or frame.unit == 'focustarget' then
		frame:Tag(name, '[Elv:getnamecolor][Elv:nameshort]')
	else
		frame:Tag(name, '[Elv:getnamecolor][Elv:namemedium]')
	end
	name:SetPoint('LEFT', frame.Health, 4, 0)
	
	return name
end