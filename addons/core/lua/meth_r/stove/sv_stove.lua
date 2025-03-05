util.AddNetworkString("RMeth_StoveGUI")
util.AddNetworkString("RMeth_TurnOFF")
util.AddNetworkString("RMeth_TurnON")
util.AddNetworkString("RMeth_Closed")
util.AddNetworkString("RMeth_Dump")
util.AddNetworkString("RMeth_Noti")

util.AddNetworkString("HazmPut")

util.AddNetworkString("MethUpdate")

local plymeta = FindMetaTable( "Player")

function plymeta:SendMethUpdate()

	net.Start("MethUpdate")
		net.WriteInt(#self.methinv, 32)
	net.Send(self)
	
end


net.Receive("MethUpdate",function(len,ply)

	if #ply.methinv < 1 or !ply:Alive() then return end

	for i,k in pairs(ply.methinv) do
		local meth = ents.Create("ent_meth_crystal")
			meth:SetPos(ply:GetPos()+ply:GetForward()*30+Vector(0,0,30)+(ply:GetUp()*(10*i)))
			meth.syscreated = true
			meth:Spawn()
			meth:SetQuality(ply.methinv[i].quality)
			meth:SetColor(ply.methinv[i].color)
			meth:GetPhysicsObject():AddVelocity(ply:GetVelocity()*2)
	end

	ply.methinv = {}

end)

hook.Add("ScalePlayerDamage","HighDamageLower",function(ply,hit,dmg)
	if ply:GetNWInt("MethHigh",0) > 0 then
		local scale = (ply.MethQuality/100)*RMETH.ScaleDamage
		scale = math.Clamp(scale, 0, 1)
		dmg:ScaleDamage(scale)
	end
end)

hook.Add("PlayerTick", "ConsumeMeth",function(ply)
	local ent = ply:GetEyeTrace().Entity
	if IsValid(ent) and ply:KeyPressed(IN_RELOAD) and ent:GetClass() == "ent_meth_crystal" and ent:GetPos():Distance(ply:GetPos()) < 100 then
		ply.usemeth = true
		ply:GetEyeTrace().Entity:Use(ply,ply,USE_TOGGLE,0)
	end
end)

net.Receive("RMeth_TurnOFF", function(len,ply)
		local entity = net.ReadEntity()
		if #entity.sent == 0 and ply:GetPos():Distance(entity:GetPos()) < 200 and ply:Alive() and entity.used == ply then
				entity:SetStateS("OFF")
		end

end)

net.Receive("RMeth_Dump", function(len,ply)
	local entity = net.ReadEntity()
		if ply:GetPos():Distance(entity:GetPos()) < 200 and ply:Alive() and entity.used == ply then
			entity:SetCrystal(0)
			entity:SetMur(0)
			entity:SetWater(0)
			entity:SetLiquid(0)
			entity:SetRedP(0)
		end
end)


net.Receive("RMeth_TurnON", function(len,ply)
		local entity = net.ReadEntity()
		if #entity.sent == 0 and ply:GetPos():Distance(entity:GetPos()) < 200 and ply:Alive() and entity.used == ply then
				entity:SetStateS("ON")
		end

end)


net.Receive("RMeth_Closed",function(len,ply)
	local entity = net.ReadEntity()
	if ply == entity.used then
		entity.used = nil
	end
end)


hook.Add("PhysgunPickup","DontPickup",function(ply,ent)
	if ent:GetParent():IsValid() then
		if ent:GetParent():GetClass() == "ent_table" then
			return false
		end
	end
	if ent:GetClass() == "ent_table" and #ent.glassware > 1 then
		if !ply:IsAdmin() or !ply:IsSuperAdmin() then
			return false
		end
	end

end)

hook.Add("PlayerDeath","ResetInv",function(vic,inf,att)
	if RMETH.DropOnDeath == true then
		for i,k in pairs(vic.methinv) do
			local meth = ents.Create("ent_meth_crystal")
			meth:SetPos(vic:GetPos()+Vector(0,0,10*i))
			meth.syscreated = true
			meth:Spawn()
			meth:SetQuality(k.quality)
			meth:SetColor(k.color)
		end
	end
	vic.methinv = {}
	vic:SendMethUpdate()
	vic:SetNWInt("MethHigh", 0)
	vic.MethQuality = nil
end)

hook.Add("PlayerInitialSpawn","Init",function(ply)
	ply.methinv = {}
	ply:SendMethUpdate()
	ply:SetNWInt("MethHigh", 0)
end)

--[[
hook.Add("InitPostEntity", "PostInit", function()
	timer.Create("RMeth_Tick", 1, 0, function()
		for i,k in pairs(player.GetAll()) do
			if k:GetNWInt("MethHigh", 0) > 0 then
				local int = k:GetNWInt("MethHigh", 0)
				k:SetNWInt("MethHigh",int-1)
			end
		end
	end)
end)
]]
