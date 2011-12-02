-------------------------------
-- ElvUI 3.0.2 Korean Locale --
--     BY MEAT (Elune-KR)    --
-------------------------------

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

	L["General"] = "일반 (General)";
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
	
	L["Credits"] = "크레딧 (Credits)";
	L['ELVUI_CREDITS'] = "I would like to give out a special shout out to the following people for helping me maintain this addon with testing and coding and people who also have helped me through donations. Please note for donations I'm only posting the names of people who PM'd me on the forums, if your name is missing and you wish to have your name added please PM me."
	L['Coding:'] = "코딩:";
	L['Testing:'] = "테스팅:";
	L['Donations:'] = "기부:";
	
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
	L["This can't be right, you must of broke something! Please turn on lua errors and report the issue to Elv http://www.tukui.org/forums/forum.php?id=146"] = "정상 작동하지 않습니다. 다음 주소를 통해 Elv에게 Lua 오류를 제보해 주세요. http://www.tukui.org/forums/forum.php?id=146";
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
		L["This is displayed when you have threat as a tank, if you don't have threat it is displayed as a DPS/Healer"] = "TANK일때 어그로를 가졌으면 혹은 DPS/힐러 일때 어그로를 갖지 않았으면 표시되는 색상입니다.";
	L["Bad Color"] = "위험 색상";
		L["This is displayed when you don't have threat as a tank, if you do have threat it is displayed as a DPS/Healer"] = "TANK일때 어그로를 갖지 못했으면 혹은 DPS/힐러 일때 어그로를 가졌으면 표시되는 색상입니다.";
	L["Good Transition Color"] = "안전한 변화 색상";
		L["This color is displayed when gaining/losing threat, for a tank it would be displayed when gaining threat, for a dps/healer it would be displayed when losing threat"] = "특성에 따라 어그로의 획득/소실에 따른 안전 색상입니다.";
	L["Bad Transition Color"] = "위험한 변화 색상";
		L["This color is displayed when gaining/losing threat, for a tank it would be displayed when losing threat, for a dps/healer it would be displayed when gaining threat"] = "특성에 따라 어그로의 획득/소실에 따른 위험 색상입니다.";	
	L["Castbar Height"] = "시전바 높이";
		L["Controls the height of the nameplate's castbar"] = "이름표의 시전바 높이를 조절합니다.";
	L["Health Text"] = "체력 문자";
		L["Toggles health text display"] = "체력 문자 표시를 토글합니다.";
	L["Personal Debuffs"] = "개인 디버프";
		L["Display your personal debuffs over the nameplate."] = "당신의 개인적인 디버프를 이름표 위쪽에 표시합니다.";
	L["Display level text on nameplate for nameplates that belong to units that aren't your level."] = "이름표에 당신과 다른 레벨일 시 레벨 문자를 표시합니다.";
	L["Enhance Threat"] = "향상된 위협수준";
		L["Color the nameplate's healthbar by your current threat, Example: good threat color is used if your a tank when you have threat, opposite for DPS."] = "당신의 현재 위협수준에 따라 이름표의 체력바 색상을 달리합니다. 예: 안전 색상은 당신이 탱커일때 위협 수준을 갖고 있을 때만, DPS는 그 반대입니다.";
	L["Combat Toggle"] = "전투 시 토글";
		L["Toggles the nameplates off when not in combat."] = "전투가 아닐 시 이름표를 끕니다.";
	L["Friendly NPC"] = "우호적인 NPC";
	L["Friendly Player"] = "우호적인 플레이어";
	L["Neutral"] = "중립";
	L["Enemy"] = "적";
	L["Threat"] = "위협";
	L["Reactions"] = "반응";
	L["Filters"] = "필터";
	L['Add Name'] = "이름 추가";
	L['Remove Name'] = "이름 삭제";
	L['Use this filter.'] = "이 필터를 사용합니다.";
	L["You can't remove a default name from the filter, disabling the name."] = true;
	L['Hide'] = "숨김";
		L['Prevent any nameplate with this unit name from showing.'] = "이 이름을 가진 이름표가 보여지는걸 막음";
	L['Custom Color'] = "사용자 색상";
		L['Disable threat coloring for this plate and use the custom color.'] = "이 이름표에 위협 색상 대신 사용자 색상을 사용하도록 합니다.";
	L['Custom Scale'] = "사용자 크기";
		L['Set the scale of the nameplate.'] = "이름표의 크기를 설정합니다.";
	L['Good Scale'] = "안전할 때 크기";
	L['Bad Scale'] = "위험할 때 크기";
	L["Auras"] = "오라";
end

--ClassTimers
do
	L['ClassTimers'] = "클래스타이머 (ClassTimers)";
	L["CLASSTIMER_DESC"] = '플레이어와 대상 유닛프레임의 버프/디버프를 상태바로 보여줍니다.';
	
	L['Player Anchor'] = "플레이어 앵커";
	L['What frame to anchor the class timer bars to.'] = "클래스타이머의 바가 어떤 프레임에 기준할지 정합니다.";
	L['Target Anchor'] = "대상 앵커";
	L['Trinket Anchor'] = "장신구 앵커";
	L['Player Buffs'] = "플레이어 버프";
	L['Target Buffs']  = "대상 버프";
	L['Player Debuffs'] = "플레이어 디버프";
	L['Target Debuffs']  = "타겟 디버프";	
	L['Player'] = "플레이어";
	L['Target'] = "대상";
	L['Trinket'] = "장신구";
	L['Procs'] = "발동형";
	L['Any Unit'] = "모든 유닛";
	L['Unit Type'] = "유닛 타입";
	L["Buff Color"] = "버프 색상";
	L["Debuff Color"] = "디버프 색상";
	L['You have attempted to anchor a classtimer frame to a frame that is dependant on this classtimer frame, try changing your anchors again.'] = "다른 클래스바 프레임이 이곳을 기준으로 하고 있기 때문에 다른 기준점으로 시도하세요.";
	L['Remove Color'] = "색상 삭제";
	L['Reset color back to the bar default.'] = "색상을 바의 기본값으로 리셋합니다.";
	L['Add SpellID'] = "주문ID 추가";
	L['Remove SpellID'] = "주문ID 삭제";
	L['You cannot remove a spell that is default, disabling the spell for you however.'] = "그 주문은 기본값이기에 삭제할 수 없습니다만, 비활성화는 가능합니다.";
	L['Spell already exists in filter.'] = "그 주문은 이미 필터에 있습니다.";
	L['Spell not found.'] = "주문을 찾지 못했습니다.";
	L["All"] = "모두";
	L["Friendly"] = "우호적";
	L["Enemy"] = "적대적";
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
	L["Hover your mouse over any actionbutton or spellbook button to bind it. Press the escape key or right click to clear the current actionbutton's keybinding."] = "액션바 버튼이나 마법책의 버튼에 마우스를 올려 키를 각인할 수 있습니다. ESC키나 마우스 우클릭으로 현재 버튼에 각인된 키를 지울수도 있습니다.";
	L['Save'] = "저장";
	L['Discard'] = "취소";
	L['Binds Saved'] = "각인 저장됨";
	L['Binds Discarded'] = "각인 취소됨";
	L["All keybindings cleared for |cff00ff00%s|r."] = "|cff00ff00%s|r 에 각인된 모든 키가 삭제됨";
	L[" |cff00ff00bound to |r"] = " |cff00ff00을 다음으로 각인함 : |r";
	L["No bindings set."] = "각인되지 않음";
	L["Binding"] = "각인";
	L["Key"] = "키";	
	L['Trigger'] = "트리거";
	
	--CONFIG
	L["ActionBars"] = "행동 단축바 (ActionBars)";
		L["Keybind Mode"] = "단축키 설정 모드";
		
	L['Macro Text'] = "매크로 문자";
		L['Display macro names on action buttons.'] = "액션바 버튼에 매크로 이름을 표시합니다.";
	L['Keybind Text'] = "단축키 문자";
		L['Display bind names on action buttons.'] = "액션바 버튼에 단축키 이름을 표시합니다.";
	L['Button Size'] = "버튼 크기";
		L['The size of the main action buttons.'] = "주 액션바 버튼의 크기";
	L['Button Spacing'] = "버튼 간격";
		L['The spacing between buttons.'] = "버튼간의 간격";
	L['Bar '] = "바 ";
	L['Backdrop'] = "배경";
		L['Toggles the display of the actionbars backdrop.'] = "행동 단축바의 뒷배경을 토글합니다.";
	L['Buttons'] = "버튼 수";
		L['The ammount of buttons to display.'] = "표시할 버튼의 수";
	L['Buttons Per Row'] = "한 행당 표시할 버튼의 수";
		L['The ammount of buttons to display per row.'] = "한 행당 표시할 버튼의 수";
	L['Anchor Point'] = "기준점";
		L['The first button anchors itself to this point on the bar.'] = "바에서 첫번째 버튼이 시작되는 기준점";
	L['Height Multiplier'] = "높이 배수";
	L['Width Multiplier'] = "너비 배수";
		L['Multiply the backdrops height or width by this value. This is usefull if you wish to have more than one bar behind a backdrop.'] = "액션바 배경의 너비나 높이의 배수를 설정합니다. 이것은 하나 이상의 바를 한 배경에 집어넣고 싶을때 유용합니다.";
	L['Action Paging'] = "행동 페이지";
		L["This works like a macro, you can run differant situations to get the actionbar to page differantly.\n Example: '[combat] 2;'"] = "이건 마치 매크로와 비슷하게 작동하며, 다른 상황에 따라 액션바의 페이지를 다르게 적용할 수 있습니다.\n예: '[combat] 2;'";
	L['Visibility State'] = "보여지는 상태";
		L["This works like a macro, you can run differant situations to get the actionbar to show/hide differantly.\n Example: '[combat] show;hide'"] = "이건 마치 매크로와 비슷하게 작동하며, 다른 상황에 따라 액션바를 보이거나 숨길 수 있습니다.\n예: '[combat] show;hide'";
	L['Restore Bar'] = "바 복원하기";
		L['Restore the actionbars default settings'] = "행동 단축바를 원래대로 되돌립니다.";
		L['Set the font size of the action buttons.'] = "액션바 버튼의 폰트 크기를 설정합니다.";
	L['Mouse Over'] = "마우스 오버";
		L['The frame is not shown unless you mouse over the frame.'] = "마우스를 프레임에 올리지 않는 이상 이 프레임은 보여지지 않습니다.";
	L['Pet Bar'] = "소환수 바";
	L['Alt-Button Size'] = "대체 버튼 크기";
		L['The size of the Pet and Shapeshift bar buttons.'] = "소환수, 태세 바 버튼의 크기";
	L['ShapeShift Bar'] = "태세변환 바";
	L['Cooldown Text'] = "쿨다운 문자";
		L['Display cooldown text on anything with the cooldown spiril.'] = true;
	L['Low Threshold'] = "최소 경계값";
		L['Threshold before text turns red and is in decimal form. Set to -1 for it to never turn red'] = "쿨다운 문자가 붉은색으로 변하는 경계값. -1로 설정하면 붉은색으로 변하지 않음.";
	L['Expiring'] = "끝남";
		L['Color when the text is about to expire'] = "끝날때의 문자 색상";
	L['Seconds'] = "초";
		L['Color when the text is in the seconds format.'] = "초 단위의 문자 색상";
	L['Minutes'] = "분";
		L['Color when the text is in the minutes format.'] = "분 단위의 문자 색상";
	L['Hours'] = "시";
		L['Color when the text is in the hours format.'] = "시 단위의 문자 색상";
	L['Days'] = "일";
		L['Color when the text is in the days format.'] = "하루 일 단위의 문자 색상";
	L['Totem Bar'] = "토템 바";
end

--UNITFRAMES
do	
	L['X Offset'] = true;
	L['Y Offset'] = true;
	L['RaidDebuff Indicator'] = true;
	L['Debuff Highlighting'] = true;
		L['Color the unit healthbar if there is a debuff that can be dispelled by you.'] = true;
	L['Disable Blizzard'] = "기본 블리자드 비활성화";
		L['Disables the blizzard party/raid frames.'] = true;
	L['OOR Alpha'] = "사거리 투명도";
		L['The alpha to set units that are out of range to.'] = true;
	L['You cannot set the Group Point and Column Point so they are opposite of each other.'] = true;
	L['Orientation'] = true;
		L['Direction the health bar moves when gaining/losing health.'] = true;
		L['Horizontal'] = true;
		L['Vertical'] = true;
	L['Camera Distance Scale'] = true;
		L['How far away the portrait is from the camera.'] = true;
	L['Offline'] = true;
	L['UnitFrames'] = "유닛프레임 (UnitFrames)";
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
	L['Health'] = "체력";
	L['Health Backdrop'] = "체력 배경";
	L['Tapped'] = true;
	L['Disconnected'] = "접속끊김";
	L['Powers'] = "파워";
	L['Reactions'] = "반응";
	L['Bad'] = "적대적";
	L['Neutral'] = "중립적";
	L['Good'] = "우호적";
	L['Player Frame'] = "플레이어 창";
	L['Width'] = "너비";
	L['Height'] = "높이";
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
	L['Role Icon'] = "역할 아이콘";
	L['Smart Raid Filter'] = true;
	L['Override any custom visibility setting in certain situations, EX: Only show groups 1 and 2 inside a 10 man instance.'] = true;
end

--Datatext
do
	L['Bandwidth'] = "대역폭";
	L['Download'] = "다운로드";
	L['Total Memory:'] = "총 메모리:";
	L['Home Latency:'] = "로컬 지연시간:";
	
	L.goldabbrev = "|cffffd700●|r"
	L.silverabbrev = "|cffc7c7cf●|r"
	L.copperabbrev = "|cffeda55f●|r"	
	
	L['Session:'] = "세션:";
	L["Character: "] = "캐릭터: ";
	L["Server: "] = "서버: ";
	L["Total: "] = "총: ";
	L["Saved Raid(s)"]= "귀속된 던전";
	L["Currency:"] = "화폐:";	
	L["Earned:"] = "수입:";	
	L["Spent:"] = "지출:";	
	L["Deficit:"] = "적자:";	
	L["Profit:"	] = "흑자:";	
	
	L["DataTexts"] = "정보글자 (DataTexts)";
	L["DATATEXT_DESC"] = "화면에 정보문자를 설정합니다.";
	L["Multi-Spec Swap"] = "이중 특성 스왑";
	L['Swap to an alternative layout when changing talent specs. If turned off only the spec #1 layout will be used.'] = "특성 교체 시 대체 레이아웃을 활성화함. 만약 이것을 끄면 오직 #1의 레이아웃만 사용됩니다.";
	L['24-Hour Time'] = "24시간제";
	L['Toggle 24-hour mode for the time datatext.'] = "시간 정보글자를 24시간제로 토글함";
	L['Local Time'] = "지역 시간";
	L['If not set to true then the server time will be displayed instead.'] = "비활성화시 서버 시간을 대신 표시합니다.";
	L['Primary Talents'] = "주 특성";
	L['Secondary Talents'] = "보조 특성";
	L['left'] = '왼쪽';
	L['middle'] = '중앙';
	L['right'] = '우측';
	L['LeftChatDataPanel'] = '좌측 대화창';
	L['RightChatDataPanel'] = '우측 대화창';
	L['LeftMiniPanel'] = '미니맵 왼쪽';
	L['RightMiniPanel'] = '미니맵 오른쪽';
	L['Friends'] = '친구';
	L['Friends List'] = '친구 목록';
	
	L['Head'] = "머리";
	L['Shoulder'] = "어깨";
	L['Chest'] = "가슴";
	L['Waist'] = "허리";
	L['Wrist'] = "손목";
	L['Hands'] = "손";
	L['Legs'] = "다리";
	L['Feet'] = "발";
	L['Main Hand'] = "주장비";
	L['Offhand'] = "보조장비";
	L['Ranged'] = "원거리장비";
	L['Mitigation By Level: '] = "레벨에 따른 점감";
	L['lvl'] = "레벨";
	L["Avoidance Breakdown"] = "방어합 수치";
	L['AVD: '] = "방어합: ";
	L['Unhittable:'] = "완전방어합";
	L['AP'] = "전투력";
	L['SP'] = "주문력";
	L['HP'] = "주문력";
end

--Tooltip
do
	L["TOOLTIP_DESC"] = '툴팁에 대한 설정을 할 수 있습니다.';
	L['Targeted By:'] = '대상을 잡은 자';
	L['Tooltip'] = '툴팁 (Tooltip)';
	L['Count'] = "갯수";
	L['Anchor Mode'] = "기준점 모드";
	L['Set the type of anchor mode the tooltip should use.'] = "툴팁에 사용될 기준점 모드를 설정합니다.";
	L['Smart'] = "스마트";
	L['Cursor'] = "커서";
	L['Anchor'] = "기준점";
	L['UF Hide'] = "유닛프레임 숨김";
	L["Don't display the tooltip when mousing over a unitframe."] = "유닛프레임에 마우스오버시 툴팁 숨김";
	L["Who's targetting who?"] = "누가 누굴 대상으로 잡았을까?";
	L["When in a raid group display if anyone in your raid is targetting the current tooltip unit."] = "레이드 그룹 내에서 현재 툴팁 대상을 누가 대상으로 잡았는지 보여줍니다.";
	L["Combat Hide"] = "전투 시 숨김";
	L["Hide tooltip while in combat."] = "전투 중엔 숨김";
	L['Item-ID'] = "아이템 ID";
	L['Display the item id on item tooltips.'] = "툴팁에 아이템 ID를 표시함";
end

--Chat
do
	L["Chat"] = "대화 (Chat)";
	L['Invalid Target'] = "적절한 대상이 아님";
end

--Skins
do
	L["Skins"] = "스킨 (Skins)";
	L["SKINS_DESC"] = "스킨 설정을 조절합니다.";
	L['Spacing'] = '공백';
	L['The spacing in between bars.'] = '바 사이의 간격을 조절합니다.';
	L["TOGGLESKIN_DESC"] = "이 스킨을 활성/비활성";
	L["Encounter Journal"] = "던전 도감";
	L["Bags"] = "가방";
	L["Reforge Frame"] = "재연마 창";
	L["Calendar Frame"] = "달력";
	L["Achievement Frame"] = "업적 창";
	L["LF Guild Frame"] = "길드 찾기";
	L["Inspect Frame"] = "살펴보기 창";
	L["KeyBinding Frame"] = "단축키 창";
	L["Guild Bank"] = "길드 은행";
	L["Archaeology Frame"] = "고고학 창";
	L["Guild Control Frame"] = "길드 설정 창";
	L["Guild Frame"] = "길드 창";
	L["TradeSkill Frame"] = "전문기술 창";
	L["Raid Frame"] = "공격대 창";
	L["Talent Frame"] = "특성 창";
	L["Glyph Frame"] = "문양 창";
	L["Auction Frame"] = "경매 창";
	L["Barbershop Frame"] = "미용실 창";
	L["Macro Frame"] = "매크로 창";
	L["Debug Tools"] = "디버그 창";
	L["Trainer Frame"] = "스킬 훈련 창";
	L["Socket Frame"] = "소켓 창";
	L["Achievement Popup Frames"] = "업적 달성 팝업창";
	L["BG Score"] = "전장 점수판";
	L["Merchant Frame"] = "상인 창";
	L["Mail Frame"] = "우편 창";
	L["Help Frame"] = "도움말 창";
	L["Trade Frame"] = "거래 창";
	L["Gossip Frame"] = "NPC 대화 창";
	L["Greeting Frame"] = true;
	L["World Map"] = "세계 지도";
	L["Taxi Frame"] = "차원문 창";
	L["LFD Frame"] = "파티찾기 창";
	L["Quest Frames"] = "퀘스트 창";
	L["Petition Frame"] = "확인 창";
	L["Dressing Room"] = "미리보기 창";
	L["PvP Frames"] = "투기장 창";
	L["Non-Raid Frame"] = "비-공격대 창";
	L["Friends"] = "친구";
	L["Spellbook"] = "마법책";
	L["Character Frame"] = "캐릭터 창";
	L["LFR Frame"] = "공격대 찾기 창";
	L["Misc Frames"] = "기타 창";
	L["Tabard Frame"] = "휘장 창";
	L["Guild Registrar"] = "길드 등록";
	L["Time Manager"] = "시계";	
end

--Misc
do
	L['Experience'] = "경험치";
	L['Bars'] = "바";
	L['XP:'] = "경험치:";
	L['Remaining:'] = "남음:";
	L['Rested:'] = "휴식:";
	
	L['Empty Slot'] = "빈 슬롯";
	L['Fishy Loot'] = "낚시 루팅";
	L["Can't Roll"] = "굴릴 수 없음";
	L['Disband Group'] = "그룹 해체";
	L['Raid Menu'] = "공격대 메뉴";
end

--Bags
do
	L['Click to search..'] = "검색하려면 클릭하세요";
	L['Sort Bags'] = "가방 정리";
	L['Stack Items'] = "아이템 덩어리 정리";
	L['Vender Grays'] = "회색 아이템 팔기";
	L['Toggle Bags'] = "가방 토글";
	L['You must be at a vender.'] = "상인을 만나야 합니다.";
	L['Vendered gray items for:'] = "회색 아이템을 팔았습니다.";
	L['No gray items to sell.'] = "처분할 회색 아이템이 없습니다.";
	L['Hold Shift:'] = "쉬프트를 누른 상태:";
	L['Stack Special'] = "특수 덩어리 정리";
	L['Sort Special'] = "특수물품 정리";
	L['Purchase'] = "구입";
	L["Can't buy anymore slots!"] = "더이상 추가 슬롯을 구매할 수 없습니다!";
	L['You must purchase a bank slot first!'] = "우선 은행 슬롯을 구매해야 합니다!";
end
