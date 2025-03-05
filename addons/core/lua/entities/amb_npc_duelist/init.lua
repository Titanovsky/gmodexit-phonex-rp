AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

	self:SetModel( 'models/Barney.mdl' )
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

	if timer.Exists( 'AmbDuelAccept' ) then  

		if ( ePly == AmbDuel.duelist2 ) then

			AmbDuel.AcceptDuel( ePly )

		end

	elseif timer.Exists( 'AmbDuelTime' ) then

		ePly:SendLua( 'AmbDuel.OpenBet()' )

	else

		ePly:SendLua( 'AmbDuel.OpenRegister()' )

	end

end