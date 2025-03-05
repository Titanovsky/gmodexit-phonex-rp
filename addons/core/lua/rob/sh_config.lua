AmbRobCargo = AmbRobCargo or {}

AmbRobCargo.min_online = 4
AmbRobCargo.loss_gold_on_death = true
AmbRobCargo.speed_player_with_gold = 3

AmbRobCargo.rewards = {
    min_save = 250,
    max_save = 600,
    min_rob = 8000,
    max_rob = 24000
}

AmbRobCargo.delays = {
    min_delay = 1800,
    max_delay = 3600,
    time_rob = 600
}

AmbRobCargo.cargo = {
    name = 'Золото',
    mdl = 'models/okxapack/valuables/valuable_bar_stack_double.mdl',
    hp = 800,
    amount = 3,
    place = {
        { pos = Vector( 3926, 3639, -196 ), ang = Angle( 0, 180, 0 ) },
        { pos = Vector( 3926, 3206, -196 ), ang = Angle( 0, 180, 0 ) },
        { pos = Vector( 3926, 2770, -196 ), ang = Angle( 0, 180, 0 ) }
    }
}


AmbRobCargo.security = {
    turn_on = true,
    repeat_spawn = true,
    guns = {
        'weapon_ar2',
    },
    mdls = {
        'models/Combine_Super_Soldier.mdl'
    },
    dmg = 3.32,
    min_hp = 300,
    max_hp = 800,
    amount = 4,
    place = {
        { pos = Vector( 3316, 3470, -68 ), ang = Angle( 0, 0, 0 ) },
        { pos = Vector( 3325, 3258, -68 ), ang = Angle( 0, 0, 0 ) },
        { pos = Vector( 3268, 2932, -196 ), ang = Angle( 0, 90, 0 ) },
        { pos = Vector( 3541, 3073, -196 ), ang = Angle( 0, -160, 0 ) },
        { pos = Vector( 3599, 2834, -196 ), ang = Angle( 0, 145, 0 ) },
        { pos = Vector( 3827, 2940, -196 ), ang = Angle( 0, 170, 0 ) },
        { pos = Vector( 3772, 3111, -196 ), ang = Angle( 0, -110, 0 ) },
        { pos = Vector( 3479, 3301, -196 ), ang = Angle( 0, -90, 0 ) },
        { pos = Vector( 3731, 3321, -196 ), ang = Angle( 0, -145, 0 ) },
        { pos = Vector( 3823, 3487, -196 ), ang = Angle( 0, -90, 0 ) },
        { pos = Vector( 3426, 3650, -196 ), ang = Angle( 0, -60, 0 ) },
        { pos = Vector( 3716, 2786, -196 ), ang = Angle( 0, -90, 0 ) },
        { pos = Vector( 3594, 2992, -196 ), ang = Angle( 0, -90, 0 ) },
        { pos = Vector( 3488, 2775, -196 ), ang = Angle( 0, -90, 0 ) },
        { pos = Vector( 3449, 3188, -196 ), ang = Angle( 0, -90, 0 ) },
        { pos = Vector( 3418, 3620, -196 ), ang = Angle( 0, -90, 0 ) },
        { pos = Vector( 3238, 3400, -68 ), ang = Angle( 0, -90, 0 ) }
    }
}

hook.Add( 'Initialize', 'WorkaroundForDarkRP', function()

    AmbRobCargo.criminal = {
        [ Tbandit1 ] = true,
        [ Tbandit1a ] = true,
        [ Tbandit1b ] = true,
        [ Tbandit2 ] = true,
        [ Tbandit2a ] = true,
        [ Tbandit2b ] = true,
        [ Tbandit3 ] = true,
        [ Tbandit3a ] = true
    }

    AmbRobCargo.police = {
        [ Tpolice1 ] = true,
        [ Tpolice2 ] = true,
        [ Tpolice2a ] = true,
        [ Tpolice3 ] = true,
        [ Tpolice4 ] = true,
        [ Tpolice4a ] = true,
        [ Tpolice4b ] = true,
        [ Tpolice4c ] = true,
        [ Tpolice4f ] = true,
        [ Tpolice5 ] = true
    }

end )
