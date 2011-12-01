local E, L, DF = unpack(select(2, ...)); --Engine
local AB = E:GetModule('ActionBars');

local ceil = math.ceil;

local condition = "";
local bar = CreateFrame('Frame', 'ElvUI_Bar3', E.UIParent, 'SecureHandlerStateTemplate');

function AB:PositionAndSizeBar3()
	local spacing = E:Scale(self.db.buttonspacing);
	local buttonsPerRow = self.db['bar3'].buttonsPerRow;
	local numButtons = self.db['bar3'].buttons;
	local size = E:Scale(self.db.buttonsize);
	local point = self.db['bar3'].point;
	local numColumns = ceil(numButtons / buttonsPerRow);
	local widthMult = self.db['bar3'].widthMult;
	local heightMult = self.db['bar3'].heightMult;
	
	if numButtons < buttonsPerRow then
		buttonsPerRow = numButtons;
	end

	if numColumns < 1 then
		numColumns = 1;
	end
	
	if self.db['bar3'].enabled then
		bar:SetScale(1);
		bar:SetAlpha(1);
	else
		bar:SetScale(0.000001);
		bar:SetAlpha(0);
	end

	bar:SetWidth(spacing + ((size * (buttonsPerRow * widthMult)) + ((spacing * (buttonsPerRow - 1)) * widthMult) + (spacing * widthMult)));
	bar:SetHeight(spacing + ((size * (numColumns * heightMult)) + ((spacing * (numColumns - 1)) * heightMult) + (spacing * heightMult)));
	bar.mover:SetSize(bar:GetSize());
	bar.mouseover = self.db['bar3'].mouseover
	if self.db['bar3'].backdrop == true then
		bar.backdrop:Show();
	else
		bar.backdrop:Hide();
	end
	
	local horizontalGrowth, verticalGrowth;
	if point == "TOPLEFT" or point == "TOPRIGHT" then
		verticalGrowth = "DOWN";
	else
		verticalGrowth = "UP";
	end
	
	if point == "BOTTOMLEFT" or point == "TOPLEFT" then
		horizontalGrowth = "RIGHT";
	else
		horizontalGrowth = "LEFT";
	end
	
	local button, lastButton, lastColumnButton; 
	local possibleButtons = {};
	for i=1, NUM_ACTIONBAR_BUTTONS do
		button = _G["MultiBarBottomLeftButton"..i];
		lastButton = _G["MultiBarBottomLeftButton"..i-1];
		lastColumnButton = _G["MultiBarBottomLeftButton"..i-buttonsPerRow];
		button:SetParent(bar);
		button:ClearAllPoints();
		
		possibleButtons[((i * buttonsPerRow) + 1)] = true;
		button:SetAttribute("showgrid", 1);
		ActionButton_ShowGrid(button);

		if self.db['bar3'].mouseover == true then
			bar:SetAlpha(0);
			if not self.hooks[bar] then
				self:HookScript(bar, 'OnEnter', 'Bar_OnEnter');
				self:HookScript(bar, 'OnLeave', 'Bar_OnLeave');	
			end
			
			if not self.hooks[button] then
				self:HookScript(button, 'OnEnter', 'Button_OnEnter');
				self:HookScript(button, 'OnLeave', 'Button_OnLeave');					
			end
		else
			bar:SetAlpha(1);
			if self.hooks[bar] then
				self:Unhook(bar, 'OnEnter');
				self:Unhook(bar, 'OnLeave');	
			end
			
			if self.hooks[button] then
				self:Unhook(button, 'OnEnter');	
				self:Unhook(button, 'OnLeave');		
			end
		end
		
		if i == 1 then
			local x, y;
			if point == "BOTTOMLEFT" then
				x, y = spacing, spacing;
			elseif point == "TOPRIGHT" then
				x, y = -spacing, -spacing;
			elseif point == "TOPLEFT" then
				x, y = spacing, -spacing;
			else
				x, y = -spacing, spacing;
			end

			button:Point(point, bar, point, x, y);
		elseif possibleButtons[i] then
			local x = 0;
			local y = -spacing;
			local buttonPoint, anchorPoint = "TOP", "BOTTOM";
			if verticalGrowth == 'UP' then
				y = spacing;
				buttonPoint = "BOTTOM";
				anchorPoint = "TOP";
			end
			button:Point(buttonPoint, lastColumnButton, anchorPoint, x, y);			
		else
			local x = spacing;
			local y = 0;
			local buttonPoint, anchorPoint = "LEFT", "RIGHT";
			if horizontalGrowth == 'LEFT' then
				x = -spacing;
				buttonPoint = "RIGHT";
				anchorPoint = "LEFT";
			end
			
			button:Point(buttonPoint, lastButton, anchorPoint, x, y);
		end
		
		if i > numButtons then
			button:SetScale(0.000001);
			button:SetAlpha(0);
		else
			button:SetScale(1);
			button:SetAlpha(1);
		end
		
		self:StyleButton(button);
	end
	possibleButtons = nil;
	
	RegisterStateDriver(bar, "page", self:GetPage('bar3', 6, condition));
	RegisterStateDriver(bar, "show", self.db['bar3'].visibility);
end

function AB:CreateBar3()
	bar:CreateBackdrop('Default');
	bar.backdrop:SetAllPoints();
	bar:Point('LEFT', ElvUI_Bar1, 'RIGHT', 3, 0);

	local button;
	for i=1, NUM_ACTIONBAR_BUTTONS do
		button = _G["MultiBarBottomLeftButton"..i];
		bar:SetFrameRef("MultiBarBottomLeftButton"..i, button);
	end
	
	bar:Execute([[
		buttons = table.new();
		for i = 1, 12 do
			table.insert(buttons, self:GetFrameRef("MultiBarBottomLeftButton"..i));
		end
	]]);
	
	bar:SetAttribute("_onstate-page", [[ 
		for i, button in ipairs(buttons) do
			button:SetAttribute("actionpage", tonumber(newstate));
		end
	]]);
	
	bar:SetAttribute("_onstate-show", [[		
		if newstate == "hide" then
			self:Hide();
		else
			self:Show();
		end	
	]])
	
	self:CreateMover(bar, 'AB3', 'bar3');
	self:PositionAndSizeBar3();
end