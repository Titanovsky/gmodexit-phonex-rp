--[[
	Основная информация про игрока.
	Сервер находится в полном подчинений проекта: [ Ambition ]

	[30.07.20]
		• Перенёс сюда teams.
	.
    [31.07.20]
        • Добавил конфигурацию, надеюсь сработает (godmode, should_damage, noclip).
    .
]]

if ( AMB.config.gamemode == "DarkRP" ) then return end

local COLOR_TEXT            = Color( 240, 240, 240 )
local COLOR_RED             = Color( 242, 90, 73 )

local delay_team    = 12

local info_teams = {
    [AMB_TEAM_PVP] = {
        ['vec'] = {
        	Vector( -6768, -12382, 609 ),
            Vector( -6768, -12382 - 200, 609 ),
            Vector( -6768, -12382 - 200 * 2, 609 ),
            Vector( -6768, -12382 - 200 * 3, 609 ),
            Vector( -6768, -12382 - 200 * 4, 609 ),
            Vector( -6768, -12382 - 200 * 5, 609 ),
            Vector( -6768, -12382 - 200 * 6, 609 ),

            Vector( -9760, -12288, 609 ),
            Vector( -9760, -12288 - 200 * 2, 609 ),
            Vector( -9760, -12288 - 200 * 3, 609 ),
            Vector( -9760, -12288 - 200 * 4, 609 ),
            Vector( -9760, -12288 - 200 * 5, 609 ),
            Vector( -9760, -12288 - 200 * 6, 609 ),

            Vector( -9858, -14844, 1108 ),
            Vector( -6631, -14851, 1100 ),
            Vector( -6639, -11878, 1091 ),
            Vector( -9866, -11906, 1111 ),

            Vector( -8257, -13343, 924 ),
            Vector( -8269, -13143, 749 ),
            Vector( -8269, -13721, 760 ),
            Vector( -8399, -13255, 600 ),
            Vector( -8256, -13580, 760 ),
            
            Vector( -9915, -13417, 1143 ),
            Vector( -8381, -14894, 1120 ),
            Vector( -6606, -13334, 1106 ),
            Vector( -8224, -11840, 1117 )
        },
        ['ang'] = {
            Angle(0, 90, 0),
            Angle(0, 90, 0),
            Angle(0, 90, 0),
            Angle(0, 90, 0),
            Angle(0, 90, 0),
            Angle(0, 90, 0),
            Angle(0, 90, 0),

            Angle(0, 0, 0),
            Angle(0, 0, 0),
            Angle(0, 0, 0),
            Angle(0, 0, 0),
            Angle(0, 0, 0),
            Angle(0, 0, 0),

            Angle(0, 45, 0),
            Angle(0, 135, 0),
            Angle(0, -135, 0),
            Angle(0, -45, 0),

            Angle(0, 90, 0),
            Angle(0, 90, 0),
            Angle(0, -90, 0),
            Angle(0, 180, 0),
            Angle(0, 0, 0),

            Angle(0, 0, 0),
            Angle(0, 90, 0),
            Angle(0, -180, 0),
            Angle(0, -90, 0),
        },
        ['on_noclip'] = false,
        ['on_godmode'] = false,
        ['on_damageplayer'] = true,
        ['weapons'] = {
            'weapon_crowbar',
            'weapon_pistol'
        }
    }, -- PVP

    [AMB_TEAM_BUILD] = {
    	['vec'] = {
            Vector(-6798.920410, -8755.924805, 746.814026),
        },
        ['ang'] = {
            Angle(0, -180, 0),
        },
        ['on_noclip'] = true,
        ['on_godmode'] = true,
        ['on_damageplayer'] = false,
        ['weapons'] = {
            'weapon_physcannon',
            'weapon_physgun',
            'gmod_tool',
            'gmod_camera'
        }
    }, -- Build

    [AMB_TEAM_RP] = {
    	['vec'] = {
            Vector( 1916, -8760, 590 ),
            Vector( 1916, -8760 + 200, 590 ),
            Vector( 1916, -8760 + 200 * 2, 590 ),
            Vector( 1916, -8760 + 200 * 3, 590 ),
            Vector( 1916, -8760 + 200 * 4, 590 ),
            Vector( 1916, -8760 + 200 * 5, 590 ),
            Vector( 1138, -8760, 590 ),
            Vector( 1138, -8760 + 200 * 2, 590 ),
            Vector( 1138, -8760 + 200 * 3, 590 ),
            Vector( 1138, -8760 + 200 * 4, 590 ),
            Vector( 1138, -8760 + 200 * 5, 590 ),
        },
        ['ang'] = {
            Angle( 0, 90, 0 ),
            Angle( 0, 90, 0 ),
            Angle( 0, 90, 0 ),
            Angle( 0, 90, 0 ),
            Angle( 0, 90, 0 ),
            Angle( 0, 90, 0 ),
            Angle( 0, 90, 0 ),
            Angle( 0, 90, 0 ),
            Angle( 0, 90, 0 ),
            Angle( 0, 90, 0 ),
            Angle( 0, 90, 0 ),
            Angle( 0, 90, 0 ),
        },
        ['on_noclip'] = false,
        ['on_godmode'] = false,
        ['on_damageplayer'] = true,
        ['weapons'] = {
            'weapon_physcannon',
            'weapon_physgun',
            'gmod_tool',
            'gmod_camera'
        }
    } -- RP
}


function AmbStats.Players.changeTeam( ePly, status )
    if ( ePly:GetNWBool('amb_bad') ) then return end
    if timer.Exists('AmbTeams[Delay;ID='..ePly:SteamID()..']') then AmbLib.chatSend( ePly, COLOR_RED, "[•] ", COLOR_TEXT, "Подождите "..math.Round( timer.TimeLeft('AmbTeams[Delay;ID='..ePly:SteamID()..']'), 0)..' секунд' ) return end
    for k, v in pairs( team.GetAllTeams() ) do
        if ( status == k or status == v.name ) then
            ePly:SetTeam( k )
            ePly:Spawn()
            timer.Create('AmbTeams[Delay;ID='..ePly:SteamID()..']', delay_team, 1, function() end) -- можно ли убрать function() end?
            AmbLib.chatSend( ePly, AMB_COLOR_AMBITION, "[•] ", COLOR_TEXT, " Вы стали: "..team.GetName( ePly:Team() ) ) 
        end
    end
    if ( status == AMB_TEAM_RP ) then
        if ( AmbDB.selectDate( 'amb_db_players_darkrp', 'ID', 'ID', ePly:SteamID() ) == ePly:SteamID() ) then return end
        ePly:SendLua('AmbRegister.startRegistrationRolePlay(true)')
    end
end

util.AddNetworkString('amb_teams_change')
net.Receive( 'amb_teams_change', function( len )
    local ePly = net.ReadEntity()
    local id = net.ReadUInt( 3 )

    AmbStats.Players.changeTeam( ePly, id )
end )


hook.Add( 'PlayerSpawn', 'amb_0x2024', function( ply )
    --if ( ply:GetUserGroup() == 'superadmin' ) then return end -- ПОМЕНЯТЬ НА admin_mode

    if ( ply:Team() == AMB_TEAM_CITIZEN ) then -- его нет в таблице
        timer.Simple( 0, function()
            if ply:GetNWBool('amb_bad') then return end
            ply:GodDisable()
            ply:GodEnable()
            ply:StripWeapons()
            ply:Give('weapon_physgun')
            ply:Give('weapon_physcannon')
            ply:Give('gmod_tool')
        end )
    end


    for teamID, v in pairs( info_teams ) do
        if ( ply:Team() == teamID and ply:Team() > AMB_TEAM_CITIZEN ) then
            local rand = math.random(1,#v.vec)
        	ply:SetPos( v['vec'][math.random(rand)] )
            ply:SetEyeAngles( v['ang'][math.random(rand)] )
            if info_teams[ ply:Team() ].on_godmode then
                ply:GodEnable()
            end
        end
    end

    if ( ply:Team() == AMB_TEAM_PVP ) then
        timer.Simple( 0, function()
            ply:StripWeapons()
            ply:Give('weapon_physgun')
            ply:Give('weapon_physcannon')
            ply:Give('gmod_tool')
            ply:Give('weapon_crowbar')
        end )
        ply:SetMaterial('models/wireframe')
        ply:GodEnable()
        ply:SendLua( "timer.Create('AmbTimer[Body]"..ply:SteamID().."', 3, 1, function() end )" )
        timer.Create( 'AmbTimer[BodySave;ID'..ply:SteamID()..']', 3, 1, function()
            --ply:ChatPrint("DA") -- debug
            ply:GodDisable()
            ply:SetMaterial('') -- return classic material
        end)
    end
end )

hook.Add( 'PlayerChangedTeam', 'amb_0x3492', function( ePly, old_Team, new_Team )
end )

hook.Add( 'PlayerLoadout', 'amb_0x3492', function( ePly )
    for id, v in pairs( info_teams ) do
        if ePly:Team() == id then
            for _, wep in pairs( v.weapons ) do
                ePly:Give( wep )
            end
        end
    end
    return false
end )

hook.Add('PlayerNoClip', 'amb_0x666', function( ePly )
    --if ( ePly:GetUserGroup() == 'superadmin' ) then return true end -- ПОМЕНЯТЬ НА head_admin
    if ePly:Team() <= AMB_TEAM_CITIZEN then return false end
    return info_teams[ ePly:Team() ].on_noclip
end)

hook.Add( "PlayerShouldTakeDamage", "amb_0x3492", function( ply, attacker )
    if ( ply:Team() == AMB_TEAM_CITIZEN ) or ( ply:Team() == AMB_TEAM_BUILD ) then return false end
end )

hook.Add( "EntityTakeDamage", "amb_0x3492", function( ent, damage )
    if IsValid( damage:GetAttacker() ) and damage:GetAttacker():IsPlayer() then
        if damage:GetAttacker():Team() == AMB_TEAM_CITIZEN or damage:GetAttacker():Team() == AMB_TEAM_BUILD then
            damage:SetDamage(0)
        end
        if timer.Exists('AmbTimer[BodySave;ID'..damage:GetAttacker():SteamID()..']') then
            damage:SetDamage( 0 )
        end
    end
end )

-- Данное творение принадлежит проекту [ Ambition ]