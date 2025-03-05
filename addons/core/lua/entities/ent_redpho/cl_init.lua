 
include('shared.lua')
 
local mat = Material("drug.png")

function ENT:Draw()
    self:DrawModel()       -- Draw the model.

	

	if self:GetPos():Distance(LocalPlayer():GetPos()) < 600 then

	local cos = math.abs(math.cos(CurTime()*2))
	local angle1 = LocalPlayer():EyeAngles()
	angle1:RotateAroundAxis(angle1:Up(), -90)
	local angle = Angle(0,angle1.y,45) 
	    cam.Start3D2D(self:GetPos()+Vector(0,0,10+cos*1.5),angle,0.1)
		    	draw.RoundedBox(0,-75,-25,50,50,Color(0,0,0,230))
				draw.RoundedBox(0,-24.5,-25,100,50,Color(0,0,0,230))
				draw.SimpleText("Красный фосфор", "DermaDefault", -24.5+(100/2),-25+50*0.2, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)	
				if !self:GetCrushed() then
					draw.SimpleText("Нажмите Е чтобы разбить", "DermaDefault", -24.5+(100/2),-25+50*0.45, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				else
					draw.SimpleText("Количество: "..self:GetAmount(), "DermaDefault", -24.5+(100/2),-25+50*0.45, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
					draw.SimpleText("Ингредиент", "DermaDefault", -24.5+(100/2),-25+50*0.70, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				end
				surface.SetDrawColor(255,255,255)
				surface.SetMaterial(mat)
				surface.DrawTexturedRect(-70,-20,40,40)
	    cam.End3D2D()
 	end
end



--[[function ENT:Draw()
    self:DrawModel()       -- Draw the model.
 		local pos = nil
 		local ang = self:GetAngles()
    	if self:GetModel() == "models/props_junk/garbage_bag001a.mdl" then
    		pos = self:GetPos()+self:GetUp()*5
    		ang:RotateAroundAxis(ang:Up(),-90)

    	else
    		pos = self:GetPos()+self:GetUp()*-2.5+self:GetForward()*1.75
    		ang:RotateAroundAxis(ang:Right(),-90)
    		ang:RotateAroundAxis(ang:Up(),90)
    	end

    if self:GetPos():Distance(LocalPlayer():GetPos()) < 300 then  
        cam.Start3D2D(pos,ang,0.1)
	    	
	    	if !self:GetCrushed() then
	    		draw.RoundedBox(0,-90,-25,180,50,Color(0,0,0,230))
	    		draw.SimpleText("Red Phosphorus","RMeth",0,-13,Color(255,130,130),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	    		draw.SimpleText("Use to crush into dust","RMeth2",0,13,Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	    	else
	    		draw.RoundedBox(0,-150,-25,300,50,Color(0,0,0,230))
	    		draw.SimpleText("Crushed Red Phosphorus","RMeth",0,-13,Color(255,130,130),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	    		draw.SimpleText("Units: "..self:GetAmount(),"RMeth2",0,13,Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	    	end
    	cam.End3D2D()
    end
 
end]]--
