AmbDuel = AmbDuel or {} 

AmbDuel.max_bet = 0
AmbDuel.winner = Entity( 0 )

local players_tab = {}

function AmbDuel.PlaceBet( ePlayer, eDuelist, nBet )

    if ( AmbDuel.bet == false ) then return end
    ePlayer:ChatPrint( '1')
    if ( timer.Exists( 'AmbDuelTime' ) == false ) then return end
    ePlayer:ChatPrint( '2')
    if ( players_tab[ ePlayer:EntIndex() ] == ePlayer ) then return end
    ePlayer:ChatPrint( '3')

    nBet = math.Round( nBet )
    if ( AmbStats.Players.getStats( ePlayer, '$' ) < nBet ) then return end
    ePlayer:ChatPrint( '4')
    if ( nBet > AmbDuel.max_bet ) then AmbLib.notifySend( ply, 'Ставка должна быть меньше '..AmbDuel.max_bet, 1, 6, 'buttons/button10.wav' ) return end
    ePlayer:ChatPrint( '5')

    ePlayer.duel_bet_duelist = eDuelist
    ePlayer.duel_bet = nBet
    AmbStats.Players.addStats( ePlayer, '$', -nBet )
    players_tab[ ePlayer:EntIndex() ] = ePlayer
    AmbLib.notifySend( ePlayer, 'Вы поставили ставку: '..nBet..' на '..eDuelist:GetNWString('amb_players_name'), 2, 10, 'buttons/button6.wav' )

end

function AmbDuel.TheEndBet()

    if ( AmbDuel.bet == false ) then return end

    for _, ply in pairs( players_tab ) do

        if ( IsValid( ply ) == false ) then continue end

        if ( ply.duel_bet_duelist == AmbDuel.winner ) then 

            AmbLib.notifySend( ply, 'Вы выйграли ставку!', 0, 6, 'buttons/button6.wav' )
            AmbStats.Players.addStats( ply, '$', ply.duel_bet * 2 )

        else

            AmbLib.notifySend( ply, 'Вы проиграли ставку!', 1, 6, 'buttons/button10.wav' )

        end

    end

    players_tab = {}

end

function AmbDuel.SendAllPlayersMaxBet( nBet )

    for _, v in pairs( player.GetAll() ) do
        
        v:SendLua( 'AmbDuel.max_bet='..tostring( nBet ) )

    end

end

util.AddNetworkString( 'amb_bet' )
net.Receive( 'amb_bet', function( nLen, caller )

    if ( AmbDuel.bet == false ) then caller:Kick( 'HIGHT PING (>254)' ) return end

    if ( IsValid( caller ) == false ) then return end
    if AmbDuel.IsDuelist( caller ) then caller:Kick( 'HIGHT PING (>258)' ) return end

    local duelist = net.ReadEntity()
    local bet = net.ReadUInt( 22 )

    --if ( bet <= 0 ) then caller:Kick( 'HIGHT PING (>252)' ) return end  

    AmbDuel.PlaceBet( caller, duelist, bet )

end )