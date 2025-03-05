AmbPhonexCoins = AmbPhonexCoins or {}

local db = 'amb_phonex_coins'

AmbDB.createDataBase( db, [[
    'ID' varchar(255) NOT NULL PRIMARY KEY,
    'Coins' REAL]]
)

function AmbPhonexCoins.CreateData( ePly )

    local query = Format( '%s, %f', sql.SQLStr( ePly:SteamID() ), 0.000 )
    AmbDB.insertDate( db, 'ID, Coins', query )

end

function AmbPhonexCoins.SaveData( ePly )

    local amount = ePly:GetNWFloat( 'PhonexCoins' )

    AmbDB.updateDate( db, 'Coins', amount, 'ID', ePly:SteamID() )
    AmbLib.chatSend( ePly, AMB_COLOR_AMBITION, '[•] ', AMB_COLOR_WHITE, 'У вас ', AMB_COLOR_AMETHYST, tostring( amount )..'f', AMB_COLOR_WHITE, ' PhonexCoins' )

end

function AmbPhonexCoins.SetCoins( ePly, nAmount )

    ePly:SetNWFloat( 'PhonexCoins', nAmount )
    AmbPhonexCoins.SaveData( ePly )

end

function AmbPhonexCoins.AddCoins( ePly, nAmount )

    ePly:SetNWFloat( 'PhonexCoins', ePly:GetNWFloat( 'PhonexCoins' ) + nAmount )
    AmbPhonexCoins.SaveData( ePly )

end

hook.Add( 'PlayerInitialSpawn', 'PhonexCoinsPlayerInitialDataBase', function( ePly )

    local ID = ePly:SteamID()

    if ( AmbDB.selectDate( db, 'ID', 'ID', ID ) ~= ID ) then AmbPhonexCoins.CreateData( ePly ) end

    ePly:SetNWFloat( 'PhonexCoins', tonumber( AmbDB.selectDate( db, 'Coins', 'ID', ID ) ) )

end )