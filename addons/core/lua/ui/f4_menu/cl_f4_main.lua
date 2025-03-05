--[[
	F4Menu для сервера DarkRP.
	Сервер находится в полном подчинений проекта: [ Ambition ]

	steamcommunity.com/groups/ambitiongmod -- steam
	vk.com/ambitiongmod -- vk

	[11.08.20]
		• Первая версия F4Menu (DarkRP).
	.
	[18.08.20] -- DarkRP
		• Доделан полностью
	.
	[13.10.20] -- DarkRP
		• Поправил адаптивность и добавил кнопку 'Content'
	.
]]

local function DisplayNotify( msg ) -- сугубо ДаркРПшная херня
    local text = msg:ReadString() 
    GAMEMODE:AddNotify( text, msg:ReadShort(), msg:ReadLong() )
end
usermessage.Hook("_Notify", DisplayNotify)


surface.CreateFont( "amb_breach32", {
	font = "Calibri", 
	size = 32,
})

surface.CreateFont( "amb_breach22", {
	font = "Calibri", 
	size = 22,
})

-- ## DEFINES #########################
local COLOR_MAIN	= Color( 45, 49, 48 ) 
local COLOR_SUBMAIN	= Color( 52, 152, 219 ) 
local COLOR_TEXT	= Color( 255, 255, 255 ) 
local bind_menu 	= KEY_F4
local w 			= ScrW()
local h 			= ScrH()
local speed_anim	= 0.24

local url_rule 		= "https://steamcommunity.com/groups/ambitiongmod/discussions/1/2918850377439698156/"
local url_vk 		= "https://vk.com/ambgmod"
local url_steam		= "https://steamcommunity.com/groups/ambitiongmod"
local url_discord 	= "https://discord.gg/G4vzxrq" 
local url_content 	= 'https://steamcommunity.com/sharedfiles/filedetails/?id=2211965287'

local AmbF4Menu = {}
local has_f4menu = false -- существует ли?

local btns_menu = {
	['Инфо'] = { AMB_COLOR_RED, AMB_COLOR_WHITE },
	['Магазин'] = { AMB_COLOR_GREEN, AMB_COLOR_WHITE },
	['Оружия'] = { AMB_COLOR_BLUE, AMB_COLOR_WHITE },
	['Работы'] = { AMB_COLOR_AMETHYST, AMB_COLOR_WHITE },
	['Донат'] = { AMB_COLOR_SMALL_BLACK, AMB_COLOR_WHITE }
}

local jobs_darkrp = RPExtraTeams
local weapons_darkrp = DarkRPEntities-- мда.. кто мешал Фальке отдельную таблу создать???
local shipments_darkrp = CustomShipments -- только щас заметил, там второе поле для аргументов, что это ???????
local ents_darkrp = DarkRPEntities
-- ####################################



function AmbF4Menu:Init()
	self.active = true -- выполнялась бы анимация + построение новой строки?
	if ( has_f4menu ) then
		self.active = false
		self:Close() 
		has_f4menu = false 
		return 
	end
	self:SetSize( w/1.8, h/1.4 )
	self:SetPos( w/2-self:GetWide()/2, h/2-self:GetTall()/8 )
	self:MakePopup()
	self:SetTitle( '' )
	self:SetDraggable( false )
	self:ShowCloseButton( false )
	self.Paint = function( self, w, h )
		surface.SetFont("amb_breach22")
		draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,0) ) -- debug
	end
	has_f4menu = true

    self.btns = vgui.Create( 'DGrid', self )
    self.btns:SetPos( 0, 0 )
    --self.btns:SetSize( 0, 200 )
    self.btns:SetCols( 5 )
    self.btns:SetColWide( self:GetWide()/5+1 )
    self.btns:SetRowHeight( 74 )
    self.btns.Paint = function( self, w, h )
		surface.SetFont("amb_breach22")
		draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_RED ) -- debug
	end

	self.menu = vgui.Create( 'DPanel', self )
	self.menu:SetPos( 0, self.btns:GetRowHeight() )
	self.menu:SetSize( 0, 0 )
	self.menu.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_MILK )
	end

    for name, v in SortedPairsByMemberValue( btns_menu ) do
        local but = vgui.Create( "DButton" )
		but:SetFont('ambFont18')
        but:SetText('')
        but:SetSize( self.btns:GetColWide(), self.btns:GetRowHeight() )
        self.btns:AddItem( but )
        but.DoClick = function()
            --self:Remove()
			self:setUpDivs( name, v[1] )
        end
		but.origfont = 'ambFont18'
		but.font = 'ambFont18'
		but.origcolor = v[1]
		but.color = v[1]
		but.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, self.color )
			draw.SimpleText( name, self.font, self:GetWide()/2, self:GetTall()/2 + 20, v[2], TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		end
		but.OnCursorEntered = function( self )
			self.font = 'ambFont22'
			--self.color = Color(255,0,0)
		end
		but.OnCursorExited = function( self )
			self.font = self.origfont
			--self.color = self.origcolor
		end
    end

    /*
	self.logo = vgui.Create( "DPanel", self )
	self.logo:SetSize( a*1.8, 42)
	self.logo:SetPos( self:GetWide()/2-a, 8 )
	self.logo.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, COLOR_SUBMAIN )
		draw.RoundedBox( 0, 2, 2, w-4, h-2, COLOR_MAIN )
		draw.SimpleText( logo_text, "amb_breach22", 
		w/2, h/2, 
		COLOR_TEXT, 
		TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
    */
end

function AmbF4Menu:setUpDivs( menu, col )
	if !(self) then return end
	local x_main, y_main = self:GetPos()
	if self.active then
		self:MoveTo( x_main, y_main - self:GetTall()/2.6, 0.24, 0, -1, function() 
			self.menu:SizeTo( self:GetWide(), self:GetTall(), 0.24, 0, -1, function() self:setUpMenu( menu, col ) end ) 
		end )
		--self:SizeTo( self:GetWide(), h/1.6, 0.4, 0, -1, function() end )
		self.active = false
	else
		self:setUpMenu( menu, col )
	end
end

local function checkAllowed( allowed )
	for k, v in pairs( allowed ) do
		--PrintTable( allowed ) -- debug
		if ( LocalPlayer():Team() == v ) then return true end
	end
	return false
end

local function becameJob( job )
	if ( RPExtraTeams[job].vote ) then
		RunConsoleCommand( 'say', '/vote'..RPExtraTeams[job].command )
	else
		RunConsoleCommand( 'say', '/'..RPExtraTeams[job].command )
	end
end

function AmbF4Menu:setUpMenu( menu, col )
	if ValidPanel( self.menu_info ) then self.menu_info:Remove() end
	if ValidPanel( self.menu_shop ) then self.menu_shop:Remove() end
	if ValidPanel( self.menu_weapons ) then self.menu_weapons:Remove() end
	if ValidPanel( self.menu_help ) then self.menu_help:Remove() end
	if ValidPanel( self.menu_donate ) then self.menu_donate:Remove() end
	
	if ( menu == 'Инфо' ) then
		self.menu_info = vgui.Create( 'DPanel', self.menu )
		self.menu_info:SetSize( self.menu:GetWide(), self.menu:GetTall() )
		self.menu_info:SetPos( 0, 0 )
		self.menu_info.Paint = function( self, w, h )
			draw.DrawText( LocalPlayer():GetNWString('amb_players_name'), 'ambFont32', 168, 24, AMB_COLOR_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

			draw.DrawText( 'Ник: ', 'ambFont22', 162, 64, AMB_COLOR_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			draw.DrawText( LocalPlayer():Nick(), 'ambFont22', 164 * 1.6, 64, AMB_COLOR_AMBITION, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

			draw.DrawText( 'SteamID: ', 'ambFont22', 162, 64*1.4, AMB_COLOR_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			draw.DrawText( LocalPlayer():SteamID(), 'ambFont22', 162 * 1.6, 64*1.4, AMB_COLOR_AMBITION, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

			draw.DrawText( 'Кошелёк: ', 'ambFont22', 162, 64*1.8, AMB_COLOR_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			draw.DrawText( LocalPlayer():getDarkRPVar('money')..' $', 'ambFont22', 162 * 1.6, 64*1.8, AMB_COLOR_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		end

		local panel_avatar = vgui.Create( 'DPanel', self.menu_info )
		panel_avatar:SetPos( 24, 24 )
		panel_avatar:SetSize( 132, 132 )
		panel_avatar.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMBITION )
		end

		local avatar = vgui.Create( 'AvatarImage', panel_avatar )
		avatar:SetSize( 124, 124 )
		avatar:SetPos( 4, 4 )
		avatar:SetPlayer( LocalPlayer(), 124 )

		local btn_vk = vgui.Create( 'DButton', self.menu_info )
		btn_vk:SetSize( 94, 32 )
		btn_vk:SetPos( self.menu_info:GetWide() - btn_vk:GetWide() - 12, 36 )
		btn_vk:SetFont( 'ambFont22' )
		btn_vk:SetTextColor( AMB_COLOR_AMBITION )
		btn_vk:SetText('VK')
		btn_vk.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
			draw.RoundedBox( 2, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
		end
		btn_vk.DoClick = function()
			gui.OpenURL( url_vk )
		end

		local btn_steam = vgui.Create( 'DButton', self.menu_info )
		btn_steam:SetSize( 94, 32 )
		btn_steam:SetPos( self.menu_info:GetWide() - btn_vk:GetWide() - 12, 36 * 2 )
		btn_steam:SetFont( 'ambFont22' )
		btn_steam:SetTextColor( AMB_COLOR_AMBITION )
		btn_steam:SetText('Steam')
		btn_steam.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
			draw.RoundedBox( 2, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
		end
		btn_steam.DoClick = function()
			gui.OpenURL( url_steam )
		end

		local btn_discord = vgui.Create( 'DButton', self.menu_info )
		btn_discord:SetSize( 94, 32 )
		btn_discord:SetPos( self.menu_info:GetWide() - btn_vk:GetWide() - 12, 36 * 3 )
		btn_discord:SetFont( 'ambFont22' )
		btn_discord:SetTextColor( AMB_COLOR_AMBITION )
		btn_discord:SetText('Discord')
		btn_discord.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
			draw.RoundedBox( 2, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
		end
		btn_discord.DoClick = function()
			gui.OpenURL( url_discord )
		end

		local btn_rules = vgui.Create( 'DButton', self.menu_info )
		btn_rules:SetSize( 94, 32 )
		btn_rules:SetPos( self.menu_info:GetWide() - btn_vk:GetWide() - 108, 36 )
		btn_rules:SetFont( 'ambFont22' )
		btn_rules:SetTextColor( AMB_COLOR_AMBITION )
		btn_rules:SetText('Rules')
		btn_rules.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
			draw.RoundedBox( 2, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
		end
		btn_rules.DoClick = function()
			gui.OpenURL( url_rule )
		end

		local btn_content = vgui.Create( 'DButton', self.menu_info )
		btn_content:SetSize( 94, 32 )
		btn_content:SetPos( self.menu_info:GetWide() - btn_vk:GetWide() - 108, 36 * 2 )
		btn_content:SetFont( 'ambFont22' )
		btn_content:SetTextColor( AMB_COLOR_AMBITION )
		btn_content:SetText('Content')
		btn_content.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
			draw.RoundedBox( 2, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
		end
		btn_content.DoClick = function()
			gui.OpenURL( url_content )
		end
		

	elseif ( menu == 'Оружия' ) then
		self.menu_shop = vgui.Create( 'DPanel', self.menu )
		self.menu_shop:SetSize( self.menu:GetWide(), self.menu:GetTall() )
		self.menu_shop:SetPos( 0, 0 )
		self.menu_shop.Paint = function( w, h )
			draw.DrawText('• Коробки •', "ambFont22", self.menu_shop:GetWide()-186, 2, AMB_COLOR_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			draw.DrawText('• Пушки •', "ambFont22", 56, 2, AMB_COLOR_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		end

		local panels_list = vgui.Create("DScrollPanel", self.menu_shop )
		panels_list:SetSize( self.menu_shop:GetWide() - 260, self.menu_shop:GetTall() - 108 )
		panels_list:SetPos( 6, 32 )
		--panels_list:EnableVerticalScrollbar(true)
		panels_list.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0) )
		end

		local grid = vgui.Create( "DGrid", panels_list )
		grid:SetPos( 0, 0 )
		grid:SetCols( 2 )
		grid:SetColWide( panels_list:GetWide()/2-4 )
		grid:SetRowHeight( 66 )

		
		for k, wep in pairs( DarkRPEntities ) do
			if ( wep.is_weapon ) then
				if wep.allowed then
					if ( checkAllowed( wep.allowed ) == false ) then continue end -- !!!
				end
				local panel = vgui.Create( "DPanel" )
				panel:SetSize( grid:GetColWide() - 4, 64 )
				grid:AddItem( panel )
				panel.Paint = function( self, w, h )
					draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_BLACK )
					draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_MILK )

					draw.SimpleText( wep.name, 'ambFont22', 64, 20, AMB_COLOR_SMALL_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
					draw.SimpleText( wep.price..'$', 'ambFont22', 64, 48, AMB_COLOR_SMALL_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
				end

				local btn_buy = vgui.Create( "DButton", panel )
				btn_buy:SetSize( 58, 26 )
				btn_buy:SetPos( panel:GetWide() - btn_buy:GetWide() - 4 , panel:GetTall() - btn_buy:GetTall() - 4 )
				btn_buy:SetFont('ambFont18')
				if LocalPlayer():getDarkRPVar('money') >= wep.price then
					btn_buy:SetTextColor( AMB_COLOR_GREEN )
				else
					btn_buy:SetTextColor( AMB_COLOR_RED )
				end
				btn_buy:SetText('Купить')
				btn_buy.DoClick = function()
					LocalPlayer():ConCommand( 'say /'..wep.cmd )
				end
				btn_buy.Paint = function( self, w, h )
					draw.RoundedBox( 8, 0, 0, w, h, AMB_COLOR_SMALL_BLACK )
				end

				local icon = vgui.Create( "ModelImage", panel )
				icon:SetSize( 64, 64 )
				icon:SetPos( 4, 4 )
				icon:SetModel( wep.model )
			end
		end

		local panels_list_shipments = vgui.Create("DScrollPanel", self.menu_shop )
		panels_list_shipments:SetSize( self.menu_shop:GetWide() - 476, self.menu_shop:GetTall() - 108 )
		panels_list_shipments:SetPos( 6 + panels_list:GetWide() + 12, 32 )
		--panels_list:EnableVerticalScrollbar(true)
		panels_list_shipments.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0) )
		end

		local grid_shipments = vgui.Create( "DGrid", panels_list_shipments )
		grid_shipments:SetPos( 0, 0 )
		grid_shipments:SetCols( 1 )
		grid_shipments:SetColWide( panels_list_shipments:GetWide() )
		grid_shipments:SetRowHeight( 66 )
		
		for q, shipment in pairs( CustomShipments ) do
			if ( shipment.allowed ) then
				if ( checkAllowed( shipment.allowed ) == false ) then continue end
			end
			local panel = vgui.Create( "DPanel" )
			panel:SetSize( 220, 64 )
			grid_shipments:AddItem( panel )
			panel.Paint = function( self, w, h )
				draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_BLACK )
				draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_MILK )

				draw.SimpleText( shipment.name, 'ambFont22', 64, 20, AMB_COLOR_SMALL_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
				draw.SimpleText( shipment.price..'$', 'ambFont22', 64, 48, AMB_COLOR_SMALL_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			end

			local btn_buy = vgui.Create( "DButton", panel )
			btn_buy:SetSize( 58, 26 )
			btn_buy:SetPos( panel:GetWide() - btn_buy:GetWide() - 4 , panel:GetTall() - btn_buy:GetTall() - 4 )
			btn_buy:SetFont('ambFont18')
			if LocalPlayer():getDarkRPVar('money') >= shipment.price then
				btn_buy:SetTextColor( AMB_COLOR_GREEN )
			else
				btn_buy:SetTextColor( AMB_COLOR_RED )
			end
			btn_buy:SetText('Купить')
			btn_buy.DoClick = function()
				LocalPlayer():ConCommand( 'say /buyshipment '..shipment.name )
			end
			btn_buy.Paint = function( self, w, h )
				draw.RoundedBox( 8, 0, 0, w, h, AMB_COLOR_SMALL_BLACK )
			end

			local icon = vgui.Create( "ModelImage", panel )
			icon:SetSize( 64, 64 )
			icon:SetPos( 4, 4 )
			icon:SetModel( shipment.model )
		end

	elseif ( menu == 'Магазин' ) then
		self.menu_shop = vgui.Create( 'DPanel', self.menu )
		self.menu_shop:SetSize( self.menu:GetWide(), self.menu:GetTall() )
		self.menu_shop:SetPos( 0, 0 )

		local panels_list = vgui.Create("DScrollPanel", self.menu_shop )
		panels_list:SetSize( self.menu_shop:GetWide() - 24, self.menu_shop:GetTall() - 82 )
		panels_list:SetPos( 12, 4 )
		--panels_list:EnableVerticalScrollbar(true)
		panels_list.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0) )
		end

		local grid = vgui.Create( "DGrid", panels_list )
		grid:SetPos( 0, 0 )
		grid:SetCols( 1 )
		grid:SetColWide( panels_list:GetWide() )
		grid:SetRowHeight( 88 )
		
		for k, ent in pairs( DarkRPEntities ) do
			if ent.is_weapon then return end
			if ( ent.allowed ) then
				if ( checkAllowed( ent.allowed ) ~= true ) then continue end
			end
			local panel = vgui.Create( "DPanel" )
			panel:SetSize( panels_list:GetWide() - 24, 82 )
			grid:AddItem( panel )
			panel.Paint = function( self, w, h )
				draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_BLACK )
				draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_MILK )

				draw.SimpleText( ent.name, 'ambFont22', 72, 20, AMB_COLOR_SMALL_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
				draw.SimpleText( ent.price..'$', 'ambFont22', 72, 48, AMB_COLOR_SMALL_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			end

			local btn_buy = vgui.Create( "DButton", panel )
			btn_buy:SetSize( 58, 26 )
			btn_buy:SetPos( panel:GetWide() - btn_buy:GetWide() - 4 , panel:GetTall() - btn_buy:GetTall() - 4 )
			btn_buy:SetFont('ambFont18')
			if LocalPlayer():getDarkRPVar('money') >= ent.price then
				btn_buy:SetTextColor( AMB_COLOR_GREEN )
			else
				btn_buy:SetTextColor( AMB_COLOR_RED )
			end
			btn_buy:SetText('Купить')
			btn_buy.DoClick = function()
				LocalPlayer():ConCommand( 'say /'..ent.cmd )
			end
			btn_buy.Paint = function( self, w, h )
				draw.RoundedBox( 8, 0, 0, w, h, AMB_COLOR_SMALL_BLACK )
			end

			local icon = vgui.Create( "ModelImage", panel )
			icon:SetSize( 64, 64 )
			icon:SetPos( 4, 4 )
			icon:SetModel( ent.model )
		end
	elseif ( menu == 'Работы' ) then
		self.menu_shop = vgui.Create( 'DPanel', self.menu )
		self.menu_shop:SetSize( self.menu:GetWide(), self.menu:GetTall() )
		self.menu_shop:SetPos( 0, 0 )

		local panels_list = vgui.Create("DScrollPanel", self.menu_shop )
		panels_list:SetSize( self.menu_shop:GetWide() - 12, self.menu_shop:GetTall() - 82 )
		panels_list:SetPos( 4, 4 )
		panels_list.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0) )
		end

		local grid = vgui.Create( "DGrid", panels_list )
		grid:SetPos( 0, 0 )
		grid:SetCols( 1 )
		grid:SetColWide( panels_list:GetWide() )
		grid:SetRowHeight( 86 )
		
		for k, job in pairs( RPExtraTeams ) do
			local panel = vgui.Create( "DPanel" )
			panel:SetSize( panels_list:GetWide() - 20, 82 )
			grid:AddItem( panel )
			panel.Paint = function( self, w, h )
				draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_BLACK )
				draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_MILK )

				draw.SimpleText( job.name, 'ambFont22', 82, 14, AMB_COLOR_SMALL_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
				draw.SimpleText( 'LVL: '..job.lvl, 'ambFont22', 82, 36, AMB_COLOR_SMALL_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
				draw.SimpleText( job.description, 'Default', 192, panel:GetTall() - 12, AMB_COLOR_SMALL_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			end

			local btn_buy = vgui.Create( "DButton", panel )
			btn_buy:SetSize( 102, 26 )
			btn_buy:SetPos( 82 , panel:GetTall() - btn_buy:GetTall() - 8 )
			btn_buy:SetFont('ambFont18')
			if ( tonumber( LocalPlayer():GetNWFloat('amb_players_level') ) >= job.lvl ) then
				btn_buy:SetTextColor( AMB_COLOR_GREEN )
			else
				btn_buy:SetTextColor( AMB_COLOR_RED )
			end
			if ( job.NeedToChangeFrom ) then
				if job.NeedToChangeFrom == LocalPlayer():Team() then 
					btn_buy:SetTextColor( AMB_COLOR_GREEN ) 
				else 
					btn_buy:SetTextColor( AMB_COLOR_RED ) 
				end
			end
			btn_buy:SetText('Устроиться')
			btn_buy.DoClick = function()
				if ( #job.model > 1 ) then 
					self:becameJob( k )
				else
					becameJob( k )
				end
			end
			btn_buy.Paint = function( self, w, h )
				draw.RoundedBox( 6, 0, 0, w, h, AMB_COLOR_SMALL_BLACK )
			end

			local icon_frame = vgui.Create( 'DPanel', panel )
			icon_frame:SetSize( 68, 68 )
			icon_frame:SetPos( 8, 6 )
			icon_frame.Paint = function( self, w, h )
				draw.RoundedBox( 0, 0, 0, w, h, job.color )
				draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
			end

			local icon = vgui.Create( "ModelImage", icon_frame )
			icon:SetSize( 64, 64 )
			icon:SetPos( 2, 2 )
			icon:SetModel( job.model[1] )
		end
	elseif ( menu == 'Донат' ) then
		self:Remove()
		RunConsoleCommand( 'say', '/donat' )
		self.menu_shop = vgui.Create( 'DPanel', self.menu )
		self.menu_shop:SetSize( self.menu:GetWide(), self.menu:GetTall() )
		self.menu_shop:SetPos( 0, 0 )

		local text = vgui.Create('DLabel', self.menu_shop )
		text:SetPos( self.menu_shop:GetTall()/2-#menu, 6 )
		text:SetTextColor( AMB_COLOR_AMBITION )
		text:SetFont('ambFont32')
		text:SetText('Донатик сюды)')
		text:SizeToContents()
	end
end

function AmbF4Menu:becameJob( job )
	local col_mdl_frame = AMB_COLOR_AMBITION

	local main = vgui.Create( 'DFrame' ) 
	main:SetSize( 540, 340 )
	main:SetTitle( '' )
	main:Center()
	main:MakePopup()
	main.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMBITION )
		draw.RoundedBox( 0, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK )

		draw.SimpleText( 'Выберите модель: ', 'ambFont32', 24, 18, AMB_COLOR_AMBITION, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end

	local skins = vgui.Create( 'DGrid', main )
	skins:SetPos( 18, 48 )
	skins:SetCols( 7 )
	skins:SetColWide( 72 )
	skins:SetRowHeight( 72 )

	for k, skin in pairs( RPExtraTeams[job].model ) do
		local mdl_frame = vgui.Create( 'DPanel' ) 
		mdl_frame:SetSize( 68, 68 )
		mdl_frame:SetPos( 0, 4 * k )
		mdl_frame.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, col_mdl_frame )
			draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
		end
		skins:AddItem( mdl_frame )

		local mdl = vgui.Create( 'ModelImage', mdl_frame )
		mdl:SetSize( 64, 64 )
		mdl:SetPos( 2, 2 )
		mdl:SetModel( skin )

		local btn = vgui.Create( 'DButton', mdl )
		btn:SetSize( mdl:GetWide(), mdl:GetTall() )
		btn:SetPos( 12, 12 )
		btn:SetText( '' )
		btn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,0) )
		end
		btn.DoClick = function()
			main:Remove()
			becameJob( job )
		end
	end
end


function AmbF4Menu:OnRemove()
	if ( has_f4menu ) then 
		has_f4menu = false
		gui.EnableScreenClicker( false )
	end
end

function AmbF4Menu:OnKeyCodePressed( bind )
    if ( bind == bind_menu ) then
    	self:Init()
    end
end
vgui.Register("AMBf4menu", AmbF4Menu, "DFrame")

function AmbF4Menu.CreateF4Menu()
	f4_menu = vgui.Create( "AMBf4menu")
end
concommand.Add( "amb_f4menu_open", AmbF4Menu.CreateF4Menu)

hook.Add("PlayerBindPress", "amb_f4menu_bind", function( ply, bind )
	if input.IsKeyDown( bind_menu ) then
		AmbF4Menu.CreateF4Menu()
	end
end )