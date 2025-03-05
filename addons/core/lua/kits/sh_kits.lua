--[[
	Система наборов.
	Сервер находится в полном подчинений проекта: [ Ambition ]

	[ 09.08.20 ]
		• Главная таблица, интервал, выдача, сохранение.
        • Доделал систему. todo: clear code
	.
    [ 10.08.20 ]
        • Пофиксил баг, связанные с залупой по поводу проверки sql Kit.
    .
    [ 16.08.20 ]
        • Пофиксил баг с team, т.к засунул их в глобальную переменную
    .
    [28.08.20]
        • Добавил для DarkRP донатные наборы.
    .
    [22.09.20]
        • Добавил /kit vip, premium, titanium
    .
    [29.09.20]
        • Решил переписать 80% всей этой дрисни
        • Сделал адекватную архитектуру
    .
    [12.10.20]
        • Заменил проверку в sv_data.lua
    .
]]

AmbKits = AmbKits or {}

AmbKits.time_s = 1
AmbKits.time_m = AmbKits.time_s * 60
AmbKits.time_h = AmbKits.time_m * 60
AmbKits.time_d = AmbKits.time_h * 24
AmbKits.time_f = AmbKits.time_d * 2048

AmbKits.kits = {}

function AmbKits.AddKit( sName, bOnce, nInterval, fCheck, fAction )

    AmbKits.kits[ sName ] = {

        once = bOnce,
        interval = nInterval,
        check = fCheck,
        func = fAction

    }

    print( '[AmbKtis] Added kit: '..sName )

end


-- ## Kits ########################################
AmbKits.AddKit( 'test', true, AmbKits.time_h,

    function( ePly ) 
    
        return true 

    end,

    function( ePly )

        ePly:ChatPrint( 'test test' )

    end

)

AmbKits.AddKit( 'starter', false, AmbKits.time_h*2,

    function( ePly ) 
    
        return ( AmbStats.Players.getStats( ePly, '!' ) <= 4 )
        
    end,

    function( ePly )

        local sum = 1500 - AmbStats.Players.getStats( ePly, '!' ) * 100

        AmbStats.Players.addStats( ePly, '$', sum )
        AmbStats.Players.newLevel( ePly )
        AmbLib.chatSend( ePly, AMB_COLOR_AMBITION, '[•] ', AMB_COLOR_WHITE, 'Приятной игры на PhonexRP  ;)' )

    end

)

-- Donate Kits --

AmbKits.AddKit( 'standart', false, AmbKits.time_h,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit1' ] ) then return true end

        return false
        
    end,

    function( ePly )

        AmbStats.Players.addStats( ePly, '$', '2500' )
        ePly:SetHealth( ePly:Health() + 50 )
        ePly:SetArmor( 50 )

    end

)

AmbKits.AddKit( 'gun1', false, AmbKits.time_h,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit2a' ] ) then return true end

        return false
        
    end,

    function( ePly )

        ePly:Give( 'arccw_fml_automag' )
        ePly:Give( 'arccw_db_sawnoff' )
        ePly:Give( 'arccw_melee_fists' )
        ePly:Give( 'arccw_melee_machete' )
        ePly:SetArmor( 50 )

    end

)

AmbKits.AddKit( 'gun2', false, AmbKits.time_m * 40,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit2b' ] ) then return true end

        return false
        
    end,

    function( ePly )

        ePly:Give( 'arccw_g18' )
        ePly:Give( 'weapon_shotgun' )
        ePly:Give( 'arccw_mp5' )
        ePly:Give( 'arccw_nade_frag' )
        ePly:Give( 'arccw_melee_knife' )
        ePly:Give( 'weapon_stunstick' )
        ePly:SetHealth( ePly:Health() + 25 )
        ePly:SetArmor( 150 )

    end

)

AmbKits.AddKit( 'gun3', false, AmbKits.time_m * 15,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit2c' ] ) then return true end

        return false
        
    end,

    function( ePly )

        ePly:Give( 'arccw_deagle357' )
        ePly:Give( 'arccw_m1014' )
        ePly:Give( 'arccw_ak47' )
        ePly:Give( 'arccw_winchester1873' )
        ePly:Give( 'arccw_nade_semtex' )
        ePly:Give( 'med_kit' )
        ePly:Give( 'weapon_slam' )
        ePly:SetHealth( ePly:Health() + 70 )
        ePly:SetArmor( 255 )

    end

)

AmbKits.AddKit( 'mutant', false, AmbKits.time_h * 2,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit3' ] ) then return true end

        return false
        
    end,

    function( ePly )

        ePly:Give( 'arccw_melee_knife' )
        ePly:Give( 'weapon_crowbar' )
        ePly:Give( 'arccw_melee_machete' )
        ePly:Give( 'arccw_melee_fists' )
        ePly:SetHealth( 600 )
        ePly:SetRunSpeed( ePly:GetRunSpeed() * 2 )
        ePly:SetWalkSpeed( ePly:GetWalkSpeed() * 1.4 )
        ePly:SetModel( 'models/player/palpatine/palpatine.mdl' )
        ePly:SetVelocity( Vector( 0, 0, 420 ) )
        ePly:GodEnable()
        timer.Simple( 20, function() 
        
            if ( IsValid( ePly ) ) then ePly:GodDisable() end 
            
        end )

    end

)

AmbKits.AddKit( 'sniper', false, AmbKits.time_h * 2,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit4' ] ) then return true end

        return false
        
    end,

    function( ePly )

        ePly:Give( 'arccw_m107' )
        ePly:Give( 'arccw_awm' )
        ePly:Give( 'arccw_melee_machete' )
        ePly:Give( 'arccw_scout' )
        ePly:SetArmor( 255 )

    end

)

AmbKits.AddKit( 'gauss', false, AmbKits.time_h * 6,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit5' ] ) then return true end

        return false
        
    end,

    function( ePly )

        ePly:Give( 'arccw_gauss_rifle' )
        ePly:SetHealth( 800 )
        ePly:SetArmor( 255 )

    end

)

AmbKits.AddKit( 'rpg', false, AmbKits.time_h * 3,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit6' ] ) then return true end

        return false
        
    end,

    function( ePly )

        ePly:Give( 'arccw_rpg7' )
        ePly:SetHealth( 320 )
        ePly:SetArmor( 255 )

    end

)

AmbKits.AddKit( 'thief', false, AmbKits.time_h + AmbKits.time_m * 20,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit7b' ] ) then return true end

        return false
        
    end,

    function( ePly )

        ePly:Give( 'arccw_tmp' )
        ePly:Give( 'arccw_winchester1873' )
        ePly:Give( 'arccw_makarov' )
        ePly:Give( 'lockpick' )
        ePly:SetHealth( 200 )

    end

)

AmbKits.AddKit( 'policeman', false, AmbKits.time_h + AmbKits.time_m * 20,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit7c' ] ) then return true end

        return false
        
    end,

    function( ePly )

        ePly:Give( 'arccw_usp' )
        ePly:Give( 'arccw_shorty' )
        ePly:Give( 'arccw_g36c' )
        ePly:Give( 'stunstick' )
        ePly:Give( 'door_ram' )
        ePly:Give( 'med_kit' )
        ePly:SetHealth( 200 )
        ePly:SetArmor( 100 )

    end

)

AmbKits.AddKit( 'hunter', false, AmbKits.time_h + AmbKits.time_m * 20,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit7d' ] ) then return true end

        return false
        
    end,

    function( ePly )

        ePly:Give( 'arccw_winchester1873' )
        ePly:Give( 'arccw_ragingbull' )
        ePly:Give( 'arccw_db_sawnoff' )
        ePly:Give( 'arccw_scout' )

    end

)

AmbKits.AddKit( 'god', false, AmbKits.time_d,

    function( ePly ) 
    
        if ( IGS.PlayerPurchases( ePly )[ 'kit8' ] ) then return true end

        return false
        
    end,

    function( ePly )

        ePly:SetHealth( 16000 )
        ePly:StripWeapons()
        ePly:Give( 'arccw_melee_fists' )
        ePly:SetWalkSpeed( 800 )
        ePly:SetRunSpeed( 900 )

    end

)

AmbKits.AddKit( 'vip', false, AmbKits.time_m * 25,

    function( ePly ) 
    
        return ( ePly:IsUserGroup( 'vip' ) or ePly:IsUserGroup( 'premium' ) or ePly:IsUserGroup( 'titanium' ) )
        
    end,

    function( ePly )

        ePly:SetHealth( 200 )
        ePly:SetWalkSpeed( 400 )
        ePly:SetRunSpeed( 500 )
        ePly:SetArmor( 50 )
        AmbStats.Players.addStats( ePly, '$', 200 )

    end

)

AmbKits.AddKit( 'premium', false, AmbKits.time_m * 45,

    function( ePly ) 
    
        return ( ePly:IsUserGroup( 'premium' ) or ePly:IsUserGroup( 'titanium' ) )
        
    end,

    function( ePly )

        ePly:SetHealth( ePly:Health() + 150 )
        ePly:SetWalkSpeed( 500 )
        ePly:SetRunSpeed( 600 )
        ePly:SetArmor( 150 )
        ePly:Give( 'gmod_camera' )
        ePly:Give( 'unarrest_stick' )
        ePly:Give( 'med_kit' )
        AmbStats.Players.newLevel( ePly )
        AmbStats.Players.addStats( ePly, '$', 600 )

    end

)

AmbKits.AddKit( 'titanium', false, AmbKits.time_h,

    function( ePly ) 
    
        return ( ePly:IsUserGroup( 'titanium' ) )
        
    end,

    function( ePly )

        ePly:SetHealth( ePly:Health() + 300 )
        ePly:SetWalkSpeed( 720 )
        ePly:SetRunSpeed( 800 )
        ePly:SetArmor( 255 )
        ePly:Give( 'gmod_camera' )
        ePly:Give( 'unarrest_stick' )
        ePly:Give( 'med_kit' )
        ePly:Give( 'lockpick' )
        ePly:Give( 'weaponchecker' )
        ePly:Give( 'stunstick' )
        ePly:Give( 'weapon_slam' )
        ePly:Give( 'weapon_bugbait' )
        ePly:Give( 'arccw_rpg7' )
        ePly:Give( 'weapon_rpg' )
        ePly:Give( 'arccw_awm' )
        AmbStats.Players.newLevel( ePly )
        AmbStats.Players.newLevel( ePly )
        AmbStats.Players.addStats( ePly, '$', 1500 )

    end

)
-- ################################################


--[[

function AmbKits.checkKit( ePly, kit )
    for name, v in pairs( AmbKits.Kits ) do
        if kit == name then
            return v.check( ePly )
        end
    end
end

elseif ( CLIENT ) then
    function AmbKits.showKits()

        local kits = {}
        local i = 0

        for name, v in pairs( AmbKits.Kits ) do
		    kits[name] = AmbKits.checkKit( LocalPlayer(), name )
        end
		chat.AddText( AMB_COLOR_AMBITION, "=====================" )
        chat.AddText( AMB_COLOR_AMBITION, "[•] ", AMB_COLOR_WHITE, ' Вам доступны киты: ' )

        for name, access in pairs( kits ) do
            if access then
		        chat.AddText( AMB_COLOR_RED, name )
            end
        end
		chat.AddText( AMB_COLOR_AMBITION, "=====================" )
    end
end
]]

