include( 'shared.lua' )

local flags_colors = {
	AMB_COLOR_AMBITION,
	AMB_COLOR_ERROR
}

local function PrintChat( sText, nFlag )

	chat.AddText( flags_colors[ nFlag ], '[•] ', AMB_COLOR_WHITE, sText )

end

local w_panel = 304
local h_panel = 124
local COLOR_PANEL = Color( 0, 0, 0, 200 )

local function CheckUpdate( ent, nUpdate )

	if ( tonumber( LocalPlayer():getDarkRPVar( 'money' ) ) >= ent.Chunks[ nUpdate ].price ) and ( ent:GetNWInt( 'Level_'..ent.Chunks[ nUpdate ].name ) < ent.Chunks[ nUpdate ].max ) then return AMB_COLOR_GREEN end

	return AMB_COLOR_RED

end

local function ShowMenuMoneyPrinters( ent )

	local frame = vgui.Create( 'DFrame' )
	frame:SetSize( 668, 444 )
	frame:Center()
	frame:SetTitle( '' )
	frame:MakePopup()
	frame.Paint = function( self, w, h )

		draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
		draw.RoundedBox( 4, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK )

	end

	local scroll = vgui.Create( "DScrollPanel", frame )
	scroll:Dock( FILL )

	local grid = vgui.Create( 'DGrid', scroll )
	grid:SetPos( 12, 32 )
	grid:SetCols( 2 )
	grid:SetColWide( w_panel + 12 )
	grid:SetRowHeight( h_panel + 12 )

	for id, upd in pairs( ent.Chunks ) do 
		
		local update = vgui.Create( 'DPanel' )
		update:SetSize( w_panel, h_panel )
		update.Paint = function( self, w, h )

			draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL )
			draw.SimpleTextOutlined( upd.header, 'ambFont22', w/2, 26, AMB_COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
			draw.SimpleTextOutlined( 'Максимум: '..ent:GetNWInt( 'Level_'..upd.name )..'/'..upd.max, 'ambFont18', 6, h-48, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
			draw.SimpleTextOutlined( 'Кол-во: '..upd.count, 'ambFont18', 6, h-30, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
			draw.SimpleTextOutlined( 'Цена: ', 'ambFont18', 6, h-12, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK )
			if not upd.spec then

				draw.SimpleTextOutlined( upd.price*ent:GetNWInt( 'Level_'..upd.name )..'$', 'ambFont18', 48, h-11, CheckUpdate( ent, id ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK ) 

			else 

				draw.SimpleTextOutlined( upd.price..'$', 'ambFont18', 48, h-11, CheckUpdate( ent, id ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLACK ) 
				
			end

		end
		grid:AddItem( update )

		local send = vgui.Create( 'DButton', update )
		send:SetSize( 72, 26 )
		send:SetPos( update:GetWide() - send:GetWide() - 6, update:GetTall() - send:GetTall() - 6 )
		send:SetFont( 'ambFont18' )
		send:SetTextColor( CheckUpdate( ent, id ) )
		send:SetText( 'Купить' )
		send.Paint = function( self, w, h )

			draw.RoundedBox( 1, 0, 0, w, h, CheckUpdate( ent, id ) )
			draw.RoundedBox( 1, 2, 2, w-4, h-4, COLOR_PANEL )

		end
		send.DoClick = function()

			if ( tonumber( LocalPlayer():GetNWInt( 'amb_players_money' ) ) >= upd.price ) and ( ent:GetNWInt( 'Level_'..upd.name ) < upd.max ) then

				frame:Remove()
				
				net.Start( 'amb_money_printer_update' )
					net.WriteEntity( ent )
					net.WriteUInt( id, 4 )
				net.SendToServer()

			else

				surface.PlaySound( 'buttons/button10.wav' )

			end

		end

	end
 
end

function ENT:GetColorMode()

	if ( self:GetNWInt( 'Mode' ) == 0 ) then return Color( 200, 0, 0 ) end
	if ( self:GetNWInt( 'Mode' ) == 1 ) then return Color( 0, 200, 0 ) end
	if ( self:GetNWInt( 'Mode' ) == 2 ) then return AMB_COLOR_AMETHYST end

end

local function CreateTimer()

-- TO DO

end

local font = 'ambFont22'
local COLOR_GREEN = Color( 0, 255, 0 )
local panel = { w = 340, h = 220, x = -170, y = -110 }

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:DrawTranslucent()

	self:Draw()
	self:DrawShadow( false )

	if imgui.Entity3D2D( self, Vector( 0, 0, 6 ), Angle( 0, 90, 0 ), 0.1, 600 ) then

		draw.RoundedBox( 4, panel.x, panel.y, panel.w, panel.h, AMB_COLOR_AMBITION )
		draw.RoundedBox( 4, panel.x + 6, panel.y + 6, panel.w - 12, panel.h - 12, AMB_COLOR_SMALL_BLACK )

		draw.SimpleTextOutlined( '•', 'ambFont32', 156, -110, self:GetColorMode(), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )

		draw.SimpleTextOutlined( 'Стабильность: '..self:Health(), 'ambFont22', -155, -90, AMB_COLOR_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )
		draw.SimpleTextOutlined( 'Заряд: '..self:GetNWInt( 'Charge' ), 'ambFont22', -155, -60, AMB_COLOR_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )
		draw.SimpleTextOutlined( 'Деньги: '..self:GetNWInt( 'Money' )..'$', 'ambFont22', -155, -30, AMB_COLOR_BLUE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )
		draw.SimpleTextOutlined( 'PhonexCoins: '..math.Round( self:GetNWFloat( 'PhonexCoins' ), 3 )..'f', 'ambFont22', -155, 0, AMB_COLOR_AMETHYST, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )

		draw.SimpleTextOutlined( self:GetNWInt( 'Up_Money' )..'$/'..self:GetNWInt( 'Up_Speed' )..' с  |  '..math.Round( self:GetNWFloat( 'Up_PhonexCoins' ) + #player.GetHumans()/1000, 3 )..'f/'..self:GetNWInt( 'Up_Speed' )..' с', 'ambFont18', -155, 30, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )

		--w 318
		if imgui.xTextButton( 'Снять', font, -160, 60, 64, 36, 2, AMB_COLOR_GREEN, COLOR_GREEN, AMB_COLOR_GREEN ) and ( LocalPlayer():GetPos():Distance( self:GetPos() ) <= 125 ) then

			net.Start( 'amb_money_printer_take' )
				net.WriteEntity( self )
			net.SendToServer()

		end

		if imgui.xTextButton( 'Переключить', font, -90, 60, 134, 36, 2, AMB_COLOR_GREEN, COLOR_GREEN, AMB_COLOR_GREEN ) and ( LocalPlayer():GetPos():Distance( self:GetPos() ) <= 125 ) then

			net.Start( 'amb_money_printer_switch' )
				net.WriteEntity( self )
			net.SendToServer()

		end

		if imgui.xTextButton( 'Улучшить', font, 50, 60, 109, 36, 2, AMB_COLOR_GREEN, COLOR_GREEN, AMB_COLOR_GREEN ) and ( LocalPlayer():GetPos():Distance( self:GetPos() ) <= 125 ) then

			ShowMenuMoneyPrinters( self )

		end

    	imgui.End3D2D()

	end

end