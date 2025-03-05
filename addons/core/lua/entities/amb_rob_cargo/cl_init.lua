include( 'shared.lua' )

local flags_colors = {
	AMB_COLOR_AMBITION,
	AMB_COLOR_ERROR
}

local function PrintChat( sText, nFlag )

	chat.AddText( flags_colors[ nFlag ], '[•] ', AMB_COLOR_WHITE, sText )

end

local max_dist = 2400
local font = 'ambFont22'
local COLOR_GREEN = Color( 0, 255, 0 )

local w_ent = 270
local h_ent = 120
local x_ent = -130
local y_ent = -182

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:DrawTranslucent()

	self:Draw()
	self:DrawShadow( false )

	local condition_color = self:GetNWBool( 'Stealing' ) and AMB_COLOR_RED or AMB_COLOR_GREEN

	if imgui.Entity3D2D( self, Vector( 28, 0, 24 ), Angle( 0, 90, 90 ), 0.1, 1200 ) then

		draw.RoundedBox( 4, x_ent, y_ent, w_ent, h_ent, AMB_COLOR_AMBITION )
		draw.RoundedBox( 4, x_ent + 6, y_ent + 6, w_ent - 12, h_ent - 12, AMB_COLOR_SMALL_BLACK )

		draw.SimpleTextOutlined( AmbRobCargo.cargo.name, 'ambFont32', 0, -160, AMB_COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
		draw.SimpleTextOutlined( 'Качество: '..self:Health(), 'ambFont22', 0, -136, AMB_COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )

		if imgui.xTextButton( 'Захватить', font, -66, -110, 140, 36, 2, condition_color, COLOR_GREEN, condition_color ) and ( LocalPlayer():GetPos():Distance( self:GetPos() ) <= 82 ) then

			if AmbRobCargo.criminal[ LocalPlayer():Team() ] and ( self:GetNWBool( 'Stealing' ) == false ) then

				net.Start( 'amb_rob_cargo' )
					net.WriteEntity( self )
				net.SendToServer()

			elseif not AmbRobCargo.criminal[ LocalPlayer():Team() ] then

				PrintChat( 'Ваша работа не подходит для ограбления!', 2 )

			elseif self:GetNWBool( 'Stealing' ) then

				PrintChat( 'Груз уже кто-то грабит', 2 )

			end

		end

    	imgui.End3D2D()

	end

end
