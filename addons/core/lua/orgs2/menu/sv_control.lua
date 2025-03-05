util.AddNetworkString( 'amb_orgs_control_ranks' )
net.Receive( 'amb_orgs_control_ranks', function( len, caller ) 

    if IsValid( caller ) == false then return end
    if caller:GetNWBool('amb_players_orgs') ~= true then caller:Kick('HIGHT PING (>320)') return end 

    local ranks = net.ReadString()
    if utf8.len( ranks ) > 124 or utf8.len( ranks ) < 4 then return end -- V
    local id = net.ReadUInt( 14 )

    if AmbOrgs2.Orgs[id].Leader_ID ~= caller:SteamID() then return end

    -- validation

    AmbOrgs2.updateOrg( id, 'Ranks', ranks )
    caller:SetNWString( 'amb_players_orgs_rank', AmbOrgs2.Orgs[id].Ranks[1] )
    AmbDB.updateDate( 'amb_orgs2_player', 'Rank', AmbOrgs2.Orgs[id].Ranks[1], 'ID', caller:SteamID() ) -- обновляем данные у игрока
end )




util.AddNetworkString( 'amb_orgs_control_flags' )
net.Receive( 'amb_orgs_control_flags', function( len, caller ) 

    if IsValid( caller ) == false then return end
    if caller:GetNWBool('amb_players_orgs') ~= true then caller:Kick('HIGHT PING (>320)') return end

    local flag = net.ReadUInt( 3 )
    local id = tonumber( caller:GetNWInt('amb_players_orgs_id') )

    if AmbOrgs2.Orgs[id].Leader_ID ~= caller:SteamID() then return end

    print('\nDADADA: '..tostring(flag))

    AmbOrgs2.updateOrg( id, 'Org_Flag', flag )
end )




util.AddNetworkString( 'amb_orgs_control_set_rank' )
net.Receive( 'amb_orgs_control_set_rank', function( len, caller ) 

    local member = net.ReadEntity()
    local rank = net.ReadString()
    local id = tonumber( member:GetNWInt('amb_players_orgs_id') )

    if AmbOrgs2.Orgs[id].Leader_ID ~= caller:SteamID() then return end

    -- validation

    member:SetNWString( 'amb_players_orgs_rank', rank )
    AmbDB.updateDate( 'amb_orgs2_player', 'Rank', rank, 'ID', member:SteamID() )
end )




util.AddNetworkString( 'amb_orgs_control_uninvite' )
net.Receive( 'amb_orgs_control_uninvite', function( len, caller ) 
    local member = net.ReadUInt( 8 )
    member = Entity( member )
    local id = tonumber( member:GetNWInt('amb_players_orgs_id') )

    if AmbOrgs2.Orgs[id].Org_Flag == 2 then -- зам может приглашать и увольнять
        if AmbOrgs2.Orgs[id].Leader_ID ~= caller:SteamID() or caller:GetNWString('amb_players_orgs_rank') ~= AmbOrgs2.Orgs[id].Ranks[2] then return end
    else
        if AmbOrgs2.Orgs[id].Leader_ID ~= caller:SteamID() then return end
    end

    -- validation

    member:ChatPrint('Вас исключили!')
    AmbOrgs2.leaveOrg( member )
end )