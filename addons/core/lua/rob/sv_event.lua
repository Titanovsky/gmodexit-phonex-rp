AmbRobCargo = AmbRobCargo or {}

AmbRobCargo.valid_event = false

function AmbRobCargo.StartEvent()

    timer.Create( 'AmbRobCargo', math.random( AmbRobCargo.delays.min_delay, AmbRobCargo.delays.max_delay ), 1, function()

        AmbRobCargo.StartEvent()

        if ( #player.GetAll() > AmbRobCargo.min_online ) then

            for _, ply in pairs( player.GetAll() ) do

                AmbLib.chatSend( ply, 'Груз с Золотом прибудет через 2 минуты!', 1, 20 )

            end

            timer.Simple( 120, function() AmbRobCargo.Start() end )
            
        end

    end )

end

AmbRobCargo.StartEvent()

function AmbRobCargo.Pay()

    if ( #ents.FindByClass( 'amb_rob_cargo' ) >= AmbRobCargo.cargo.amount ) then

        local money = math.random( AmbRobCargo.rewards.min_save, AmbRobCargo.rewards.max_save )

        for _, ply in pairs( player.GetAll() ) do

            if ( AmbRobCargo.criminal[ ply:Team() ] == false ) then

                AmbStats.Players.addStats( ply, '$', money )
                AmbLib.chatSend( ply, 'Груз с Золотом был благополучно доставлен', 1, 6 )

            end

        end

    end

end

function AmbRobCargo.Start()

    AmbRobCargo.valid_event = true

    AmbRobCargo.SpawnNPCs()
    AmbRobCargo.SpawnCargoes()
    if AmbRobCargo.security.repeat_spawn then AmbRobCargo.RepeatSpawnNPCs() end

    for _, ply in pairs( player.GetAll() ) do

        AmbLib.chatSend( ply, AMB_COLOR_AMBITION, '[•] ', AMB_COLOR_WHITE, 'На Городской Склад прибыл груз с Золотом, его выгруз будет через 10 минут.' )

    end 

    timer.Create( 'AmbRobCargoEnd', AmbRobCargo.delays.time_rob, 1, function() AmbRobCargo.End() end )

end

function AmbRobCargo.End()

    AmbRobCargo.valid_event = false

    AmbRobCargo.Pay()
    AmbRobCargo.GarbageCollector()

end