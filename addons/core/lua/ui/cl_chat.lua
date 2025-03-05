local COLOR_WHITE	= Color(255,255,255)
local COLOR_BRACKET = Color( 196, 196, 196 )
local COLOR_TEXT 	= Color( 244, 244, 244 )
local COLOR_GRAY 	= Color( 200, 200, 200 )

hook.Add( "OnPlayerChat", "amb_0x1234", function( ePly, sText )
	if ( ePly == nil ) or ( ePly == Entity(-1) ) then

		chat.AddText( COLOR_BRACKET, "[", COLOR_WHITE, "?", COLOR_BRACKET, "] ", COLOR_TEXT, sText )
	else
		if ( ePly:GetNWInt('amb_orgs') > 0 ) then

			local COLOR_ORGS = AmbOrgs[ ePly:GetNWInt('amb_orgs') ].color
			if string.EndsWith( sText, 'ooc' ) then
				chat.AddText( COLOR_GRAY, "OOC | ["..ePly:EntIndex().."]", COLOR_ORGS, " [", COLOR_WHITE, ePly:GetNWString('amb_players_name'), COLOR_ORGS, "] ", COLOR_TEXT, sText )
			else
				chat.AddText( COLOR_GRAY, "["..ePly:EntIndex().."]", COLOR_ORGS, " [", COLOR_WHITE, ePly:GetNWString('amb_players_name'), COLOR_ORGS, "] ", COLOR_TEXT, sText )
			end
		else
			local COLOR_TEAMS = team.GetColor( ePly:Team() )
			if string.EndsWith( sText, 'ooc' ) then
				sText= string.Replace( sText, 'ooc', '' )
				chat.AddText( COLOR_GRAY, "OOC | ["..ePly:EntIndex().."]", COLOR_TEAMS, " [", COLOR_WHITE, ePly:GetNWString('amb_players_name'), COLOR_TEAMS, "] ", COLOR_TEXT, sText )
			elseif string.EndsWith( sText, 'adv' ) then
				sText= string.Replace( sText, 'adv', '' )
				chat.AddText( COLOR_GRAY, "A |", COLOR_TEAMS, " [", COLOR_WHITE, ePly:GetNWString('amb_players_name'), COLOR_TEAMS, "] ", Color( 255,255, 0), sText )
			elseif string.EndsWith( sText, 'ww' ) then
				sText= string.Replace( sText, 'ww', '' )
				chat.AddText( COLOR_TEAMS, " [", COLOR_WHITE, ePly:GetNWString('amb_players_name'), COLOR_TEAMS, "] ", AMB_COLOR_GRAY, sText )
			elseif string.EndsWith( sText, 'yy' ) then
				sText= string.Replace( sText, 'yy', '' )
				chat.AddText( COLOR_TEAMS, " [", COLOR_WHITE, ePly:GetNWString('amb_players_name'), COLOR_TEAMS, "] ", AMB_COLOR_GREEN, sText )
			elseif string.EndsWith( sText, 'br' ) then
				sText= string.Replace( sText, 'br', '' )
				chat.AddText( AMB_COLOR_RED, "Новости |", COLOR_TEAMS, " [", COLOR_WHITE, ePly:GetNWString('amb_players_name'), COLOR_TEAMS, "] ", AMB_COLOR_WHITE, sText )
			else
				chat.AddText( COLOR_GRAY, "["..ePly:EntIndex().."]", COLOR_TEAMS, " [", COLOR_WHITE, ePly:GetNWString('amb_players_name'), COLOR_TEAMS, "] ", COLOR_TEXT, sText )
			end
		end
	end
	return true
end)