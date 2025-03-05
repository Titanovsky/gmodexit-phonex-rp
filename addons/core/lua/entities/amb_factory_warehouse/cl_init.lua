include("shared.lua")

local max_dist = 1600
local color_back = Color( 0, 0, 0, 245 )
local font = 'ambFont32'
local name = 'Склад'
surface.SetFont( font )
local x_text, _ = surface.GetTextSize( name ) 



function ENT:Draw()
	self:DrawShadow( false )

	local pos = self:GetPos()
	local ang = self:GetAngles()
	ang:RotateAroundAxis( ang:Up(), 90 )

	if self:GetPos():Distance( LocalPlayer():GetPos() ) < max_dist then
		self:DrawModel()
		
		cam.Start3D2D( pos + ang:Up() * 42 + ang:Right() * 24 + ang:Forward() * -5, ang + Angle( 0, 0, 90 ), 0.15 )

			draw.RoundedBox( 6, 0, 0, x_text + 12, 44, color_back )
	        draw.SimpleText( 'Склад', font, 6, 21, AMB_COLOR_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

			draw.RoundedBox( 6, -90, 54, 250, 166, color_back )
			draw.SimpleTextOutlined( 'Макеты:', 'ambFont22', -88, 66, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
			draw.SimpleTextOutlined( self:GetNWInt( 'Instance' ), 'ambFont18', -6, 68, AMB_COLOR_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )

			draw.SimpleTextOutlined( 'AK-47  |  '..self:GetNWInt( 'Instance_AK47' ), 'ambFont18', -88, 84 + 21, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
			draw.SimpleTextOutlined( 'M4A1  |  '..self:GetNWInt( 'Instance_M4A1' ), 'ambFont18', -88, 84 + 21 * 2, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
			draw.SimpleTextOutlined( 'PM  |  '..self:GetNWInt( 'Instance_PM' ), 'ambFont18', -88, 84 + 21 * 3, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
			draw.SimpleTextOutlined( 'Desert Eagle  |  '..self:GetNWInt( 'Instance_DesertEagle' ), 'ambFont18', -88, 84 + 21 * 4, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
			draw.SimpleTextOutlined( 'AWP  |  '..self:GetNWInt( 'Instance_AWP' ), 'ambFont18', -88, 84 + 21 * 5, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
			draw.SimpleTextOutlined( 'RPG-7  |  '..self:GetNWInt( 'Instance_RPG' ), 'ambFont18', -88, 84 + 21 * 6, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )

			if self:GetNWInt('Plus') > 0 then
				draw.SimpleText( '+'..self:GetNWInt('Plus'), 'ambFont18', 32, -144, AMB_COLOR_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			end
		
	    cam.End3D2D()
	end
end
