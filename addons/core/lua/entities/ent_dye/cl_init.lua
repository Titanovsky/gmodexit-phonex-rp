 
include('shared.lua')


net.Receive("PickColorRMETH",function(len,ply)

	if IsValid(frame) then return end

	local frame = vgui.Create("DFrame")
	frame:SetSize(200, 150)
	frame:MakePopup()
	frame:Center()
	frame:SetTitle("Краситель")
	frame.Think = function(s)
		if LocalPlayer():Alive() then return end
		s:Close()
	end
	frame.OnClose = function(s)
		net.Start("PickColorRMETH")
		net.SendToServer()
	end

	local color = vgui.Create("DColorCube",frame)
	color:Dock(TOP)

	local color1 = vgui.Create( "DRGBPicker", frame )
	color1:Dock(LEFT)
	color1:DockMargin(0, 5, 0, 0)
	color1:SetSize(20,0)
	color1.OnChange = function(s)
		local col = color1:GetRGB()
		local h = ColorToHSV(col)
		color:SetColor( col )
	end

	local button = vgui.Create("DButton",frame)
	button:Dock(FILL)
	button:DockMargin(5,5,0,0)
	button:SetText("Принять")
	button.DoClick = function(s)
		net.Start("PickColorRMETH")
			local col = color:GetRGB()
			net.WriteColor(Color(col.r,col.g,col.b))
		net.SendToServer()
	end

end)

local mat = Material("dye.png")

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
				draw.SimpleText("Краситель", "DermaDefault", -24.5+(100/2),-25+50*0.2, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				draw.SimpleText("Одноразовый", "DermaDefault", -24.5+(100/2),-25+50*0.45, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				draw.SimpleText("Ухудшает качество", "DermaDefault", -24.5+(100/2),-25+50*0.70, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)

				local col = self:GetColorC()
				surface.SetDrawColor(col.x,col.y,col.z)
				surface.SetMaterial(mat)
				surface.DrawTexturedRect(-70,-20,40,40)
	    cam.End3D2D()
 	end
end
