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
	if ( IsValid( ph ) ) then

		ph:EnableMotion( false )

	end

end

function ENT:Use( ePly )

	if ( ePly:GetNWBool( 'amb_players_orgs' ) ) then

		ePly:SendLua( 'AmbOrgs2.openMenuLeaveOrg()' )

	else

		ePly:SendLua( 'AmbOrgs2.openMenuCreateOrg()' )

	end

end