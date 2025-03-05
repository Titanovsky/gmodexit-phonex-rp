AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 
function ENT:Initialize()
 
	self:SetModel( "models/Gibs/wood_gib01e.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
    self:SetMaterial("models/shiny",true)
    self:SetColor(Color(0,255,255))
    self:SetUseType(SIMPLE_USE)
	self.t = CurTime() + 1	
        local phys = self:GetPhysicsObject()
		
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMaterial("metal")
	end
	if not self.syscreated == true then
		self:SetQuality(50)
		self:SetWarm(true)
	end
end



function ENT:OnTakeDamage(dmg)
	if dmg:GetDamage() > 20 and dmg:IsBulletDamage() then
		self:Remove()
	end
end


function ENT:Use(act,ply)
	if IsValid(ply) and ply:IsPlayer() and ply:Alive() and ply.usemeth == true then
		ply.usemeth = false
		ply:SetNWInt("MethHigh", RMETH.HighTime)
		ply.MethQuality = self:GetQuality()
		self:Remove()
		return
	end
	if ( IsValid(ply) and ply:IsPlayer() and RMETH.AccessTeam[ ply:Team() ] ) then
		if ply:Alive() and self:GetWarm() == false then
			if #ply.methinv >= 2 then 
			ply:SendLua('chat.AddText(Color(255,100,100),"You can\'t pick up any more than 2 of that item!")')
			ply:SendLua('chat.AddText(Color(255,130,130),"Perhaps try to batch sell all of your product?")')
			return
			end
			ply.methinv[#ply.methinv+1] = {quality = self:GetQuality(),color = self:GetColor()}
			ply:SendLua('chat.AddText(Color(255,100,100),"You picked up some meth! Bring it to the dealer!")')
			ply:SendMethUpdate()
			self:Remove()
			return
		end
	end
end

function ENT:Think()
	
	if self:GetQuality() <= 0 then
		self:Remove()
	end

    if CurTime() > self.t and self:GetQuality() > 0 and self:GetWarm(false) then
    	self:SetQuality(self:GetQuality()-1)
    	self.t = CurTime()+RMETH.DegradeT
    end
end


