AmbWarn = AmbWarn or {}

local db = 'amb_warn'

AmbDB.createDataBase( db, [[ 
    'ID' varchar(255),
    'Name' varchar(255),
    'Warns' tinyint]] 
)

function AmbWarn.CreateWarnDataBase( ePly, nWarn )

    local ID = ePly:SteamID()
    local NAME = ePly:GetNWString( 'amb_players_name' )

    AmbDB.insertDate( db, 'ID, Name, Warns', sql.SQLStr( ID )..', '..sql.SQLStr( NAME )..', '..sql.SQLStr( nWarn ) )

end

function AmbWarn.UpdateWarnDataBase( ePly, nWarn )

    local ID = ePly:SteamID()

    sql.Query( 'UPDATE '..db..' SET Warns='..sql.SQLStr( nWarn )..' WHERE ID='..sql.SQLStr( ID ) )

end

function AmbWarn.CheckWarnDataBase( ePly )

    local ID = ePly:SteamID()

    if ( AmbDB.selectDate( db, 'ID', 'ID', ID ) == ID ) then return true end

    return false

end

function AmbWarn.SetWarnDataBase( ePly, nWarn )

    local ID = ePly:SteamID()

    if ( AmbWarn.CheckWarnDataBase( ePly ) ) then

        AmbWarn.UpdateWarnDataBase( ePly, nWarn )

    else

        AmbWarn.CreateWarnDataBase( ePly, nWarn )

    end

end

function AmbWarn.RemoveWarnDataBase( ePly )

    local ID = ePly:SteamID()

    AmbDB.wipeDate( db, 'ID', ID )

end

hook.Add( 'PlayerInitialSpawn', 'GiveWarnsPlayers', function( ePly )
    
    if ( AmbWarn.CheckWarnDataBase( ePly ) ) then
        
        local ID = ePly:SteamID()
        local count = tonumber( sql.QueryValue( 'SELECT Warns from '..db..' WHERE ID='..sql.SQLStr( ID ) ) )

        ePly:SetNWInt( 'Warns', count )

    end

end )