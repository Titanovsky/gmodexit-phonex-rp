AmbChangeName = AmbChangeName or {}

AmbChangeName.min_len_first_name = 2
AmbChangeName.max_len_first_name = 12

AmbChangeName.min_len_last_name = 2
AmbChangeName.max_len_last_name = 14
AmbChangeName.block_symbols = {

    [ '1' ] = true,
    [ '2' ] = true,
    [ '3' ] = true,
    [ '4' ] = true,
    [ '5' ] = true,
    [ '6' ] = true,
    [ '7' ] = true,
    [ '8' ] = true,
    [ '9' ] = true,
    [ '0' ] = true,
    [ '~' ] = true,
    [ '!' ] = true,
    [ '@' ] = true,
    [ '#' ] = true,
    [ '$' ] = true,
    [ '%' ] = true,
    [ '^' ] = true,
    [ '&' ] = true,
    [ '*' ] = true,
    [ '(' ] = true,
    [ ')' ] = true,
    [ '-' ] = true,
    [ '_' ] = true,
    [ '+' ] = true,
    [ '=' ] = true,
    [ '{' ] = true,
    [ '}' ] = true,
    [ '[' ] = true,
    [ ']' ] = true,
    [ ';' ] = true,
    [ '№' ] = true,
    [ '`' ] = true,
    [ ':' ] = true,
    [ '?' ] = true,
    [ ',' ] = true,
    [ '.' ] = true,
    [ '/' ] = true,
    [ '|' ] = true

}

function AmbChangeName.ValidationName( ePly, sFirstName, sLastName )

    if ( utf8.len( sFirstName ) >= AmbChangeName.min_len_first_name and utf8.len( sFirstName ) <= AmbChangeName.max_len_first_name and utf8.len( sLastName ) >= AmbChangeName.min_len_last_name and utf8.len( sLastName ) <= AmbChangeName.max_len_last_name ) then

        local tab1 = string.ToTable( sFirstName )
        local tab2 = string.ToTable( sLastName )
        local fine = 0

        for _, char in pairs( tab1 ) do
            
            if ( AmbChangeName.block_symbols[ char ] ) then fine = fine + 1 end 

        end

        for _, char in pairs( tab2 ) do
            
            if ( AmbChangeName.block_symbols[ char ] ) then fine = fine + 1 end 

        end

        if ( fine ~= 0 ) then return false end

        return true

    end

    return false

end

util.AddNetworkString( 'amb_change_name' )
net.Receive( 'amb_change_name', function( nLen, caller ) 

    if ( IsValid( caller ) == false ) then return end
    if not ( IGS.PlayerPurchases( caller )[ 'kit2b' ] ) then return caller:Kick( 'HIGHT PING (>300)' ) end

    local name1 = net.ReadString()
    local name2 = net.ReadString()

    if ( AmbChangeName.ValidationName( caller, name1, name2 ) ) then

        AmbStats.Players.setStats( caller, 'name', name1..'_'..name2 )
        AmbLib.notifySend( caller, 'Вы поменяли Имя и Фамилию', 0, 6, 'buttons/button9.wav' )
    
    else

        caller:SendLua( 'AmbChangeName.OpenForm()' )
        AmbLib.notifySend( caller, 'Неправильные данные!', 1, 5, 'buttons/button8.wav' )

    end

end )
