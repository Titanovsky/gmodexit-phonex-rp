include("shared.lua")

function AmbFactoryShowTimeTable( n, index )
    timer.Create( 'AmbTableReload'..index, n, 1, function() end )
end

local max_dist = 2400
local font = 'ambFont22'

function ENT:Draw()
    self:DrawShadow( false )

	local pos = self:GetPos()
	local ang = self:GetAngles()
	local status = ( self:GetNWBool( "amb_TableReload" ) ) and 'Металла нет (Загружается..)' or 'Раздатчик Металла  [1]'
    local time = ( timer.Exists('AmbTableReload'..self:EntIndex()) ) and math.Round( timer.TimeLeft('AmbTableReload'..self:EntIndex()) ) or ''
    local color =  ( self:GetNWBool( "amb_TableReload" ) ) and AMB_COLOR_RED or AMB_COLOR_GREEN
    surface.SetFont( font )
    local x, _ = surface.GetTextSize( status )

	ang:RotateAroundAxis( ang:Up(), 90)

	if ( self:GetPos():Distance( LocalPlayer():GetPos() ) < max_dist ) then
        self:DrawModel()

		cam.Start3D2D( pos + ang:Up() * 16.8, ang, 0.15 )
			draw.RoundedBox( 4, -370, -140, 740, 270, AMB_COLOR_AMBITION )
			draw.RoundedBox( 4, -370 + 8, -140 + 8, 740 - 16, 270 - 16, AMB_COLOR_SMALL_BLACK )
	        draw.SimpleTextOutlined( status, font, -x/2, 0, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
            draw.SimpleTextOutlined( time, 'ambFont32', -x/2 + 120, 64, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
	    cam.End3D2D()
	end
end
