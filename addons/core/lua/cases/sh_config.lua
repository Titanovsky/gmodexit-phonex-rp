--[[
	Кейсы.
	Сервер находится в полном подчинений проекта: [ Ambition ]

	[10.09.20]
		• Система кейсов v 1.0. Без меню
	.
]]

AmbCases = AmbCases or {}

AmbCases.cases = {}

function AmbCases.addCase( sName, nType, sDescription, main_func )

    AmbCases.cases[nType] = {

        name = sName,
        desc = sDescription,
        func = main_func
        
    }

    MsgN( ' [AmbCases] Case: '..tostring(nType)..' has added! ')

end

AmbCases.addCase( 'Денежный Кейс #1', 1, '-', function( eActivator )

    local gifts = {}
    gifts[1] = 500
    gifts[2] = 2000
    gifts[3] = 10000
    gifts[4] = 25000
    gifts[5] = 64000

    local rand = math.random( 1, #gifts )

    AmbStats.Players.addStats( eActivator, '$', gifts[rand] )
    eActivator:ChatPrint('Вы открыли: Денежный Кейс #1' )
    eActivator:ChatPrint('Вам выпало: '..tostring(rand)..'/5   ( '..tostring(gifts[rand])..'$ )' )

end )

AmbCases.addCase( 'Денежный Кейс #2', 2, '-', function( eActivator )

    local gifts = {}
    gifts[1] = 0
    gifts[2] = 0
    gifts[3] = 0
    gifts[4] = 0
    gifts[5] = 0
    gifts[6] = 100000
    gifts[7] = 120000
    gifts[8] = 180000
    gifts[9] = 250000
    gifts[10] = 320000

    local rand = math.random( 1, #gifts )

    AmbStats.Players.addStats( eActivator, '$', gifts[rand] )
    eActivator:ChatPrint('Вы открыли: Денежный Кейс #2' )
    eActivator:ChatPrint('Вам выпало: '..tostring(rand)..'/10   ( '..tostring(gifts[rand])..'$ )' )

end )

AmbCases.addCase( 'Денежный Кейс #3', 3, '-', function( eActivator )

    local gifts = {}
    gifts[1] = 0
    gifts[2] = 0
    gifts[3] = 0
    gifts[4] = 0
    gifts[5] = 0
    gifts[6] = 0
    gifts[7] = 0
    gifts[8] = 0
    gifts[9] = 0
    gifts[10] = 400000
    gifts[11] = 450000
    gifts[12] = 500000
    gifts[13] = 600000
    gifts[14] = 1000000
    gifts[15] = 1500000

    local rand = math.random( 1, #gifts )

    AmbStats.Players.addStats( eActivator, '$', gifts[rand] )
    eActivator:ChatPrint('Вы открыли: Денежный Кейс #3' )
    eActivator:ChatPrint('Вам выпало: '..tostring(rand)..'/15   ( '..tostring(gifts[rand])..'$ )' )

end )





AmbCases.addCase( 'Оружейный Кейс #1', 4, '-', function( eActivator )

    local gifts = {

        'weapon_crowbar',
        'weapon_357',
        'weapon_smg1',
        'arccw_g18',
        'arccw_winchester1873'

    }


    local rand = math.random( 1, #gifts )

    eActivator:Give( gifts[rand] )
    eActivator:ChatPrint('Вы открыли: '..AmbCases.cases[4].name )
    eActivator:ChatPrint('Вам выпало: '..tostring(rand)..'/'..#gifts..'   ( '..gifts[rand]..' )' )

end )

AmbCases.addCase( 'Оружейный Кейс #2', 5, '-', function( eActivator )

    local gifts = {

        'weapon_crowbar',
        'weapon_357',
        'weapon_smg1',
        'arccw_g18',
        'arccw_winchester1873'

    }

    local rand = math.random( 1, #gifts )

    eActivator:Give( gifts[rand] )
    eActivator:ChatPrint('Вы открыли: '..AmbCases.cases[5].name )
    eActivator:ChatPrint('Вам выпало: '..tostring(rand)..'/'..#gifts..'   ( '..gifts[rand]..' )' )

end )

AmbCases.addCase( 'Оружейный Кейс #3', 6, '-', function( eActivator )

    local gifts = {

        'weapon_crowbar',
        'weapon_357',
        'weapon_smg1',
        'arccw_g18',
        'arccw_winchester1873'

    }


    local rand = math.random( 1, #gifts )

    eActivator:Give( gifts[rand] )
    eActivator:ChatPrint('Вы открыли: '..AmbCases.cases[6].name )
    eActivator:ChatPrint('Вам выпало: '..tostring(rand)..'/'..#gifts..'   ( '..gifts[rand]..' )' )

end )
