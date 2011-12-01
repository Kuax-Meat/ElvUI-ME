local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "koKR")
if not L then return end

--Static Popup
do
	L["One or more of the changes you have made require a ReloadUI."] = "하나 이상의 변경사항을 적용하려면 UI를 재시작해야 됩니다.";
end

--General
do
	L["Version"] = "버전";
	L["Enable"] = "활성화";

	L["General"] = "일반";
	L["ELVUI_DESC"] = "ElvUI는 월드 오브 워크래프트의 기본 인터페이스를 대체하는 유저 인터페이스입니다.";
	L["Auto Scale"] = "자동 크기";
		L["Automatically scale the User Interface based on your screen resolution"] = "사용자의 화면 해상도에 따라 자동으로 UI 크기를 맞춥니다.";
	L["Scale"] = "크기";
		L["Controls the scaling of the entire User Interface"] = "UI 전체의 크기를 조절합니다.";
	L["None"] = "없음";
	L["You don't have permission to mark targets."] = "대상에 표시할 권한이 없습니다.";
	L['LOGIN_MSG'] = '%sElvUI|r : Meat Edition %s%s|r 에 오신걸 환영합니다. /ec를 입력하시면 게임 내 설정메뉴로 진입가능합니다. 만약 기술지원이 필요하면 다음을 방문해주세요. http://www.tukui.org/forums/forum.php?id=84';
	L['Login Message'] = '로그인 메시지';
	
	L["Reset Anchors"] = "앵커 초기화";
	L["Reset all frames to their original positions."] = "모든 프레임을 초기 위치로 되돌립니다.";
	
	L['Install'] = "설치";
	L['Run the installation process.'] = "설치 마법사를 실행합니다.";
	
	L["Credits"] = true;
	L['ELVUI_CREDITS'] = "I would like to give out a special shout out to the following people for helping me maintain this addon with testing and coding and people who also have helped me through donations. Please note for donations I'm only posting the names of people who PM'd me on the forums, if your name is missing and you wish to have your name added please PM me."
	L['Coding:'] = true;
	L['Testing:'] = true;
	L['Donations:'] = true;
	
	--Installation
	L["Welcome to ElvUI version %s!"] = "ElvUI %s : Meat Edition 에 오신 것을 환영합니다!";
	L["This install process will help you learn some of the features in ElvUI has to offer and also prepare your user interface for usage."] = "이 설치과정은 UI의 사용에 대한 준비를 제공함과 동시에 몇가지의 구성요소에 대해 배울 수 있습니다.";
	L["The in-game configuration menu can be accesses by typing the /ec command or by clicking the 'C' button on the minimap. Press the button below if you wish to skip the installation process."] = "게임 내 설정메뉴는 /ec를 입력하시거나 미니맵 옆의 'C' 버튼을 클릭하시면 됩니다. 이 과정을 건너뛰시려면 아래 버튼을 누르십시오.";
	L["Please press the continue button to go onto the next step."] = "다음 단계로 가시려면 계속 버튼을 누르세요.";
	L["Skip Process"] = "건너뛰기";
	L["ElvUI Installation"] = "ElvUI 설치";
	
	L["CVars"] = "CVars (콘솔 버라이어블)";
	L["This part of the installation process sets up your World of Warcraft default options it is recommended you should do this step for everything to behave properly."] = "이 설치 단계는 당신의 WoW 기본 설정을 바꿔줍니다. 이 과정은 다른 단계에 있어서도 중요하니 설치를 강력히 추천합니다.";
	L["Please click the button below to setup your CVars."] = "CVars를 설치하려면 아래 설치 버튼을 누르세요.";
	L["Setup CVars"] = "CVars 설치";
	
	L["Importance: |cff07D400High|r"] = "중요도: |cff07D400높음|r";
	L["Importance: |cffD3CF00Medium|r"] = "중요도: |cffD3CF00중간|r";

	L["Chat"] = "대화 (Chat)";
	L["This part of the installation process sets up your chat windows names, positions and colors."] = "이 설치 단계는 당신의 대화창의 이름과 위치와 색상을 설정합니다.";
	L["The chat windows function the same as Blizzard standard chat windows, you can right click the tabs and drag them around, rename, etc. Please click the button below to setup your chat windows."] = "이 대화창의 기능은 블리자드의 기본과 같아서, 탭 우클릭으로 모든 기능을 설정 가능합니다. 아래 버튼을 누르셔서 대화창을 설치하세요.";
	L["Setup Chat"] = "Chat 설치";
	L['AutoHide Panels'] = "패널 자동숨김";
	L['When a chat frame does not exist, hide the panel.'] = "대화 프레임이 존재하지 않을경우, 패널을 숨깁니다.";
	
	L["Installation Complete"] = "설치 완료";
	L["You are now finished with the installation process. If you are in need technical support please visit us at www.tukui.org."] = "이제 설치가 완료되었습니다. 만약 기술적인 지원이 필요하면 다음을 방문하세요. www.tukui.org";
	L["Please click the button below so you can setup variables and ReloadUI."] = "아래 버튼을 누르시면 설치를 마무리하고 UI를 재시작합니다.";
	L["Finished"] = "마침";
	L["CVars Set"] = "CVars 설정";
	L["Chat Set"] = "대화 (Chat) 설정";
	L['Trade'] = "거래";
	
	L['Panels'] = "패널";
	L['Announce Interrupts'] = "방해/차단 알림";
	L['Announce when you interrupt a spell to the specified chat channel.'] = "주문 차단/방해를 하면 특정 대화채널로 알립니다.";
	L["Movers unlocked. Move them now and click Lock when you are done."] = "Movers 잠금 풀림. 움직이시고 완료가 되시면 다시 잠금을 클릭하세요.";
	L['Lock'] = "잠금";
end

--Media	
do
	L["Media"] = "미디어 (Media)";
	L["Fonts"] = "글꼴";
	L["Font Size"] = "글꼴 크기";
		L["Set the font size for everything in UI. Note: This doesn't effect somethings that have their own seperate options (UnitFrame Font, Datatext Font, ect..)"] = "UI 내의 모든 글꼴 크기를 설정합니다. Note: 개별 옵션으로 지정할 수 있는 부분은 제외됩니다. (유닛프레임 폰트, 정보글자 폰트 등)";
	L["Default Font"] = "기본 글꼴";
		L["The font that the core of the UI will use."] = "UI에서 기본으로 사용할 글꼴을 지정합니다.";
	L["UnitFrame Font"] = "유닛프레임 글꼴";
		L["The font that unitframes will use"] = "유닛프레임에서 사용할 글꼴";
	L["CombatText Font"] = "전투문자 글꼴";
		L["The font that combat text will use. |cffFF0000WARNING: This requires a game restart or re-log for this change to take effect.|r"] = "전투문자에 사용할 글꼴입니다. |cffFF0000경고: 설정을 변경하면 완전히 게임을 껐다 키셔야 합니다.|r";
	L["Textures"] = "텍스쳐 (무늬)";
	L["StatusBar Texture"] = "상태바 텍스쳐";
		L["Main statusbar texture."] = "주요 상태바 텍스쳐";
	L["Gloss Texture"] = "화려한 텍스쳐";
		L["This gets used by some objects."] = "이것은 몇몇 개체에 사용됩니다.";
	L["Colors"] = "색상";	
	L["Border Color"] = "테두리 색상";
		L["Main border color of the UI."] = "UI 주요 테두리의 색상";
	L["Backdrop Color"] = "배경 색상";
		L["Main backdrop color of the UI."] = "UI 주요 배경 색상";
	L["Backdrop Faded Color"] = "반투명 배경 색상";
		L["Backdrop color of transparent frames"] = "반투명한 배경 색상";
	L["Restore Defaults"] = "기본값으로 복원";
		
	L["Toggle Anchors"] = "앵커 토글";
	L["Unlock various elements of the UI to be repositioned."] = "위치를 설정하기 위해 다양한 UI 구성요소의 잠금을 품";
	
	L["Value Color"] = "색상 값";
	L["Color some texts use."] = "몇몇 문자에서 사용할 색상";
end

--NamePlate Config
do
	L["NamePlates"] = "이름표 (NamePlates)";
	L["NAMEPLATE_DESC"] = "이름표 설정 수정";
	L["Width"] = "길이";
		L["Controls the width of the nameplate"] = "이름표의 길이를 조절합니다.";
	L["Height"] = "높이";
		L["Controls the height of the nameplate"] = "이름표의 높이를 조절합니다.";
	L["Good Color"] = "안전 색상";
		L["This is displayed when you have threat as a tank, if you don't have threat it is displayed as a DPS/Healer"] = "TANK일때 ";
	L["Bad Color"] = "위험 색상";
		L["This is displayed when you don't have threat as a tank, if you do have threat it is displayed as a DPS/Healer"] = true;
	L["Good Transition Color"] = true;
		L["This color is displayed when gaining/losing threat, for a tank it would be displayed when gaining threat, for a dps/healer it would be displayed when losing threat"] = true;
	L["Bad Transition Color"] = true;
		L["This color is displayed when gaining/losing threat, for a tank it would be displayed when losing threat, for a dps/healer it would be displayed when gaining threat"] = true;	
	L["Castbar Height"] = true;
		L["Controls the height of the nameplate's castbar"] = true;
	L["Health Text"] = true;
		L["Toggles health text display"] = true;
	L["Personal Debuffs"] = true;
		L["Display your personal debuffs over the nameplate."] = true;
	L["Display level text on nameplate for nameplates that belong to units that aren't your level."] = true;
	L["Enhance Threat"] = true;
		L["Color the nameplate's healthbar by your current threat, Example: good threat color is used if your a tank when you have threat, opposite for DPS."] = true;
	L["Combat Toggle"] = true;
		L["Toggles the nameplates off when not in combat."] = true;
	L["Friendly NPC"] = true;
	L["Friendly Player"] = true;
	L["Neutral"] = true;
	L["Enemy"] = true;
	L["Threat"] = true;
	L["Reactions"] = true;
	L["Filters"] = true;
	L['Add Name'] = true;
	L['Remove Name'] = true;
	L['Use this filter.'] = true;
	L["You can't remove a default name from the filter, disabling the name."] = true;
	L['Hide'] = true;
		L['Prevent any nameplate with this unit name from showing.'] = true;
	L['Custom Color'] = true;
		L['Disable threat coloring for this plate and use the custom color.'] = true;
	L['Custom Scale'] = true;
		L['Set the scale of the nameplate.'] = true;
	L['Good Scale'] = true;
	L['Bad Scale'] = true;
	L["Auras"] = true;
end

--ClassTimers
do
	L['ClassTimers'] = true;
	L["CLASSTIMER_DESC"] = 'Display status bars above your player and target frame that show buff/debuff information.';
	
	L['Player Anchor'] = true;
	L['What frame to anchor the class timer bars to.'] = true;
	L['Target Anchor'] = true;
	L['Trinket Anchor'] = true;
	L['Player Buffs'] = true;
	L['Target Buffs']  = true;
	L['Player Debuffs'] = true;
	L['Target Debuffs']  = true;	
	L['Player'] = true;
	L['Target'] = true;
	L['Trinket'] = true;
	L['Procs'] = true;
	L['Any Unit'] = true;
	L['Unit Type'] = true;
	L["Buff Color"] = true;
	L["Debuff Color"] = true;
	L['Attempting to position a frame to a frame that is dependant, try another anchor point.'] = true;
	L['Remove Color'] = true;
	L['Reset color back to the bar default.'] = true;
	L['Add SpellID'] = true;
	L['Remove SpellID'] = true;
	L['You cannot remove a spell that is default, disabling the spell for you however.'] = true;
	L['Spell already exists in filter.'] = true;
	L['Spell not found.'] = true;
	L["All"] = true;
	L["Friendly"] = true;
	L["Enemy"] = true;
end
	
--ACTIONBARS
do
	--HOTKEY TEXTS
	L['KEY_SHIFT'] = 'S';
	L['KEY_ALT'] = 'A';
	L['KEY_CTRL'] = 'C';
	L['KEY_MOUSEBUTTON'] = 'M';
	L['KEY_MOUSEWHEELUP'] = 'MU';
	L['KEY_MOUSEWHEELDOWN'] = 'MD';
	L['KEY_BUTTON3'] = 'M3';
	L['KEY_NUMPAD'] = 'N';
	L['KEY_PAGEUP'] = 'PU';
	L['KEY_PAGEDOWN'] = 'PD';
	L['KEY_SPACE'] = 'SpB';
	L['KEY_INSERT'] = 'Ins';
	L['KEY_HOME'] = 'Hm';
	L['KEY_DELETE'] = 'Del';
	L['KEY_MOUSEWHEELUP'] = 'MwU';
	L['KEY_MOUSEWHEELDOWN'] = 'MwD';

	--BLIZZARD MODIFERS TO SEARCH FOR
	L['KEY_LOCALE_SHIFT'] = '(s%-)';
	L['KEY_LOCALE_ALT'] = '(a%-)';
	L['KEY_LOCALE_CTRL'] = '(c%-)';
	
	--KEYBINDING
	L["Hover your mouse over any actionbutton or spellbook button to bind it. Press the escape key or right click to clear the current actionbutton's keybinding."] = true;
	L['Save'] = true;
	L['Discard'] = true;
	L['Binds Saved'] = true;
	L['Binds Discarded'] = true;
	L["All keybindings cleared for |cff00ff00%s|r."] = true;
	L[" |cff00ff00bound to |r"] = true;
	L["No bindings set."] = true;
	L["Binding"] = true;
	L["Key"] = true;	
	L['Trigger'] = true;
	
	--CONFIG
	L["ActionBars"] = true;
		L["Keybind Mode"] = true;
		
	L['Macro Text'] = true;
		L['Display macro names on action buttons.'] = true;
	L['Keybind Text'] = true;
		L['Display bind names on action buttons.'] = true;
	L['Button Size'] = true;
		L['The size of the main action buttons.'] = true;
	L['Button Spacing'] = true;
		L['The spacing between buttons.'] = true;
	L['Bar '] = true;
	L['Backdrop'] = true;
		L['Toggles the display of the actionbars backdrop.'] = true;
	L['Buttons'] = true;
		L['The ammount of buttons to display.'] = true;
	L['Buttons Per Row'] = true;
		L['The ammount of buttons to display per row.'] = true;
	L['Anchor Point'] = true;
		L['The first button anchors itself to this point on the bar.'] = true;
	L['Height Multiplier'] = true;
	L['Width Multiplier'] = true;
		L['Multiply the backdrops height or width by this value. This is usefull if you wish to have more than one bar behind a backdrop.'] = true;
	L['Action Paging'] = true;
		L["This works like a macro, you can run differant situations to get the actionbar to page differantly.\n Example: '[combat] 2;'"] = true;
	L['Visibility State'] = true;
		L["This works like a macro, you can run differant situations to get the actionbar to show/hide differantly.\n Example: '[combat] show;hide'"] = true;
	L['Restore Bar'] = true;
		L['Restore the actionbars default settings'] = true;
		L['Set the font size of the action buttons.'] = true;
	L['Mouse Over'] = true;
		L['The frame is not shown unless you mouse over the frame.'] = true;
	L['Pet Bar'] = true;
	L['Alt-Button Size'] = true;
		L['The size of the Pet and Shapeshift bar buttons.'] = true;
	L['ShapeShift Bar'] = true;
	L['Cooldown Text'] = true;
		L['Display cooldown text on anything with the cooldown spiril.'] = true;
	L['Low Threshold'] = true;
		L['Threshold before text turns red and is in decimal form. Set to -1 for it to never turn red'] = true;
	L['Expiring'] = true;
		L['Color when the text is about to expire'] = true;
	L['Seconds'] = true;
		L['Color when the text is in the seconds format.'] = true;
	L['Minutes'] = true;
		L['Color when the text is in the minutes format.'] = true;
	L['Hours'] = true;
		L['Color when the text is in the hours format.'] = true;
	L['Days'] = true;
		L['Color when the text is in the days format.'] = true;
	L['Totem Bar'] = true;
end

--UNITFRAMES
do	
	L['X Offset'] = true;
	L['Y Offset'] = true;
	L['RaidDebuff Indicator'] = true;
	L['Debuff Highlighting'] = true;
		L['Color the unit healthbar if there is a debuff that can be dispelled by you.'] = true;
	L['Disable Blizzard'] = true;
		L['Disables the blizzard party/raid frames.'] = true;
	L['OOR Alpha'] = true;
		L['The alpha to set units that are out of range to.'] = true;
	L['You cannot set the Group Point and Column Point so they are opposite of each other.'] = true;
	L['Orientation'] = true;
		L['Direction the health bar moves when gaining/losing health.'] = true;
		L['Horizontal'] = true;
		L['Vertical'] = true;
	L['Camera Distance Scale'] = true;
		L['How far away the portrait is from the camera.'] = true;
	L['Offline'] = true;
	L['UnitFrames'] = true;
	L['Ghost'] = true;
	L['Smooth Bars'] = true;
		L['Bars will transition smoothly.'] = true;
	L["The font that the unitframes will use."] = true;
		L["Set the font size for unitframes."] = true;
	L['Font Outline'] = true;
		L["Set the font outline."] = true;
	L['Bars'] = true;
	L['Fonts'] = true;
	L['Class Health'] = true;
		L['Color health by classcolor or reaction.'] = true;
	L['Class Power'] = true;
		L['Color power by classcolor or reaction.'] = true;
	L['Health By Value'] = true;
		L['Color health by ammount remaining.'] = true;
	L['Custom Health Backdrop'] = true;
		L['Use the custom health backdrop color instead of a multiple of the main health color.'] = true;
	L['Class Backdrop'] = true;
		L['Color the health backdrop by class or reaction.'] = true;
	L['Health'] = true;
	L['Health Backdrop'] = true;
	L['Tapped'] = true;
	L['Disconnected'] = true;
	L['Powers'] = true;
	L['Reactions'] = true;
	L['Bad'] = true;
	L['Neutral'] = true;
	L['Good'] = true;
	L['Player Frame'] = true;
	L['Width'] = true;
	L['Height'] = true;
	L['Low Mana Threshold'] = true;
		L['When you mana falls below this point, text will flash on the player frame.'] = true;
	L['Combat Fade'] = true;
		L['Fade the unitframe when out of combat, not casting, no target exists.'] = true;
	L['Health'] = true;
		L['Text'] = true;
		L['Text Format'] = true;	
	L['Current - Percent'] = true;
	L['Current - Max'] = true;
	L['Current'] = true;
	L['Percent'] = true;
	L['Deficit'] = true;
	L['Filled'] = true;
	L['Spaced'] = true;
	L['Power'] = true;
	L['Offset'] = true;
		L['Offset of the powerbar to the healthbar, set to 0 to disable.'] = true;
	L['Alt-Power'] = true;
	L['Overlay'] = true;
		L['Overlay the healthbar']= true;
	L['Portrait'] = true;
	L['Name'] = true;
	L['Up'] = true;
	L['Down'] = true;
	L['Left'] = true;
	L['Right'] = true;
	L['Num Rows'] = true;
	L['Per Row'] = true;
	L['Buffs'] = true;
	L['Debuffs'] = true;
	L['Y-Growth'] = true;
	L['X-Growth'] = true;
		L['Growth direction of the buffs'] = true;
	L['Initial Anchor'] = true;
		L['The initial anchor point of the buffs on the frame'] = true;
	L['Castbar'] = true;
	L['Icon'] = true;
	L['Latency'] = true;
	L['Color'] = true;
	L['Interrupt Color'] = true;
	L['Match Frame Width'] = true;
	L['Fill'] = true;
	L['Classbar'] = true;
	L['Position'] = true;
	L['Target Frame'] = true;
	L['Text Toggle On NPC'] = true;
		L['Power text will be hidden on NPC targets, in addition the name text will be repositioned to the power texts anchor point.'] = true;
	L['Combobar'] = true;
	L['Use Filter'] = true;
		L['Select a filter to use.'] = true;
		L['Select a filter to use. These are imported from the unitframe aura filter.'] = true;
	L['Personal Auras'] = true;
	L['If set only auras belonging to yourself in addition to any aura that passes the set filter may be shown.'] = true;
	L['Create Filter'] = true;
		L['Create a filter, once created a filter can be set inside the buffs/debuffs section of each unit.'] = true;
	L['Delete Filter'] = true;
		L['Delete a created filter, you cannot delete pre-existing filters, only custom ones.'] = true;
	L["You can't remove a pre-existing filter."] = true;
	L['Select Filter'] = true;
	L['Whitelist'] = true;
	L['Blacklist'] = true;
	L['Filter Type'] = true;
		L['Set the filter type, blacklisted filters hide any aura on the like and show all else, whitelisted filters show any aura on the filter and hide all else.'] = true;
	L['Add Spell'] = true;
		L['Add a spell to the filter.'] = true;
	L['Remove Spell'] = true;
		L['Remove a spell from the filter.'] = true;
	L['You may not remove a spell from a default filter that is not customly added. Setting spell to false instead.'] = true;
	L['Unit Reaction'] = true;
		L['This filter only works for units with the set reaction.'] = true;
		L['All'] = true;
		L['Friend'] = true;
		L['Enemy'] = true;
	L['Duration Limit'] = true;
		L['The aura must be below this duration for the buff to show, set to 0 to disable. Note: This is in seconds.'] = true;
	L['TargetTarget Frame'] = true;
	L['Attach To'] = true;
		L['What to attach the buff anchor frame to.'] = true;
		L['Frame'] = true;
	L['Anchor Point'] = true;
		L['What point to anchor to the frame you set to attach to.'] = true;
	L['Focus Frame'] = true;
	L['FocusTarget Frame'] = true;
	L['Pet Frame'] = true;
	L['PetTarget Frame'] = true;
	L['Boss Frames'] = true;
	L['Growth Direction'] = true;
	L['Arena Frames'] = true;
	L['Profiles'] = true;
	L['New Profile'] = true;
	L['Delete Profile'] = true;
	L['Copy From'] = true;
	L['Talent Spec #1'] = true;
	L['Talent Spec #2'] = true;
	L['NEW_PROFILE_DESC'] = 'Here is where you can create new unitframe profiles, you can assign certain profiles to load based on what talent specialization you are currently using. You can also delete, copy or reset profiles here.';
	L["Delete a profile, doing this will permanently remove the profile from this character's settings."] = true;
	L["Copy a profile, you can copy the settings from a selected profile to the currently active profile."] = true;
	L["Assign profile to active talent specialization."] = true;
	L['Active Profile'] = true;
	L['Reset Profile'] = true;
		L['Reset the current profile to match default settings from the primary layout.'] = true;
	L['Party Frames'] = true;
	L['Group Point'] = true;
		L['What each frame should attach itself to, example setting it to TOP every unit will attach its top to the last point bottom.'] = true;
	L['Column Point'] = true;
		L['The anchor point for each new column. A value of LEFT will cause the columns to grow to the right.'] = true;
	L['Max Columns'] = true;
		L['The maximum number of columns that the header will create.'] = true;
	L['Units Per Column'] = true;
		L['The maximum number of units that will be displayed in a single column.'] = true;
	L['Column Spacing'] = true;
		L['The amount of space (in pixels) between the columns.'] = true;
	L['xOffset'] = true;
		L['An X offset (in pixels) to be used when anchoring new frames.'] = true;
	L['yOffset'] = true;
		L['An Y offset (in pixels) to be used when anchoring new frames.'] = true;
	L['Show Party'] = true;
		L['When true, the group header is shown when the player is in a party.'] = true;
	L['Show Raid'] = true;
		L['When true, the group header is shown when the player is in a raid.'] = true;
	L['Show Solo'] = true;
		L['When true, the header is shown when the player is not in any group.'] = true;
	L['Display Player'] = true;
		L['When true, the header includes the player when not in a raid.'] = true;
	L['Visibility'] = true;
		L['The following macro must be true in order for the group to be shown, in addition to any filter that may already be set.'] = true;
	L['Blank'] = true;
	L['Buff Indicator'] = true;
	L['Color Icons'] = true;
		L['Color the icon to their set color in the filters section, otherwise use the icon texture.'] = true;
	L['Size'] = true;
		L['Size of the indicator icon.'] = true;
	L["Select Spell"] = true;
	L['Add SpellID'] = true;
	L['Remove SpellID'] = true;
	L["Not valid spell id"] = true;
	L["Spell not found in list."] = true;
	L['Show Missing'] = true;
	L['Any Unit'] = true;
	L['Move UnitFrames'] = true;
	L['Reset Positions'] = true;
	L['Sticky Frames'] = true;
	L['Attempt to snap frames to nearby frames.'] = true;
	L['Raid625 Frames'] = true;
	L['Raid2640 Frames'] = true;
	L['Copy From'] = true;
	L['Select a unit to copy settings from.'] = true;
	L['You cannot copy settings from the same unit.'] = true;
	L['Restore Defaults'] = true;
	L['Role Icon'] = true;
	L['Smart Raid Filter'] = true;
	L['Override any custom visibility setting in certain situations, EX: Only show groups 1 and 2 inside a 10 man instance.'] = true;
end

--Datatext
do
	L['Bandwidth'] = true;
	L['Download'] = true;
	L['Total Memory:'] = true;
	L['Home Latency:'] = true;
	
	L.goldabbrev = "|cffffd700●|r"
	L.silverabbrev = "|cffc7c7cf●|r"
	L.copperabbrev = "|cffeda55f●|r"	
	
	L['Session:'] = true;
	L["Character: "] = true;
	L["Server: "] = true;
	L["Total: "] = true;
	L["Saved Raid(s)"]= true;
	L["Currency:"] = true;	
	L["Earned:"] = true;	
	L["Spent:"] = true;	
	L["Deficit:"] = true;	
	L["Profit:"	] = true;	
	
	L["DataTexts"] = true;
	L["DATATEXT_DESC"] = "Setup the on-screen display of info-texts.";
	L["Multi-Spec Swap"] = true;
	L['Swap to an alternative layout when changing talent specs. If turned off only the spec #1 layout will be used.'] = true;
	L['24-Hour Time'] = true;
	L['Toggle 24-hour mode for the time datatext.'] = true;
	L['Local Time'] = true;
	L['If not set to true then the server time will be displayed instead.'] = true;
	L['Primary Talents'] = true;
	L['Secondary Talents'] = true;
	L['left'] = 'Left';
	L['middle'] = 'Middle';
	L['right'] = 'Right';
	L['LeftChatDataPanel'] = 'Left Chat';
	L['RightChatDataPanel'] = 'Right Chat';
	L['LeftMiniPanel'] = 'Minimap Left';
	L['RightMiniPanel'] = 'Minimap Right';
	L['Friends'] = true;
	L['Friends List'] = true;
	
	L['Head'] = true;
	L['Shoulder'] = true;
	L['Chest'] = true;
	L['Waist'] = true;
	L['Wrist'] = true;
	L['Hands'] = true;
	L['Legs'] = true;
	L['Feet'] = true;
	L['Main Hand'] = true;
	L['Offhand'] = true;
	L['Ranged'] = true;
	L['Mitigation By Level: '] = true;
	L['lvl'] = true;
	L["Avoidance Breakdown"] = true;
	L['AVD: '] = true;
	L['Unhittable:'] = true;
	L['AP'] = true;
	L['SP'] = true;
	L['HP'] = true;
end

--Tooltip
do
	L["TOOLTIP_DESC"] = 'Setup options for the Tooltip.';
	L['Targeted By:'] = true;
	L['Tooltip'] = true;
	L['Count'] = true;
	L['Anchor Mode'] = true;
	L['Set the type of anchor mode the tooltip should use.'] = true;
	L['Smart'] = true;
	L['Cursor'] = true;
	L['Anchor'] = true;
	L['UF Hide'] = true;
	L["Don't display the tooltip when mousing over a unitframe."] = true;
	L["Who's targetting who?"] = true;
	L["When in a raid group display if anyone in your raid is targetting the current tooltip unit."] = true;
	L["Combat Hide"] = true;
	L["Hide tooltip while in combat."] = true;
	L['Item-ID'] = true;
	L['Display the item id on item tooltips.'] = true;
end

--Chat
do
	L["Chat"] = true;
	L['Invalid Target'] = true;
end

--Skins
do
	L["Skins"] = true;
	L["SKINS_DESC"] = 'Adjust Skin settings.';
	L['Spacing'] = true;
	L['The spacing in between bars.'] = true;
	L["TOGGLESKIN_DESC"] = "Enable/Disable this skin.";
	L["Encounter Journal"] = true;
	L["Bags"] = true;
	L["Reforge Frame"] = true;
	L["Calendar Frame"] = true;
	L["Achievement Frame"] = true;
	L["LF Guild Frame"] = true;
	L["Inspect Frame"] = true;
	L["KeyBinding Frame"] = true;
	L["Guild Bank"] = true;
	L["Archaeology Frame"] = true;
	L["Guild Control Frame"] = true;
	L["Guild Frame"] = true;
	L["TradeSkill Frame"] = true;
	L["Raid Frame"] = true;
	L["Talent Frame"] = true;
	L["Glyph Frame"] = true;
	L["Auction Frame"] = true;
	L["Barbershop Frame"] = true;
	L["Macro Frame"] = true;
	L["Debug Tools"] = true;
	L["Trainer Frame"] = true;
	L["Socket Frame"] = true;
	L["Achievement Popup Frames"] = true;
	L["BG Score"] = true;
	L["Merchant Frame"] = true;
	L["Mail Frame"] = true;
	L["Help Frame"] = true;
	L["Trade Frame"] = true;
	L["Gossip Frame"] = true;
	L["Greeting Frame"] = true;
	L["World Map"] = true;
	L["Taxi Frame"] = true;
	L["LFD Frame"] = true;
	L["Quest Frames"] = true;
	L["Petition Frame"] = true;
	L["Dressing Room"] = true;
	L["PvP Frames"] = true;
	L["Non-Raid Frame"] = true;
	L["Friends"] = true;
	L["Spellbook"] = true;
	L["Character Frame"] = true;
	L["LFR Frame"] = true;
	L["Misc Frames"] = true;
	L["Tabard Frame"] = true;
	L["Guild Registrar"] = true;
	L["Time Manager"] = true;	
end

--Misc
do
	L['Experience'] = true;
	L['Bars'] = true;
	L['XP:'] = true;
	L['Remaining:'] = true;
	L['Rested:'] = true;
	
	L['Empty Slot'] = true;
	L['Fishy Loot'] = true;
	L["Can't Roll"] = true;
	L['Disband Group'] = true;
	L['Raid Menu'] = true;
end

--Bags
do
	L['Click to search..'] = true;
	L['Sort Bags'] = true;
	L['Stack Items'] = true;
	L['Vender Grays'] = true;
	L['Toggle Bags'] = true;
	L['You must be at a vender.'] = true;
	L['Vendered gray items for:'] = true;
	L['No gray items to sell.'] = true;
	L['Hold Shift:'] = true;
	L['Stack Special'] = true;
	L['Sort Special'] = true;
	L['Purchase'] = true;
	L["Can't buy anymore slots!"] = true;
	L['You must purchase a bank slot first!'] = true;
end
