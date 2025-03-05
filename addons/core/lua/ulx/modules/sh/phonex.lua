local cat_darkrp = '[PhonexRP]'

function ulx.setteam( eCaller, eTarget, nTeam )

    if nTeam > #RPExtraTeams then return end

	eTarget:changeTeam( nTeam, true )

	nTeam = RPExtraTeams[nTeam].name

	ulx.fancyLogAdmin( eCaller, false, "#A изменил тиму  #T на #s", eTarget, nTeam  )
end
local setteam = ulx.command( cat_darkrp, "ulx setteam", ulx.setteam, "/setteam" )
setteam:addParam{ type=ULib.cmds.PlayerArg }
setteam:addParam{ type=ULib.cmds.NumArg, min=1, max=64, hint="ID Тимы", ULib.cmds.round }
setteam:defaultAccess( ULib.ACCESS_ADMIN )
setteam:help( "Изменить профу." )




local random_names = {

	'Владимир_Путин',
	'Monica_Belluchi',
	'Мария_Баженова',
	'Юля_Страус_Коловчук',
	'Дмитрий_Гордон',
	'Алексей_Панин',
	'Santa_Claus',
	'Leonid_Fedotov',
	'Дмитрий_Медведв',
	'Николас_Сед',
	'Мартин_Лютер',
	'Dmitriy_Medvedev',
	'Алексей_Иванов',
	'Семён_Глазницын',
	'Vladimir_Putin',
	'Marina_Dybko',
	'Mario_Salvia',
	'Bennito_Mono',
	'Ches_Chesterov',
	'Борис_Гользун',
	'Борис_Годунов',
	'Леонiд_Стасянов',
	'Владимир_Мешко',
	'Станислав_Бацко',
	'Дмитрий_Грушин',
	'Tony_Mantano',
	'Frederico_Pupo',
	'Paul_Gass',
	'Олександр_Балалайко',
	'Ahmed_ibn_Samin',
	'Ярослав_Залупко',
	'Bennito_Musalini',
	'Adolf_Hitler',
	'Iosif_Stalin',
	'Vladimir_Lenin',
	'Alina_Karamzina',
	'Александр_Пушкин',
	'Михаил_Лермонтов',
	'Валера_Грыжа_Питерский',
	'Владимир_Жириновский',
	'Ярослав_Мацудо',
	'Айзек_Азимов',
	'Азир_Басутов',
	'Максим_Марцинкевич',
	'Мухаммед_Амутакаев',
	'Василиск_Бабинский',
	'John_Wick',
	'John_MacShein',
	'Martin_Forelli',
	'Tony_Soprano',
	'Базир_Олегович',
	'Иван_Сухпойцев',
	'Иван_Иванов',
	'Артем_Скрипник',
	'Миша_Бачок_Московский',
	'Анджела_Канк',
	'Мария_Иванова',
	'Claudia_Soprano',
	'Хиро_Масудо',
	'Саске_Учиха',
	'Maya_Haru',
	'Aoi_Risaki',
	'Thomas_Styl',
	'Spartacus_Shmetterlink',
	'Thomas_Divan',
	'El_Capone',
	'Dmitry_Kostunov'

}
function ulx.setrandname( eCaller, eTarget )

	AmbStats.Players.setStats( eTarget, 'name', table.Random( random_names ) )

	ulx.fancyLogAdmin( eCaller, false, "#A выдал случайное имя #T", eTarget  )
end
local setrandname = ulx.command( cat_darkrp, "ulx setrandname", ulx.setrandname, "/setrandname" )
setrandname:addParam{ type=ULib.cmds.PlayerArg }
setrandname:defaultAccess( ULib.ACCESS_ADMIN )
setrandname:help( "Дать случайное имя." )

function ulx.spawnply( eCaller, eTarget )

	eTarget:Spawn()

	ulx.fancyLogAdmin( eCaller, false, "#A заспавнил #T", eTarget  )

end
local spawnply = ulx.command( cat_darkrp, "ulx spawn", ulx.spawnply, '/spawn' )
spawnply:addParam{ type=ULib.cmds.PlayerArg }
spawnply:defaultAccess( ULib.ACCESS_ADMIN )
spawnply:help( 'Заспавнить челика' )

function ulx.adminmode( eCaller )

	if ( eCaller.adminmode ~= true ) then

		eCaller:SetMaterial( 'Models/effects/vol_light001' )
		AmbLib.notifySend( eCaller, 'You turn on AdminMode', 0, 4, 'buttons/button9.wav' )
		eCaller.adminmode = true
		eCaller:GodEnable()

	else

		eCaller:SetMaterial( '' )
		AmbLib.notifySend( eCaller, 'You turn off AdminMode', 1, 3, 'buttons/button9.wav' )
		eCaller.adminmode = false
		eCaller:GodDisable()

	end


end
local adminmode = ulx.command( cat_darkrp, "ulx adminmode", ulx.adminmode, '/adminmode' )
adminmode:defaultAccess( ULib.ACCESS_ADMIN )
adminmode:help( 'Turn On/Off AdminMode' )

function ulx.warn( eCaller, eTarget, sReason )

	AmbWarn.GiveWarn( eTarget, sReason )

	ulx.fancyLogAdmin( eCaller, false, "#A выдал предупреждение #T с причиной: #s", eTarget, sReason  )

end
local warn = ulx.command( cat_darkrp, "ulx warn", ulx.warn, '/warn' )
warn:defaultAccess( ULib.ACCESS_SUPERADMIN )
warn:addParam{ type=ULib.cmds.PlayerArg }
warn:addParam{ type=ULib.cmds.StringArg, hint="Причина", ULib.cmds.optional }
warn:help( 'Выдать Warn' )


--[[
function ulx.lockdown( eCaller, sReason )

	local lockdown = GetConVar( 'phonexrp_lockdown' )

	if ( lockdown ) then

		AmbLockDown.SetLockDown( false )
		ulx.fancyLogAdmin( eCaller, false, "#A включил Комендантский Час по причине: #s", sReason  )

	else

		AmbLockDown.SetLockDown( true )
		ulx.fancyLogAdmin( eCaller, false, "#A включил Комендантский Час"  )

	end

end
local lockdown = ulx.command( cat_darkrp, 'ulx lockdown', ulx.lockdown, '/lockdown' )
lockdown:defaultAccess( ULib.ACCESS_ADMIN )
lockdown:addParam{ type=ULib.cmds.StringArg, hint="Причина", ULib.cmds.optional }
lockdown:help( 'Запустить/Отменить Ком. Час' )
]]