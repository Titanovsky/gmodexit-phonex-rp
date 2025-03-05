AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 
function ENT:Initialize()
 
	self:SetModel( "models/props_junk/cardboard_box001a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
	self:SetUseType( SIMPLE_USE )
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	self.cooldown = 0
	self.container = {}
end
 
function ENT:Use( activator, caller )
end

function ENT:Think()
end

function ENT:StartTouch(ent)
	if self.cooldown > CurTime() or self:GetTotal() >= 20 then return end
	if !IsValid(ent) or ent:GetClass() != "ent_meth_crystal" or ent:GetWarm() then return end

	local amt = self:GetTotal()
	self.container[#self.container+1] = ent:GetQuality()
	ent:Remove()
	self.cooldown = CurTime()+2
	self:SetTotal(amt+1)
	
end


function ENT:OnTakeDamage(dmg)
	if dmg:GetDamage() > 5 and dmg:IsBulletDamage() then
		self:Remove()
	end
end