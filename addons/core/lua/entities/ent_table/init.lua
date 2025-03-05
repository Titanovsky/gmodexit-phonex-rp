AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 
function ENT:BuildTable()

	if self.heateradded == true then 

					------------------------------------
				local heat = ents.Create("prop_physics")
				heat:SetModel("models/Items/combine_rifle_ammo01.mdl")
				heat:SetPos(self:GetPos()+self:GetUp()*10+self:GetRight()*20+self:GetForward()*-20)
				heat:SetParent(self)

				heat = nil
					------------------------------------
				local heat = ents.Create("prop_physics")
				heat:SetModel("models/props_lab/reciever01d.mdl")
				heat:SetPos(self:GetPos()+self:GetUp()*18.8+self:GetRight()*20+self:GetForward()*-26.5)
				heat:SetAngles(self:GetAngles()+Angle(0,-180,0))
				heat:SetParent(self)

				heat = nil
					------------------------------------

	end

	if self.glassadded == true then
			self:SetAssembly(true)

					------------------------------------			
			local glassware = ents.Create("prop_physics")
				glassware:SetModel("models/props_junk/glassjug01.mdl")
				glassware:SetPos(self:GetPos()+self:GetUp()*22+self:GetRight()*20+self:GetForward()*-20)
				glassware:SetParent(self)

			glassware = nil
					------------------------------------
			local glassware = ents.Create("prop_physics")
				glassware:SetModel("models/props_junk/garbage_glassbottle001a.mdl")
				glassware:SetPos(self:GetPos()+self:GetUp()*28.5+self:GetRight()*15+self:GetForward()*-15)
				glassware:SetParent(self)

			glassware = nil

			local glassware = ents.Create("prop_physics")
				glassware:SetModel("models/props_c17/playground_teetertoter_stan.mdl")
				glassware:SetPos(self:GetPos()+self:GetUp()*33+self:GetRight()*5+self:GetForward()*-20)
				glassware:SetParent(self)
				glassware:SetAngles(self:GetAngles()+Angle(0,90,0))

			glassware = nil

	

			local glassware = ents.Create("prop_physics")
				glassware:SetModel("models/props_canal/mattpipe.mdl")
				glassware:SetPos(self:GetPos()+self:GetUp()*52+self:GetRight()*5+self:GetForward()*-5.60)
				glassware:SetParent(self)
				glassware:SetAngles(self:GetAngles()+Angle(-90,-90,90))
				glassware:Activate()

			glassware = nil	


			local glassware = ents.Create("prop_physics")
				glassware:SetModel("models/props_c17/GasPipes006a.mdl")
				glassware:SetPos(self:GetPos()+self:GetUp()*26+self:GetRight()*5+self:GetForward()*10)
				glassware:SetParent(self)
				glassware:SetAngles(self:GetAngles()+Angle(180,0,0))

			glassware = nil	


			local glassware = ents.Create("prop_physics")
				glassware:SetModel("models/props_lab/pipesystem02e.mdl")
				glassware:SetPos(self:GetPos()+self:GetUp()*50+self:GetRight()*20+self:GetForward()*-15)
				glassware:SetParent(self)
				glassware:SetAngles(self:GetAngles()+Angle(-180,-90,40))

			glassware = nil

			local glassware = ents.Create("prop_physics")
				glassware:SetModel("models/props_junk/cardboard_box001a.mdl")
				glassware:SetPos(self:GetPos()+self:GetUp()*32+self:GetRight()*-13+self:GetForward()*13)
				glassware:SetParent(self)
				glassware:SetSolid(SOLID_VPHYSICS)
				local ang = self:GetAngles()
				ang:RotateAroundAxis(ang:Up(),45)
				glassware:SetAngles(ang)

			glassware = nil
			ang = nil

	end

end

function ENT:Initialize()
 
	self:SetModel( "models/props_wasteland/kitchen_counter001c.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetPos(self:GetPos()+self:GetUp()*70)
	self:SetAngles(self:GetAngles()+Angle(0,-180,0))
	self:SetTrigger(true)
	self:SetUseType(SIMPLE_USE)
	self:SetAssembly(false)

	self.glassware = {}
	self.heat = {}
	self.sent = {}
	self.cooldown = 0
	self.inside = nil
	self:SetStateS("OFF")
	self.used = nil
	self.damagetimer = CurTime()
	self.useable = true
	self.time = 0
	self:SetCooking(0)
	self.formula = 0


 
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(5)

	end
	timer.Simple(0.1,function() if self:IsValid() then self:BuildTable() self.useable = true self.time = 0 self.used = nil end end) --make it compatible with pocket

end



function ENT:OnTakeDamage(dmg)
	if dmg:GetDamage() > 20 and dmg:IsBulletDamage() then
		self:Remove()
	end
end

function ENT:OnRemove()
		self:StopSound("fire_onichan")
end




function ENT:Use( activator, caller )
	if self.glassadded == true and self.heateradded == true and self.used == nil and self.useable == true then
		if caller:IsPlayer() then
			net.Start("RMeth_StoveGUI")
				net.WriteEntity(self)
			net.Send(caller)
			self.used = caller
		end
	end
 end


sound.Add( {
	name = "fire_onichan",
	channel = CHAN_AUTO,
	volume = 0.5,
	level = 70,
	pitch = 150,
	sound = "ambient/gas/steam_loop1.wav"
} )


function ENT:Think()
    if self:GetStateS() == "ON" then
    	if self:GetLiquid() > 0 and self:GetMur() > 0 and self:GetWater() > 0 and self:GetRedP() == 0 and self:GetCrystal() == 0 then
    		self.useable = false
    		if self.time == 0 then
    			self.time = CurTime() + RMETH.CookTime1
    			self:EmitSound("fire_onichan")
    			self:SetCooking(1)
    		end
    		if CurTime() > self.time then
    			self:StopSound("fire_onichan")
    			formula = (self:GetLiquid() * 0.5)+(self:GetMur() * 0.4)+(self:GetWater() * 0.2)
    			formula = math.Round(math.Clamp(formula,1,99))
    			self:SetCrystal(self:GetCrystal() + formula)
    			self:SetStateS("OFF")
    			self.useable = true
    			self:SetLiquid(0)
    			self:SetMur(0)
    			self:SetWater(0)
    			self.time = 0
    			self:SetCooking(0)
    		end
    	elseif self:GetCrystal() > 0 and self:GetRedP() > 0 and self:GetMur() == 0 and self:GetWater() == 0 and self:GetLiquid() == 0 then
    		self.useable = false
    		if self.time == 0 then
    			self:SetCooking(2)
    			self.time = CurTime() + RMETH.CookTime2
    			self:EmitSound("fire_onichan")
    		end
    		if CurTime() > self.time then
    			self.formula = 0
    			self:StopSound("fire_onichan")
	    			if self:GetRedP() > RMETH.PerfRedP then 
	    				self.formula = self.formula + math.Round((RMETH.PerfRedP/self:GetRedP()*50))
	    			else
	    				self.formula = self.formula + (self:GetRedP()/RMETH.PerfRedP)*50
	    			end
	    			if self:GetCrystal() > RMETH.PerfCry then
						self.formula = self.formula + math.Round((RMETH.PerfCry/self:GetCrystal()*50))
	    			else
						self.formula = self.formula + (self:GetCrystal()/RMETH.PerfCry)*50
	    			end
    			self.formula = math.Round(math.Clamp(self.formula,1,100))
    			self:SetStateS("OFF")
    			local meth = ents.Create("ent_meth_crystal")
	    			meth:SetPos(self:GetPos()+Vector(0,0,30))
	    			meth.syscreated = true
	    			meth:Spawn()
	    			meth:SetQuality(self.formula)
	    			meth:SetWarm(true)
    			self:SetCooking(0)

    			meth = nil

    			self.useable = true
    			self.formula = 0
    			self:SetLiquid(0)
    			self:SetMur(0)
    			self:SetCrystal(0)
    			self:SetRedP(0)
    			self:SetWater(0)
    			self.time = 0
    		end
    	   elseif self:GetCrystal() > 0 or self:GetRedP() > 0 or self:GetMur() > 0 or self:GetWater() > 0 or self:GetLiquid() > 0 then
    			self:SetLiquid(0)
    			self:SetMur(0)
    			self:SetCrystal(0)
    			self:SetRedP(0)
    			self:SetWater(0)
    			self:SetCooking(0)
    			self:SetStateS("OFF")
    			self:EmitSound("ambient/fire/gascan_ignite1.wav",self:GetPos())
    		else
    			self:SetStateS("OFF")
    		end
    end


    if self:GetCooking() == 2 and self.damagetimer < CurTime() and RMETH.DamagePerSecond > 0 then
    	self.damagetimer = CurTime() + 1
    	local finds = ents.FindInSphere(self:GetPos(),200)
    	if #finds > 0 then
	    	for i,k in pairs(finds) do
	    		if k:IsValid() then
	    			if k:IsPlayer() and k:Alive() and k:GetModel() != RMETH.Hazmat then
		    			k:TakeDamage(RMETH.DamagePerSecond,self,nil)
		    			k:EmitSound(table.Random(RMETH.PainSounds),self:GetPos())
	    			end
	    		end
	    	end
    	end
    end

end

function ENT:Touch(ent)
	if ent:GetClass() == "ent_torch" then
		if self.heateradded != true then
				self.heateradded = true
				self:BuildTable()
				ent:Remove()
				self:EmitSound("items/gift_pickup.wav",self:GetPos())

		end
	end
		if ent:GetClass() == "ent_glassware" and self.glassadded != true and self.heateradded == true then
			ent:Remove()
			self.glassadded = true
			self:BuildTable()
			self:EmitSound("items/ammopickup.wav",self:GetPos())
		end

		if ent:GetClass() == "ent_redpho" and ent:GetAmount() > 0 and CurTime() > self.cooldown and self.useable == true then
			self:SetStateS("OFF")
			self.cooldown = CurTime() + 0.8
			ent:SetAmount(ent:GetAmount()-1)
			self:SetRedP(self:GetRedP()+1)
		end
		if ent:GetClass() == "ent_water" or ent:GetClass() == "ent_muriatic" or ent:GetClass() == "ent_iodine" then
			if self.glassadded == true and ent:GetAmount() > 0 and #self.sent == 0 and self.useable == true then
					self:SetStateS("OFF")
				----#
					local sent = ents.Create("prop_physics")
						sent:SetModel("models/props_junk/glassjug01.mdl")
						sent:SetPos(self:GetPos()+self:GetUp()*66+self:GetRight()*20+self:GetForward()*-20)
						sent:SetParent(self)
						local ang = self:GetAngles()
						ang:RotateAroundAxis(ang:Right(),-130)
						sent:SetAngles(ang)
						ang = nil

					self.sent[1] = sent
					sent = nil
				----#

				self.inside = ent:GetContent()
				self.amount = ent:GetAmount()
				ent:Remove()

				self.reps = 0

					timer.Create("Splash "..self:EntIndex(),1,ent:GetAmount(),function()
							if self:IsValid() then
								local effdata = EffectData()
									effdata:SetOrigin(self.sent[1]:GetPos()+self.sent[1]:GetUp()*12)
									util.Effect("watersplash",effdata)			
								if self.inside == "Muriatic Acid" then
									self:SetMur(self:GetMur()+1)
								elseif self.inside == "Water" then
									self:SetWater(self:GetWater()+1)
								elseif self.inside == "Liquid Iodine" then
									self:SetLiquid(self:GetLiquid()+1)
								end
							end
							self.reps = self.reps + 1
							if self.reps == self.amount then
								self.inside = nil
								self.amount = nil
								self.reps = 0
							end

					end)

					timer.Simple(ent:GetAmount()+1,function()
						if self:IsValid() then
							self.sent[1]:Remove()
							self.sent[1] = nil
							bottle = nil
						end
					end)
			end
		end
end


