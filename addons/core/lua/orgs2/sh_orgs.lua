--[[
	Organization v2.0.
	— Эта версия сохраняет организации, сохраняет людей в организациях.
    - Имеются ранги (4 ранга) со своими названиями

	[31.08.20]
		• Вторая Версия организации, специально для PhonexRP
		• Логика ДБ: Создание ДБ (проверка на её существование), Сохранение из неё, Удаление из неё.
		• Логика ДБ-Игроков: Тоже самое
	.

	org_flag:
		1 - Зам ничего не может
		2 - Зам может только приглашать
		3 - Зам может приглашать и удалять из организации
	.

	[03.09.20]
		• Немного поправил проверки.
		• Доделал control подпапку, доделал флаги.
		todo: amb_invite_org можно эксплойтить, т.к сам caller может самого себя запихать в ePly и стать 4 рангом на любой орге - сделать таймер приглашения
	.
]]

AmbOrgs2 = AmbOrgs2 or {}
AmbOrgs2.Orgs = AmbOrgs2.Orgs or {}

AmbOrgs2.cost_for_org = 128000
AmbOrgs2.min_level = 2
-- ## DataBase #############################

if ( SERVER ) then

	local function s( sText )
		return sql.SQLStr( sText )
	end

	local function debugTab()
		PrintTable( AmbOrgs2.Orgs )
	end

	local function checkMoney( leader, money )
		if AmbStats.Players.getStats( leader, '$' ) > money then return true end
		return false
	end

	local function erroris( ply, str )
		AmbLib.chatSend( ply, AMB_COLOR_RED, '[•] ', AMB_COLOR_WHITE, str)
	end

	local function printAll( id )
		local col = string.Explode(',', AmbOrgs2.Orgs[id].Color )
		col = Color( col[1], col[2], col[3] )

		for _, ply in pairs( player.GetAll() ) do
			AmbLib.chatSend( ply, AMB_COLOR_GREEN, '[•] ', AMB_COLOR_WHITE, 'Игрок ', AMB_COLOR_GRAY, AmbOrgs2.Orgs[id].Leader_Name, AMB_COLOR_WHITE, ' создал организацию: ', col, AmbOrgs2.Orgs[id].Name )
		end
	end

	function AmbOrgs2.createOrg( name, leader, org_flag, color, ranks )

		if checkMoney( leader, AmbOrgs2.cost_for_org ) == false then erroris( leader, 'Не хватает: '..AmbOrgs2.cost_for_org..'$') return end
		if leader:GetNWBool('amb_players_orgs') then erroris( leader, 'Вы состоите в организации!') return end
		if leader:GetNWBool('amb_bad') then return end

		local id = math.random( 1, 9999 )
		org_flag = tonumber( org_flag )


		AmbOrgs2.saveOrg( id, name, leader, org_flag, color, ranks )
		AmbStats.Players.addStats( leader, '$', -AmbOrgs2.cost_for_org ) 
		AmbLib.chatSend( leader, AMB_COLOR_NEWS, '[•] ', AMB_COLOR_WHITE, 'Вы создали организацию: '..name )
		AmbLib.chatSend( leader, AMB_COLOR_NEWS, '[•] ', AMB_COLOR_WHITE, 'ID вашей организации:  '..id )

		AmbOrgs2.initPlayer( leader, id, 'Лидер' )

	
		timer.Simple( 2, function() printAll( id ) end )
	end

	function AmbOrgs2.initPlayer( eMember, id, rank )

		id = tonumber( id )

		local name = AmbOrgs2.Orgs[id].Name

		eMember:SetNWBool( 'amb_players_orgs', true )
		eMember:SetNWInt( 'amb_players_orgs_id', id )
		eMember:SetNWString( 'amb_players_orgs_rank', rank )
		eMember:SetNWString( 'amb_players_orgs_name', name )

		if ( AmbDB.selectDate( 'amb_orgs2_player', 'ID', 'ID', eMember:SteamID() ) ~= eMember:SteamID() ) then
			local query = Format( "%s, %s, %i, %s", 
				s( eMember:SteamID() ),
				s( eMember:GetNWString('amb_players_name') ),
				eMember:GetNWInt('amb_players_orgs_id'),
				s( eMember:GetNWString('amb_players_orgs_rank') )
			)
			
			AmbDB.insertDate( 'amb_orgs2_player', "ID, Name, Org, Rank", query )
		end

	end

	function AmbOrgs2.leaveOrg( eMember )

		if eMember:GetNWBool( 'amb_players_orgs' ) == false then return end

		local id = tonumber( eMember:GetNWInt( 'amb_players_orgs_id' ) )


		if AmbOrgs2.Orgs[id].Ranks[1] then
			if eMember:GetNWString( 'amb_players_orgs_rank' ) == AmbOrgs2.Orgs[id].Ranks[1] then
				eMember:SetNWString( 'amb_players_orgs_rank', '_' )
				return AmbOrgs2.removeOrg( id )
			end
		end

		AmbLib.chatSend( eMember, AMB_COLOR_AMBITION, '[•] ', AMB_COLOR_WHITE, 'Вы покинули организацию ', AMB_COLOR_GRAY, AmbOrgs2.Orgs[id].Name )

		AmbDB.wipeDate( 'amb_orgs2_player', 'ID', eMember:SteamID() )

		eMember:SetNWBool( 'amb_players_orgs', false )
		eMember:SetNWInt( 'amb_players_orgs_id', 0 )
		eMember:SetNWString( 'amb_players_orgs_rank', '' )

		for _, v in pairs( player.GetAll() ) do
			if tonumber( v:GetNWInt('amb_players_orgs_id') ) == id then
				AmbLib.chatSend( v, AMB_COLOR_AMBITION, '[•] ', AMB_GRAY, eMember:GetNWString('amb_players_name') ,AMB_COLOR_WHITE, ' Покинул организацию' )
			end
		end
		
	end

	function AmbOrgs2.inviteOrg( leader, eMember )
		local id = tonumber( eMember:GetNWInt( 'amb_players_orgs_id' ) )
		local id_leader = tonumber( leader:GetNWInt( 'amb_players_orgs_id' ) )

		eMember:SendLua('AmbOrgs2.toInvite( "'..AmbOrgs2.Orgs[id_leader].Name..'", "'..leader:GetNWString("amb_players_name")..'", '..id_leader..' )')
	end

	function AmbOrgs2.demoteOrg( leader, eMember )

		local id = tonumber( eMember:GetNWInt( 'amb_players_orgs_id' ) )
		local id_leader = tonumber( leader:GetNWInt( 'amb_players_orgs_id' ) )
		if AmbOrgs2.Orgs[id_leader].Leader_ID ~= leader:SteamID() then erroris( leader, 'Вы не лидер!' ) return end
		if AmbOrgs2.Orgs[id].Leader_ID ~= leader:SteamID() then erroris( leader, 'Игрок не в вашей организации!' ) return end

		AmbOrgs2.leaveOrg( eMember )
	end

	function AmbOrgs2.init()

		-- shit-sorte
		local tab = {}
		local id = {}

		tab = sql.Query( 'SELECT * FROM amb_orgs2' )
		
		for k, v in pairs( tab ) do
			id[k] = tonumber( tab[k].ID )
		end

		for k, v in pairs( id ) do
			AmbOrgs2.Orgs[tonumber(v)] = tab[k]
			local ranks = string.Explode( ';', tab[k].Ranks )
			AmbOrgs2.Orgs[tonumber(v)].Ranks = {
				ranks[1],
				ranks[2],
				ranks[3],
				ranks[4]
			}
		end

		net.Start( 'amb_send_org' )
			net.WriteTable( AmbOrgs2.Orgs )
		net.Broadcast()

		tab = nil 
		id = nil
		MsgN('\n[AmbOrgs2] Table with Organizations has done!')
	end

	function AmbOrgs2.initClient( receiver )
		net.Start( 'amb_send_org' )
			net.WriteTable( AmbOrgs2.Orgs )
		net.Send( receiver )
	end

	function AmbOrgs2.saveOrg( id, name, leader, org_flag, color, ranks )

		if ( AmbDB.selectDate( 'amb_orgs2', 'ID', 'ID', id ) == tostring(id) ) then return end

		local query = Format( "%i, %s, %s, %s, %s, %i, %i, %s, %s", 
			id,
			s( name ),
			s( os.date( '%c', os.time() ) ),
			s( leader:GetNWString('amb_players_name') ),
			s( leader:SteamID() ),
			org_flag,
			0,
			s( color ),
			s( ranks )
		)
		
		AmbDB.insertDate( 'amb_orgs2', "ID, Name, Reg_Date, Leader_Name, Leader_ID, Org_Flag, Warehouse, Color, Ranks", query )

		AmbOrgs2.init()
	end

	function AmbOrgs2.removeOrg( id )

		local col = string.Explode(',', AmbOrgs2.Orgs[id].Color )
		col = Color( col[1], col[2], col[3] )

		for _, ply in pairs( player.GetAll() ) do
			AmbLib.chatSend( ply, AMB_COLOR_GREEN, '[•] ', AMB_COLOR_WHITE, 'Организация ', col, AmbOrgs2.Orgs[id].Name, AMB_COLOR_WHITE, ' распущена!' )
			if ply:GetNWInt( 'amb_players_orgs_id' ) == id then
				AmbOrgs2.leaveOrg( ply )
			end
		end

		AmbOrgs2.Orgs[id] = nil

		AmbDB.wipeDate( 'amb_orgs2', 'ID', id )
		
		AmbOrgs2.init()
	end

	function AmbOrgs2.updateOrg( id, type, update )
		if ( AmbDB.selectDate( 'amb_orgs2', 'ID', 'ID', id ) ~= tostring(id) ) then return end

		AmbDB.updateDate( 'amb_orgs2', type, update, 'ID', tostring(id) )

		AmbOrgs2.init()
	end


	local function initDB()
		AmbDB.createDataBase( 'amb_orgs2', [[
			'ID' smallint NOT NULL PRIMARY KEY,
			'Name' varchar(255),
			'Reg_Date' varchar(255),
			'Leader_Name' varchar(255),
			'Leader_ID' varchar(255),
			'Org_Flag' tinyint,
			'Warehouse' int,
			'Color' varchar(255),
			'Ranks' varchar(512)]]
		)

		AmbDB.createDataBase( 'amb_orgs2_player', [[
			'ID' varchar(255) NOT NULL PRIMARY KEY,
			'Name' varchar(255),
			'Org' smallint,
			'Rank' varchar(255)]]
		)
	end
	initDB()


	hook.Add( 'Initialize', 'OrgInitHook', function()

		timer.Simple( 10, function()

			AmbOrgs2.init()
			print('[AmbOrgs2] Initialization table done')

		end )

	end )

	hook.Add( 'PlayerInitialSpawn', 'OrgInitHook', function( ePly )

		AmbOrgs2.initClient( ePly )

		if ( AmbDB.selectDate( 'amb_orgs2_player', 'ID', 'ID', ePly:SteamID() ) == ePly:SteamID() ) then

			ePly:ChatPrint('Вы подходите!')

			local rank = AmbDB.selectDate( 'amb_orgs2_player', 'Rank', 'ID', ePly:SteamID() )
			local id = AmbDB.selectDate( 'amb_orgs2_player', 'Org', 'ID', ePly:SteamID() )

			if AmbOrgs2.Orgs[ tonumber( id ) ] then

				AmbOrgs2.initPlayer( ePly, id, rank )
				ePly:ChatPrint('Вы были иницализированы!')

			else

				ePly:ChatPrint('Организация была уничтожена!')
				AmbDB.wipeDate( 'amb_orgs2_player', 'ID', ePly:SteamID() )

			end

		end

	end )


	util.AddNetworkString( 'amb_register_org' )
	util.AddNetworkString( 'amb_leave_org' )
	util.AddNetworkString( 'amb_invite_org' )
	util.AddNetworkString( 'amb_invite_org_cmd' )
	util.AddNetworkString( 'amb_send_org' )

	net.Receive( 'amb_register_org', function( len, caller )

		local ePly = net.ReadEntity()

		if ( IsValid( ePly ) == false ) or ( IsValid( caller ) == false ) then return end
		if ( ePly ~= caller ) then caller:Kick('HIGHT PINGUS(>400)') return end
		if ( ePly:IsPlayer() == false ) then return end


		local name = net.ReadString()
		if #name <= 0 or utf8.len(name) > 100 then return end

		local color = net.ReadColor()
		color = tostring( color.r )..','..tostring( color.g )..','..tostring( color.b )

		AmbOrgs2.createOrg( name, ePly, 1, color, 'Лидер;Заместитель;Офицер;Боец' )

	end )

	net.Receive( 'amb_leave_org', function( len, caller )

		local ePly = net.ReadEntity()

		if ( IsValid( ePly ) == false ) or ( IsValid( caller ) == false ) then return end
		if ( ePly ~= caller ) then caller:Kick('HIGHT PINGUS(>404)') return end
		if ( ePly:IsPlayer() == false ) then return end

		AmbOrgs2.leaveOrg( ePly )
	end )

	net.Receive( 'amb_invite_org', function( len, caller )

		local ePly = net.ReadEntity()

		if ( IsValid( ePly ) == false ) or ( IsValid( caller ) == false ) then return end
		if ( ePly:IsPlayer() == false ) then return end

		local id = net.ReadUInt( 14 )
		--print( id )
		--print( AmbOrgs2.Orgs[id].Ranks[1] )

		if ePly:GetNWBool( 'amb_players_orgs' ) then erroris( ePly, 'Игрок уже находится в организации!' ) return end
		if AmbStats.Players.getStats( ePly, '!' ) < AmbOrgs2.min_level then erroris( ePly, 'Игрок должен быть от '..tostring(AmbOrgs2.min_level)..'+ уровня!' ) return end

		AmbOrgs2.initPlayer( ePly, id, AmbOrgs2.Orgs[id].Ranks[4] )

		for _, v in pairs( player.GetAll() ) do

			if tonumber( v:GetNWInt('amb_players_orgs_id') ) == id then

				AmbLib.chatSend( v, AMB_COLOR_AMBITION, '[•] ', AMB_GRAY, ePly:GetNWString('amb_players_name') ,AMB_COLOR_WHITE, ' Вступил в организацию!' )

			end

		end

	end )

	net.Receive( 'amb_invite_org_cmd', function( len, caller )

		local leader = net.ReadEntity()

		if ( IsValid( leader ) == false ) or ( IsValid( caller ) == false ) then return end
		if ( leader ~= caller ) then caller:Kick('HIGHT PINGUS(>406)') return end

		local eMember = net.ReadEntity()

		if IsValid( eMember ) == false then return end
		if leader:IsPlayer() == false or eMember:IsPlayer() == false then return end

		local id_leader = tonumber( leader:GetNWInt( 'amb_players_orgs_id' ) )

		if AmbOrgs2.Orgs[id_leader].Org_Flag == 2 or AmbOrgs2.Orgs[id_leader].Org_Flag == 3 then -- зам может приглашать и увольнять

			if AmbOrgs2.Orgs[id_leader].Leader_ID ~= leader:SteamID() or caller:GetNWString('amb_players_orgs_rank') ~= AmbOrgs2.Orgs[id].Ranks[2] then return end

		else

			if AmbOrgs2.Orgs[id_leader].Leader_ID ~= leader:SteamID() then erroris( leader, 'Вы не имеете право!' ) return end

		end

		if eMember:GetNWBool( 'amb_players_orgs' ) then erroris( leader, 'Игрок уже в организации!' ) return end

		AmbOrgs2.inviteOrg( leader, eMember )

	end )

elseif ( CLIENT ) then

	net.Receive( 'amb_send_org', function()

		local tab = net.ReadTable()

		AmbOrgs2.Orgs = nil
		AmbOrgs2.Orgs = tab

	end )

end
-- #########################################

-- Данное творение принадлежит проекту [ Ambition ]