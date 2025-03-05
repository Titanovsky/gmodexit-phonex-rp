--[[
	Меню Управления Организацией

	[01.09.20]
		• Переименовал в cl_control.lua
	.
]]

local w = ScrW()
local h = ScrH()
local COLOR_PANEL = rgb( 0, 0, 0, 150 )

local function calcAllPlayersOrg( id )
    local max_players = 0
    for k, v in pairs( player.GetAll() ) do
        if tonumber( v:GetNWInt('amb_players_orgs_id') ) == id then max_players = max_players + 1 end
    end
    
    return max_players
end

local function collectStr( ... )
    local args = { ... }
    local str = args[1]..';'..args[2]..';'..args[3]..';'..args[4]

    return str
end

local function ranksMenuOpen( member )
    local id = tonumber( member:GetNWInt( 'amb_players_orgs_id' ) )

    local frame = vgui.Create( 'DFrame' )
    frame:SetSize( 320, 240 )
    frame:Center()
    frame:MakePopup()
    frame:SetTitle( '' )
    frame:ShowCloseButton( true )
    frame.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMETHYST )
        draw.RoundedBox( 0, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK ) 

        draw.SimpleText( member:GetNWString('amb_players_name'), "ambFont22", w/2, 36, AMB_COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        draw.SimpleText( member:GetNWString('amb_players_orgs_rank'), "ambFont18", w/2, 54, AMB_COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end

    for k, rank in pairs( AmbOrgs2.Orgs[id].Ranks ) do

        if k == 1 then continue end

        local btn = vgui.Create( 'DButton', frame )
        surface.SetFont('ambFont22')
        btn:SetSize( surface.GetTextSize(rank) + 12, 32 )
        btn:SetPos( frame:GetWide()/2 - btn:GetWide()/2, 82 * k / 1.8 )
        btn:SetFont( 'ambFont22' )
        btn:SetTextColor( AMB_COLOR_WHITE )
        btn:SetText( rank )
        btn.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMETHYST )
            draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK ) 
        end
        btn.DoClick = function()
            net.Start( 'amb_orgs_control_set_rank' )
                net.WriteEntity( member )
                net.WriteString( rank )
            net.SendToServer()
        end
    end
end

function AmbOrgs2.controlMenuOpen()

    if LocalPlayer():GetNWBool( 'amb_players_orgs' ) == false then chat.AddText('Доступ запрещён!') return end

    local id = tonumber( LocalPlayer():GetNWInt( 'amb_players_orgs_id' ) )
    local warehouse = AmbOrgs2.Orgs[id].Warehouse
    local leader = AmbOrgs2.Orgs[id].Leader_Name

    local ranks_org = {}

    local frame = vgui.Create( 'DFrame' )
    frame:SetSize( 620, 500 )
    frame:Center()
    frame:MakePopup()
    frame:SetTitle( tostring( id )..' | '..LocalPlayer():GetNWString( 'amb_players_orgs_name' ) )
    frame:ShowCloseButton( true )

    frame.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMETHYST )
        draw.RoundedBox( 0, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK ) 

        draw.SimpleText('ПАНЕЛЬ УПРАВЛЕНИЯ', "ambFont22", w/2, 24, AMB_COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

        draw.SimpleText('Онлайн: '..calcAllPlayersOrg( id ), "ambFont22", 24, h-82, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        draw.SimpleText('Лидер: '..leader, "ambFont22", 24, h-52, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        draw.SimpleText( warehouse..'$', "ambFont22", 92, h-22, AMB_COLOR_GREEN, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        draw.SimpleText('Склад:', "ambFont22", 24, h-24, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
    end

    local panel_ranks = vgui.Create( 'DPanel', frame )
    panel_ranks:SetSize( 260, 180 )
    panel_ranks:SetPos( frame:GetWide() - panel_ranks:GetWide() - 24, 48 )
    panel_ranks.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMETHYST )
        draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK ) 
    end

    for k, rank in pairs( AmbOrgs2.Orgs[id].Ranks ) do
        local te_rank = vgui.Create( 'DTextEntry', panel_ranks )
        te_rank:SetSize( 164, 32 )
        te_rank:SetPos( 8, -32 + 8 + 38 * k )
        te_rank:SetFont( 'ambFont22' )
        te_rank:SetValue( rank )
        ranks_org[k] = te_rank:GetValue()
        te_rank.OnChange = function( self )
            ranks_org[k] = self:GetValue()
        end
    end

    local send_ranks = vgui.Create( 'DButton', panel_ranks )
    send_ranks:SetSize( 64, 32 )
    send_ranks:SetPos( panel_ranks:GetWide() - send_ranks:GetWide() - 12, panel_ranks:GetTall()/2 - send_ranks:GetTall()/2)
    send_ranks:SetFont( 'ambFont18' )
    send_ranks:SetTextColor( AMB_COLOR_WHITE )
    send_ranks:SetText( 'send' )
    send_ranks.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMETHYST )
        draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK ) 
    end
    send_ranks.DoClick = function()

        if LocalPlayer():GetNWString('amb_players_orgs_rank') ~= AmbOrgs2.Orgs[id].Ranks[1] then frame:Remove() return end

        local r = collectStr( ranks_org[1],ranks_org[2],ranks_org[3],ranks_org[4] )
        if utf8.len( r ) > 100 then
            chat.AddText( 'Превышен лимит символов' )
            return
        else
            -- chat.AddText( collectStr( ranks_org[1],ranks_org[2],ranks_org[3],ranks_org[4] ) ) -- debug
            chat.AddText( 'Вы поменяли ранги!' )
            net.Start( 'amb_orgs_control_ranks' )
                net.WriteString( r )
                net.WriteUInt( id, 14 )
            net.SendToServer()
        end
    end

    local wrap_panel = vgui.Create( 'DPanel', frame )
    wrap_panel:SetSize( 300, 320 )
    wrap_panel:SetPos( 24, 48 )
    wrap_panel.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMETHYST )
    end

    local panel_members = vgui.Create( 'DScrollPanel', wrap_panel )
    panel_members:SetSize( wrap_panel:GetWide()-4, wrap_panel:GetTall()-4 )
    panel_members:SetPos( 2, 2 )
    panel_members.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_SMALL_BLACK ) 
    end


    for _, v in pairs( player.GetAll() ) do

        if ( tonumber( v:GetNWInt('amb_players_orgs_id') ) ~= id ) then continue end

        local member = panel_members:Add( 'DPanel' )
        member:Dock( TOP )
        member:SetSize( panel_members:GetWide(), 64 )
	    member:DockMargin( 4, 4, 4, 4 )
        member.Paint = function( self, w, h )
            draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL ) 

            draw.SimpleText( v:GetNWString('amb_players_name'), "ambFont18", 8, 12, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
            draw.SimpleText( v:GetNWString('amb_players_orgs_rank'), "ambFont18", 8, 32, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        end

        local uninvite = vgui.Create( 'DButton', member )
        timer.Simple( 0, function() uninvite:SetPos( member:GetWide() - uninvite:GetWide() - 4, member:GetTall() - uninvite:GetTall() - 4 ) end ) -- workaround
        uninvite:SetFont( 'ambFont18' )
        uninvite:SetTextColor( AMB_COLOR_RED )
        uninvite:SetText( 'uninvite' )
        uninvite.Paint = function( self, w, h )
            draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL )
        end
        uninvite.DoClick = function()
            chat.AddText('Вы выгнали игрока: '..v:GetNWString('amb_players_name') )
            net.Start( 'amb_orgs_control_uninvite' )
                net.WriteUInt( v:EntIndex(), 8 )
            net.SendToServer()
        end

        local rank = vgui.Create( 'DButton', member )
        timer.Simple( 0, function() rank:SetPos( member:GetWide() - rank:GetWide() - 4, member:GetTall() - rank:GetTall() - 28 ) end ) -- workaround
        rank:SetFont( 'ambFont18' )
        rank:SetTextColor( AMB_COLOR_AMBITION )
        rank:SetText( 'rank' )
        rank.Paint = function( self, w, h )
            draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL )
        end
        rank.DoClick = function()
            ranksMenuOpen( v )
            frame:Remove()
        end
    end

    local wrap_panel1 = vgui.Create( 'DPanel', frame )
    wrap_panel1:SetSize( 260, 132 )
    wrap_panel1:SetPos( frame:GetWide() - wrap_panel1:GetWide() - 24, 48 + panel_ranks:GetTall() + 8 )
    wrap_panel1.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMETHYST )
    end

    local panel_potencial_ply = vgui.Create( 'DScrollPanel', wrap_panel1 )
    panel_potencial_ply:SetSize( wrap_panel1:GetWide()-4, wrap_panel1:GetTall()-4 )
    panel_potencial_ply:SetPos( 2, 2 )
    panel_potencial_ply.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_SMALL_BLACK ) 
    end

    for k, v in pairs( player.GetAll() ) do
        if #v:GetNWString('amb_players_name') <= 0 or tonumber( v:GetNWInt('amb_players_level') ) < AmbOrgs2.min_level or v:GetNWBool('amb_players_orgs') then continue end


        local ply = panel_potencial_ply:Add( 'DPanel' )
        ply:Dock( TOP )
        ply:SetSize( wrap_panel1:GetWide()-4, 52 )
	    ply:DockMargin( 2, 2, 2, 2 )
        ply.Paint = function( self, w, h )
            draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL ) 

            draw.SimpleText( v:GetNWString('amb_players_name'), "ambFont18", 8, 12, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        end

        local invite = vgui.Create( 'DButton', ply )
        invite:SetPos( ply:GetWide() - invite:GetWide() - 4, ply:GetTall() - invite:GetTall() - 4 )
        timer.Simple( 0, function() invite:SetPos( ply:GetWide() - invite:GetWide() - 4, ply:GetTall() - invite:GetTall() - 4 ) end ) -- workaround
        invite:SetFont( 'ambFont18' )
        invite:SetTextColor( AMB_COLOR_WHITE )
        invite:SetText( 'invite' )
        invite.Paint = function( self, w, h )
            draw.RoundedBox( 4, 0, 0, w, h, COLOR_PANEL )
        end
        invite.DoClick = function()
            net.Start('amb_invite_org_cmd')
                net.WriteEntity( LocalPlayer() )
                net.WriteEntity( v )
            net.SendToServer()
        end
    end

    local combo = vgui.Create( "DComboBox", frame )
    combo:SetSize( 100, 20 )
    combo:SetPos( frame:GetWide() - wrap_panel1:GetWide() - 24, 48 + panel_ranks:GetTall() + 8 + wrap_panel1:GetTall() + 8  )
    combo:AddChoice( "Зам. Ничего не может" )
    combo:AddChoice( "Зам. Может приглашать" )
    combo:AddChoice( "Зам. Может приглашать и увольнять" )
    if tonumber( AmbOrgs2.Orgs[id].Org_Flag ) > 0 then
        combo:SetValue( combo:GetOptionText( tonumber( AmbOrgs2.Orgs[id].Org_Flag ) ) )
    else
        combo:SetValue( "Flag" )
    end
    combo:SetSortItems( false )
    combo.OnSelect = function( self, index, value )
        if LocalPlayer():GetNWString('amb_players_orgs_rank') ~= AmbOrgs2.Orgs[id].Ranks[1] then frame:Remove() return end

        net.Start('amb_orgs_control_flags')
            net.WriteUInt( tonumber( index ), 3)
        net.SendToServer()
    end
end
concommand.Add( "org_menu", AmbOrgs2.controlMenuOpen )

-- PrintTable( AmbOrgs2.Orgs )
