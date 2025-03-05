AmbRestrict = AmbRestrict or {}

local ALL_GROUPS = { 'user', 'premium', 'd_helper', 'helper', 'd_moder', 'moder', 'manager', 'admin', 'ahc', 'sub_head_admin', 'head_moder', 'superadmin' }
local VIP = { 'premium', 'd_moder', 'moder', 'manager', 'admin', 'ahc', 'sub_head_admin', 'head_moder', 'superadmin' }
local PREMIUM = { 'premium', 'manager', 'admin', 'ahc', 'sub_head_admin', 'head_moder', 'superadmin' }
local TITANIUM = { 'sub_head_admin', 'head_moder', 'superadmin' }
local L1 = { 'd_moder', 'moder', 'manager', 'admin', 'ahc', 'sub_head_admin', 'head_moder', 'superadmin' }
local L2 = { 'manager', 'admin', 'ahc', 'sub_head_admin', 'head_moder', 'superadmin' }
local L3 = { 'ahc', 'sub_head_admin', 'head_moder', 'superadmin' }
local L4 = { 'superadmin' }

AmbRestrict.Tools = { 
	-- ['name'] = { lvl, { ranks } }
	['duplicator'] 	= { 1, L4 },

	['axis'] 		= { 2, PREMIUM },
	['ballsocket']  = { 2, PREMIUM },

	['weld'] 		= { 3, L4 },
	['rope'] 		= { 3, L4 },
	['advdupe2']	= { 8, ALL_GROUPS },
	['winch'] 		= { 3, L4 },
	['muscle'] 		= { 3, L4 },
	['slider'] 		= { 3, L4 },
	['hydraulic'] 	= { 3, L4 },
	['motor'] 		= { 3, L4 },
	['elastic'] 	= { 3, L4 },
	['balloon'] 	= { 3, PREMIUM },
	['button'] 		= { 3, ALL_GROUPS },
	['stacker_improved']  = { 3, ALL_GROUPS },

	['dynamite'] 	= { 1, L4 },
	['hoverball']  	= { 4, L4 },
	['paint']		= { 4, L4 },
	['lamps']  		= { 4, ALL_GROUPS },
	['light']  		= { 2, ALL_GROUPS },
	['nocollide']  	= { 3, L4 },
	['textscreen']  = { 4, ALL_GROUPS },

	['thruster']  	= { 5, PREMIUM },
	['wheel']  		= { 5, PREMIUM },
	['keypad_willox']  	= { 1, ALL_GROUPS },

	['eyeposer']  	= { 5, L4 },
	['faceposer']  	= { 5, L4 },
	['finger']  	= { 5, L4 },
	['inflator']  	= { 5, L4 },
}

local spec_weapons = {
	['blink'] = { 'STEAM_0:1:511604395', 'STEAM_0:1:95303327' },
	['starfall_processor'] = { 'STEAM_0:0:426598565', 'STEAM_0:1:425625503', 'STEAM_0:1:95303327' },
	['starfall_component'] = { 'STEAM_0:0:426598565', 'STEAM_0:1:425625503', 'STEAM_0:1:95303327' }
}

local modif = {
	['user'] = 2,
	['premium'] = 4,
	['d_helper'] = 2,
	['helper'] = 2,
	['d_moder'] = 3,
	['moder'] = 3,
	['manager'] = 4,
	['admin'] = 4,
	['ahc'] = 5,
	['sub_head_admin'] = 6,
	['head_admin'] = 8,
	['superadmin'] = 10
}

function AmbRestrict.calcModifProps( ePly )
	for rank, limit in pairs( modif ) do
		if ( ePly:GetUserGroup() == rank ) then
			return limit
		end
	end
end

function AmbStats.Players.limitEntities( ePly, type_ent, sEnt )
    if ( type_ent == 1 ) or ( type_ent == 'props' ) then
		if ( RPExtraTeams[ ePly:Team() ].props ) then
			return RPExtraTeams[ ePly:Team() ].props * AmbRestrict.calcModifProps( ePly )
		else
			return 10 * AmbRestrict.calcModifProps( ePly )
		end
    end
end

hook.Add( 'PlayerSpawnProp', 'amb_0x228', function( ePly, sModel )
	if ePly:GetCount('props') < AmbStats.Players.limitEntities( ePly, 'props' ) then
		return true
	else
		ePly:ChatPrint('[•] Лимит достигнут!')
		return false
	end
end )

hook.Add( 'PlayerSpawnRagdoll', 'amb_0x228', function( ePly, sModel )
	if ( ePly:GetUserGroup() == 'superadmin' ) then return true end -- ПОМЕНЯТЬ НА head_admin
end )

hook.Add( 'PlayerSpawnEffect', 'amb_0x228', function( ePly, sModel )
	--if ( ePly:GetUserGroup() == 'superadmin' ) then return true end -- ПОМЕНЯТЬ НА head_admin
	return false
end )

hook.Add( 'PlayerSwitchFlashlight', 'amb_0x228', function( ePly )
	for _, rank in pairs( PREMIUM ) do
		if ( ePly:GetUserGroup() == rank ) then return true end
	end
	return false
end )



function AmbRestrict.calcRanks( ePly, sTool )
	for name, v in pairs( AmbRestrict.Tools ) do
		if ( name == sTool ) then
			for _, rank in pairs( AmbRestrict.Tools[sTool][2] ) do
				-- ePly:ChatPrint( rank ) -- debug
				if ( ePly:GetUserGroup() == rank ) then return true end
			end
		end
	end
	AmbLib.notifySend( ePly, 'Access Denied!', 1, 2, 'buttons/button10.wav' )
	return false
end


hook.Add( 'CanTool', 'amb_0x228', function( ePly, tTrace, sTool )
	--if ( ePly:GetUserGroup() == 'superadmin' ) then return true end -- ПОМЕНЯТЬ НА head_admin
	for k, v in pairs( spec_weapons ) do
		if ( k == sTool ) then
			for _, id in pairs( v ) do
				if ePly:SteamID() == id then return true end
			end
			return false
		end
	end

	for name, v in pairs( AmbRestrict.Tools ) do
		if ( name == sTool ) then
			if tonumber( ePly:GetNWInt('amb_players_level') ) >= v[1] then return AmbRestrict.calcRanks( ePly, sTool ) end
			AmbLib.notifySend( ePly, "For It tool need a level: "..v[1], 1, 3, 'buttons/button10.wav' )
			return false
		end
	end
end )
