include('shared.lua')
include( 'autorun/rmeth_config.lua' )


function ENT:Initialize()
	self.anim1 = 0
	self.anim2 = 0
	self.timer = CurTime()
	timer.Simple(0.1,function() if self:IsValid() then self.timer = CurTime() end end) --make it compatible with pocket
	--self.timer2 = 0
	--self.started = false
	self.timerdisplay = 0
	string.FormattedTime(0,"%02i:%02i")
	self.pipe = ParticleEmitter(self:GetPos()+self:GetUp()*50+self:GetForward()*-25)
end

function ENT:Think()
	if self:GetPos():Distance(LocalPlayer():GetPos()) < 1000 then
		if self:GetCooking() == 1 and self.timer < CurTime() then
			local opar = self.pipe:Add("particle/smokesprites_0009",self:GetPos()+self:GetUp()*52+self:GetForward()*12+self:GetRight()*5)
			opar:SetVelocity(self:GetUp()*20)
			opar:SetStartSize(0.1)
			opar:SetEndSize(15)
			opar:SetRoll(100)
			opar:SetColor(100,255,100)
			opar:SetGravity(Vector(0,0,10))
			opar:SetAirResistance(100)
			opar:SetDieTime(3)
			opar:SetStartAlpha(200)
			opar:SetEndAlpha(0)
			self.timer = CurTime() + 0.8
		elseif self:GetCooking() == 2 and self.timer < CurTime() then
			local opar = self.pipe:Add("particle/smokesprites_0009",self:GetPos()+self:GetUp()*52+self:GetForward()*12+self:GetRight()*5)
			opar:SetVelocity(self:GetUp()*20)
			opar:SetStartSize(0.1)
			opar:SetEndSize(15)
			opar:SetRoll(100)
			opar:SetColor(150,150,0)
			opar:SetGravity(Vector(0,0,10))
			opar:SetAirResistance(100)
			opar:SetDieTime(3)
			opar:SetStartAlpha(200)
			opar:SetEndAlpha(0)
			self.timer = CurTime() + 0.8
		end
	end


	-- lets set up the timer when the cooking starts
	--[[if self:GetCooking() == 1 and self.timer2 < CurTime() then
			if self.started == false then
				self.started = true
				self.timerdisplay = RMETH_CookTime1+1
			end

			self.timer2 = CurTime() + 1
			self.timerdisplay = self.timerdisplay - 1

	end

	if self:GetCooking() == 2 and self.timer2 < CurTime() then
			if self.started == false then
				self.started = true
				self.timerdisplay = RMETH_CookTime2+1
			end
		self.timer2 = CurTime() + 1
		self.timerdisplay = self.timerdisplay - 1
	end

	if self:GetCooking() == 0 and self.started == true then
		self.started = false
		self.timer2 = 0
	end]]--

end
local scale = 2
surface.CreateFont( "MethTitle", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30*scale,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )
surface.CreateFont( "MethDesc", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20*scale,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )



function ENT:Draw()
    self:DrawModel()       -- Draw the model.
end





local mat = Material("lab.png")
local mat2 = Material("water.png")
local mat3 = Material("drug.png")

function ENT:DrawTranslucent()


	if self:GetPos():Distance(LocalPlayer():GetPos()) < 600 then 
	local cos = math.abs(math.cos(CurTime()*2))
    local ang = self:GetAngles()
    ang:RotateAroundAxis(ang:Right(),95)
    ang:RotateAroundAxis(ang:Up(),-90)
	
	    cam.Start3D2D(self:GetPos()+self:GetForward()*-30+Vector(0,0,45+cos*0.7),ang,0.1/2)
		    	draw.RoundedBox(0,-240*scale,-25*scale,100*scale,100*scale,Color(0,0,0,230))
				draw.RoundedBox(0,-137.5*scale,-25*scale,380*scale,50*scale,Color(0,0,0,230))

				draw.RoundedBox(0,-240*scale,(-25+102.5)*scale,100*scale,40*scale,Color(0,0,0,230))
				if self:GetCooking() == 0 then
					draw.SimpleText("Бездействует", "MethDesc", (-240+100/2)*scale,(-25+102.5+40/2)*scale, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				else
					draw.SimpleText("Готовит", "MethDesc", (-240+100/2)*scale,(-25+102.5+40/2)*scale, Color(255-cos*230,255-cos*150,255-cos*230), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end
				if !self:GetAssembly() then
					draw.SimpleText("Разoбранная лаборатория", "MethTitle", (-137.5+380/2)*scale,(-25+50/2)*scale, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				else
					draw.SimpleText("Мет Лаборатория", "MethTitle", (-137.5+380/2)*scale,(-25+50/2)*scale, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					if self.anim1 < 220 then
						self.anim1 = math.Approach(self.anim1, 220, 0.5)
						self.anim1 = math.ceil(self.anim1)
					else
						if self.anim2 < 255 then
							self.anim2 = math.Approach(self.anim2, 255, 0.5)
							self.anim2 = math.ceil(self.anim2)
						end
					end
					draw.RoundedBox(0,(-137.5)*scale,(-25+52.5)*scale,380*scale,self.anim1*scale,Color(0,0,0,230))
					draw.SimpleText("Количество воды: "..self:GetWater(), "MethDesc", (-137.5+35)*scale,(-25+52.5+17.5)*scale, Color(255,255,255,self.anim2), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
						surface.SetDrawColor(255,255,255,self.anim2)
						surface.SetMaterial(mat2)
						surface.DrawTexturedRect((-137.5+5)*scale,(-25+52.5+5)*scale,25*scale,25*scale)
					draw.SimpleText("Количество красного фосфора: "..self:GetRedP(), "MethDesc", (-137.5+35)*scale,(-25+52.5+5+30*1+25/2)*scale, Color(255,255,255,self.anim2), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
						surface.SetDrawColor(255,255,255,self.anim2)
						surface.SetMaterial(mat3)
						surface.DrawTexturedRect((-137.5+5)*scale,(-25+52.5+5+30*1)*scale,25*scale,25*scale)
					draw.SimpleText("Количество жидкого йода: "..self:GetLiquid(), "MethDesc", (-137.5+35)*scale,(-25+52.5+5+30*2+25/2)*scale, Color(255,255,255,self.anim2), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
						surface.SetDrawColor(255,255,255,self.anim2)
						surface.SetMaterial(mat3)
						surface.DrawTexturedRect((-137.5+5)*scale,(-25+52.5+5+30*2)*scale,25*scale,25*scale)
					draw.SimpleText("Количество соляной кислоты: "..self:GetMur(), "MethDesc", (-137.5+35)*scale,(-25+52.5+5+30*3+25/2)*scale, Color(255,255,255,self.anim2), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
						surface.SetDrawColor(255,255,255,self.anim2)
						surface.SetMaterial(mat3)
						surface.DrawTexturedRect((-137.5+5)*scale,(-25+52.5+5+30*3)*scale,25*scale,25*scale)
					draw.SimpleText("Количество кристаллизованного йода: "..self:GetCrystal(), "MethDesc", (-137.5+35)*scale,(-25+52.5+5+30*4+25/2)*scale, Color(255,255,255,self.anim2), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
						surface.SetDrawColor(255,255,255,self.anim2)
						surface.SetMaterial(mat3)
						surface.DrawTexturedRect((-137.5+5)*scale,(-25+52.5+5+30*4)*scale,25*scale,25*scale)
				end
				surface.SetDrawColor(255,255,255)
				surface.SetMaterial(mat)
				surface.DrawTexturedRect(-230*scale,-15*scale,80*scale,80*scale)
	    cam.End3D2D()
 	end
end



--[[function ENT:Draw()
    self:DrawModel() -- Draws Model Client Side


    local label = ""

    if self:GetCooking() == 0 then
    	label = "Idle"
    else
		label = "Cooking"
    end

    local ang = self:GetAngles()
    ang:RotateAroundAxis(ang:Right(),90)
    ang:RotateAroundAxis(ang:Up(),-90)

	if self:GetPos():Distance(LocalPlayer():GetPos()) < 600 then  
	    cam.Start3D2D(self:GetPos()+self:GetUp()*13+self:GetForward()*-30.2,ang,0.1)


			    		draw.RoundedBox(16,-500/2,-25,500,50,Color(0,0,0,245))
			    		draw.SimpleText("Meth Laboratory","RMeth",0,0,Color(255,255,130),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
						draw.RoundedBox(16,-500/2,50,500,180,Color(0,0,0,245))
						draw.SimpleText(label,"RMeth",0,75,Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
						draw.SimpleText("Red Phosphorus units: "..self:GetRedP(),"RMeth2",-240,110,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
						draw.SimpleText("Water units: "..self:GetWater(),"RMeth2",-240,125,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
						draw.SimpleText("Liquid Iodine units: "..self:GetLiquid(),"RMeth2",-240,140,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
						draw.SimpleText("Muriatic Acid units: "..self:GetMur(),"RMeth2",-240,155,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
						draw.SimpleText("Crystalized Iodine units: "..self:GetCrystal(),"RMeth2",-240,170,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
						--surface.SetFont("RMeth")
						--local formatted = string.FormattedTime( self.timerdisplay, "%02i:%02i")
						--local x,y = surface.GetTextSize(formatted)
						--draw.SimpleText(formatted,"RMeth",-240+x/2,190,Color(255,255,130),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)

	    cam.End3D2D()
	end

 
end]]--



