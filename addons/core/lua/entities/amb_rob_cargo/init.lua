AddCSLuaFile( 'shared.lua' )
AddCSLuaFile( 'cl_init.lua' )

include( 'shared.lua' )

util.AddNetworkString( 'amb_rob_cargo' )

function ENT:Initialize()

	self:SetModel( AmbRobCargo.cargo.mdl )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	self:SetHealth( AmbRobCargo.cargo.hp )

	local phys = self:GetPhysicsObject()
	if IsValid( phys ) then

		phys:EnableMotion( false )

	end

	self:SetNWBool( 'Stealing', false )

end

function ENT:Steal( ePly )

	ePly:Freeze( true )
	AmbLib.notifySend( ePly, 'Вы начали ограбление, ждите 1 минуту!', 0, 60, 'ambition/amb_zombie_mode_sounds_pack/wins/human_win_m3.wav' )

	self:SetNWBool( 'Stealing', true )

	timer.Simple( 62, function() 
	
		ePly:Freeze( false )

		if not IsValid( self ) then return end
		if not ePly:Alive() then

			AmbLib.notifySend( ePly, 'Вы потеряли груз', 1, 6, 'ambition/amb_zombie_mode_sounds_pack/wins/zombie_win3.wav' )
			self:SetNWBool( 'Stealing', false )
			return
			
		end

		ePly:SetNWInt( 'Gold', ePly:GetNWInt( 'Gold' )+1 )
		AmbLib.notifySend( ePly, 'Вы закончили ограбление, отнесите груз Вору!', 0, 8, 'ambition/amb_zombie_mode_sounds_pack/zombie/laught/laught2.wav' )

		if AmbRobCargo.loss_gold_on_death then 
		
			ePly:SetWalkSpeed( ePly:GetWalkSpeed() / AmbRobCargo.speed_player_with_gold )
			ePly:SetRunSpeed( ePly:GetRunSpeed() / AmbRobCargo.speed_player_with_gold ) 
			
		end
		
		self:Remove()
	
	end )

end

function ENT:OnTakeDamage( dmg )

	self:SetHealth( self:Health() - dmg:GetDamage() )

	if ( self:Health() <= 0 ) and IsValid( self ) then self:Remove() end

end

net.Receive( 'amb_rob_cargo', function( nLen, caller )

	if ( IsValid( caller ) == false ) or ( caller:Alive() == false ) then return end
	if ( AmbRobCargo.criminal[ caller:Team() ] == false ) then return end

	local cargo = net.ReadEntity()

	if ( cargo:GetClass() ~= 'amb_rob_cargo' ) then return end

	cargo:Steal( caller )

end )



