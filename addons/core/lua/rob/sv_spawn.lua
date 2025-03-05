AmbRobCargo = AmbRobCargo or {}

local cfg = { AmbRobCargo.security, AmbRobCargo.cargo } 
local _T = { npcs = {}, cargoes = {} }

function AmbRobCargo.SpawnNPCs()

    for i = 1, cfg[ 1 ].amount do

        local npc = ents.Create( 'npc_monk' )
        npc:SetPos( cfg[ 1].place[ math.random( 1, #cfg[ 1 ].place ) ].pos )
        npc:SetAngles( cfg[ 1 ].place[ math.random( 1, #cfg[ 1 ].place ) ].ang )
        npc:SetHealth( math.random( cfg[ 1 ].min_hp, cfg[ 1 ].max_hp ) )
        npc:SetKeyValue( 'spawnflags', '8192' )
        npc:AddRelationship( 'player D_HT 99' )
        npc:Give( table.Random( cfg[ 1 ].guns ) )
        npc:Spawn()
        npc:SetModel( table.Random( cfg[ 1 ].mdls ) )
        npc.sec_cargo = true
        _T.npcs[ i ] = npc

    end

end

function AmbRobCargo.RepeatSpawnNPCs()

    timer.Simple( AmbRobCargo.delays.time_rob/2, function() AmbRobCargo.SpawnNPCs() end )

end

function AmbRobCargo.SpawnCargoes()

    for i = 1, cfg[ 2 ].amount do

        local cargo = ents.Create( 'amb_rob_cargo' )
        cargo:SetPos( cfg[ 2 ].place[ i ].pos )
        cargo:SetAngles( cfg[ 2 ].place[ i ].ang )
        cargo:Spawn()
        _T.cargoes[ i ] = cargo

    end

end

function AmbRobCargo.GarbageCollector()

    for _, npc in pairs( _T.npcs ) do

        if IsValid( npc ) then npc:Remove() end

    end

    for _, cargo in pairs( _T.cargoes ) do

        if IsValid( cargo ) then cargo:Remove() end

    end

    _T = { npcs = {}, cargoes = {} }

end

hook.Add( 'EntityTakeDamage', 'CargoSecurityDMG', function( victim, dmginfo )

    if dmginfo:GetAttacker():IsNPC() and dmginfo:GetAttacker().sec_cargo then

        if victim:IsNPC() then

            return dmginfo:SetDamage( 0 )

        end

        dmginfo:SetDamage( dmginfo:GetDamage() * cfg[ 1 ].dmg )

    end

end )
