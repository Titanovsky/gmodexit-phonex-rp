include('shared.lua')


local mat = Material("meth.png")


function ENT:Draw()
    self:DrawModel() -- Draws Model Client Side

	

	if self:GetPos():Distance(LocalPlayer():GetPos()) < 600 then 
	local cos = math.abs(math.cos(CurTime()*2))
	local angle1 = LocalPlayer():EyeAngles()
	angle1:RotateAroundAxis(angle1:Up(), -90)
	local angle = Angle(0,angle1.y,45)
	    cam.Start3D2D(self:GetPos()+Vector(0,0,4+cos*1.5),angle,0.1)
		    	draw.RoundedBox(0,-75,-25,50,50,Color(0,0,0,230))
				draw.RoundedBox(0,-24.5,-25,100,50,Color(0,0,0,230))
				draw.SimpleText("Мет", "DermaDefault", -24.5+(100/2),-25+50*0.2, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				if self:GetQuality() <= 10 then
					draw.SimpleText("Ужасное качество", "DermaDefault", -24.5+(100/2),-25+50*0.45, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				elseif self:GetQuality() <= 30 then
					draw.SimpleText("Плохое качество", "DermaDefault", -24.5+(100/2),-25+50*0.45, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				elseif self:GetQuality() <= 50 then
					draw.SimpleText("Приемлемое качество", "DermaDefault", -24.5+(100/2),-25+50*0.45, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				elseif self:GetQuality() <= 70 then
					draw.SimpleText("Нормальное качество", "DermaDefault", -24.5+(100/2),-25+50*0.45, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				elseif self:GetQuality() <= 90 then
					draw.SimpleText("Отличное качество!", "DermaDefault", -24.5+(100/2),-25+50*0.45, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				else
					draw.SimpleText("Превосходное качество!", "DermaDefault", -24.5+(100/2),-25+50*0.45, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				end
				if self:GetWarm() then
					local warn = math.abs(math.cos(CurTime()*2))
					draw.SimpleText("Он слишком горяч!", "DermaDefault", -24.5+(100/2),-25+50*0.70, Color(255,255-warn*230,255-warn*230),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				end
				surface.SetDrawColor(255,255,255)
				surface.SetMaterial(mat)
				surface.DrawTexturedRect(-70,-20,40,40)
	    cam.End3D2D()
 	end
end
