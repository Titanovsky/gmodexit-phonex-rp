hook.Add( 'PlayerSpawn', 'DonatePlayers', function( ePly ) 

    if ( ePly:GetUserGroup() == 'titanium' ) then

        timer.Simple( 0.4, function()

            ePly:SetHealth( ePly:Health() + 50 )
            ePly:SetArmor( 75 )

        end )

    end

end )