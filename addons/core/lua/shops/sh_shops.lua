--[[
	Конфиг магазинов (Основная Настройка).
	Сервер находится в полном подчинений проекта: [ Ambition ]

	[10.08.20]
		• Одежда.
	.
    [31.08.20]
        • Решил переписать модуль магазинов, помимо магазины скинов, добавить костюмы (временные скины).
    .

    todo: Сделать общий класс магазинов с возможностью 3Д модельки, Иконки модельки, кастомной иконкой.
]]

AmbShops = AmbShops or {}

AmbShops.ShopSkins = AmbShops.ShopSkins or {} -- магазин скинов
AmbShops.ShopCostumes = AmbShops.ShopCostumes or {} -- магазин временных костюмов


AmbShops.ShopSkins.female_mdls = {
    ['models/player/Group01/female_01.mdl'] = 1000,
    ['models/player/Group01/female_02.mdl'] = 1000,
    ['models/player/Group01/female_03.mdl'] = 1000,
    ['models/player/Group01/female_04.mdl'] = 1000,
    ['models/player/Group01/female_05.mdl'] = 1000,
    ['models/player/Group01/female_06.mdl'] = 1000,

    ['models/player/mossman_arctic.mdl'] = 4000,
    ['models/player/mossman.mdl'] = 4000,

    ['models/player/alyx.mdl'] = 8000,
    ['models/player/p2_chell.mdl'] = 16000
}
AmbShops.ShopSkins.male_mdls = {
    ['models/player/Group01/male_07.mdl'] = 1000,
    ['models/player/Group01/male_09.mdl'] = 1000,
    ['models/player/Group01/male_02.mdl'] = 1000,
    ['models/player/Group01/male_04.mdl'] = 1000,
    ['models/player/Group01/male_05.mdl'] = 1000,
    ['models/player/Group01/male_06.mdl'] = 1000,
    ['models/player/Group01/male_01.mdl'] = 1000,
    ['models/player/Group01/male_03.mdl'] = 1000,
    ['models/player/Group01/male_08.mdl'] = 1000,

    ['models/player/hostage/hostage_01.mdl'] = 4000,
    ['models/player/hostage/hostage_02.mdl'] = 4000,
    ['models/player/hostage/hostage_03.mdl'] = 4000,
    ['models/player/hostage/hostage_04.mdl'] = 4000,

    ['models/player/eli.mdl'] = 14000,
    ['models/player/kleiner.mdl'] = 14000,
    ['models/player/monk.mdl'] = 14000,
    ['models/player/odessa.mdl'] = 14000,
    ['models/player/magnusson.mdl'] = 14000,

    ['models/player/gman_high.mdl'] = 32000,
    ['models/player/breen.mdl'] = 64000
}

AmbShops.ShopSkins.transgender_mdls = {
    ['models/player/Group01/female_01.mdl'] = 1000,
    ['models/player/Group01/female_02.mdl'] = 1000,
    ['models/player/Group01/female_03.mdl'] = 1000,
    ['models/player/Group01/female_04.mdl'] = 1000,
    ['models/player/Group01/female_05.mdl'] = 1000,
    ['models/player/Group01/female_06.mdl'] = 1000,

    ['models/player/mossman_arctic.mdl'] = 4000,
    ['models/player/mossman.mdl'] = 4000,

    ['models/player/alyx.mdl'] = 8000,
    ['models/player/p2_chell.mdl'] = 16000,

    ['models/player/Group01/male_07.mdl'] = 1000,
    ['models/player/Group01/male_09.mdl'] = 1000,
    ['models/player/Group01/male_02.mdl'] = 1000,
    ['models/player/Group01/male_04.mdl'] = 1000,
    ['models/player/Group01/male_05.mdl'] = 1000,
    ['models/player/Group01/male_06.mdl'] = 1000,
    ['models/player/Group01/male_01.mdl'] = 1000,
    ['models/player/Group01/male_03.mdl'] = 1000,
    ['models/player/Group01/male_08.mdl'] = 1000,

    ['models/player/hostage/hostage_01.mdl'] = 4000,
    ['models/player/hostage/hostage_02.mdl'] = 4000,
    ['models/player/hostage/hostage_03.mdl'] = 4000,
    ['models/player/hostage/hostage_04.mdl'] = 4000,

    ['models/player/eli.mdl'] = 14000,
    ['models/player/kleiner.mdl'] = 14000,
    ['models/player/monk.mdl'] = 14000,
    ['models/player/odessa.mdl'] = 14000,
    ['models/player/magnusson.mdl'] = 14000,

    ['models/player/gman_high.mdl'] = 32000,
    ['models/player/breen.mdl'] = 64000
}






AmbShops.ShopCostumes.need_in_org = true -- нужно ли находиться во орге?

AmbShops.ShopCostumes.costumes = {
    ['models/player/Group01/female_01.mdl'] = 200,
    ['models/player/Group01/female_02.mdl'] = 200,
    ['models/player/Group01/female_03.mdl'] = 200,
    ['models/player/Group01/female_04.mdl'] = 200,
    ['models/player/Group01/female_05.mdl'] = 200,
    ['models/player/Group01/female_06.mdl'] = 200,
    
    ['models/player/Group03m/female_01.mdl'] = 200,
    ['models/player/Group03m/female_02.mdl'] = 200,
    ['models/player/Group03m/female_03.mdl'] = 200,
    ['models/player/Group03m/female_04.mdl'] = 200,
    ['models/player/Group03m/female_05.mdl'] = 200,
    ['models/player/Group03m/female_06.mdl'] = 200,

    ['models/player/Group03/female_01.mdl'] = 200,
    ['models/player/Group03/female_02.mdl'] = 200,
    ['models/player/Group03/female_03.mdl'] = 200,
    ['models/player/Group03/female_04.mdl'] = 200,
    ['models/player/Group03/female_05.mdl'] = 200,
    ['models/player/Group03/female_06.mdl'] = 200,

    ['models/player/Group01/male_07.mdl'] = 200,
    ['models/player/Group01/male_09.mdl'] = 200,
    ['models/player/Group01/male_02.mdl'] = 200,
    ['models/player/Group01/male_04.mdl'] = 200,
    ['models/player/Group01/male_05.mdl'] = 200,
    ['models/player/Group01/male_06.mdl'] = 200,
    ['models/player/Group01/male_01.mdl'] = 200,
    ['models/player/Group01/male_03.mdl'] = 200,
    ['models/player/Group01/male_08.mdl'] = 200,

    ['models/player/Group03m/male_07.mdl'] = 200,
    ['models/player/Group03m/male_09.mdl'] = 200,
    ['models/player/Group03m/male_02.mdl'] = 200,
    ['models/player/Group03m/male_04.mdl'] = 200,
    ['models/player/Group03m/male_05.mdl'] = 200,
    ['models/player/Group03m/male_06.mdl'] = 200,
    ['models/player/Group03m/male_01.mdl'] = 200,
    ['models/player/Group03m/male_03.mdl'] = 200,
    ['models/player/Group03m/male_08.mdl'] = 200,

    ['models/player/Group03/male_07.mdl'] = 200,
    ['models/player/Group03/male_09.mdl'] = 200,
    ['models/player/Group03/male_02.mdl'] = 200,
    ['models/player/Group03/male_04.mdl'] = 200,
    ['models/player/Group03/male_05.mdl'] = 200,
    ['models/player/Group03/male_06.mdl'] = 200,
    ['models/player/Group03/male_01.mdl'] = 200,
    ['models/player/Group03/male_03.mdl'] = 200,
    ['models/player/Group03/male_08.mdl'] = 200,

    ['models/player/mossman_arctic.mdl'] = 600,
    ['models/player/mossman.mdl'] = 600,

    ['models/player/alyx.mdl'] = 800,
    ['models/player/p2_chell.mdl'] = 1200,

    ['models/player/hostage/hostage_01.mdl'] = 400,
    ['models/player/hostage/hostage_02.mdl'] = 400,
    ['models/player/hostage/hostage_03.mdl'] = 400,
    ['models/player/hostage/hostage_04.mdl'] = 400,

    ['models/player/eli.mdl'] = 600,
    ['models/player/kleiner.mdl'] = 600,
    ['models/player/monk.mdl'] = 600,
    ['models/player/odessa.mdl'] = 600,
    ['models/player/magnusson.mdl'] = 600,

    ['models/player/arctic.mdl'] = 900,
    ['models/player/phoenix.mdl'] = 900,
    ['models/player/leet.mdl'] = 900,
    ['models/player/guerilla.mdl'] = 900,

    ['models/player/gman_high.mdl'] = 1200,
    ['models/player/breen.mdl'] = 1200,

    [ 'models/cwtc/soldiercwtc.mdl' ] = 1200,
    [ 'models/arachnit/wolfenstein2/nazis/nazi_elite_atom_soldier_player.mdl' ] = 1400,
    [ 'models/bloocobalt/resident_evil/rerev_hunk.mdl' ] = 1400,
    [ 'models/agroenner/03_agroenners.mdl' ] = 1600
}




if ( SERVER ) then

    local function checkMoney( ePly, money )
        if ( AmbStats.Players.getStats( ePly, '$' ) >= money ) then return true end
        return false 
    end

    function AmbShops.buy( ePly, type, ent, flag_fixed )

        if ( type == 'skins' ) then
            if ePly:GetNWString('amb_players_sex') == 'Мужской' then
                if checkMoney( ePly, AmbShops.ShopSkins.male_mdls[ent] ) then
                    AmbStats.Players.addStats( ePly, '$', -AmbShops.ShopSkins.male_mdls[ent] )
                    AmbStats.Players.setStats( ePly, 'skin', ent )
                    ePly:SetModel( ent )
                    ePly:ChatPrint('Вы переобулись!')
                end
            elseif ePly:GetNWString('amb_players_sex') == 'Женский' then
                if checkMoney( ePly, AmbShops.ShopSkins.female_mdls[ent] ) then
                    AmbStats.Players.addStats( ePly, '$', -AmbShops.ShopSkins.female_mdls[ent] )
                    AmbStats.Players.setStats( ePly, 'skin', ent )
                    ePly:SetModel( ent )
                    ePly:ChatPrint('Вы переобулись!')
                end
            else
                if checkMoney( ePly, AmbShops.ShopSkins.transgender_mdls[ent] ) then
                    AmbStats.Players.addStats( ePly, '$', -AmbShops.ShopSkins.transgender_mdls[ent] )
                    AmbStats.Players.setStats( ePly, 'skin', ent )
                    ePly:SetModel( ent )
                    ePly:ChatPrint('Вы переобулись!')
                end
            end
        elseif ( type == 'costumes' ) then
            if ( checkMoney( ePly, AmbShops.ShopCostumes.costumes[ent] ) ) then
                AmbStats.Players.addStats( ePly, '$', -AmbShops.ShopCostumes.costumes[ent] )
                ePly:SetModel( ent )
                ePly:ChatPrint('Вы переобулись.')
                if ( ent == 'models/cwtc/soldiercwtc.mdl' ) then ePly:SetBodyGroups('1011021') end
                if ( ent == 'models/arachnit/wolfenstein2/nazis/nazi_elite_atom_soldier_player.mdl' ) then ePly:SetBodyGroups('002112122101') end
                if ( ent == 'models/agroenner/03_agroenners.mdl' ) then ePly:SetBodyGroups('3101110') ePly:SetSkin(3) end
                if flag_fixed then
                    ePly:ChatPrint('Вы купили Костюм с фиксацией!')
                    ePly:ChatPrint('Отменить Фиксацию можно в магазине')
                    ePly.fixed_costume = true
                    ePly.costume = ent
                end
                return true
            end
            ePly:ChatPrint('Вы не можете позволить себе Костюм!')
            return false
        end
    end

    hook.Add( 'PlayerSpawn', 'amb_0x691', function( ePly )
        if ( ePly.fixed_costume ) then
            timer.Simple( .1, function()
                if AmbShops.buy( ePly, 'costumes', ePly.costume, false ) then ePly:ChatPrint('Вам вернули костюм.') else ePly:ChatPrint('Фиксация Костюма снята!') ePly.fixed_costume = false ePly.costume = nil end
            end )
        end
    end )

    util.AddNetworkString('amb_shop_skin_buy')

    net.Receive( 'amb_shop_skin_buy', function( len, caller )
        local ePly = net.ReadEntity()

        if IsValid( caller ) == false or IsValid( ePly ) == false then return end
        if ePly:IsPlayer() == false or ePly:Alive() == false then return end
        if caller ~= ePly then caller:Kick('HIGHT PING (>908)') return end

        local mdl = net.ReadString()
        local type_shop = net.ReadString()
        local flag_fixed = net.ReadBool()

        -- caller:ChatPrint( tostring( flag_fixed ) ) -- debug

        AmbShops.buy( ePly, type_shop, mdl, flag_fixed )
    end )

    util.AddNetworkString('amb_shop_costume_unfix')
    net.Receive( 'amb_shop_costume_unfix', function( len, caller)

        if IsValid( caller ) == false then return end
        if caller:IsPlayer() == false then return end
        if caller.fixed_costume == false then return end
        if timer.Exists( 'AmbDelayUnfix'..caller:SteamID() ) then caller:Kick('HIGHT PING (>908)') return end
        if ( checkMoney( caller, 500 ) == false ) then return end

        timer.Create( 'AmbDelayUnfix'..caller:SteamID(), 0.2, 1, function() end )

        caller.fixed_costume = false
        caller.costume = nil
        AmbStats.Players.addStats( caller, '$', -500 )
        caller:ChatPrint('Фиксация Костюма снята!')
    end )

elseif ( CLIENT ) then
    local w = ScrW()
    local h = ScrH()

    function AmbShops.ShopSkins.open()
        local frame = vgui.Create( "DFrame" )
        frame:SetTitle( "" )
        frame:SetSize( 620, 512 )
        frame:Center()			
        frame:MakePopup()
        frame:ShowCloseButton( true )
        frame.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMBITION )
            draw.RoundedBox( 0, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK )

            draw.SimpleText('• Скин сохранится, прошлый будет уничтожен!', "ambFont18", 24, 24, AMB_COLOR_RED, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        end

        local panel = vgui.Create( 'DScrollPanel', frame )
        panel:SetPos( 12, 64 )
        panel:SetSize( frame:GetWide() - 24, frame:GetTall() - 78 )
        panel.Paint = function( self, w, h )
            -- draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_RED ) -- debug
        end

        AmbShops.ShopSkins.showModels( panel, LocalPlayer():GetNWString('amb_players_sex') )
    end

    function AmbShops.ShopSkins.showModels( panel, sex )

        local i = -1
        local tab = nil
        
        if sex == 'Мужской' then 
            tab = AmbShops.ShopSkins.male_mdls
        elseif ( sex == 'Женский' ) then 
            tab = AmbShops.ShopSkins.female_mdls
        else
            tab = AmbShops.ShopSkins.transgender_mdls
        end


        for mdl, price in SortedPairsByValue( tab ) do
            i = i + 1
            local mdl_panel = panel:Add( "DPanel" )
            mdl_panel:SetSize( panel:GetWide() - 12, 220 )
            mdl_panel:SetPos( 2, ( mdl_panel:GetTall() + 4 ) * i  )
            mdl_panel.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) ) 
            end

            local icon = vgui.Create( "DModelPanel", mdl_panel )
            icon:SetPos( 8, 8 )
            icon:SetSize( 200, 200 )
            icon:SetModel( mdl ) -- you can only change colors on playermodels
            --function icon:LayoutEntity( Entity ) return true end -- disables default rotation
            function icon.Entity:GetPlayerColor() return Vector (0, 0, 0) end

            local buy = vgui.Create( "DButton", mdl_panel )
            buy:SetSize( 120, 40 )
            buy:SetPos( mdl_panel:GetWide() - buy:GetWide() - 12, mdl_panel:GetTall() - buy:GetTall() - 12  )
            buy:SetFont('ambFont22')
            buy:SetTextColor( AMB_COLOR_WHITE )
            buy:SetText( price..'$' )
            buy.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMBITION )
                draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
            end
            buy.DoClick = function()
                net.Start( 'amb_shop_skin_buy' )
                    net.WriteEntity( LocalPlayer() )
                    net.WriteString( mdl )
                    net.WriteString( 'skins' )
                net.SendToServer()
            end
        end
    end

    function AmbShops.ShopCostumes.open()
        local frame = vgui.Create( "DFrame" )
        frame:SetTitle( "" )
        frame:SetSize( 620, 512 )
        frame:Center()			
        frame:MakePopup()
        frame:ShowCloseButton( true )
        frame.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMBITION )
            draw.RoundedBox( 0, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK )

            draw.SimpleText('• После смерти - костюм будет уничтожен!', "ambFont18", 24, 12, AMB_COLOR_RED, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        end

        local fix = frame:Add( "DCheckBoxLabel" )
        fix:SetPos( 25, 42 )
        fix:SetText("Фиксировать (после смерти Костюм будет покупаться)")
        fix:SetChecked( false )						
        fix:SizeToContents()

        local unfix = vgui.Create( "DButton", frame )
        unfix:SetSize( 172, 26 )
        unfix:SetPos( frame:GetWide()/2 + 44, 32  )
        unfix:SetFont('ambFont18')
        unfix:SetTextColor( AMB_COLOR_WHITE )
        unfix:SetText( 'Снять Фиксацию (500$)' )
        unfix.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMBITION )
            draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
        end
        unfix.DoClick = function()
            net.Start( 'amb_shop_costume_unfix' )
            net.SendToServer()
            frame:Remove()
        end

        local panel = vgui.Create( 'DScrollPanel', frame )
        panel:SetPos( 12, 64 )
        panel:SetSize( frame:GetWide() - 24, frame:GetTall() - 78 )
        panel.Paint = function( self, w, h )
            -- draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_RED ) -- debug
        end

        local i = -1
        for mdl, price in SortedPairsByValue( AmbShops.ShopCostumes.costumes ) do
            i = i + 1
            local mdl_panel = panel:Add( "DPanel" )
            mdl_panel:SetSize( panel:GetWide() - 12, 220 )
            mdl_panel:SetPos( 2, ( mdl_panel:GetTall() + 4 ) * i  )
            mdl_panel.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) ) 
            end

            local icon = vgui.Create( "DModelPanel", mdl_panel )
            icon:SetPos( 8, 8 )
            icon:SetSize( 200, 200 )
            icon:SetModel( mdl ) -- you can only change colors on playermodels
            --function icon:LayoutEntity( Entity ) return true end -- disables default rotation
            function icon.Entity:GetPlayerColor() return Vector (0, 0, 0) end

            local buy = vgui.Create( "DButton", mdl_panel )
            buy:SetSize( 120, 40 )
            buy:SetPos( mdl_panel:GetWide() - buy:GetWide() - 12, mdl_panel:GetTall() - buy:GetTall() - 12  )
            buy:SetFont('ambFont22')
            buy:SetTextColor( AMB_COLOR_WHITE )
            buy:SetText( price..'$' )
            buy.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_AMBITION )
                draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
            end
            buy.DoClick = function()
                net.Start( 'amb_shop_skin_buy' )
                    net.WriteEntity( LocalPlayer() )
                    net.WriteString( mdl )
                    net.WriteString( 'costumes' )
                    net.WriteBool( fix:GetChecked() )
                net.SendToServer()
            end
        end
    end
end
