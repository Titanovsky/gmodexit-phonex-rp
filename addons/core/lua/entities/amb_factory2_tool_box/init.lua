AddCSLuaFile( 'shared.lua' )
AddCSLuaFile( 'cl_init.lua' )

include( 'shared.lua' )

function ENT:Initialize()

	self:SetModel( 'models/items/boxmrounds.mdl' )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )

	local phys = self:GetPhysicsObject()
	if IsValid( phys ) then

	    phys:EnableMotion( false )

	end

end

function ENT:Use( ePly )

	--

end

