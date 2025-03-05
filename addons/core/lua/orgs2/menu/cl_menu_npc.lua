local w = ScrW()
local h = ScrH()

function AmbOrgs2.openMenuCreateOrg()

    local frame = vgui.Create( 'DFrame' )
    frame:SetSize( w/3, h/3 )
    frame:Center()
    frame:MakePopup()
    frame:SetTitle( '' )
    frame:ShowCloseButton( true )

    frame.Paint = function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_RED )
        draw.RoundedBox( 0, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK ) 

        draw.SimpleText('Создание организаций обойдётся Вам всего в '..AmbOrgs2.cost_for_org..'$', "ambFont18", w/2, 24, AMB_COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )

    end

    local create = vgui.Create( 'DButton', frame )
    create:SetSize( 260, 52 )
    create:SetPos( frame:GetWide()/2 - create:GetWide()/2, frame:GetWide()/2 - create:GetWide()/2 )
    create:SetFont( 'ambFont22' )
    create:SetTextColor( AMB_COLOR_RED )
    create:SetText( 'Купить организацию' )
    create.Paint = function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_RED )
        draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK ) 

    end
    create.DoClick = function()

        frame:Remove()
        
        AmbOrgs2.openRegisterMenu()

    end

end

function AmbOrgs2.openMenuLeaveOrg()

    local frame = vgui.Create( 'DFrame' )
    frame:SetSize( w/3, h/3 )
    frame:Center()
    frame:MakePopup()
    frame:SetTitle( '' )
    frame:ShowCloseButton( true )
    frame.Paint = function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_RED )
        draw.RoundedBox( 0, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK ) 

    end

    local leave = vgui.Create( 'DButton', frame )
    leave:SetSize( 200, 52 )
    leave:SetPos( frame:GetWide()/2 - leave:GetWide()/2, frame:GetWide()/2 - leave:GetWide()/2 )
    leave:SetFont( 'ambFont22' )
    leave:SetTextColor( AMB_COLOR_RED )
    leave:SetText( 'Покинуть организацию' )
    leave.Paint = function( self, w, h )

        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_RED )
        draw.RoundedBox( 0, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK ) 

    end
    leave.DoClick = function()

        frame:Remove()
        
        net.Start( 'amb_leave_org' )
            net.WriteEntity( LocalPlayer() )
        net.SendToServer()

    end

end