-- Использую лик, обязательно его куплю, пожалуйста, берите лицуху!
-- Проект: [ Ambition ]. Сервер: PhonexRP
-- Steam: https://steamcommunity.com/groups/ambitiongmod

-- Переделано проектом [ Ambition ]

itemstore = {}

if SERVER then
	include( "itemstore/sv_init.lua" )
else
	include( "itemstore/cl_init.lua" )
end