--[[
	Приглашение в Организацию

	[31.08.20]
		• Переименовал в cl_invite.lua
	.
]]
local COLOR_MENU = Color( 59, 59, 59, 250 )
local COLOR_TEXT = Color( 255, 255, 255 )
local w = ScrW()
local h = ScrH()

function AmbOrgs2.toInvite( name, leader, id )
    local inv = vgui.Create( "DFrame" )
    inv:SetTitle( '' )
    inv:SetSize( w/1.5, h/1.8 )
    inv:Center()
    inv:MakePopup()
    inv:ShowCloseButton( true )
    inv.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, COLOR_MENU )
        draw.SimpleText("Приглашение", "ambFont54", inv:GetWide()/2-8, 65, COLOR_TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Вы были приглашены лидером: "..leader, "ambFont22", inv:GetWide()/2-8, 115, COLOR_TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("В организацию "..name, "ambFont22", inv:GetWide()/2-8, 145, team.GetColor( index ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Вы готовы вступить?", "ambFont22", inv:GetWide()/2-8, 255, COLOR_TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local btn_ok = vgui.Create( "DButton", inv )
    btn_ok:SetText( "Согласен" )
    btn_ok:SetTextColor( COLOR_TEXT )
    btn_ok:SetFont("ambFont32")
    btn_ok:SetSize( 240, 50 )
    btn_ok:SetPos( inv:GetWide()/2-btn_ok:GetWide()-40, inv:GetTall()-btn_ok:GetTall()-15 )
    btn_ok.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_GREEN )
    end
    btn_ok.DoClick = function( self )
        inv:Remove()
        net.Start('amb_invite_org')
            net.WriteEntity( LocalPlayer() )
            net.WriteUInt( id, 14 )
        net.SendToServer()
    end

    local btn_cancel = vgui.Create( "DButton", inv )
    btn_cancel:SetFont("ambFont32")
    btn_cancel:SetText( "Отказываюсь" )
    btn_cancel:SetTextColor( COLOR_TEXT )
    btn_cancel:SetPos( inv:GetWide()-btn_ok:GetWide()*1.7, inv:GetTall()-btn_ok:GetTall()-15 )
    btn_cancel:SetSize( 240, 50 )
    btn_cancel.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, AMB_COLOR_RED )
    end
    btn_cancel.DoClick = function( self )
        inv:Remove()
    end

    timer.Simple( 9, function() if ValidPanel( inv ) then inv:Remove() end end )
end

--[[
local function AmbOrgs_invite( name, leader, index )
    local inv = vgui.Create( "DFrame" )
    inv:SetTitle( "" )
    inv:SetSize( w/1.5, h/1.8 )
    inv:Center()
    inv:MakePopup()
    inv:ShowCloseButton( false )
    inv.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, COLOR_MENU )
        draw.SimpleText("Invite", "ambFont54", inv:GetWide()/2-8, 65, COLOR_TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Вы были приглашены игроком: "..leader:GetNWString('amb_players_name').." ...", "ambFont22", inv:GetWide()/2-8, 115, COLOR_TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("во фракцию "..name, "ambFont22", inv:GetWide()/2-8, 145, team.GetColor( index ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Вы готовы вступить?", "ambFont22", inv:GetWide()/2-8, 255, COLOR_TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local btn_ok = vgui.Create( "DButton", inv )
    btn_ok:SetText( "Согласен" )
    btn_ok:SetTextColor( COLOR_TEXT )
    btn_ok:SetFont("ambFont32")
    btn_ok:SetSize( 240, 50 )
    btn_ok:SetPos( inv:GetWide()/2-btn_ok:GetWide()-40, inv:GetTall()-btn_ok:GetTall()-15 )
    btn_ok.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, COLOR_BLUE )
    end
    btn_ok.DoClick = function( self )
        net.Start( "a_o_i_p_accept_done" )
            net.WriteEntity( LocalPlayer() )
            net.WriteUInt( index, 6 )
        net.SendToServer()
        inv:Remove()
    end

    local btn_cancel = vgui.Create( "DButton", inv )
    btn_cancel:SetFont("ambFont32")
    btn_cancel:SetText( "Отказываюсь" )
    btn_cancel:SetTextColor( COLOR_TEXT )
    btn_cancel:SetPos( inv:GetWide()-btn_ok:GetWide()*1.7, inv:GetTall()-btn_ok:GetTall()-15 )
    btn_cancel:SetSize( 240, 50 )
    btn_cancel.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, COLOR_RED )
    end
    btn_cancel.DoClick = function( self )
        inv:Remove()
    end

    timer.Simple( 9, function() if ValidPanel( inv ) then inv:Remove() end end )
end


net.Receive("a_o_i_p_accept", function(len)
    local name = net.ReadString()
    local id = net.ReadUInt( 6 )
    AmbOrgs_invite( name, AmbOrgs[id].leader, id )
end)
]]


-- Данное творение принадлежит проекту [ Ambition ]