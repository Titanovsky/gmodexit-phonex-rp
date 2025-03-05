--[[
    Обычненький Табик.
    Сервер находится в полном подчинений проекта: [ Ambition ]

    [24.07.20]
        • Полностью сделал TAB;
    .
    [31.07.20]
        • Добавил обычный update через sc.Think(). Засунул дочерние панельки в функцию, и эту функцию вызываю + хуки в sv_tab.lua;
    .
    [03.07.20]
        • Добавил к скролбару sc:GetTall(), т.к раньше измерял длину от h (хз зачем) и из-за этого не было видно последнего игрока!
    .
    [11.07.20]
        • Ещё уменьшил скролбару и пофиксил баг, что у админов не появлялась кнопка с админским менб
    .
    [19.08.20]
        • Убрал у sc.Think обновление, т.к оно корявое. Всё работает просто через net, когда игрок коннектится, либо дисконектится
    .
    [26.09.20]
        • Добавил amb_tab_name
    .
]]

CreateClientConVar( 'amb_tab_admins', '1', true )
CreateClientConVar( 'amb_tab_buttons', '1', true )
CreateClientConVar( 'amb_tab_info', '1', true )
CreateClientConVar( 'amb_tab_name', '1', true )

local w = ScrW()
local h = ScrH()

local COLOR_TEXT = Color( 240, 240, 240 )
local COLOR_MAIN = Color( 214, 137, 56 )
local COLOR_SUBMAIN = Color( 54, 54, 54 )
local COLOR_PANEL_OUTLINE = Color( 221, 129, 56 )
local COLOR_PANEL = Color( 72, 72, 72 )

local BLUR = Material( "pp/blurscreen.png", "noclamp" )

local function DrawBlur(panel, amount)

    local x, y = panel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()

    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(BLUR)

    for i = 1, 3 do
        BLUR:SetFloat( "$BLUR", (i / 3) * (amount or 6) )
        BLUR:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
    end

end

local function AmbTab_formReason( text, flag, ply )

    local frame = vgui.Create( "DFrame" )
    frame:SetSize(620, 110)
    frame:SetPos( w/2 - frame:GetWide()/2, h/2 - frame:GetTall()/2 )
    frame:SetTitle("")
    frame:MakePopup()
    frame:ShowCloseButton( true )
    frame.Paint = function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, COLOR_MAIN )
        draw.RoundedBox( 0, 4, 4, w-8, h-8, COLOR_SUBMAIN )

        draw.SimpleText(text, "ambFont22", frame:GetWide()/2, 32, COLOR_TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

    end

    local te_reason = vgui.Create( "DTextEntry", frame )

    te_reason:SetSize( frame:GetWide() - 20, 32 )
    te_reason:SetPos( 10, frame:GetTall() - te_reason:GetTall() - 10 )
    te_reason:SetValue( "" )
    te_reason:SetAllowNonAsciiCharacters(true)
    te_reason.OnEnter = function( self )

        frame:Remove()

        if ( #self:GetValue() == 0 ) then return end

        if ( flag == 1 ) then

            LocalPlayer():ConCommand( 'ulx kick "'..ply..'" "'..te_reason:GetValue()..'"' )

        elseif ( flag == 2 ) then

            LocalPlayer():ConCommand( 'ulx warn "'..ply..'" "'..te_reason:GetValue()..'"' )

        elseif ( flag == 3 ) then

            LocalPlayer():ConCommand( 'ulx asay "'..te_reason:GetValue()..'"'  )

        end

    end
end

local delay = 0
local delay_tab = 0

net.Receive( 'amb_tab_update', function(len)

    if ValidPanel( sc ) then AmbTab_createDivs() end

end )


local function AmbTab_create( flag )

    sc = vgui.Create("DFrame") -- scoreboard
    sc:SizeTo( w, h, .3, 0, -1 )
	sc:SetSize( 0, h )
	sc:SetPos( 0, 0 )
	sc:SetTitle("")
	sc:SetDraggable(false)
	sc:ShowCloseButton(false)
	sc.Paint = function(self, w, h )
        DrawBlur( self, 1 )
		draw.RoundedBox(0, 0, 0, w/2, h, COLOR_MAIN )
	end

    --sc.Think = function() -- доделать auto refresh
    --    if CurTime() < delay then return end
	--        sc:Refill()
	--    delay = CurTime() + 2
    --end

    sc.logo = vgui.Create( "DPanel", sc )
    sc.logo:SetSize( w/2 - 8, 76 )
    sc.logo:SetPos( 4, 4 )
    sc.logo.Paint = function(self, w, h)

		draw.RoundedBox(0, 0, 0, w, h, COLOR_SUBMAIN )

        draw.SimpleText(GetHostName(), "ambFont32", sc.logo:GetWide()/2, sc.logo:GetTall()/2, COLOR_TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

	end

    AmbTab_createDivs()

end

function AmbTab_createDivs( main_panel )

    if ValidPanel( sc.panel ) then sc.panel:Remove() end

    sc.panel = vgui.Create( "DScrollPanel", sc )
    sc.panel:SetSize( w/2 - 8, sc:GetTall() - 84 )
    sc.panel:SetPos( 4, 84 )
    sc.panel.Paint = function(self, w, h)

        draw.RoundedBox(0, 0, 0, w, h, COLOR_SUBMAIN )

    end

    local sbar = sc.panel:GetVBar()
    sbar:SetSize( 0, 0)


    for k, v in pairs( player.GetAll() ) do

        if !IsValid( v ) then end

        --if v:SteamID() == 'STEAM_0:1:95303327' then continue end 

        sc.player = sc.panel:Add( "DPanel" )
        sc.player:SetSize( sc.panel:GetWide() - 8, 82 )
        sc.player:Dock( TOP )
        sc.player:DockMargin( 2, 2, 2, 2 )
        sc.player.Paint = function(self, w, h)

            draw.RoundedBox(6, 2, 2, w-4, h-4, COLOR_PANEL )

            if !IsValid( v ) then return end

            if ( AmbPlayersImgs.imgs[ v:SteamID() ] ) then

                surface.SetDrawColor( 255,255,255,255 )
		        surface.SetMaterial( AmbPlayersImgs.imgs[ v:SteamID() ] )
                surface.DrawTexturedRect( 2, 2, 624, 78 )

                draw.SimpleText( v:EntIndex(), "Default", 4, 8, COLOR_TEXT, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

            end

            if ( GetConVar( 'amb_tab_info' ):GetBool() == true ) then

                if ( utf8.len( v:GetNWString("amb_players_name") ) > 2 ) then 
                
                    draw.SimpleText( v:GetNWString("amb_players_name")..' ['..v:EntIndex()..']', "ambFont22", 78, 14, COLOR_TEXT, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

                else

                    draw.SimpleText( v:Nick()..' ['..v:EntIndex()..']', "ambFont22", 78, 14, COLOR_TEXT, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

                end

                if ( tonumber( v:GetNWInt("amb_orgs") ) > 0 ) then

                    draw.SimpleText( AmbOrgs[ tonumber( v:GetNWInt("amb_orgs") ) ].name..' ('..team.GetName( v:Team() )..')', "ambFont18", sc.panel_avatar:GetWide() + 14, 48, COLOR_TEXT, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

                else

                    draw.SimpleText( team.GetName( v:Team() ), "ambFont18", sc.panel_avatar:GetWide() + 14, 34, COLOR_TEXT, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

                end


                draw.SimpleText( "P: "..v:Ping(), "ambFont18", sc.player:GetWide() - 6, 14, COLOR_TEXT, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
                draw.SimpleText( "K: "..v:Frags(), "ambFont18", sc.player:GetWide() - 6, 40, COLOR_TEXT, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
                draw.SimpleText( "D: "..v:Deaths(), "ambFont18", sc.player:GetWide() - 6, 64, COLOR_TEXT, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )

            end

        end


        sc.panel_avatar = vgui.Create( "DPanel", sc.player )
        sc.panel_avatar:SetSize( 72, 72 )
        sc.panel_avatar:SetPos( 6, 5 )
        sc.panel_avatar.Paint = function(self, w, h)

            if ( IsValid( v ) ) then

                draw.RoundedBox(64, 0, 0, w, h, team.GetColor( v:Team() ) )

            end

        end

        if ( !v:IsBot() ) then

            sc.panel_button = vgui.Create( "DButton", sc.player ) -- костыль
            sc.panel_button:SetSize( 72, 72 )
            sc.panel_button:SetText("")
            sc.panel_button:SetPos( 6, 5 )
            sc.panel_button.Paint = function(self, w, h)

                draw.RoundedBox(64, 0, 0, w, h, Color( 0,0,0,0 ) )

            end
            sc.panel_button.DoClick = function()

                v:ShowProfile()

            end

        end

        if ( LocalPlayer():GetUserGroup() ~= "user" and GetConVar( 'amb_tab_admins' ):GetBool() ) then

            sc.info_button = vgui.Create( "DButton", sc.player )
            sc.info_button:SetSize( 32, 54 )
            sc.info_button:SetText("")
            sc.info_button:SetPos( sc.player:GetWide()/2, 24 )
            sc.info_button.Paint = function(self, w, h)

                draw.RoundedBox(6, 0, 0, w, h, Color(0,0,0,190) )

            end
            sc.info_button.DoClick = function( self )

                if ValidPanel( sc.grid ) then sc.grid:Remove() end

                sc.grid = vgui.Create( "DGrid", self:GetParent() )
                sc.grid:SetAlpha( 0 )
                sc.grid:AlphaTo( 255, 0.4, 0 )
                sc.grid:SetPos( sc.player:GetWide()/2 + sc.info_button:GetWide() + 12, 22 )
                sc.grid:SetCols( 5 )
                sc.grid:SetRowHeight( 32 )
                sc.grid:SetColWide( 28 )
                sc.grid.Paint = function( self, w, h )

                    draw.RoundedBox(4, 0, 0, w, h, Color(0,0,0,0) )

                end

                sc.steamid = vgui.Create( "DButton" )
                sc.steamid:SetText( "ID" )
                sc.steamid:SetTextColor( COLOR_TEXT )
                sc.steamid:SetSize( 24, 24 )
                sc.steamid.Paint = function( self, w, h )

                    draw.RoundedBox(4, 0, 0, w, h, Color( 0,255,255,50 ) )

                end
                sc.steamid.DoClick = function()

                    chat.AddText( COLOR_MAIN, "[•] ", COLOR_TEXT, "Вы скопировали: "..v:SteamID() )
                    SetClipboardText( v:SteamID() )

                end
                sc.grid:AddItem( sc.steamid )

                sc.kick = vgui.Create( "DButton" )
                sc.kick:SetText( "K" )
                sc.kick:SetTextColor( COLOR_TEXT )
                sc.kick:SetSize( 24, 24 )
                sc.kick.Paint = function( self, w, h )

                    draw.RoundedBox(4, 0, 0, w, h, Color( 255,0,0,55 ) )

                end
                sc.kick.DoClick = function()

                    sc:Close()
                    AmbTab_formReason( "Назовите причину кика", 1, v:Nick() )

                end
                sc.grid:AddItem( sc.kick )

                sc.warn = vgui.Create( "DButton" )
                sc.warn:SetText( "W" )
                sc.warn:SetTextColor( COLOR_TEXT )
                sc.warn:SetSize( 24, 24 )
                sc.warn.Paint = function( self, w, h )

                    draw.RoundedBox(4, 0, 0, w, h, Color(255,0,0,55) )

                end
                sc.warn.DoClick = function()

                    sc:Close()
                    AmbTab_formReason( "Введите причину Варна", 2, v:Nick() )

                end
                sc.grid:AddItem( sc.warn )

                sc.slap = vgui.Create( "DButton" )
                sc.slap:SetText( "S" )
                sc.slap:SetTextColor( COLOR_TEXT )
                sc.slap:SetSize( 24, 24 )
                sc.slap.Paint = function( self, w, h )

                    draw.RoundedBox(4, 0, 0, w, h, Color(255,0,0,55) )

                end
                sc.slap.DoClick = function()

                    LocalPlayer():ConCommand( 'ulx slap "'..v:Nick()..'" 1' )

                end
                sc.grid:AddItem( sc.slap )

                sc.gag = vgui.Create( "DButton" )
                sc.gag:SetText( "G" )
                sc.gag:SetTextColor( COLOR_TEXT )
                sc.gag:SetSize( 24, 24 )
                sc.gag.Paint = function( self, w, h )

                    draw.RoundedBox(4, 0, 0, w, h, Color(140,20,80,200) )

                end
                sc.gag.DoClick = function()

                    LocalPlayer():ConCommand( 'ulx gag "'..v:Nick()..'"' )

                end
                sc.grid:AddItem( sc.gag )

                sc.mute = vgui.Create( "DButton" )
                sc.mute:SetText( "M" )
                sc.mute:SetTextColor( COLOR_TEXT )
                sc.mute:SetSize( 24, 24 )
                sc.mute.Paint = function( self, w, h )

                    draw.RoundedBox(4, 0, 0, w, h, Color(140,20,80,200) )

                end
                sc.mute.DoClick = function()

                    LocalPlayer():ConCommand( 'ulx mute "'..v:Nick()..'"' )

                end
                sc.grid:AddItem( sc.mute )

                sc.tp = vgui.Create( "DButton" )
                sc.tp:SetText( "G" )
                sc.tp:SetTextColor( COLOR_TEXT )
                sc.tp:SetSize( 24, 24 )
                sc.tp.Paint = function( self, w, h )

                    draw.RoundedBox(4, 0, 0, w, h, Color(20,155,20,200) )

                end
                sc.tp.DoClick = function()

                    LocalPlayer():ConCommand( 'ulx goto "'..v:Nick()..'"' )

                end
                sc.grid:AddItem( sc.tp )

                sc.bring = vgui.Create( "DButton" )
                sc.bring:SetText( "B" )
                sc.bring:SetTextColor( COLOR_TEXT )
                sc.bring:SetSize( 24, 24 )
                sc.bring.Paint = function( self, w, h )

                    draw.RoundedBox(4, 0, 0, w, h, Color(20,155,20,200) )

                end
                sc.bring.DoClick = function()
                    LocalPlayer():ConCommand( 'ulx bring "'..v:Nick()..'"' )
                end
                sc.grid:AddItem( sc.bring )

                sc.returns = vgui.Create( "DButton" )
                sc.returns:SetText( "R" )
                sc.returns:SetTextColor( COLOR_TEXT )
                sc.returns:SetSize( 24, 24 )
                sc.returns.Paint = function( self, w, h )

                    draw.RoundedBox(4, 0, 0, w, h, Color(20,155,20,200) )

                end
                sc.returns.DoClick = function()

                    LocalPlayer():ConCommand( 'ulx return "'..v:Nick()..'"' )

                end
                sc.grid:AddItem( sc.returns )

                sc.info = vgui.Create( "DButton" )
                sc.info:SetText( "I" )
                sc.info:SetTextColor( Color(0,0,0) )
                sc.info:SetSize( 24, 24 )
                sc.info.Paint = function( self, w, h )

                    draw.RoundedBox(4, 0, 0, w, h, Color(255,255,255,220) )

                end
                sc.info.DoClick = function()

                    sc:Close()
                    AmbTab_formReason( "Введите Ник нарушителя и кратко опишите Жалобу", 3 )

                end
                sc.grid:AddItem( sc.info )

            end

        end

        local x, _ = 0
        
        if !v:IsBot() and GetConVar('amb_tab_buttons'):GetBool() then
            surface.SetFont('ambFont22')
            if utf8.len( v:GetNWString('amb_players_name') ) > 1 then
                x = surface.GetTextSize( v:GetNWString("amb_players_name")..' ['..v:EntIndex()..']' )
            else
                x = surface.GetTextSize( v:Nick()..' ['..v:EntIndex()..']' )
            end
            sc.steamid = vgui.Create( "DButton", sc.player )
            sc.steamid:SetSize( 24, 24 )
            sc.steamid:SetTextColor( COLOR_TEXT )
            sc.steamid:SetText("ID")
            sc.steamid:SetPos( 82 + x, 4 )
            sc.steamid.Paint = function(self, w, h)
                draw.RoundedBox(6, 0, 0, w, h, Color(0,0,0,190) )
            end
            sc.steamid.DoClick = function( self )
                chat.AddText( COLOR_MAIN, "[•] ", COLOR_TEXT, "Вы скопировали: "..v:SteamID() )
                chat.AddText( COLOR_MAIN, "[•] ", COLOR_TEXT, "Index: "..v:EntIndex() )
                SetClipboardText( v:SteamID() )
            end

            sc.report = vgui.Create( "DButton", sc.player )
            sc.report:SetSize( 24, 24 )
            sc.report:SetTextColor( COLOR_TEXT )
            sc.report:SetText("R")
            sc.report:SetPos( 82 + x + sc.report:GetWide() + 4, 4 )
            sc.report.Paint = function(self, w, h)
                draw.RoundedBox(6, 0, 0, w, h, Color(0,0,0,190) )
            end
            sc.report.DoClick = function( self )
                sc:Close()
                AmbTab_formReason( "Введите Ник нарушителя и кратко опишите Жалобу", 3 )
            end

            sc.gag_button = vgui.Create( "DButton", sc.player )
            sc.gag_button:SetSize( 24, 24 )
            sc.gag_button:SetTextColor( COLOR_TEXT )
            if v:IsMuted() then
                sc.gag_button:SetText("uG")
            else
                sc.gag_button:SetText("G")
            end
            sc.gag_button:SetPos( 82 + x + sc.report:GetWide() + 4 + sc.gag_button:GetWide() + 4, 4 )
            sc.gag_button.Paint = function(self, w, h)
                draw.RoundedBox(6, 0, 0, w, h, Color(0,0,0,190) )
            end
            sc.gag_button.DoClick = function( self )
                if v:IsMuted() then
                    v:SetMuted( false )
                     self:SetText("G")
                else
                    v:SetMuted( true )
                    self:SetText("uG")
                end
            end
        end

        if LocalPlayer():GetNWInt("amb_orgs_lead") > 0 and v != LocalPlayer() then
            sc.invite = vgui.Create( "DButton", sc.player )
            sc.invite:SetSize( 44, 24 )
            sc.invite:SetTextColor( COLOR_TEXT )
            if v:GetNWInt("amb_orgs") == LocalPlayer():GetNWInt("amb_orgs") then
                sc.invite:SetText("uninvite")
            else
                sc.invite:SetText("invite")
            end
            sc.invite:SetPos( 82 + x + sc.report:GetWide() + 4 + sc.gag_button:GetWide() + 4 + sc.invite:GetWide() + 4, 4 )
            sc.invite.Paint = function(self, w, h)
                draw.RoundedBox(6, 0, 0, w, h, Color(0,0,0,190) )
            end
            sc.invite.DoClick = function( self )
                if ( v:GetNWInt("amb_orgs") == LocalPlayer():GetNWInt("amb_orgs") ) then
                    LocalPlayer():ConCommand( 'org_uninvite "'..v:SteamID()..'"' )
                    self:SetText("invite")
                else
                    LocalPlayer():ConCommand( 'org_invite "'..v:SteamID()..'"' )
                    self:SetText("uninvite")
                end
            end
        end

        sc.avatar = vgui.Create( "EnhancedAvatarImage", sc.panel_avatar )
        sc.avatar:SetSize( sc.panel_avatar:GetWide() - 4, sc.panel_avatar:GetTall() - 4 )
        sc.avatar:SetPos( 2, 2 )
        sc.avatar:SetPlayer( v, 64 )
    end
end

hook.Add( "ScoreboardShow", "amb_0x864", function()
    if ( !ValidPanel( sc ) ) then
        AmbTab_create()
        gui.EnableScreenClicker(true)
    end

	return true
end )

hook.Add( "ScoreboardHide", "amb_0x864", function()
    if ( !ValidPanel( sc ) ) then
        AmbTab_create()
    end

    sc:Close()
    gui.EnableScreenClicker( false )
    --sc:SizeTo( 0, h, .1, 0, -1, function() sc:Close() gui.EnableScreenClicker( false ) end ) -- проблема, что иногда не закрывается
	return true
end )



AmbPlayersImgs = AmbPlayersImgs or {}
AmbPlayersImgs.imgs = AmbPlayersImgs.imgs or {}


net.Receive( 'amb_scoreboard_send_img', function( len )

    local img_url = net.ReadString()
    local ply = net.ReadEntity()

    timer.Simple( 1, function()
        local cache = 'amb_'..util.CRC( img_url )..'.png'
        AmbCache.Picture.startCache( 'url', img_url )

        timer.Simple( 3, function() 
            AmbPlayersImgs.imgs[ ply:SteamID()  ] = AmbCache.Picture.imgs[ cache ]
        end )
    end )
end )

net.Receive( 'amb_scoreboard_remove_img', function( len )

    local ply = net.ReadEntity()

    AmbPlayersImgs.imgs[ ply:SteamID() ] = nil
end )

net.Receive( 'amb_scoreboard_update_img', function( len )

    local tab = net.ReadTable()

    -- PrintTable( tab )

    AmbPlayersImgs.imgs = {}

    timer.Simple( 1, function()
        for id, url in pairs( tab ) do
            local cache = 'amb_'..util.CRC( url )..'.png'
            AmbCache.Picture.startCache( 'url', url )

            timer.Simple( 3, function() 
                AmbPlayersImgs.imgs[ id ] = AmbCache.Picture.imgs[ cache ]
            end )
        end
    end )

    --tab = nil
end )

-- PrintTable( AmbCache.Picture.imgs ) -- debug