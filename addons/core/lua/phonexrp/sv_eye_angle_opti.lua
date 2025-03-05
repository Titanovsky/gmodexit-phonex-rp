local angle_true_side = Angle( 0, -90, 0 )

hook.Add( 'PlayerSpawn', 'CitizenEyeAngleOnTrueSide', function( ePly ) 

    if ( ePly:Team() == Tcit ) then ePly:SetEyeAngles( angle_true_side ) end

end )