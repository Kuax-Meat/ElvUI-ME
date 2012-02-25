local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "koKR")
if not L then return end

L["Meat Edition"] = "|cffff139bMeat Edition|r"
L["Meat Edition DESC"] = "|cffff139bMeat Edition|r의 모든 코드는 |cff599fffElv|r와 |cff599fffMeat|r가 작성하였습니다. (Special Credit: odine)"
L["ME Reinstall"] = "|cffff0000재설치|r"
L["ME Reinstall DESC"] = "Meat Edition을 재설치합니다."
L["ME Changelog"] = "기능 및 변경사항"
L["ME Changelog DESC"] = "|cff599fff2012/2/24|r\n  |cffff139b* 버그 수정 내역|r\n   1. 행동 단축바 사용 안함시 발생하는 LUA 오류 해결\n   2. 전투문자 글꼴이 바뀌지 않던 점 수정\n   3. 코드 안정화\n   4. 유닛프레임 버그 픽스\n   5. 상단 패널에 현재 좌표와 위치를 표시하는 기능 추가\n   6. LUA 오류 해결\n   7. Omen/Recount 끼워넣기 옵션 추가 (왼쪽 스킨탭에서 설정가능)"
L["ME UPPANEL"] = "상단 패널"
L["ME BOTPANEL"] = "하단 패널"
L["ME AB FIX"] = "액션바 고정"
L["ME AB FIX DESC"] = "바2를 바1 위에 끼워넣고 모든 바를 1번 바에 종속시킵니다."
L["ME Chatfont"] = "채팅창 글꼴"
L["ME Microbar"] = "마이크로바"
L["TOPLEFTDT"] = "상단 로고 좌측 패널"
L["TOPRIGHTDT"] = "상단 로고 우측 패널"
L["ME Toggle"] = "토글"

-- fix Mistranslation
L["copperabbrev"] = "|cffeda55f●|r"
L["goldabbrev"] = "|cffffd700●|r"
L["silverabbrev"] = "|cffc7c7cf●|r"
L["HP"] = "주문력"