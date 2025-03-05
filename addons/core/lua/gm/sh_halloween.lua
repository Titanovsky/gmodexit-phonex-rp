AmbHalloween = AmbHalloween or {}

AmbHalloween.places = {
    Vector( -1838, -2236, -174 ),
    Vector( -1312, -2335, -143 ),
    Vector( -1312, -2335, -143 ),
    Vector( -1237, -1705, -159 ),
    Vector( -1259, -888, -162 ),
    Vector( -1259, -888, -162 ),
    Vector( -2946, -766, -158 ),
    Vector( -2901, -1505, -158 ),
    Vector( -1228, -153, -156 ),
    Vector( -822, -1144, -162 ),
    Vector( -960, 891, -167 ),
    Vector( -1242, 1564, -414 ),
    Vector( -775, 1871, -471 ),
    Vector( -775, 1871, -471 ),
    Vector( 246, 2484, -164 ),
    Vector( -464, 3213, -160 ),
    Vector( 286, 4162, -157 ),
    Vector( 1082, 3694, 38 ),
    Vector( 2564, 3996, -157 ),
    Vector( 2368, 2948, -160 ),
    Vector( 2877, 1711, -164 ),
    Vector( 2576, 710, -157 ),
    Vector( 2039, 453, -157 ),
    Vector( 2575, -1074, -156 ),
    Vector( 2619, -2976, -157 ),
    Vector( 4749, -866, -93 ),
    Vector( 5083, -1951, -97 ),
    Vector( 4729, -3003, -97 ),
    Vector( 1163, -3935, -94 ),
    Vector( -64, -5216, -81 ),
    Vector( 227, -1779, -89 ),
    Vector( 1210, 629, -161 ),
    Vector( -165, 267, 231 ),
    Vector( -506, 1021, -100 ),
    Vector( -837, 80, -150 ),
    Vector( -1052, -269, 381 ),
    Vector( -1044, -744, 385 ),
    Vector( -2962, -3292, -145 ),
    Vector( -1908, -1573, 95 )
}

AmbHalloween.gift_weapons = {
    'weapon_pistol',
    'weapon_357',
    'weapon_shotgun',
    'weapon_smg1',
    'weapon_stunstick',
    'weapon_frag',
    'weapon_vape_golden',
    'weapon_vape_medicinal',
    'arccw_melee_machete',
    'arccw_melee_knife',
    'weapon_crossbow'
}

function AmbHalloween.CalcWinner()

    local tab = player.GetAll()

    for i = 1, #tab do
        
        for j = 1, #tab do

            if ( tab[ i ]:GetNWInt( 'Candy' ) > tab[ j ]:GetNWInt( 'Candy' ) ) then

                local temp = tab[ j ]
                tab[ j ] = tab[ i ]
                tab[ i ] = temp

            end

        end

    end

    return tab[ 1 ]

end

if SERVER then

    timer.Create( 'AmbHalloweenEvent', 2700, 0, function()

        if ( #player.GetAll() >= 3 ) then AmbHalloween.Start() end

    end )

    util.AddNetworkString( 'AmbHalloweenEvent' )

    function AmbHalloween.SetGift( ePly )

        ePly:Give( table.Random( AmbHalloween.gift_weapons ) )
        ePly:SetHealth( 666 )
        AmbLib.notifySend( ePly, 'Вы победили!', 0, 4, 'ambition/amb_zombie_mode_sounds_pack/misc/pick_up_on_weapons.mp3' )
        AmbStats.Players.addStats( ePly, '$', math.random( 1, 800 ) )
        AmbCases.spawnCase( ePly, math.random( 1, 6 ) )

    end

    function AmbHalloween.Start()

        net.Start( 'AmbHalloweenEvent' )
        net.Broadcast()

        timer.Simple( 15, function() 
        
            for _, pos in pairs( AmbHalloween.places ) do

                local candy = ents.Create( 'amb_candy' )
                candy:SetPos( pos )
                candy:Spawn()

            end

            timer.Simple( 120, function() AmbHalloween.End() end )

        end )

    end

    function AmbHalloween.End()

        local winner = AmbHalloween.CalcWinner()

        for _, candy in pairs( ents.FindByClass( 'amb_candy' ) ) do

            candy:Remove()

        end

        if ( winner:GetNWInt( 'Candy' ) > 0 ) then

            AmbHalloween.SetGift( winner )

        else

            return

        end

        for _, ply in pairs( player.GetAll() ) do

            ply:SetNWInt( 'Candy', 0 )
            ply:ChatPrint( 'Победитель: '..winner:GetNWString( 'amb_players_name' ) )

        end

    end

    function AmbHalloween.SetSkin( ePly )

        if ( ePly:Team() == Tcit ) then timer.Simple( 0, function() ePly:SetModel( 'models/player/stalker/packboy.mdl' ) end ) end

    end
    hook.Add( 'PlayerSpawn', 'HalloweenSetSkin', AmbHalloween.SetSkin )

elseif CLIENT then

    local w = ScrW()
    local h = ScrH()
    local COLOR_TEXT = Color( 242, 100, 17 )

    local function ShowPanel( nType )

        hook.Add( 'HUDPaint', 'HalloweenEvent', function() 
        
            if ( nType == 1 ) then

                draw.SimpleTextOutlined( 'Trick or Treat!', 'ambFont32', w/2, 32, COLOR_TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )
                draw.SimpleTextOutlined( 'Starts in: '..math.Round( timer.TimeLeft( 'AmbHalloweenClient' ) ), 'ambFont32', w/2, 68, COLOR_TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )

            else

                draw.SimpleTextOutlined( 'Ends in: '..math.Round( timer.TimeLeft( 'AmbHalloweenClientEnd' ) ), 'ambFont32', w/2, 32, COLOR_TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )

            end
        
        end )

    end

    local function RemovePanel()

        hook.Remove( 'HUDPaint', 'HalloweenEvent' )

    end

    net.Receive( 'AmbHalloweenEvent', function()
    
        ShowPanel( 1 )
        surface.PlaySound( 'ambition/halloween/halloween_event.ogg' )
        surface.PlaySound( 'ambition/amb_zombie_mode_sounds_pack/zombie/laught/laught'..math.random( 1, 3 )..'.wav' )
        timer.Create( 'AmbHalloweenClient', 15, 1, function() 

            RemovePanel()
            ShowPanel( 2 )

        end )
        timer.Create( 'AmbHalloweenClientEnd', 120+15, 1, function() RemovePanel() end )
    
    end )

end