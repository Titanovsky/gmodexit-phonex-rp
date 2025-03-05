AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

	self:SetModel( 'models/gman_high.mdl' )
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal()
	self:PhysicsInit( SOLID_BBOX )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetCollisionGroup( COLLISION_GROUP_PLAYER )
	self:CapabilitiesAdd( CAP_ANIMATEDFACE )
	self:CapabilitiesAdd( CAP_TURN_HEAD )
	self:SetUseType( SIMPLE_USE )

	local ph = self:GetPhysicsObject()
	if IsValid( ph ) then

		ph:EnableMotion( false )

	end

end

function ENT:Use( ePly )

	if ( ePly:GetNWInt( 'Gold' ) > 0 ) then

		for i = 1, ePly:GetNWInt( 'Gold' ) do

			AmbStats.Players.addStats( ePly, '$', math.random( AmbRobCargo.rewards.min_rob, AmbRobCargo.rewards.max_rob ) )

		end

		ePly:SetNWInt( 'Gold', 0 )
		if AmbRobCargo.loss_gold_on_death then 
		
			ePly:SetWalkSpeed( ePly:GetWalkSpeed() * AmbRobCargo.speed_player_with_gold )
			ePly:SetRunSpeed( ePly:GetRunSpeed() * AmbRobCargo.speed_player_with_gold )
			
		end

	end

end

function ENT:Touch( eObj )

	if ( eObj:GetClass() ~= 'amb_cases_case' ) then return end

	local ply = eObj:GetOwner()

	if IsValid( ply ) then AmbStats.Players.addStats( ply, '$', math.random( 800, 4200 ) ) end

	eObj:Remove()

end

hook.Add( 'PlayerDeath', 'LossGold', function( victim )

	if AmbRobCargo.loss_gold_on_death then

		if victim:IsPlayer() and ( victim:GetNWInt( 'Gold' ) > 0 ) then 
		
			victim:SetNWInt( 'Gold', 0 )
			AmbLib.notifySend( ePly, 'Вы потеряли груз', 1, 6, 'ambition/amb_zombie_mode_sounds_pack/wins/zombie_win3.wav' )
			
		end

	end

end )
