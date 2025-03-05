--[[
	                            Ambitions HUDes.
	— Два типа худа: минималистичный и шаблонный для проекта [ Ambition ]
	Сервер находится в полном подчинений проекта: [ Ambition ] (AMB)

	Примеры названий:

	local amb_var = nil
	local function AmbLib_func( sString, nNumber, fNumber )

	amb_var = nil -- global
	function AmbLib_funcStart() -- global

	local COLOR_BLOHA -- it's for static var

	tTableAdmins = {}

	[22.07.20]
		• Отключение стандартных единиц худа и создание первого (минималистичного) худа.
	.
    [05.08.20]
        • Добавил Info Panel.
    .
    [25.08.20] -- PhonexRP
        • под DarkRP сделал худикс.
    .
    [22.09.20] -- PhonexRP
        • Изменил цвет для работ, чтобы их было видно (особенно бандитские работы)
    .
    [20.10.20] -- PhonexRP
        • Сделал для Factory 2 худ.
    .
]]

CreateClientConVar( "amb_hud", "0", true, false )
CreateClientConVar( "amb_hud_logo", "1", true, false )
CreateClientConVar( "amb_hud_info", "1", true, false )

local w = ScrW()
local h = ScrH()

local COLOR_BLOCK = Color( 10, 10, 10, 225 )

--##### Disable Classic Hud ###################################################################
local tNamesElementsHud = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
    ["CHudCloseCaption"] = true,
    ["CHudDamageIndicator"] = true,
    ["CHudDeathNotice"] = true,
    ["CHudGeiger"] = true,
    ["CHudHintDisplay"] = true,
    ["CHudPoisonDamageIndicator"] = true,
    ["CHudMessage"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["CHudSquadStatus"] = true,
    ["CHudVehicle"] = true,
    ["CHudSuitPower"] = true,
}

local function AmbHud_DisableClassicHud( sName )
    if ( tNamesElementsHud[ sName ] ) then return false end
end
hook.Add( "HUDShouldDraw", "amb_0x702", AmbHud_DisableClassicHud )

local function AmbHud_DisableTargetID()
    return false
end
hook.Add( "HUDDrawTargetID", "amb_0x702", AmbHud_DisableTargetID )
--#############################################################################################

local panel_h = 64

local function setDate()
    local date = os.date( '%c', os.time() )
    return date
end

local date = os.date( '%X', os.time() )

local COLOR_PANEL = Color( 0, 0, 0, 200 )

hook.Add( "HUDPaint", "amb_0x228", function()

    if ( GetConVar( "amb_hud" ):GetInt() == 0 ) then return end

    if ( LocalPlayer():GetNWInt( 'Metal' ) > 0 ) then

        draw.SimpleTextOutlined( 'Металл: x'..LocalPlayer():GetNWInt( 'Metal' ), 'ambFont22', w - 8, h - 120, AMB_COLOR_GRAY, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )

    end

    for i = 0, #AmbFactory2Chunks do

        if ( LocalPlayer():GetNWInt( 'Workpiece_'..i ) > 0 ) then

            draw.SimpleTextOutlined( 'Заготовка '..AmbFactory2Chunks[i].chunk..': x'..LocalPlayer():GetNWInt( 'Workpiece_'..i ), 'ambFont22', w - 8, h - 120 - 30 * i, AMB_COLOR_WHITE, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )

        end

    end

    for i = 0, #AmbFactory2Chunks do

        if ( LocalPlayer():GetNWInt( 'Detail_'..i ) > 0 ) then

            draw.SimpleTextOutlined( 'Деталь '..AmbFactory2Chunks[i].chunk..': x'..LocalPlayer():GetNWInt( 'Detail_'..i ), 'ambFont22', w - 8, h - 240 - 30 * i, AMB_COLOR_AMBITION, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )

        end

    end


    if ( GetConVar( "amb_hud" ):GetInt() == 1 ) then

	    surface.SetDrawColor( 214, 137, 56, 255 )
	    surface.DrawRect( 0, 0, w, 24 )
        surface.DrawRect( 0, h-24, w, 24 )
        surface.SetDrawColor( 54, 54, 54, 255 )
	    surface.DrawRect( 2, 2, w - 4, 20 )
        surface.DrawRect( 2, h-22, w - 4, 20 )

        if ( GetConVar( 'phonexrp_lockdown' ):GetBool() ) then

            draw.RoundedBox( 6, 4, 26, 320, 100, COLOR_PANEL )
            draw.SimpleText( 'Комендантский Час', 'ambFont32', 42, 30, AMB_COLOR_RED, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'все по домам!', 'ambFont18', 112, 60, AMB_COLOR_RED, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleTextOutlined( 'Причина: '..GetConVar( 'phonexrp_lockdown_reason' ):GetString(), 'ambFont22', 12, 96, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )

        end

        -- up
        draw.SimpleText( LocalPlayer():GetNWString("amb_players_name"), "ambFont18",
        124, 12,
        Color( 255, 255, 255, 255 ),
        TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER
        )
        surface.SetDrawColor( 214, 137, 56, 255 )
	    surface.DrawRect( 252, 0, 2, 24 )

        surface.SetDrawColor( 214, 137, 56, 255 )
        surface.DrawRect( 492, 0, 2, 24 )

        if tonumber( LocalPlayer():GetNWInt("amb_orgs") ) > 0 then
            draw.SimpleText( AmbOrgs[ LocalPlayer():GetNWInt("amb_orgs") ].name, "ambFont18",
            372, 12,
            AmbOrgs[ LocalPlayer():GetNWInt("amb_orgs") ].color ,
            TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER
            )
        else
            draw.SimpleTextOutlined( team.GetName( LocalPlayer():Team() ), "ambFont18",
            372, 12,
            AMB_COLOR_WHITE,
            TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,
            1, team.GetColor( LocalPlayer():Team() )
            )
        end

        draw.SimpleText( LocalPlayer():GetUserGroup(), "ambFont18",
        600, 12,
        Color( 255, 255, 255, 255 ),
        TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER
        )
        surface.SetDrawColor( 214, 137, 56, 255 )
	    surface.DrawRect( 704, 0, 2, 24 )

        -- down
        surface.SetDrawColor( 217, 80, 65, 255 )
        surface.DrawRect( 4, h-20, 16, 16 ) -- hp

        draw.SimpleText( LocalPlayer():Health(), "ambFont18",
        40, h - 11,
        Color( 255, 255, 255),
        TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER
        )
        surface.SetDrawColor( 214, 137, 56, 255 )
	    surface.DrawRect( 64, h-22, 2, 24 )

        surface.SetDrawColor( 65, 156, 217, 255 )
        surface.DrawRect( 68, h-20, 16, 16 ) -- armor

        draw.SimpleText( LocalPlayer():Armor(), "ambFont18",
        104, h - 11,
        Color( 255, 255, 255),
        TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER
        )
        surface.SetDrawColor( 214, 137, 56, 255 )
	    surface.DrawRect( 128, h-22, 2, 24 )

        surface.SetDrawColor( 25, 185, 25, 255 )
        surface.DrawRect( 132, h-20, 16, 16 ) -- money

        draw.SimpleText( LocalPlayer():getDarkRPVar('money'), "ambFont18",
        192, h - 11,
        Color( 255, 255, 255),
        TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER
        )
        surface.SetDrawColor( 214, 137, 56, 255 )
	    surface.DrawRect( 242, h-22, 2, 24 )

        surface.SetDrawColor( 164, 65, 217, 255 )
        surface.DrawRect( 246, h-20, 16, 16 ) -- lvl

        draw.SimpleText( LocalPlayer():GetNWInt("amb_players_level").." ["..LocalPlayer():GetNWInt("amb_players_exp").."/"..LocalPlayer():GetNWInt("amb_players_max_exp").."]", "ambFont18",
        302, h - 11,
        Color( 255, 255, 255),
        TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER
        )
        surface.SetDrawColor( 214, 137, 56, 255 )
	    surface.DrawRect( 352, h-22, 2, 24 )

        --draw.SimpleText( 'Ком.Час. На улице нельзя находиться!', "ambFont18",
        --365, h - 11,
        --AMB_COLOR_RED,
        --TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER
        --)

    elseif ( GetConVar( "amb_hud" ):GetInt() == 2 ) then

        surface.SetFont('ambFont22')
        draw.RoundedBox( 6, 4, h-168, surface.GetTextSize( team.GetName( LocalPlayer():Team() ) ) + 8, 32, COLOR_PANEL )

        draw.SimpleTextOutlined( team.GetName( LocalPlayer():Team() ), "ambFont22",
            8, h - 152,
            AMB_COLOR_WHITE,
            TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER,
            1, team.GetColor( LocalPlayer():Team() )
        )

        if ( GetConVar( 'phonexrp_lockdown' ):GetBool() ) then

            draw.RoundedBox( 6, 16, 16, 320, 100, COLOR_PANEL )
            draw.SimpleText( 'Комендантский Час', 'ambFont32', 54, 24, AMB_COLOR_RED, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleText( 'все по домам!', 'ambFont18', 122, 54, AMB_COLOR_RED, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
            draw.SimpleTextOutlined( 'Причина: '..GetConVar( 'phonexrp_lockdown_reason' ):GetString(), 'ambFont22', 24, 82, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, AMB_COLOR_BLACK )

        end


        draw.RoundedBox( 6, 4, h-128-4, 196, 128, COLOR_PANEL )

        draw.SimpleTextOutlined( LocalPlayer():GetNWString('amb_players_name'), "ambFont22",
        12, h - 20,
        AMB_COLOR_WHITE,
        TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER,
        1, AMB_COLOR_BLACK
        )

        draw.SimpleTextOutlined( "Жизнь: "..LocalPlayer():Health(), "ambFont22",
        12, h - 20 - 24,
        AMB_COLOR_WHITE,
        TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER,
        1, AMB_COLOR_BLACK
        )

        draw.SimpleTextOutlined( "Броня: "..LocalPlayer():Armor(), "ambFont22",
        12, h - 20 - 24 * 2,
        AMB_COLOR_WHITE,
        TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER,
        1, AMB_COLOR_BLACK
        )

        draw.SimpleTextOutlined( "Уровень: "..LocalPlayer():GetNWInt('amb_players_level'), "ambFont22",
        12, h - 20 - 24 * 3,
        AMB_COLOR_WHITE,
        TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER,
        1, AMB_COLOR_BLACK
        )

        draw.SimpleTextOutlined( "Бюджет: "..LocalPlayer():getDarkRPVar('money')..'$', "ambFont22",
        12, h - 20 - 24 * 4,
        AMB_COLOR_WHITE,
        TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER,
        1, AMB_COLOR_BLACK
        )
        
    end


    if ( GetConVar( "amb_hud_logo" ):GetInt() == 1 ) then
        if ( GetConVar( "amb_hud" ):GetInt() == 1 ) then
            draw.SimpleText( "[PhonexRP]", "ambFont18",
            w-2, 12,
            Color( 255, 107, 52, math.sin( CurTime() * 1  ) * 50 + 200 ),
            TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER
            )
        else
            draw.RoundedBox(4, w - 128 - 4, 4, 128, 44, Color(255, 137, 56, 255) )
            draw.RoundedBox(6, w - 130, 6, 124, 40, Color(54, 54, 54, 255 ) )

            draw.SimpleText( "PhonexRP", "ambFont22",
            w - 64, 26,
            Color( 255, 255, 255, 255 ),
            TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER
            )
        end
    end

    if ( GetConVar( "amb_hud_info" ):GetInt() == 1 ) then
        if IsValid( LocalPlayer():GetEyeTrace().Entity ) and LocalPlayer():GetEyeTrace().Entity:IsPlayer() == false and LocalPlayer():GetPos():Distance( LocalPlayer():GetEyeTrace().Entity:GetPos() ) < 200 then
            surface.SetFont('ambFont18')
            local x, y = surface.GetTextSize( "[1] "..LocalPlayer():GetEyeTrace().Entity:GetModel() ) -- todo: доделать проверки на расширение
            draw.RoundedBox( 4, w-x-16, h/2-panel_h/2, x+16, panel_h, COLOR_BLOCK )

            draw.SimpleText( "[1] "..LocalPlayer():GetEyeTrace().Entity:GetModel(), "ambFont18",
                w-4, h/2-panel_h/2+12,
                Color( 255, 255, 255, 255 ),
                TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER
            )

            if IsValid( LocalPlayer():GetEyeTrace().Entity ) then
                panel_h = 148
                draw.SimpleText( "[2] "..LocalPlayer():GetEyeTrace().Entity:GetClass().." ".."["..LocalPlayer():GetEyeTrace().Entity:EntIndex().."]", "ambFont18",
                    w-4, h/2-panel_h/2+32,
                    Color( 255, 255, 255, 255 ),
                    TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER
                )
                if LocalPlayer():GetEyeTrace().Entity:CPPIGetOwner() then
                    draw.SimpleText( "[4] Owner: "..LocalPlayer():GetEyeTrace().Entity:CPPIGetOwner():GetNWString('amb_players_name'), "ambFont18",
                        w-4, h/2-panel_h/2+72,
                        Color( 255, 255, 255, 255 ),
                        TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER
                    )
                else
                    draw.SimpleText( "[4] Owner: Server", "ambFont18",
                        w-4, h/2-panel_h/2+72,
                        Color( 255, 255, 255, 255 ),
                        TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER
                    )
                end

                if LocalPlayer():GetEyeTrace().Entity:GetModelScale() then
                        draw.SimpleText( "[5] Scale: "..LocalPlayer():GetEyeTrace().Entity:GetModelScale(), "ambFont18",
                            w-4, h/2-panel_h/2+92,
                            Color( 255, 255, 255, 255 ),
                            TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER
                        )
                else
                    draw.SimpleText( "[5] Scale: nil", "ambFont18",
                        w-4, h/2-panel_h/2+92,
                        Color( 255, 255, 255, 255 ),
                        TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER
                    )
                end

                draw.SimpleText( "[7] "..math.floor( LocalPlayer():GetEyeTrace().Entity:GetAngles()[1] )..",  "..math.floor( LocalPlayer():GetEyeTrace().Entity:GetAngles()[2] )..",  "..math.floor( LocalPlayer():GetEyeTrace().Entity:GetAngles()[3] ), "ambFont18",
                    w-4, h/2-panel_h/2+132,
                    Color( 255, 255, 255, 255 ),
                    TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER
                )
            end

            if LocalPlayer():GetEyeTrace().Entity:GetMaterial() == '' then
                draw.SimpleText( "[3] Default", "ambFont18",
                    w-4, h/2-panel_h/2+52,
                    Color( 255, 255, 255, 255 ),
                    TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER
                )
            else
                draw.SimpleText( "[3] "..LocalPlayer():GetEyeTrace().Entity:GetMaterial(), "ambFont18",
                    w-4, h/2-panel_h/2+52,
                    Color( 255, 255, 255, 255 ),
                    TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER
                )
            end

            draw.SimpleText( "[6] "..math.floor( LocalPlayer():GetEyeTrace().Entity:GetPos()[1] )..",  "..math.floor( LocalPlayer():GetEyeTrace().Entity:GetPos()[2] )..",  "..math.floor( LocalPlayer():GetEyeTrace().Entity:GetPos()[3] ), "ambFont18",
                w-4, h/2-panel_h/2+112,
                Color( 255, 255, 255, 255 ),
                TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER
            )
        end
    end
end )

local function copyInfo( info )

    if IsValid( LocalPlayer():GetEyeTrace().Entity ) and LocalPlayer():GetPos():Distance( LocalPlayer():GetEyeTrace().Entity:GetPos() ) < 200 then
        if info == 1 then
            SetClipboardText( LocalPlayer():GetEyeTrace().Entity:GetModel() )
        elseif info == 2 then
            SetClipboardText( LocalPlayer():GetEyeTrace().Entity:GetClass() )
        elseif info == 3 then
            SetClipboardText( LocalPlayer():GetEyeTrace().Entity:GetMaterial() )
        elseif info == 4 then
            SetClipboardText( 'im gay' )
        elseif info == 5 then
            SetClipboardText( LocalPlayer():GetEyeTrace().Entity:GetModelScale().." Scale" )
        elseif info == 6 then
            SetClipboardText( math.floor( LocalPlayer():GetEyeTrace().Entity:GetPos()[1] )..", "..math.floor( LocalPlayer():GetEyeTrace().Entity:GetPos()[2] )..", "..math.floor( LocalPlayer():GetEyeTrace().Entity:GetPos()[3] ) )
        elseif info == 7 then
            SetClipboardText( math.floor( LocalPlayer():GetEyeTrace().Entity:GetAngles()[1] )..", "..math.floor( LocalPlayer():GetEyeTrace().Entity:GetAngles()[2] )..", "..math.floor( LocalPlayer():GetEyeTrace().Entity:GetAngles()[3] ) )
        end
    end

end

hook.Add( 'PlayerButtonDown', 'amb_0x1032', function( ePly, bind )
    if input.IsKeyDown( KEY_PAD_1 ) then
        copyInfo( 1 )
    elseif input.IsKeyDown( KEY_PAD_2 ) then
        copyInfo( 2 )
    elseif input.IsKeyDown( KEY_PAD_3 ) then
        copyInfo( 3 )
    elseif input.IsKeyDown( KEY_PAD_4 ) then
        copyInfo( 4 )
    elseif input.IsKeyDown( KEY_PAD_5 ) then
        copyInfo( 5 )
    elseif input.IsKeyDown( KEY_PAD_6 ) then
        copyInfo( 6 )
    elseif input.IsKeyDown( KEY_PAD_7 ) then
        copyInfo( 7 )
    end
end )

-- Данное творение принадлежит проекту [.ambition]