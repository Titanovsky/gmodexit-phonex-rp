AmbChangeName = AmbChangeName or {}

local w = ScrW()
local h = ScrH()

function AmbChangeName.OpenForm()

    local frame = vgui.Create( "DFrame" )
    frame:SetSize( 400, 320 )
    frame:Center()
    frame:MakePopup()
    frame:ShowCloseButton( true )
    frame:SetTitle( '' )
    frame.Paint = function( self, w, h )

        draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
        draw.RoundedBox( 4, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK )

    end

    local te_first_name = vgui.Create( 'DTextEntry', frame ) 
    te_first_name:SetSize( frame:GetWide() - 24, 54 )
    te_first_name:SetPos( 12, frame:GetTall()/4 )
    te_first_name:SetFont( 'ambFont22' )
    te_first_name:SetValue( 'Введите сюда Имя' )
    te_first_name.OnGetFocus = function( self )

        self:SetValue( '' )

    end

    local te_last_name = vgui.Create( 'DTextEntry', frame ) 
    te_last_name:SetSize( frame:GetWide() - 24, 54 )
    te_last_name:SetPos( 12, frame:GetTall()/2 )
    te_last_name:SetFont( 'ambFont22' )
    te_last_name:SetValue( 'Введите сюда Фамилию' )
    te_last_name.OnGetFocus = function( self )

        self:SetValue( '' )

    end

    local send = vgui.Create( 'DButton', frame ) 
    send:SetSize( 82, 54 )
    send:SetPos( frame:GetWide()/2 - send:GetWide()/2, frame:GetTall()/1.32 )
    send:SetFont( 'ambFont22' )
    send:SetTextColor( AMB_COLOR_AMBITION )
    send:SetText( 'ОК' )
    send.Paint = function( self, w, h )

        draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
        draw.RoundedBox( 4, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )

    end
    send.DoClick = function( self )

        if ( #te_first_name:GetValue() > 1 and #te_last_name:GetValue() > 1 ) then

            frame:Remove()
            
            net.Start( 'amb_change_name' )
                net.WriteString( te_first_name:GetValue() )
                net.WriteString( te_last_name:GetValue() )
            net.SendToServer()

        else

            surface.PlaySound( 'buttons/button8.wav' )

        end

    end

end