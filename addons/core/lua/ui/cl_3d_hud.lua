local function AmbHud_PlayerHud1( ply )
	if ( !IsValid( ply ) ) then return end
	if ( ply == LocalPlayer() ) then return end
	if ( !ply:Alive() ) then return end
	local name = ply:GetNWString('amb_players_name')..' ['..ply:EntIndex()..']'
	local teams = team.GetName( ply:Team() ) or 'Безработный'
	

	local dis = EyePos():DistToSqr( ply:GetPos() )

	if ( dis < 800^2 ) then

		--surface.SetAlphaMultiplier( math.Clamp( 3 - ( dis / 99999 ), 0, 1 ) )
		local _,max = ply:GetRotatedAABB( ply:OBBMins(), ply:OBBMaxs() )
		local rot = ( ply:GetPos() - EyePos() ):Angle().yaw - 90 --  чтобы крутилась.
		local center = ply:LocalToWorld( ply:OBBCenter() )

		cam.Start3D2D( center + Vector( 0, 0, math.abs( max.z/2 + 6 ) ), Angle( 0, rot, 90 ), 0.13)
			if #ply:GetNWString('amb_players_name') > 1 then
				draw.SimpleTextOutlined( teams, "amb_fonts32", 0, -45, team.GetColor( ply:Team() ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
				draw.SimpleTextOutlined( name, "amb_fonts32", 0, -15, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
			elseif ply:IsBot() then
				--draw.SimpleTextOutlined( teams "amb_fonts32", 0, -45, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
				draw.SimpleTextOutlined( ply:Nick()..' ['..ply:EntIndex()..']', "amb_fonts32", 0, -15, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
			else
				draw.SimpleTextOutlined( 'Заходит...', "amb_fonts32", 0, -15, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
			end

			if #ply:GetNWString( 'amb_players_virus_name' ) > 0 then
				draw.SimpleTextOutlined( "Заражён: "..ply:GetNWString( 'amb_players_virus_name' ), "amb_fonts32", 0, -32, Color( 200, 0, 0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
			end

			if ply:GetNWBool("amb_players_orgs") then
				draw.SimpleTextOutlined( ply:GetNWString("amb_players_orgs_name"), "ambFont22", 0, -75, AMB_COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, AMB_COLOR_RED )
			end

			if ply:GetNWBool("amb_bad") == true then
				draw.SimpleTextOutlined( "Bad Entity", "amb_fonts32", 0, -45, Color( 200, 0, 0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
			end
		cam.End3D2D()
		--surface.SetAlphaMultiplier( 1 )
	end
end


hook.Add( "PostPlayerDraw", "amb_0x16", function( ePly )
	AmbHud_PlayerHud1( ePly )
	--AmbVGUI_drawPanelNPC( ePly, 660 )
end )


