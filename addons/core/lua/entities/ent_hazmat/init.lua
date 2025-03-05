AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 
function ENT:Initialize()
 
	self:SetModel( "models/props_c17/BriefCase001a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
	self:SetUseType( SIMPLE_USE )
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end

end
 
function ENT:Use( activator, caller )
	caller.oldmodelrmeth = caller:GetModel()
	caller:SetModel(RMETH.Hazmat)
	net.Start("HazmPut")

	net.Send(caller)
	self:Remove()
end

function ENT:Think()
end


function ENT:OnTakeDamage(dmg)
	if dmg:GetDamage() > 20 and dmg:IsBulletDamage() then
		self:Remove()
	end
end

net.Receive("HazmPut", function(len,ply)

	if ply:GetModel() != RMETH.Hazmat or !ply:Alive() then return end
	ply:SetModel(ply.oldmodelrmeth)
	ply.oldmodelrmeth = nil
	local ent = ents.Create("ent_hazmat")
		ent:SetPos(ply:GetPos()+ply:GetForward()*30+Vector(0,0,30))
		ent:Spawn()
		
end)
