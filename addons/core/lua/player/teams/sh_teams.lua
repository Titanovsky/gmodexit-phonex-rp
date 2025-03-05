--[[
	Стандартные команды (PVP, Build, RP, Player) в Shared.
	Сервер находится в полном подчинений проекта: [ Ambition ]

	[30.07.20]
		• Замутил sh, чтобы тима была и на сервере, и на клиенте.
	.
	[17.08.20]
		• Выпилил клиентскую часть + поменял под глобальные переменные и добавил зелёный цвет рпшкам.
		• а нахрена я хотел обфусцировать скрипт? О_о
	.
	todo: maybe to obfuscate this script?
]]

if ( AMB.config.gamemode == "DarkRP" ) then return end

local COLOR_GRAY = Color( 243, 243, 243 )

team.SetUp( AMB_TEAM_CITIZEN, 'Citizen', COLOR_GRAY )
team.SetUp( AMB_TEAM_PVP, 'PVP', COLOR_GRAY )
team.SetUp( AMB_TEAM_BUILD, 'Builder', COLOR_GRAY )
team.SetUp( AMB_TEAM_RP, 'RolePlayer', AMB_COLOR_GREEN )

-- print( team.GetName( AMB_TEAM_BUILD ) ) -- debug
