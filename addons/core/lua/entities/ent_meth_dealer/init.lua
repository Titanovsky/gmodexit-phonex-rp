AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:Initialize()

	self:SetModel( RMETH.skin_buyer )
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE)
	self:SetUseType(SIMPLE_USE)
	self:SetMaxYawSpeed(90)

end

local moneyamt = 0


function ENT:AcceptInput(Name, Activator, Caller)

	if ( Name == "Use" and Caller:IsPlayer() ) then

		if ( RMETH.AccessTeam[ Caller:Team() ] == false ) then return Caller:ChatPrint( table.Random( RMETH.random_phrases_unknow ) ) end

		moneyamt = 0

		local find = ents.FindInSphere( self:GetPos() - Vector( 0, 0, 40 ), 150 )

		for _, k in pairs( find ) do

			if k:GetClass() == "ent_batch" and k:GetTotal() >= 10 then
				for _,v in pairs(k.container) do
					moneyamt = moneyamt + RMETH.Award * v
				end
				local amt = 0
				if #k.container > 10 then
					amt = #k.container - 10
				end
				Caller:addMoney(moneyamt+amt*2000)
				k:Remove()
				net.Start("RMeth_Noti")
					net.WriteFloat(moneyamt)
					net.WriteFloat(amt*2000)
				net.Send(Caller)
				return
			end

		end

		if ( #Caller.methinv > 0 ) then 

			for i, k in pairs( Caller.methinv ) do

				moneyamt = moneyamt + RMETH.Award * k.quality

			end

			Caller.methinv = {}
			Caller:SendMethUpdate()

		end

		if ( moneyamt > 0 ) then

			Caller:addMoney(moneyamt)

			net.Start( "RMeth_Noti" )
				net.WriteFloat( moneyamt )
				net.WriteFloat( 0 )
			net.Send( Caller )

			self:EmitSound("vo/npc/male01/finally.wav", self:GetPos())

		else

			ParticleEffect("particle/smokesprites_000", self:GetPos(), self:GetAngles())
			Caller:ChatPrint( 'Ты не принёс то, что я просил!' )
			self:EmitSound("vo/npc/male01/gethellout.wav", self:GetPos())

		end

	end

end
