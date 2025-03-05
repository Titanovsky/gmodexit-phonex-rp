include('shared.lua') 

function ENT:Draw()

	self:DrawModel()

	local ang = self:GetAngles()

	ang:RotateAroundAxis(ang:Forward(),90)
	ang:RotateAroundAxis(ang:Right(),CurTime() * 90)



	if self:GetPos():Distance(LocalPlayer():GetPos()) < 600 then
		cam.Start3D2D(self:GetPos()+Vector(0,0,80),ang,0.1)
			draw.RoundedBox(0,-95,-25,190,50,Color(0,0,0,230))
			draw.SimpleText("Скупщик мета","Trebuchet24",0,0,Color(255,255,130),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		cam.End3D2D()
	end


	if self:GetPos():Distance(LocalPlayer():GetPos()) < 600 then
		cam.Start3D2D(self:GetPos()+Vector(0,0,80),ang-Angle(0,-180,0),0.1)
			draw.SimpleText("Скупщик мета","Trebuchet24",0,0,Color(255,255,130),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		cam.End3D2D()
	end

end

local tab = {
	[ "$pp_colour_addr" ] = 0,
	[ "$pp_colour_addg" ] = 0,
	[ "$pp_colour_addb" ] = 0,
	[ "$pp_colour_brightness" ] = 0,
	[ "$pp_colour_contrast" ] = 0.61,
	[ "$pp_colour_colour" ] = 0.59,
	[ "$pp_colour_mulr" ] = 0,
	[ "$pp_colour_mulg" ] = 0,
	[ "$pp_colour_mulb" ] = 0
}


hook.Add("RenderScreenspaceEffects", "RMETH_OnMeth", function()
	if LocalPlayer():GetNWInt("MethHigh", 0) > 0 then
		DrawMaterialOverlay("models/shadertest/shader3", -0.01)
		DrawColorModify(tab)
	end
end)