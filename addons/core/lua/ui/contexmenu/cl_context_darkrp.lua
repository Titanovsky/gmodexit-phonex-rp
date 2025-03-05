--[[
	C Menu, откуда-то спизженная примерно 2017-2018 году..
	Сервер находится в полном подчинений проекта: [ Ambition ]

    [20.08.20]
        • Сделал ахуительную кнопку доната и в отличии от недосерверов сделал, чтобы её можно было выключить.
        • Написал в sv_ecomonic.lua свою фукнцию покупки патронов.
    .
    [28.08.20]
        • Так как многие не понимают, что надо вписать число в lottery, то убрал стандартный SetText()
    .
    [28.09.20]
        • Исправил баг, когда много нажимаешь C меню и зависает панелька с законами
    .

    todo: попробовать переделать Context Menu под Grid (юзать кнопки)
]]

if ( AMB == false ) then return end

AmbContext = AmbContext or {}

CreateClientConVar( 'amb_darkrp_laws', '1', true )
CreateClientConVar( 'amb_context_donat', '1', true )

local w = ScrW()
local h = ScrH()

local delay = 0 

local COLOR_CONTEXT = Color( 255, 255, 255, 200 )
local COLOR_LAWS = Color( 0, 0, 0, 240 )

AmbContext.icons_donate = {
    'icon16/star.png',
    'icon16/lightning.png',
    'icon16/heart.png',
    'icon16/male.png',
    'icon16/ruby.png',
    'icon16/world.png',
    'icon16/cake.png',
    'icon16/pill_add.png',
    'icon16/wand.png',
    'icon16/rainbow.png',
    'icon16/rosette.png'
}

AmbContext.text_pin = {
    '❖',
    '✩',
    '✪',
    '✿',
    '(͡° ͜ʖ ͡°)'
}

AmbContext.icons = {
    ['shop'] = 'icon16/star.png',
    ['sellalldoors'] = 'icon16/door_open.png',
    ['ammo'] = 'icon16/bullet_black.png',
    ['advert'] = 'icon16/eye.png',
    ['money'] = 'icon16/money_delete.png',
    ['lockdown_open'] = 'icon16/bell_add.png',
    ['lockdown_close'] = 'icon16/bell_delete.png',
    ['dropweapon'] = 'icon16/arrow_down.png'
}

function AmbContext.openMenu( flag )

    if ( ValidPanel( amb_context_laws ) ) then amb_context_laws:Remove() end

    if ( GetConVar('amb_darkrp_laws'):GetBool() ) and flag == 1 then
        amb_context_laws = vgui.Create( 'DPanel' )
        amb_context_laws:SetSize( 480, 220 )
        amb_context_laws:SetPos( 110, 40 )
        amb_context_laws.Paint = function( self, w, h )
            draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
            draw.RoundedBox( 4, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK )

            draw.SimpleText( 'Чтобы убрать введите /laws 0', 'Default', 8, 200, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

            for k, law in pairs( DarkRP.getLaws() ) do
                draw.SimpleText( law, 'ambFont18', 12, 20*k, AMB_COLOR_AMBITION, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
            end
        end
    end


    if ( LocalPlayer():Alive() == false ) then return end

    amb_context_menu = vgui.Create( 'DMenu' )
    amb_context_menu.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, COLOR_CONTEXT )
    end

    if ( GetConVar( 'amb_context_donat' ):GetBool() ) then
        local pin = table.Random( AmbContext.text_pin )
        local donate = amb_context_menu:AddOption( pin..' Магазин '..pin, function() 
            RunConsoleCommand( 'say', '/donat' )
            surface.PlaySound( 'ui/buttonclick.wav' )
        end )
        donate:SetImage( AmbContext.icons.shop )
        donate:SetFont('ambFont18')
        donate.Think = function()
            donate:SetTextColor( HSVToColor(  ( CurTime() * 22 ) % 360, 1, 1 ) )
            if ( CurTime() > delay ) then
                delay = CurTime() + 1.25
                donate:SetImage( table.Random( AmbContext.icons_donate ) )
            end
        end
        donate.OnCursorEntered = function()
            surface.PlaySound( 'ui/buttonrollover.wav' )
        end
        amb_context_menu:AddSpacer()
    end

    if LocalPlayer():GetNWBool('amb_players_orgs') then
        local orgs = amb_context_menu:AddOption( "Меню Организации", function() 
            RunConsoleCommand( "org_menu", "" ) 
        end )
        orgs:SetImage( 'icon16/world.png' )
        orgs:SetFont('ambFont18')
    end

    if LocalPlayer():isCP() then

        if ( LocalPlayer():Team() == Tmayor ) then

            local requestlic = amb_context_menu:AddOption( "Оформить Лицензию", function() 
                RunConsoleCommand( "say", "/givelicense" ) 
            end )
            requestlic:SetImage( "icon16/page_add.png" )
            requestlic:SetFont('ambFont18')

            local lottery = amb_context_menu:AddOption( 'Запустить Лотерею', function() 
                AmbContext.box( 'Приз в $', 'Запустить', "", function( count ) RunConsoleCommand( 'say', '/lottery '..count ) end )
            end )
            lottery:SetImage( "icon16/page_add.png" )
            lottery:SetFont('ambFont18')

            if ( GetConVar( 'phonexrp_lockdown' ):GetBool() ) then

                local lockdown = amb_context_menu:AddOption( "Отменить Ком. Час", function() 
                    RunConsoleCommand( 'amb_lockdown_off', '' ) 
                end )
                lockdown:SetImage( "icon16/page_add.png" )
                lockdown:SetFont('ambFont18')
                
            else

                local lockdown = amb_context_menu:AddOption( "Объявить Ком. Час", function() 
                    AmbContext.box( 'Причина Ком. Часа?', 'Запустить', "", function( sReason ) RunConsoleCommand( 'amb_lockdown_on', sReason ) end )
                end )
                lockdown:SetImage( "icon16/page_add.png" )
                lockdown:SetFont('ambFont18')

            end

            amb_context_menu:AddSpacer()

            local addlaw = amb_context_menu:AddOption( 'Добавить Закон', function() 
                AmbContext.box( "Закон", "Объявить", "", function( law ) RunConsoleCommand( 'say', '/addlaw '..law ) end )
            end )
            addlaw:SetImage( "icon16/page_add.png" )
            addlaw:SetFont('ambFont18')

            local removelaw = amb_context_menu:AddOption( 'Уничтожить Закон', function() 
                AmbContext.box( "Номер Закона", "Уничтожить", "", function( law ) RunConsoleCommand( 'say', '/removelaw '..law ) end )
            end )
            removelaw:SetImage( "icon16/page_add.png" )
            removelaw:SetFont('ambFont18')

            amb_context_menu:AddSpacer()
        end

        local sub_wanted, ed = amb_context_menu:AddSubMenu("Объявить в Розыск")
        ed:SetImage( "icon16/group_edit.png" )
        for _, ply in pairs( player.GetAll() ) do
            if ( LocalPlayer() ~= ply ) and ( #ply:GetNWString('amb_players_name') > 1 ) then
                local wanted = sub_wanted:AddOption( ply:GetNWString('amb_players_name'), function()
                    AmbContext.box( "Причина", "Объявить", "", function( reason ) RunConsoleCommand( "say", "/wanted "..ply:Name().." "..reason ) end )
                end )
                wanted:SetImage("icon16/user_delete.png")
            end
        end
        ed:SetFont('ambFont18')

        local sub_unwanted, ed = amb_context_menu:AddSubMenu("Снять Розыск")
        ed:SetImage( 'icon16/user_delete.png' )
        for _, ply in pairs( player.GetAll() ) do
            if ( LocalPlayer() ~= ply ) and ( #ply:GetNWString('amb_players_name') > 1 ) then
                local unwanted = sub_unwanted:AddOption( ply:GetNWString('amb_players_name'), function()
                    RunConsoleCommand( "say", "/unwanted "..ply:Name() )
                end )
                unwanted:SetImage( 'icon16/user_delete.png' )
            end
        end
        ed:SetFont('ambFont18')

        local sub_warrant, ed = amb_context_menu:AddSubMenu("Запросить Обыск")
        ed:SetImage( "icon16/group_edit.png" )
        for _, ply in pairs( player.GetAll() ) do
            if ( LocalPlayer() ~= ply ) and ( #ply:GetNWString('amb_players_name') > 1 ) then
                local warrant = sub_warrant:AddOption( ply:GetNWString('amb_players_name'), function()
                    AmbContext.box( "Причина", "Запросить Ордер на Обыск", "", function( reason ) RunConsoleCommand( "say", "/warrant "..ply:Name().." "..reason ) end )
                end )
                warrant:SetImage("icon16/user_delete.png")
            end
        end
        ed:SetFont('ambFont18')

        amb_context_menu:AddSpacer()
        
    end
    

    local sellalldoors = amb_context_menu:AddOption( "Продать Все Двери", function() 
        RunConsoleCommand( "say", "/sellalldoors" ) 
    end )
    sellalldoors:SetImage( AmbContext.icons.sellalldoors )
    sellalldoors:SetFont('ambFont18')


    local ammo = amb_context_menu:AddOption( "Купить патроны", function() 
        RunConsoleCommand( 'amb_darkrp_buyammo', '' ) -- написал свою функцию, т.к у ДаркРП залупа полная
    end ) 
    ammo:SetImage( AmbContext.icons.ammo )
    ammo:SetFont('ambFont18')

    local advert = amb_context_menu:AddOption( "Подать рекламу", function() 
        AmbContext.box( "Текст", "Опубликовать", "", function( str ) RunConsoleCommand( "say", "/advert "..str ) end )
    end )
    advert:SetImage( AmbContext.icons.advert )
    advert:SetFont('ambFont18')

    amb_context_menu:AddSpacer()

    local sub_demote, ed = amb_context_menu:AddSubMenu("Уволить")
    ed:SetImage( "icon16/user_delete.png" )
    for _, ply in pairs( player.GetAll() ) do
        if ( LocalPlayer() ~= ply ) and ( #ply:GetNWString('amb_players_name') > 1 ) then
            local demote = sub_demote:AddOption( ply:GetNWString('amb_players_name'), function()
                AmbContext.box( "Причина", "Уволить", "", function( reason ) RunConsoleCommand( "say", "/demote "..ply:Name().." "..reason ) end )
            end )
            demote:SetImage("icon16/bullet_delete.png")
        end
    end
    ed:SetFont('ambFont18')

    amb_context_menu:AddSpacer()

    -- Money #######################
    local givemoney = amb_context_menu:AddOption( "Передать доллары", function() 
        AmbContext.box( "Сумма", "Передать", "", function( summ ) RunConsoleCommand( "say", "/give "..summ ) end )
    end )
    givemoney:SetImage( AmbContext.icons.money )
    givemoney:SetFont('ambFont18')

    local dropmoney = amb_context_menu:AddOption( "Выкинуть доллары", function() 
        AmbContext.box( "Сумма", "Выкинуть", "", function( summ ) RunConsoleCommand( "say", "/dropmoney "..summ ) end )
    end )
    dropmoney:SetImage( AmbContext.icons.money )
    dropmoney:SetFont('ambFont18')

    amb_context_menu:AddSpacer()
    -- ##############################

    local dropgun = amb_context_menu:AddOption( 'Выкинуть оружие', function() 
        RunConsoleCommand( 'say', '/dropweapon' )
    end )
    dropgun:SetImage( AmbContext.icons.dropweapon )
    dropgun:SetFont('ambFont18')
    
    
    
    amb_context_menu:Open()
    amb_context_menu:SetPos( w/2 - amb_context_menu:GetWide()/2, h - amb_context_menu:GetTall() - 8 )
    --amb_context_menu:MoveTo(amb_context_menu.x, ScrH() - amb_context_menu:GetTall() - 8, .0, 0)
end

function AmbContext.closeMenu()
    if ValidPanel( amb_context_menu ) then amb_context_menu:Remove() end
end

function AmbContext.box( sTitle, sBtn, sText, func )

    local amb_context_framebox = vgui.Create( 'DFrame' )
    amb_context_framebox:SetTitle( sTitle )
    amb_context_framebox:ShowCloseButton( true )
    amb_context_framebox:MakePopup()
    amb_context_framebox:SetSize( 250, 100 )
    amb_context_framebox:Center()
    amb_context_framebox:SetKeyboardInputEnabled( true )
    amb_context_framebox:SetMouseInputEnabled( true )
    amb_context_framebox.Paint = function( self, w, h )
        draw.RoundedBox ( 0, 0, 0, w, h, Color( 0,0,0,155 ) )
        draw.RoundedBox ( 0, 1, 1, w-2, h-2, Color( 255,255,255,100 ) )
    end
 
    local amb_context_framebox_te = vgui.Create( 'DTextEntry', amb_context_framebox )
    amb_context_framebox_te:SetPos( 25, 25 )
    amb_context_framebox_te:SetSize( 210, 30 )
    amb_context_framebox_te:SetMultiline( false )
    amb_context_framebox_te:SetAllowNonAsciiCharacters( true )
    amb_context_framebox_te:SetText( sText )
    amb_context_framebox_te:SetEnterAllowed( true )
 
    local amb_context_framebox_btn = vgui.Create( 'DButton', amb_context_framebox )
    amb_context_framebox_btn:SetText( sBtn )
    amb_context_framebox_btn:SetSize( 110, 20 )
    amb_context_framebox_btn:SetPos( 75, 70 )
    amb_context_framebox_btn.DoClick = function()
        func( amb_context_framebox_te:GetValue() )
        amb_context_framebox:Remove()
    end
end

--
hook.Add( 'OnContextMenuOpen', 'amb_0x6', function()
    timer.Simple( 0, function() AmbContext.openMenu( 1 ) end )
end )

hook.Add( 'OnContextMenuClose', 'amb_0x6', function()
    if ValidPanel( amb_context_laws ) then amb_context_laws:Remove() end
end )
