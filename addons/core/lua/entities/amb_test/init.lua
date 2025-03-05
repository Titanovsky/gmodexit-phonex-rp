AddCSLuaFile( 'cl_init.lua' )
AddCSLuaFile( 'shared.lua' )
include( 'shared.lua' )

function ENT:Initialize()

	self:SetModel( 'models/hunter/blocks/cube025x025x025.mdl' )
	self:SetUseType( SIMPLE_USE )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetNWString( 'Name', 'Habibula' )

	local phys = self:GetPhysicsObject()
	if ( IsValid( phys ) ) then

		phys:EnableMotion( false )

	end

end

local color = Color( 0, 0, 255 )

function ENT:Use( eCaller )

	eCaller:SetColor( color )
	self:Remove()

end
