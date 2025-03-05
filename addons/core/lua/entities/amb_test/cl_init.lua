include( 'shared.lua' )

local max_dist = 1600
local font = 'ambFont22'

function ENT:Draw()

	self:DrawShadow( false )

    local _,max = self:GetRotatedAABB( self:OBBMins(), self:OBBMaxs() )
    local rot = ( self:GetPos() - EyePos() ):Angle().yaw - 90
	local center = self:LocalToWorld( self:OBBCenter() )

	if ( self:GetPos():Distance( LocalPlayer():GetPos() ) < max_dist ) then

		self:DrawModel()

		cam.Start3D2D( center + Vector( 0, 0, -16 ), Angle( 0, rot, 90 ), 0.13 )

	        draw.SimpleTextOutlined( self:GetNWString( 'Name' ), font, 24, 0, AMB_COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )

	    cam.End3D2D()

	end

end