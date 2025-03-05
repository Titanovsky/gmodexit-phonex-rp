include('shared.lua')



local mat = Material("lab.png")

function ENT:Draw()
    self:DrawModel()       -- Draw the model.

	

	if self:GetPos():Distance(LocalPlayer():GetPos()) < 600 then 
	local cos = math.abs(math.cos(CurTime()*2))
	local angle1 = LocalPlayer():EyeAngles()
	angle1:RotateAroundAxis(angle1:Up(), -90)
	local angle = Angle(0,angle1.y,45)
	    cam.Start3D2D(self:GetPos()+Vector(0,0,19+cos*1.5),angle,0.1)
		    	draw.RoundedBox(0,-75,-25,50,50,Color(0,0,0,230))
				draw.RoundedBox(0,-24.5,-25,100,50,Color(0,0,0,230))
				draw.SimpleText("Колбы", "DermaDefault", -24.5+(100/2),-25+50*0.2, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				draw.SimpleText("Лабораторное оборудование", "DermaDefault", -24.5+(100/2),-25+50*0.45, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				surface.SetDrawColor(255,255,255)
				surface.SetMaterial(mat)
				surface.DrawTexturedRect(-70,-20,40,40)
	    cam.End3D2D()
 	end
end

