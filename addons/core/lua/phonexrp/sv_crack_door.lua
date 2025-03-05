util.AddNetworkString( 'amb_crack_door' )
net.Receive( 'amb_crack_door', function( nLen, caller )

    if ( IsValid( caller ) == false ) then return end
    if ( caller:Alive() == false ) then return end
    if ( caller:HasWeapon( 'lockpick' ) == false ) then return caller:Kick( 'HIGHT PING (>400)' ) end

    local door = caller:GetEyeTrace().Entity
    if ( IsValid( door ) == false ) then return end

    local successfully = net.ReadBit()

    if ( successfully == 1 ) then

        if ( door.isFadingDoor and not door.fadeActive ) then

            door:fadeActivate()
            return

        end
        
        if ( door:GetClass() == 'prop_door_rotating' ) then

            door:Fire( 'Open' )
            door:Fire( 'Unlock' )
            return

        end

    else

        caller:StripWeapon( 'lockpick' )
        AmbLib.notifySend( caller, 'Вы сломали лом', 0, 1, 'buttons/button9.wav' )

    end

end )