AmbLockDown = AmbLockDown or {}

AmbLockDown.time_end_lockdown = 480 -- 8 min
AmbLockDown.time_delay = 120
AmbLockDown.sound_start = 'npc/overwatch/cityvoice/f_confirmcivilstatus_1_spkr.wav'
AmbLockDown.sound_end = 'buttons/button16.wav'
AmbLockDown.string_start = 'Ком. Час начался! Ожидайте: '..tostring( math.Round( AmbLockDown.time_end_lockdown/60 ) )..' минут'
AmbLockDown.string_end = 'Ком. Час закончился!'

timer.Simple( 10, function() -- cuz darkrp

    AmbLockDown.access_job = {

        [ Tmayor ] = true

    }

end )

function AmbLockDown.SetLockDown( bStart )

    local lockdown = GetConVar( 'phonexrp_lockdown' )

    lockdown:SetBool( bStart )

end

function AmbLockDown.SetReasonLockDown( sReason )

    local reason = GetConVar( 'phonexrp_lockdown_reason' )

    reason:SetString( sReason )

end

function AmbLockDown.Notify( sSound, sText )

    for _, ply in pairs( player.GetAll() ) do

        AmbLib.notifySend( ply, sText, 0, 8, sSound )

    end

end

function AmbLockDown.StartLockDown( ePly, sReason )

    local reason = GetConVar( 'phonexrp_lockdown_reason' )

    if ( AmbLockDown.access_job[ ePly:Team() ] ) then

        if ( timer.Exists( 'AmbLockDownDelay' ) ) then return AmbLib.chatSend( ePly, AMB_COLOR_RED, '[•] ', AMB_COLOR_WHITE, 'Подождите ', AMB_COLOR_GRAY, tostring( math.Round( timer.TimeLeft( 'AmbLockDownDelay' ) ) ), ' секунд!' ) end

        AmbLockDown.SetLockDown( true )
        AmbLockDown.SetReasonLockDown( sReason )
        AmbLockDown.Notify( AmbLockDown.sound_start, AmbLockDown.string_start )

        print( '[AmbLockDown] Start lockdown: '..os.date( '%X', os.time() )..'\n' )

        timer.Create( 'AmbLockDown', AmbLockDown.time_end_lockdown, 1, function()
        
            AmbLockDown.SetLockDown( false )
            AmbLockDown.Notify( AmbLockDown.sound_end, AmbLockDown.string_end )

            timer.Create( 'AmbLockDownDelay', AmbLockDown.time_delay, 1, function() end )

            print( '[AmbLockDown] Close lockdown: '..os.date( '%X', os.time() )..'\n' )

        end )

    end

end
concommand.Add( 'amb_lockdown_on', function( ePly, cmd, args )

    if not ( args[1] ) then args[1] = 'Высокая Преступность' end

    AmbLockDown.StartLockDown( ePly, tostring( args[1] ) )

end )

function AmbLockDown.RemoveLockDown( ePly )

    local lockdown = GetConVar( 'phonexrp_lockdown' )

    if ( lockdown:GetBool() == false ) then return end

    if ( AmbLockDown.access_job[ ePly:Team() ] ) then

        timer.Create( 'AmbLockDownDelay', AmbLockDown.time_delay, 1, function() end )
        if ( timer.Exists( 'AmbLockDown' ) ) then timer.Remove( 'AmbLockDown' ) end
        
        AmbLockDown.SetLockDown( false )
        AmbLockDown.Notify( AmbLockDown.sound_end, AmbLockDown.string_end )

    end

end
concommand.Add( 'amb_lockdown_off', function( ePly, cmd, args )

    AmbLockDown.RemoveLockDown( ePly )

end )