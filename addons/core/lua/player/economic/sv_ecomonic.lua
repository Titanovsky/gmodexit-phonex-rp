if ( AMB.config.module_economic == false ) then return false end

AmbEconomic = AmbEconomic or {}

AmbEconomic.payday_ranks_modif = {
	['user'] = 2,
	['premium'] = 3,
	['helper'] = 2,
	['d_helper'] = 3,
	['d_moder'] = 2,
	['moder'] = 3,
	['manager'] = 4,
	['admin'] = 3,
	['ahc'] = 4,
	['sub_head_admin'] = 4,
	['head_admin'] = 5,
	['superadmin'] = 5
}

local payday_delay = 590
local payday_modif	= 1 -- todo: сделать глобальным и изменяемым из игры

local COLOR_TEXT    = AMB_COLOR_WHITE
local COLOR_GRAY	= AMB_COLOR_GRAY
local COLOR_RED     = AMB_COLOR_RED
local COLOR_ORANGE	= AMB_COLOR_AMBITION

function AmbEconomic.PayDay()

	print( '\n[AmbEconomic] PayDay | '..os.date( '%X',os.time() ) )


	for k, v in pairs( player.GetAll() ) do

		AmbLib.chatSend( v, COLOR_ORANGE, "[•] ", COLOR_TEXT, "Пришла зарплата | "..os.date( '%X',os.time() ) )

		if ( tonumber( v:GetNWInt( 'amb_players_level' ) ) >= 1 ) then AmbStats.Players.newLevel( v ) end

		if ( #player.GetAll() > 2 ) then

			AmbStats.Players.addStats( v, "$", RPExtraTeams[v:Team()].salary * payday_modif * AmbEconomic.payday_ranks_modif[v:GetUserGroup()] )

		else

			AmbLib.notifySend( v, 'На сервере мало игроков, вы не получили +Деньги', 1, 6, 'buttons/button15.wav' )

		end

	end

end

timer.Create( 'AmbPayDay', payday_delay, 0, function()

	AmbEconomic.PayDay()

end )


local cost_ammo = 64

function AmbEconomic.buyAmmo( ePly )
	if ( ePly:IsPlayer() == false ) then return false end
	
	if ( AmbStats.Players.getStats( ePly, '$') >= cost_ammo ) then

		local wep = ePly:GetActiveWeapon()
		-- ePly:ChatPrint( tostring( wep:GetClass() ) )
		local ammo = wep:GetPrimaryAmmoType()
		-- ePly:ChatPrint( tostring( ammo ) )

		ePly:GiveAmmo( 32, ammo )
		AmbStats.Players.addStats( ePly, '$', -cost_ammo )
	else
		AmbLib.notifySend( ePly, 'Не хватает долларов!', 1, 3, 'buttons/button10.wav' )
	end
end
concommand.Add( 'amb_darkrp_buyammo', function( ply ) AmbEconomic.buyAmmo( ply ) end )
