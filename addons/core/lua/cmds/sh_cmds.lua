AmbCmds = AmbCmds or {}

local prefix = '/'
local COLOR_ERROR 	= Color( 204, 38, 8 )
local COLOR_TEXT    = Color( 252, 252, 252 )
local COLOR_ORANGE  = Color( 235, 155, 52 )
local COLOR_GRAY    = Color( 214, 214, 214 )

local try = { 'УДАЧНО', 'НЕУДАЧНО' }

AmbCmds.Cmds = {
	['cmd']	= { 'Показать Список команд', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('amb_list') net.WriteEntity( args[1] ) net.Send( args[1] ) end },
	['limits']	= { 'Список лимитов.', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('amb_list_limits') net.WriteEntity( args[1] ) net.Send( args[1] ) end },

	['суп'] 	= { 'To start animation [0-2048].', function( ... ) local args = { ... } if args[1]:IsSuperAdmin() == false then return end net.Start('amb_cmds_anim') net.WriteUInt( tonumber( args[2] ), 11 ) net.WriteEntity( args[1] ) net.WriteBool( false ) net.Broadcast() end },

	['faq']		= { 'Популярные вопросы.', function( ... ) local args = { ... } args[1]:ChatPrint('Не доделал =/') end },

	['kit']		= { 'Выдать набор', function( ... ) local args = { ... } if not args[2] then return args[1]:ChatPrint('Введите kit') end args[1]:SendLua( 'RunConsoleCommand( "kit", "'..args[2]..'" )' ) end },

	['retry']	= { 'Перезайти', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('retry') net.WriteEntity( args[1] ) net.Send( args[1] ) end },

	['roll'] = { 'Кинуть кубик от 1 до 100 случайно.', function( ... ) local args = { ... } args[1]:Say( '/me выбрал: '..math.random(0,100) ) end },
	['stopsound'] = { 'stopsound', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('stopsound') net.WriteEntity( args[1] ) net.Send( args[1] ) end },

	['tab buttons'] = { 'Вкл/Выкл кнопки в табе', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('amb_tab_buttons '..args[3]) net.WriteEntity( args[1] ) net.Send( args[1] ) end },
	['tab info'] = { 'Вкл/Выкл ник, ping, фраги и смерти в табе', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('amb_tab_info '..args[3]) net.WriteEntity( args[1] ) net.Send( args[1] ) end },
	['tab admin'] = { 'Вкл/Выкл админ кнопку', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('amb_tab_admins '..args[3]) net.WriteEntity( args[1] ) net.Send( args[1] ) end },
	['hud'] = { '0 - выключить худ. Доступны худы: 1, 2.', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('amb_hud '..args[2]) net.WriteEntity( args[1] ) net.Send( args[1] ) end },
	['logo'] = { 'Вкл/Выкл логотип сервера', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('amb_hud_logo '..args[2]) net.WriteEntity( args[1] ) net.Send( args[1] ) end },
	['outline'] = { 'Вкл/Выкл контур объектов', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('amb_outline '..args[2]) net.WriteEntity( args[1] ) net.Send( args[1] ) end },

	['laws'] = { 'Закрыть/Открыть вкладку с Законами', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('amb_darkrp_laws '..args[2]) net.WriteEntity( args[1] ) net.Send( args[1] ) end },
	['context donat'] = { 'Показать/Убрать Кнопку с Магазином', function( ... ) local args = { ... } net.Start('amb_cmds_concmd') net.WriteString('amb_context_donat '..args[3]) net.WriteEntity( args[1] ) net.Send( args[1] ) end },

	['try'] = { 'Удачно/Неудачно совершить действие (50%).', function( ... ) local args = { ... } args[1]:Say( '/me Действие получилось ['..table.Random( try )..']' ) end },

	['rob'] = { 'Узнать через сколько будет доставлен груз.', function( ... ) local args = { ... } AmbLib.chatSend( args[ 1 ], AMB_COLOR_AMBITION, '[•] ', AMB_COLOR_WHITE, 'Груз прибудет через: ', AMB_COLOR_GRAY, math.Round( timer.TimeLeft( 'AmbRobCargo' )/60 ), AMB_COLOR_WHITE, ' минут' ) end },
}


AmbCmds.ChatSpecWords = {
	['привет']	= { 'd', function( ... ) local args = { ... } net.Start('amb_cmds_anim') net.WriteUInt( ACT_GMOD_TAUNT_SALUTE, 11 ) net.WriteEntity( args[1] ) net.WriteBool( true ) net.Broadcast() end },
	['да']		= { 'd', function( ... ) local args = { ... } net.Start('amb_cmds_anim') net.WriteUInt( ACT_GMOD_GESTURE_AGREE, 11 ) net.WriteEntity( args[1] ) net.WriteBool( true ) net.Broadcast() end },
	['ок']		= { 'd', function( ... ) local args = { ... } net.Start('amb_cmds_anim') net.WriteUInt( ACT_GMOD_GESTURE_AGREE, 11 ) net.WriteEntity( args[1] ) net.WriteBool( true ) net.Broadcast() end },
	['нет']		= { 'd', function( ... ) local args = { ... } net.Start('amb_cmds_anim') net.WriteUInt( ACT_GMOD_GESTURE_DISAGREE, 11 ) net.WriteEntity( args[1] ) net.WriteBool( true ) net.Broadcast() end },
	['неа']		= { 'd', function( ... ) local args = { ... } net.Start('amb_cmds_anim') net.WriteUInt( ACT_GMOD_GESTURE_DISAGREE, 11 ) net.WriteEntity( args[1] ) net.WriteBool( true ) net.Broadcast() end },
	['нет']		= { 'd', function( ... ) local args = { ... } net.Start('amb_cmds_anim') net.WriteUInt( ACT_GMOD_GESTURE_DISAGREE, 11 ) net.WriteEntity( args[1] ) net.WriteBool( true ) net.Broadcast() end },
	['лол']		= { 'd', function( ... ) local args = { ... } net.Start('amb_cmds_anim') net.WriteUInt( ACT_GMOD_TAUNT_LAUGH, 11 ) net.WriteEntity( args[1] ) net.WriteBool( true ) net.Broadcast() end },
	['xD']		= { 'd', function( ... ) local args = { ... } net.Start('amb_cmds_anim') net.WriteUInt( ACT_GMOD_TAUNT_LAUGH, 11 ) net.WriteEntity( args[1] ) net.WriteBool( true ) net.Broadcast() end },
	[':D']		= { 'd', function( ... ) local args = { ... } net.Start('amb_cmds_anim') net.WriteUInt( ACT_GMOD_TAUNT_LAUGH, 11 ) net.WriteEntity( args[1] ) net.WriteBool( true ) net.Broadcast() end },

}

if ( SERVER ) then
	util.AddNetworkString('amb_cmds_concmd')
	util.AddNetworkString('amb_cmds_orgs')
	util.AddNetworkString('amb_cmds_anim')
	util.AddNetworkString('amb_cmds_urls')


	function AmbCmds.isMing( ent_index )
		local ply = Entity(ent_index)
		local valid_players = {}
		local ming_or_not = { 'Мингом', 'Не Мингом'}
		local rand_ming = table.Random( ming_or_not )

		if ( tonumber( ent_index ) == 0 ) then
			for k, pl in pairs( player.GetAll() ) do
				valid_players[k] = pl:EntIndex()
			end
			ply = Entity( table.Random(valid_players) )
		end

		if ( ply:IsPlayer() ) then
			for k, v in pairs( player.GetAll() ) do
				if rand_ming == 'Мингом' then
					if #ply:GetNWString('amb_players_name') > 0 then
						AmbLib.chatSend( v, COLOR_ORANGE, "[•] ", COLOR_TEXT, 'Внимание! '..ply:GetNWString('amb_players_name')..' оказался: ', AMB_COLOR_RED, rand_ming )
					else
						AmbLib.chatSend( v, COLOR_ORANGE, "[•] ", COLOR_TEXT, 'Внимание! '..ply:Nick()..' оказался: ', AMB_COLOR_RED, rand_ming )
					end
				else
					if #ply:GetNWString('amb_players_name') > 0 then
						AmbLib.chatSend( v, COLOR_ORANGE, "[•] ", COLOR_TEXT, 'Внимание! '..ply:GetNWString('amb_players_name')..' оказался: ', AMB_COLOR_GREEN, rand_ming )
					else
						AmbLib.chatSend( v, COLOR_ORANGE, "[•] ", COLOR_TEXT, 'Внимание! '..ply:Nick()..' оказался: ', AMB_COLOR_GREEN, rand_ming )
					end
				end
			end
		end
	end

	hook.Add( 'PlayerSay', 'amb_0x80', function( ePly, sText, team )

		if string.GetChar( sText, 1 ) ~= '/' then
			for name, v in pairs( AmbCmds.ChatSpecWords ) do
				if string.find( sText, name ) then
					v[2]( ePly )
				end
			end
		end

		if string.GetChar( sText, 1 ) == '/' then
			for name, v in pairs( AmbCmds.Cmds ) do
				--if string.find( sText, prefix..name, 1, #name ) then
				if string.match( sText, prefix..name ) then
					--ePly:ChatPrint( sText..' | '..prefix..name ) -- debug
					local tText = string.Explode(" ", sText )
					-- print( tText[2] ) -- debug
					v[2]( ePly, tText[2], tText[3], tText[4], tText[5], tText[6] )
				end
			end
		end
	end )
elseif ( CLIENT ) then

	
	local function AmbCmds_list()
		chat.AddText( COLOR_ORANGE, '##########################' )
		for name, v in SortedPairs( AmbCmds.Cmds ) do
			chat.AddText(  COLOR_ORANGE, "/"..name.." — ", COLOR_TEXT, AmbLang.str( v[1] ) )
		end
		chat.AddText(  COLOR_ORANGE, '##########################' )
	end
	concommand.Add('amb_list', function() AmbCmds_list() end )

	local tab_limits = {
		'props',
		'sents',
		'ragdolls',
		'vehicles',
		'npcs',
		'balloons',
		'buttons',
		'emitters',
		'lights',
		'lamps',
		'wheels'

	}
	local function AmbCmds_listLimits()
		chat.AddText( COLOR_ORANGE, '##########################' )
		for _, v in SortedPairs( tab_limits ) do
			chat.AddText(  AMB_COLOR_RED, v, COLOR_TEXT, "	[ "..tostring(LocalPlayer():GetCount( v ))..'/', AMB_COLOR_RED, tostring( LocalPlayer():GetNWInt('amb_players_limit_'..v) ), COLOR_TEXT, ' ]' )
		end
		chat.AddText(  COLOR_ORANGE, '##########################' )
	end
	concommand.Add('amb_list_limits', function() AmbCmds_listLimits() end )

	net.Receive( 'amb_cmds_orgs', function( len ) local flag = net.ReadString() local ePly = net.ReadEntity() ePly:ConCommand( flag ) end )
	net.Receive( 'amb_cmds_anim', function( len ) local act = net.ReadUInt( 11 ) local ePly = net.ReadEntity() local is_loop = net.ReadBool() ePly:AnimRestartGesture( GESTURE_SLOT_CUSTOM, act, is_loop ) end )
	net.Receive( 'amb_cmds_urls', function( len ) local url = net.ReadString() gui.OpenURL( url ) end )
	net.Receive( 'amb_cmds_concmd', function( len ) local cmd = net.ReadString() local ePly = net.ReadEntity() ePly:ConCommand( cmd ) end )
end