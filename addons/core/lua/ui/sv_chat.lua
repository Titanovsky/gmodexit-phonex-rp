hook.Add( 'PlayerSay', 'amb_0x4224', function( ply, text )

	if ( ply:GetNWBool( 'ulx_muted' ) ) then return end

	if string.GetChar( text, 2 ) == '/' or ( string.match( text, 'ooc', 2 ) ) then
		return text..' ooc'
	elseif ( string.match( text, 'advert', 2 ) ) then
		return text..' adv'
	elseif string.GetChar( text, 2 ) == 'w' then
		return text..' ww'
	elseif string.GetChar( text, 2 ) == 'y' then
		return text..' yy'
	elseif ( string.match( text, 'broadcast', 2 ) ) and string.GetChar( text, 1 ) == '/' then
		return text..' br'
	end

	if ply:Team() == Talien1 or ply:Team() == Talien1a then
		local r = math.random( 1, 4 )
		--ply:ChatPrint(r)
		if r == 4 then
			ply:EmitSound( 'ambition/amb_zombie_mode_sounds_pack/zombie/coming/coming'..tostring(math.random(1,10))..'.wav', 999 )
		end
	end
end )