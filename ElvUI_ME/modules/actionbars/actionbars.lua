local E, L, P, G = unpack(ElvUI); --Import: Engine, Locales, ProfileDB, GlobalDB
local AB = E:GetModule('ActionBars');

-- Action Bar fontset
local function StyleFont(button, noBackdrop)
	local name = button:GetName();
	local count = _G[name.."Count"];
	local hotkey = _G[name.."HotKey"];
	local macroName = _G[name.."Name"];
	
	if count then
		count:ClearAllPoints();
		count:SetPoint("BOTTOMRIGHT", 1, 0);
		count:FontTemplate(E["meat"].font, E.db.meat.fontsize, E.db.meat.fontflag);
	end
	
	if E.db.actionbar.macrotext and macroName then
		macroName:ClearAllPoints();
		macroName:SetPoint("BOTTOM", 2, 2);
		macroName:FontTemplate(E["meat"].font, E.db.meat.fontsize, E.db.meat.fontflag);
	end
	
	if E.db.actionbar.hotkeytext then
		hotkey:FontTemplate(E["meat"].font, E.db.meat.fontsize, E.db.meat.fontflag);
	end
end

function AB:UpdateABFont()
	if E.global.actionbar.enable ~= true then return end
	for button, _ in pairs(self["handledbuttons"]) do
		if button then
			StyleFont(button, button.noBackdrop)
			--self:StyleFlyout(button)
		else
			self["handledbuttons"][button] = nil
		end
	end
end

function AB:AdjustBarPos()
	if E.db.meat.actionbarlayout == true and E.global.actionbar.enable == true then
		ElvUI_Bar2:Point('TOP', ElvUI_Bar1, 'TOP', 0, 0)
	end
end

function AB:MakeShadows()
	if E.global.actionbar.enable == true and not ElvUI_Bar1.backdrop.shadow then
		ElvUI_Bar1.backdrop:CreateShadow('Default')
		ElvUI_Bar2.backdrop:CreateShadow('Default')
		ElvUI_Bar3.backdrop:CreateShadow('Default')
		ElvUI_Bar4.backdrop:CreateShadow('Default')
		ElvUI_Bar5.backdrop:CreateShadow('Default')
	end
end