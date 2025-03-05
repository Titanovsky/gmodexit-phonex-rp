--[[
	Основные переменные и таблицы для серверов на проекте [ Ambition ].
	Сервер находится в полном подчинений проекта: [ Ambition ]

	[05.09.20]
		• Эту сис-му тоже сделал где-то в середине августа. Код надо переработать + добавить приглашения и менюшку.
	.
    [12.10.20]
        • Полностью переделал систему: добавил архитектуру, разделил на блоки, переписал логику.
    .
]]

AmbDuel = AmbDuel or {} 

AmbDuel.min_award = 500
AmbDuel.max_award = 100000

AmbDuel.max_health = 400

AmbDuel.delay = 40
AmbDuel.time_duel = 300
AmbDuel.time_accept = 10
AmbDuel.delay_start = 15

AmbDuel.bet = true

AmbDuel.places = { 
    [1] = { pos = Vector( 2884, 1277, -142 ), ang = Angle( 0, 90, 0 ) },
    [2] = { pos = Vector( 2890, 1003, -141 ), ang = Angle( 0, -90, 0 ) },
    ['end'] = { pos = Vector( 2880, 1439, -125 ), ang = Angle( 0, -180, 0 ) }
}

AmbDuel.min_level = 2
AmbDuel.return_guns = {
    'weapon_physgun',
    'weapon_physcannon',
    'keys',
    'itemstore_pickup',
    'gmod_tool'
}
AmbDuel.access_guns = {
    'weapon_crossbow',
    'weapon_357',
    'weapon_stunstick',

    'arccw_minigun',
    'weapon_smg1',

    'arccw_ragingbull',
    'arccw_welrod',
    'arccw_db_sawnoff',
    'arccw_winchester1873',
    'arccw_melee_fists'
}
