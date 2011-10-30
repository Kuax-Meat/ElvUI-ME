local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales
if E.client == "koKR" then

	L.core_resowarning = "|cff1784d1ElvUI:|r 당신이 지금 이용하는 해상도(%s)는, 모니터의 최적 해상도가 아닙니다. 그래픽 설정에서 최적화된 해상도 %s 로 조정하세요."
	L.colorpicker_warning = "|cff1784d1ElvUI|r: ElvUI 내에 같은 기능이 있으므로 ColorPickerPlus 애드온을 끄시려면 '/disable ColorPickerPlus' 를 입력하세요."
	
	L.openConfigTooltip = '게임 내 설정 열기'
 
	L.chat_BATTLEGROUND_GET = "[B]"
	L.chat_BATTLEGROUND_LEADER_GET = "[B]"
	L.chat_BN_WHISPER_GET = "From"
	L.chat_GUILD_GET = "[G]"
	L.chat_OFFICER_GET = "[O]"
	L.chat_PARTY_GET = "[P]"
	L.chat_PARTY_GUIDE_GET = "[P]"
	L.chat_PARTY_LEADER_GET = "[P]"
	L.chat_RAID_GET = "[R]"
	L.chat_RAID_LEADER_GET = "[R]"
	L.chat_RAID_WARNING_GET = "[W]"
	L.chat_WHISPER_GET = "From"
	L.chat_FLAG_AFK = "[AFK]"
	L.chat_FLAG_DND = "[DND]"
	L.chat_FLAG_GM = "[GM]"
	L.chat_ERR_FRIEND_ONLINE_SS = "|cff298F00접속|r했습니다"
	L.chat_ERR_FRIEND_OFFLINE_S = "|cffff0000접속종료|r했습니다"
	L.raidbufftoggler = "Raid Buff Reminder: "
 
	L.disband = "공격대를 해체합니다."
	L.chat_trade = "거래"
	
	L.addons_toggle = "토글"
	
	L.datatext_homelatency = "로컬 지연시간: "
	L.datatext_download = "다운로드: "
	L.datatext_bandwidth = "대역폭: "
	L.datatext_noguild = "길드 없음"
	L.datatext_bags = "소지품: "
	L.datatext_friends = "친구"
	L.datatext_earned = "수입:"
	L.datatext_spent = "지출:"
	L.datatext_deficit = "적자:"
	L.datatext_profit = "흑자:"
	L.datatext_wg = "전투 시간"
	L.datatext_friendlist = "친구 목록:"
	L.datatext_playersp = "주문력: "
	L.datatext_playerap = "전투력: "
	L.datatext_session = "시간: "
	L.datatext_character = "캐릭터: "
	L.datatext_server = "서버: "
	L.datatext_totalgold = "전체: "
	L.datatext_savedraid = "귀속된 던전"
	L.datatext_currency = "화폐:"
	L.datatext_playercrit = "치명타: "
	L.datatext_playerheal = "치유량"
	L.datatext_avoidancebreakdown = "방어합 수치"
	L.datatext_lvl = "레벨"
	L.datatext_boss = "우두머리"
	L.datatext_playeravd = "방어합: "
	L.datatext_mitigation = "레벨에 따른 경감: "
	L.datatext_healing = "치유량: "
	L.datatext_damage = "피해량: "
	L.datatext_honor = "명예점수: "
	L.datatext_killingblows = "결정타: "
	L.datatext_ttstatsfor = "통계"
	L.datatext_ttkillingblows = "결정타: "
	L.datatext_tthonorkills = "명예 승수: "
	L.datatext_ttdeaths = "죽은 수: "
	L.datatext_tthonorgain = "획득한 명예: "
	L.datatext_ttdmgdone = "피해량: "
	L.datatext_tthealdone = "치유량: "
	L.datatext_basesassaulted = "거점 공격:"
	L.datatext_basesdefended = "거점 방어:"
	L.datatext_towersassaulted = "경비탑 점령:"
	L.datatext_towersdefended = "경비탑 방어:"
	L.datatext_flagscaptured = "깃발 쟁탈:"
	L.datatext_flagsreturned = "깃발 반환:"
	L.datatext_graveyardsassaulted = "무덤 점령:"
	L.datatext_graveyardsdefended = "무덤 방어:"
	L.datatext_demolishersdestroyed = "파괴한 파괴전차:"
	L.datatext_gatesdestroyed = "파괴한 관문:"
	L.datatext_totalmemusage = "총 메모리 사용량:"
	L.datatext_control = "현재 진영:"
	L.datatext_cta_allunavailable = "긴급 소집에 대한 정보를 받을 수 없습니다."
	L.datatext_cta_nodungeons = "긴급 소집을 필요로 하는 던전이 없습니다."
 
	L.Slots = {
	  [1] = {1, "머리", 1000},
	  [2] = {3, "어깨", 1000},
	  [3] = {5, "가슴", 1000},
	  [4] = {6, "허리", 1000},
	  [5] = {9, "손목", 1000},
	  [6] = {10, "손", 1000},
	  [7] = {7, "다리", 1000},
	  [8] = {8, "발", 1000},
	  [9] = {16, "주장비", 1000},
	  [10] = {17, "보조장비", 1000},
	  [11] = {18, "원거리", 1000}
	}
 
	L.popup_disableui = "Elvui는 현재 해상도에서 작동하지 않습니다. Elvui를 비활성하시겠습니까? (다른 해상도로 시도해보려면 취소)"
	L.popup_install = "현재 캐릭터는 ElvUI를 처음 실행합니다. 대화창과 행동 단축바를 설정해야 합니다."
	L.popup_2raidactive = "두가지 공격대 레이아웃이 활성화 되었습니다. 하나를 선택해주세요."
 
	L.merchant_repairnomoney = "수리에 필요한 돈이 충분하지 않습니다!"
	L.merchant_repaircost = "모든 아이템이 수리되었습니다: "
	L.merchant_trashsell = "불필요한 아이템이 판매되었습니다: "
 
	L.goldabbrev = "|cffffd700●|r"	--gold
	L.silverabbrev = "|cffc7c7cf●|r"	--silver
	L.copperabbrev = "|cffeda55f●|r"	--copper
 
	L.error_noerror = "오류가 발견되지 않았습니다."
 
	L.unitframes_ouf_offline = "오프라인"
	L.unitframes_ouf_dead = "죽음"
	L.unitframes_ouf_ghost = "유령"
	L.unitframes_ouf_lowmana = "마나 적음"
	L.unitframes_ouf_threattext = "현재 대상에 대한 위협수준:"
	L.unitframes_ouf_offlinedps = "오프라인"
	L.unitframes_ouf_deaddps = "죽음"
	L.unitframes_ouf_ghostheal = "유령"
	L.unitframes_ouf_deadheal = "죽음"
	L.unitframes_ouf_gohawk = "매의 상으로 전환"
	L.unitframes_ouf_goviper = "독사의 상으로 전환"
	L.unitframes_disconnected = "연결끊김"
 
	L.tooltip_count = "개수"
	L.tooltip_notalents = "특성 없음"
	L.tooltip_loading = "불러오는 중"

	L.bags_noslots = "추가 슬롯을 구매할 수 없습니다!"
	L.bags_need_purchase = "은행 슬롯을 구매하셔야 합니다!"
	L.bags_costs = "가격: %.2f 골드"
	L.bags_buyslots = "Buy new slot with /bags purchase yes"
	L.bags_openbank = "먼저 은행을 열어야 됩니다."
	L.bags_sort = "열려있는 가방이나 은행을 정리합니다."
	L.bags_stack = "나뉜 덩이들을 합칩니다."
	L.bags_buybankslot = "은행 슬롯을 구매합니다. (은행이 열려있어야함)"
	L.bags_search = "검색"
	L.bags_sortmenu = "정리"
	L.bags_sortspecial = "특수가방 정리"
	L.bags_stackmenu = "덩이 합치기"
	L.bags_stackspecial = "특수가방 덩이 합치기"
	L.bags_showbags = "가방 보기"
	L.bags_sortingbags = "정리 완료."
	L.bags_nothingsort= "정리 할 것이 없습니다."
	L.bags_bids = "사용중인 가방: "
	L.bags_stackend = "덩이 다시 합치기 완료."
	L.bags_rightclick_search = "검색하려면 우클릭하세요."
	L.bags_leftclick = "왼쪽 클릭:"
	L.bags_rightclick = "오른쪽 클릭:"
 
	L.chat_invalidtarget = "잘못된 대상"
 
	L.core_autoinv_enable = "자동초대 활성화: 초대"
	L.core_autoinv_enable_c = "자동초대 활성화: "
	L.core_autoinv_disable = "자동초대 비활성화"
	L.core_welcome1 = "|cff1784d1ElvUI|r : Meat Edition %s 을 사용해주셔서 감사합니다."
	L.core_welcome1alt = "|cff1784d1ElvUI|r : Meat Edition %s 을 사용해주셔서 감사합니다."
	L.core_welcome2 = "자세한 사항은 |cff1784d1/uihelp|r를 입력하거나 http://www.tukui.org/forums/forum.php?id=84 에 방문하시면 확인 가능합니다."
 
	L.core_uihelp1 = "|cff00ff00일반적인 명령어|r"
	L.core_uihelp2 = "|cff1784d1/tracker|r - Elvui 투기장 애드온 - 가벼운 투기장 애드온입니다."
	L.core_uihelp3 = "|cff1784d1/rl|r - UI를 다시 불러옵니다."
	L.core_uihelp4 = "|cff1784d1/gm|r - 도움 요청(지식 열람실, GM 요청하기) 창을 엽니다."
	L.core_uihelp5 = "|cff1784d1/frame|r - 커서가 위치한 창의 정보를 보여줍니다. (lua 편집 시 매우 유용)"
	L.core_uihelp6 = "|cff1784d1/heal|r - 힐러용 공격대창을 사용합니다."
	L.core_uihelp7 = "|cff1784d1/dps|r - 딜러/탱커용 공격대창을 사용합니다."
	--L.core_uihelp8 = "|cff1784d1/uf|r - 개체창을 이동할 수 있습니다."
	L.core_uihelp9 = "|cff1784d1/bags|r - 분류, 정리, 가방 보관함을 추가 구입을 할 수 있습니다."
	L.core_uihelp10 = "|cff1784d1/installui|r - Elvui의 설정을 초기화합니다."
	L.core_uihelp11 = "|cff1784d1/rd|r - 공격대를 해체합니다."
	--L.core_uihelp12 = "|cff1784d1/wf|r - 임무 추적창을 이동할 수 있습니다."
	L.core_uihelp12 = "|cff1784d1/hb|r - 행동 단축 바에 단축키를 지정할 수 있습니다."
	--L.core_uihelp13 = "|cff1784d1/mss|r - 특수 기술 단축바를 이동할 수 있습니다."
	L.core_uihelp15 = "|cff1784d1/ainv|r - 자동초대 기능을 사용합니다. '/ainv 단어'를 입력하여 해당 단어가 들어간 귓속말이 올 경우 자동으로 초대를 합니다."
	L.core_uihelp16 = "|cff1784d1/resetgold|r - 골드 정보글자를 초기화합니다."
	L.core_uihelp17 = "|cff1784d1/moveele <arg>|r - 다양한 유닛프레임 요소들의 위치 이동을 토글하며, <arg>가 프레임 이름일 경우 그 프레임만 초기화 시켜줍니다."
	L.core_uihelp18 = "|cff1784d1/resetele|r - 개체창 요소의 위치를 초기화합니다. /resetele <요소 이름>로 지정한 요소만 초기화할 수 있습니다."
	L.core_uihelp19 = "|cff1784d1/farmmode|r - 미니맵의 크기 증가/감소를 토글합니다. 채집류 활동을 할 때 유용합니다."
	L.core_uihelp21 = "|cff1784d1/moveui|r - 인터페이스 구성요소들의 위치를 잠금해제 합니다."
	L.core_uihelp22 = "|cff1784d1/resetui <arg>|r - 이동되었던 모든 인터페이스 구성요소들의 위치를 초기화시킵니다. <arg>에 프레임 이름을 넣으면 그 프레임만 초기화됩니다(유닛프레임은 제외). 유닛프레임만 리셋시키기 위해서는 '/resetui uf'를 입력하세요."
	L.core_uihelp14 = "(위로 올리십시오 ...)"
 
	L.tooltip_whotarget = "대상을 잡은 자"
 
	L.bind_combat = "전투 중에는 단축키를 지정할 수 없습니다."
	L.bind_saved = "모든 단축키가 저장되었습니다."
	L.bind_discard = "새로 지정한 모든 단축키가 저장되지 않았습니다."
	L.bind_instruct = "커서가 위치한 단축버튼에 단축키를 지정할 수 있습니다. 오른쪽 클릭으로 해당 단축버튼의 단축키를 초기화할 수 있습니다."
	L.bind_save = "단축키 저장"
	L.bind_discardbind = "취소"

	L.core_raidutil = "공격대 관리자"
	L.core_raidutil_disbandgroup = "해체"
	
	L.ElvUIInstall_Title = "ElvUI 설치"
	L.ElvUIInstall_ContinueMessage = "다음 단계로 이동하려면 계속 버튼을 누르세요."
	L.ElvUIInstall_HighRecommended = "중요도: |cff07D400높음|r"
	L.ElvUIInstall_MediumRecommended = "중요도: |cffD3CF00보통|r"

	L.ElvUIInstall_page1_subtitle = "ElvUI %s : Meat Edition에 오신 것을 환영합니다!"
	L.ElvUIInstall_page1_desc1 = "이 설치 과정은 ElvUI가 제공하는 몇가지 기능들에 대하여 배울수 있으며, 당신의 사용자 인터페이스 환경을 이용하기 쉽도록 준비합니다."
	L.ElvUIInstall_page1_desc2 = "/uihelp 를 입력하면 명령어의 목록이 보여집니다. 게임 내 설정 메뉴는 /ec 나 /elvui 명령어로 사용할 수 있습니다. 만약 이 설치과정을 건너뛰고 싶으면 아래 버튼을 누르시면 됩니다."
	L.ElvUIInstall_page1_button1 = "건너뛰기"

	L.ElvUIInstall_page2_subtitle = "CVars (콘솔 버라이어블)"
	L.ElvUIInstall_page2_desc1 = "이번 단계에선 당신의 월드 오브 워크래프트 기본 옵션들을 세팅합니다. 제대로 동작하기 위해 이 단계를 수행하는 것을 추천합니다."
	L.ElvUIInstall_page2_desc2 = "CVars를 설치하려면 아래 버튼을 클릭하세요."
	L.ElvUIInstall_page2_button1 = "CVars 설치"

	L.ElvUIInstall_page3_subtitle = "Chat (대화)"
	L.ElvUIInstall_page3_desc1 = "이번 설치 단계에서는 당신의 대화창의 이름과, 위치와, 색상을 설정합니다."
	L.ElvUIInstall_page3_desc2 = "대화창을 설치하려면 아래 버튼을 클릭하세요. 대화창 탭들의 정확한 설정을 위해 이 설치 과정을 마쳐야 합니다."
	L.ElvUIInstall_page3_button1 = "Chat 설치"

	L.ElvUIInstall_page4_subtitle = "Resolution (해상도)"
	L.ElvUIInstall_page4_desc1 = "현재 해상도: %s, ElvUI는 자동으로 %s 버전을 당신의 화면 크기에 맞게 선택하였습니다."
	L.ElvUIInstall_page4_desc2 = "이것은 행동 단축바의 표시형태 혹은 유닛프레임의 적절한 크기 등 다양한 설정을 조절해줍니다. 나중에 이 세팅을 바꾸고 싶으시면 게임 내 설정(/ec)에 해상도 오버라이드 옵션으로 원하는 대로 설정하실 수 있습니다."
	L.ElvUIInstall_Low = "낮음"
	L.ElvUIInstall_High = "높음"

	L.ElvUIInstall_page5_subtitle = "Action Bars (행동 단축바)"
	L.ElvUIInstall_page5_desc1 = "이 설치 과정이 완료되면 행동 단축바를 설정할 수 있습니다. 왼쪽 채팅창 하단의 오른쪽에 위치한 L 버튼을 눌러서 설정할 수 있습니다."
	L.ElvUIInstall_page5_desc2 = "/hb 명령어를 통해 당신은 빠르게 행동 단축바의 단축키 설정을 할 수 있습니다. 쉬프트를 누른 상태에서 버튼을 드래그 하시면 행동 단축 버튼을 이동할 수 있습니다."

	L.ElvUIInstall_page6_subtitle = "UnitFrames (개체창)"
	L.ElvUIInstall_page6_desc1 = "이 설치 과정이 완료되면 유닛프레임의 위치를 재조정 할 수 있습니다. 왼쪽 채팅창 하단의 오른쪽에 위치한 L 버튼을 눌러서 설정할 수 있습니다."
	L.ElvUIInstall_page6_desc2 = "/dps 혹은 /heal 명령어를 통해 빠르게 딜러와 힐러 레이아웃을 오갈 수 있습니다."
	L.ElvUIInstall_page6_desc3 = "개체창의 위치를 모두 기본으로 설정하시길 원하면 아래 버튼을 누르세요."
	L.ElvUIInstall_page6_button1 = "개체창 위치 설정"

	L.ElvUIInstall_page7_subtitle = "설치 완료"
	L.ElvUIInstall_page7_desc1 = "모든 설치 과정이 끝났습니다. 기술적인 지원을 원한다면 다음을 방문해주세요. www.tukui.org"
	L.ElvUIInstall_page7_desc2 = "아래 버튼을 누르시면 여러 변수를 설정하고 재시작합니다."
	L.ElvUIInstall_page7_button1 = "마침"
	L.ElvUIInstall_CVarSet = "CVars 설정"
	L.ElvUIInstall_ChatSet = "대화 위치 설정"
	L.ElvUIInstall_UFSet = "개체창 위치 설정"
 
	L.hunter_unhappy = "소환수의 만족도: 불만족"
	L.hunter_content = "소환수의 만족도: 만족"
	L.hunter_happy = "소환수의 만족도: 매우 만족"
	
	L.tooltip_itemlevel = "아이템 레벨"
	L.tooltip_equip = " (착용)"
	
	function E.UpdateHotkey(self, actionButtonType)
		local hotkey = _G[self:GetName() .. 'HotKey']
		local text = hotkey:GetText()
		
		text = string.gsub(text, '(s%-)', 'S')
		text = string.gsub(text, '(a%-)', 'A')
		text = string.gsub(text, '(c%-)', 'C')
		text = string.gsub(text, '(번 마우스 버튼)', 'M')
		text = string.gsub(text, '(마우스 휠 위로)', 'MU')
		text = string.gsub(text, '(마우스 휠 아래로)', 'MD')
		text = string.gsub(text, KEY_BUTTON3, '3M')
		text = string.gsub(text, '(숫자패드 )', 'N')
		text = string.gsub(text, '(숫자패드)', 'N')
		text = string.gsub(text, KEY_PAGEUP, 'PU')
		text = string.gsub(text, KEY_PAGEDOWN, 'PD')
		text = string.gsub(text, KEY_SPACE, 'SpB')
		text = string.gsub(text, KEY_INSERT, 'Ins')
		text = string.gsub(text, KEY_HOME, 'Hm')
		text = string.gsub(text, KEY_DELETE, 'Del')
		text = string.gsub(text, KEY_MOUSEWHEELUP, 'MwU')
		text = string.gsub(text, KEY_MOUSEWHEELDOWN, 'MwD')
		
		if hotkey:GetText() == _G['RANGE_INDICATOR'] then
			hotkey:SetText('')
		else
			hotkey:SetText(text)
		end
	end
end