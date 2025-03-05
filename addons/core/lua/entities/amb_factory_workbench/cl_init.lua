include("shared.lua")

local max_dist = 2400
local font = 'ambFont32'


function ENT:Draw()
    self:DrawShadow( false )

	local pos = self:GetPos()
	local ang = self:GetAngles()
	local status = ( self:GetNWBool( "amb_WorkbenchBusy" ) ) and 'Крафтится..' or 'Верстак  [2]'
    local color =  ( self:GetNWBool( "amb_WorkbenchBusy" ) ) and AMB_COLOR_RED or AMB_COLOR_AMETHYST
    surface.SetFont( font )
    local x, _ = surface.GetTextSize( status )

	ang:RotateAroundAxis( ang:Up(), 90)


	if ( self:GetPos():Distance( LocalPlayer():GetPos() ) < max_dist ) then
        self:DrawModel()


		cam.Start3D2D( pos + ang:Up() * 36.6, ang, 0.15 )
			draw.RoundedBox( 4, -333, 128, 666, 24, color ) -- cool numbers :D
	        draw.SimpleTextOutlined( status, font, -x/2, 0, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
	    cam.End3D2D()
	end
end
