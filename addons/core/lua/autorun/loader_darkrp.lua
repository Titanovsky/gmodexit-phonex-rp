--[[
	Загрузка Модулей для PhonexDarkRP
	Сервер находится в полном подчинений проекта: [ Ambition ]

	[ 09.08.20 ]
		• Этот Loader был написан ещё в конце апреля, работал до июня, потом было много говна, полностью закончен в конце июня.
		• Сделать потом сортировку файлов по номеру (напр. sv_1_init.lua  sv_2_init.lua  )
		• Вроде как сделал (пусть и говнясто) принятие sub dirs.
	.
	[16.08.20]
		• Добавил для Phonex DarkRP
	.
	[31.08.20]
		• Добавил orgs2 для PhonexRP
	.
]]

if ( SERVER ) then 
	AddCSLuaFile()
end

function AMB.loadScripts( sDir, sText ) -- Загрузка скриптов (sv, cl, sh) на сервачок. Принимает папку и текст, который надо выводить
	MsgN( sText.."\n" )
	local files, dirs = file.Find( sDir .. "/*", "LUA" )
	for _, f in pairs( files ) do -- f - это файл
		AMB.load( sDir, f )
	end
	if ( dirs ) then
		for _, d in pairs( dirs ) do
			local sub_files, sub_dirs = file.Find( sDir .. "/" .. d .. "/*", "LUA" )
			for _, f_sub in pairs( sub_files ) do
				AMB.load( sDir .. "/" .. d, f_sub )
			end
		end
	end
	MsgN("======================================")
end

function AMB.load( sDir, f, on_sub, d )
	local type_file = string.sub( f, 0, 2 ) -- Первые два символа.

	if ( type_file == "sh" ) then
		if ( SERVER ) then
            include( sDir .. "/" .. f )
			AddCSLuaFile( sDir .. "/" .. f )
			MsgN( "[AMB] Added/Refresh file to (shared): " .. f )
        elseif ( CLIENT ) then
            include( sDir .. "/" .. f )
        end
	end

	if ( type_file == "sv") then
		if ( SERVER ) then
			include( sDir .. "/" .. f )
			MsgN( "[AMB] Added/Refresh file to (server): " .. f )
        end
	end

    if ( type_file == "cl") then
        if ( SERVER ) then
			AddCSLuaFile( sDir .. "/" .. f )
			MsgN( "[AMB] Added/Refresh file to (client): " .. f )
        elseif ( CLIENT )  then
            include( sDir .. "/" .. f )
        end
	end

end

AMB.loadScripts( 'language', 	"| [AMB] Language Client System |" )
AMB.loadScripts( 'lib', 		"| [AMB] Custom Library |" ) 
AMB.loadScripts( 'gm', 			"| [AMB] Gamemode Structure, Optimizations, Static Entities |" )
AMB.loadScripts( 'player',  	"| [AMB] Main Information of Player |" )
AMB.loadScripts( 'orgs2', 		"| [AMB] Organizations v2.0 |" ) -- PhonexRP
AMB.loadScripts( 'ui', 			"| [AMB] User Interface |" )
AMB.loadScripts( 'cmds', 		"| [AMB] CMDs |" )
AMB.loadScripts( 'drinks',  	"| [AMB] Drinks Coctail & Bar System |" )
AMB.loadScripts( 'kits',  		"| [AMB] System Kits |" )
AMB.loadScripts( 'shops',  		"| [AMB] Network of Shops |" )
AMB.loadScripts( 'chemistry', 	"| [AMB] Chemistry system: Synthesize of Virus |" )
AMB.loadScripts( 'phonexrp', 	"| [AMB] PhonexRP Structure" )
AMB.loadScripts( 'rob', 		"| [AMB] Rob Cargo |" ) -- PhonexRP
AMB.loadScripts( 'cases', 		"| [AMB] System Cases v1.0 |" )
AMB.loadScripts( 'propcore', 	"| [AMB] System Control of Props v1.0 |" ) -- PhonexRP
AMB.loadScripts( 'meth_r', 		"| [AMB]|" )
AMB.loadScripts( 'duel', 		"| [AMB]|" )