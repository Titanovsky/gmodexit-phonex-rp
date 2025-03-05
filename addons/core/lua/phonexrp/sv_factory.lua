hook.Add( 'InitPostEntity', 'amb_0x4049', function()

    if ( game.GetMap() ~= 'rp_downtown_v4_exl' ) then return end

    Entity( 273 ):Remove()
    Entity( 274 ):Remove()

end )