AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 
function ENT:Initialize()
 
	self:SetModel( "models/props_junk/glassjug01.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
	self:SetUseType( SIMPLE_USE )
	self:SetContent("Muriatic Acid")
 	self.amt = 2
 	self:SetAmount(self.amt)
 
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end

end
 
function ENT:Use( activator, caller )
end

function ENT:Think()
end



function ENT:OnTakeDamage(dmg)
	if dmg:GetDamage() > 20 and dmg:IsBulletDamage() then
		self:Remove()
	end
end