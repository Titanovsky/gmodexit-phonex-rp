-- Использую лик, обязательно его куплю, пожалуйста, берите лицуху!
-- Проект: [ Ambition ]. Сервер: PhonexRP
-- Steam: https://steamcommunity.com/groups/ambitiongmod

-- Переделано проектом [ Ambition ]

include( "skins/" .. itemstore.config.Skin .. ".lua" )

for _, filename in ipairs( file.Find( "itemstore/vgui/*.lua", "LUA" ) ) do
	include( "vgui/" .. filename )
end
