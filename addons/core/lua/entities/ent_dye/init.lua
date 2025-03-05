AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 

util.AddNetworkString("PickColorRMETH")

net.Receive("PickColorRMETH", function(len,ply)
	local ent = ply.dye
	local col = net.ReadColor()
	
		if !IsValid(ent) or (Color(0,0,0,0) == col) or ent:GetPos():Distance(ply:GetPos()) > 100 then return end
	col = Vector(col.r,col.g,col.b)
	ent:SetColorC(col)
	ply.dye = nil

end)


function ENT:Initialize()
 
	self:SetModel( "models/props_lab/jar01b.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
	self:SetUseType( SIMPLE_USE )
	self:SetTrigger(true)
	self.once = false
	self:SetColorC(Vector(255,255,255))
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end

end
 
function ENT:Use( activator, caller )
	net.Start("PickColorRMETH")
	net.Send(caller)
	caller.dye = self
end

function ENT:StartTouch(ent)
	if self.once or ent:GetClass() != "ent_meth_crystal" then return end
	self.once = true
	local scol = self:GetColorC()
	local col = Color(scol.x,scol.y,scol.z)
	ent:SetColor(col)
	local qual = ent:GetQuality()
	ent:SetQuality(qual-5)
	self:Remove()


end


function ENT:OnTakeDamage(dmg)
	if dmg:GetDamage() > 20 and dmg:IsBulletDamage() then
		self:Remove()
	end
end