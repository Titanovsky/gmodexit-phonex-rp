AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 
function ENT:Initialize()
 
	self:SetModel( "models/props_junk/GlassBottle01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
	self:SetUseType( SIMPLE_USE )
 		self.crushed = false
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	timer.Simple(0,function()
			if self.crushed == true then
				self:SetModel("models/props_junk/garbage_bag001a.mdl")
				self:SetCrushed(true)
				self:PhysicsInit( SOLID_VPHYSICS )
				self:GetPhysicsObject():Wake()
				self:SetColor(Color(255,130,130))
			end
			if self.amt then
				self:SetAmount(self.amt)
			end
	end)
end
 
function ENT:Use( activator, caller )
	if self:GetCrushed() == false then
		self:SetCrushed(true)
		self.crushed = true
		self:SetAmount(math.random(2,6))
		self.amt = self:GetAmount()
		self:SetModel("models/props_junk/garbage_bag001a.mdl")
		self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
		self:GetPhysicsObject():Wake()
		self:SetColor(Color(255,130,130))
	end
end
 

 function ENT:Think()
 	if self:GetCrushed() and self:GetAmount() == 0 then
 		self:Remove()
 	end
 end





function ENT:OnTakeDamage(dmg)
	if dmg:GetDamage() > 20 and dmg:IsBulletDamage() then
		self:Remove()
	end
end