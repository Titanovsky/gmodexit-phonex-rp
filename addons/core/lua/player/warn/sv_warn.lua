AmbWarn = AmbWarn or {}

AmbWarn.max_counts_warn = 5

function AmbWarn.SetWarn( ePly, nWarn )

    ePly:SetNWInt( 'Warns', nWarn )
    AmbWarn.SetWarnDataBase( ePly, nWarn )

end

function AmbWarn.GiveWarn( ePly, sReason )

    AmbWarn.SetWarn( ePly, ePly:GetNWInt( 'Warns' ) + 1 )

    local count = ePly:GetNWInt( 'Warns' )

    if ( count >= AmbWarn.max_counts_warn ) then
        
        AmbWarn.RemoveWarnDataBase( ePly )
        RunConsoleCommand( 'ulx', 'banid', ePly:SteamID(), '10080', 'Has been reached limit Warns ['..AmbWarn.max_counts_warn..']' )

    else

        AmbLib.chatSend( ePly, AMB_COLOR_AMBITION, '[•] ', AMB_COLOR_WHITE, 'Вы получили предупреждение [', AMB_COLOR_RED, tostring( count ), AMB_COLOR_WHITE, '/'..AmbWarn.max_counts_warn..']' )
        AmbLib.chatSend( ePly, AMB_COLOR_AMBITION, '[•] ', AMB_COLOR_WHITE, 'Причина предупреждения: ', AMB_COLOR_GRAY, sReason )
        AmbLib.notifySend( ePly, 'Пожалуйста, сделайте скрин причины предупреждения!', 1, 8, 'buttons/button10.wav' )

    end

end
