--[[
	Гайд менюшки для [DarkRP].
	Сервер находится в полном подчинений проекта: [ Ambition ]

    Вот сейчас 17 августа, и я на 100% уверен, что кто зайдёт на серв с целью стырить клиентскую часть, он обязательно захочет
    именно этот аддон. Потом что он будет необычным и очень свежим для ДаркРП. Да, он не перевернёт Гмод и сознание комьюнити,
    но это один маленький шаг к тому, чтобы адекватные и порядочные люди начали снова подтягиваться на сервера. Сам по себе
    скрипт простой, но он интересный в том плане, что я смог реализовать то, что считал невозможным в марте.
    Я хочу гордиться этим скриптом, и напишу его днём на свежую голову. И уже на самом ДаркРП (из-за карты).

    Если ты это читаешь, то знай:
    Во-первых, это убогий код, ибо я не программист. 
    Во-вторых, если я узнаю о его продаже, я выложу его на гитхаб.
    В-третьих, при попытки продажи, твой SteamID и IP( он сохранится при заходе ) будут в чёрным списке скриптеров.
    В-четвёртых, если зальёшь на свой сервер, пожалуйста, не удаляй вотемарку и не испорти код! Backdoor с моей стороны тут нет, серверной части нет.
    В-пятых, если ты скачал этот скрипт, то проверь его на Backdoor, ибо его могли сюда всунуть.
                                                                                                                        с уважением Titanovsky

	[17.08.20]
		• Первая версия гайда. Отложил до 12:00 по МСК. todo: логику, заполнить таблицу, начало, сами фреймы и конец (мультик) с музыкой и картинками
	.
    [20.08.20]
        • Перенёс открытие, немного переделал текст.
    .
    [18.09.20]
        • Сделал для расстановку для карты rp_downtown_v4_exl
    .

    todo: сделать кастомный текст кнопки: '>>', 'идти', 'продолжить'
]]


if ( AMB == false ) then return end 

AmbGuide = AmbGuide or {}

AmbGuide.guidePerson = 'Билли'

local w = ScrW()
local h = ScrH()
local COLOR_BLOCK = Color( 0, 0, 0, 150 )
local scare_png = Material( 'ambition/amb_guide/amb_billy_scare1.png' )
local bandit_png = Material( 'ambition/amb_guide/amb_bandit1.png' )
local gun_png = Material( 'ambition/amb_guide/amb_pistol1.png' )
local effect_png = Material( 'ambition/amb_guide/amb_pistol_effect1.png' )
local bandit_two_png = Material( 'ambition/amb_guide/amb_bandit2.png' )
local delay = 0


AmbGuide.main = {

    {
        pos = Vector( -2662.816406, -1945.769043, 380.942566 ),
        angle = Angle( 29.035515, 26.733103, 0.000000 ),
        picture = Material('ambition/amb_guide/amb_billy_idle1.png'),
        name = AmbGuide.guidePerson,
        text = 
        [[Привет! Я твой друг и расскажу тебе про сервер. Ты попал на PhonexRP
он принадлежит проекту [ Ambition ]. Режим DarkRP, так что тебе..
надо соблюдать Правила! Давай пройдёмся по этому чудесному городу.]],
        delay = 4
    },

    {
        pos = Vector( -1054.652710, -131.942673, -65.714798 ),
        angle = Angle( -6.022881, 179.007980, 0.000000 ),
        picture = Material('ambition/amb_guide/amb_billy_idle1.png'),
        name = AmbGuide.guidePerson,
        text = 
        [[Это ПУ (Полиц. Управление) и Мэрия. На сервере нельзя просто так 
убивать! Если тебя убили, то ты должен забыть про прошлую жизнь.. 
в течении 2 минут, иначе будет НЛР! И админы накажут тебя.]],
        delay = 2
    },

    {
        pos = Vector( -453.705139, 823.711670, -56.338768 ),
        angle = Angle( 8.873085, 108.343033, 0.000000 ),
        picture = Material('ambition/amb_guide/amb_billy_idle2.png'),
        name = AmbGuide.guidePerson,
        text = 
        [[Это здание Оружейного Завода.
Тут можно заработать небольшие деньги, конечно не миллионы..
Но на жизнь хватит. Притом тут есть бонус за Уровень.
Кстати, Чтобы заработать уровень, надо Просто играть!]],
        delay = 3
    },

    {
        pos = Vector( 1186.262207, 4143.785156, 80.129768 ),
        angle = Angle( 9.805905, -148.668304, 0.000000 ),
        picture = Material('ambition/amb_guide/amb_billy_idle1.png'),
        name = AmbGuide.guidePerson,
        text = 
        [[Оу, май.. Это же Криминальный Район. Здесь опасно.. 
Запомни, если тебя грабят больше двух человек то нужно подчиниться.. 
и сделать то, что они просят, иначе ты нарушишь FearRP и получишь..
Предупреждение или бан!
Кхм.. Давай лучше пойдём отседева, а то мне не по себе.]],
        delay = 2
    }
}

function AmbGuide.startGuide()
    AmbGuide.setFrame( 1, true )
end


function AmbGuide.setFrame( frame, bContinue )
    -- print('da') -- debug

    if ValidPanel( amb_guide_frame ) then amb_guide_frame:Remove() end

    AmbGuide.camPos( true, frame )
    
    amb_guide_frame = vgui.Create( 'DPanel' )
    amb_guide_frame:MakePopup()
    amb_guide_frame:SetSize( 640, 180 )
    amb_guide_frame:SetPos( w/2 - amb_guide_frame:GetWide()/2, h - amb_guide_frame:GetTall() )
    amb_guide_frame.Paint = function( self, w, h )
        draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
        draw.RoundedBox( 4, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK )

        surface.SetFont( 'ambFont32' )
        local x, _ = surface.GetTextSize(  AmbGuide.main[frame].name )
        draw.RoundedBox( 4, self:GetWide()/2, 18, x + 12, 28, COLOR_BLOCK )
        draw.SimpleText( AmbGuide.main[frame].name, 'ambFont32', self:GetWide()/2 + 6, 30, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

        surface.SetDrawColor( 255, 255, 255, 255 )
        surface.SetMaterial( AmbGuide.main[frame].picture )
	    surface.DrawTexturedRect( 24, self:GetTall()/2-64, 128, 128 )
    end

    amb_guide_text = vgui.Create( "DLabel", amb_guide_frame )
    amb_guide_text:SetPos( 160, 52 )
    amb_guide_text:SetFont( 'HudHintTextLarge' )
    amb_guide_text:SetTextColor( AMB_COLOR_WHITE )
    amb_guide_text:SetText(AmbGuide.main[frame].text )
    amb_guide_text:SizeToContents()


    timer.Simple( AmbGuide.main[frame].delay, function()
        amb_guide_button = vgui.Create( 'DButton', amb_guide_frame )
        amb_guide_button:SetSize( 60, 32 )
        amb_guide_button:SetPos( amb_guide_frame:GetWide()/2-amb_guide_button:GetWide()/2, amb_guide_frame:GetTall() - amb_guide_button:GetTall() - 16 )
        amb_guide_button:SetFont( 'ambFont32' )
        amb_guide_button:SetTextColor( AMB_COLOR_WHITE )
        amb_guide_button:SetText( '>>' )
        amb_guide_button.Paint = function( self, w, h )
            draw.RoundedBox( 2, 0, 0, w, h, AMB_COLOR_AMBITION )
            draw.RoundedBox( 2, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
        end
        amb_guide_button.DoClick = function( self )
            amb_guide_frame:Remove()
            AmbGuide.camPos( false )
            if ( bContinue ) then
                if ( frame >= #AmbGuide.main ) then return AmbGuide.endGuide( true ) end
                AmbGuide.setFrame( frame+1, bContinue )
            end
        end
    end )
end

function AmbGuide.endGuide( flag )
    if ( flag ) then
        AmbGuide.camPos( true, #AmbGuide.main )
        
        surface.PlaySound('ambition/amb_guide/amb_guide_end.mp3')

        amb_guide_end = vgui.Create( 'DPanel' )
        amb_guide_end:MakePopup()
        amb_guide_end:SetSize( 640, 180 )
        amb_guide_end:SetPos( w/2 - amb_guide_end:GetWide()/2, h - amb_guide_end:GetTall() )
        amb_guide_end.Paint = function( self, w, h )
            draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
            draw.RoundedBox( 4, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK )

            surface.SetFont( 'ambFont32' )
            local x, _ = surface.GetTextSize(  AmbGuide.main[#AmbGuide.main].name )
            draw.RoundedBox( 4, self:GetWide()/2, 18, x + 12, 28, COLOR_BLOCK )
            draw.SimpleText( AmbGuide.main[#AmbGuide.main].name, 'ambFont32', self:GetWide()/2 + 6, 30, AMB_COLOR_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.SetMaterial( scare_png )
            surface.DrawTexturedRect( 24, self:GetTall()/2-64, 128, 128 )
        end

        amb_guide_text = vgui.Create( "DLabel", amb_guide_end )
        amb_guide_text:SetPos( 160, 52 )
        amb_guide_text:SetFont( 'HudHintTextLarge' )
        amb_guide_text:SetTextColor( AMB_COLOR_WHITE )
        amb_guide_text:SetText( 'Не понял, что за...' )
        amb_guide_text:SizeToContents()


        local bandit = vgui.Create( 'DPanel' )
        bandit:SetSize( 128, 128 )
        bandit:SetPos( w, h - amb_guide_end:GetTall() - 142 )
        bandit.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,0) )

            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.SetMaterial( bandit_png )
            surface.DrawTexturedRect( 0, 0, 128, 128 )
        end

        bandit:MoveTo( w/2, h - amb_guide_end:GetTall() - 142, 13, 0, -1,
        function()
            amb_guide_gun = vgui.Create( 'DPanel' )
            amb_guide_gun:SetSize( 128, 128 )
            amb_guide_gun:SetPos( w/2-22, h - amb_guide_end:GetTall() - 100 )
            amb_guide_gun.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,0) )

                surface.SetDrawColor( 255, 255, 255, 255 )
                surface.SetMaterial( gun_png )
                surface.DrawTexturedRect( 0, 0, 128, 128 )
            end
            timer.Simple( 1, function() 
                amb_guide_effect = vgui.Create( 'DPanel' )
                amb_guide_effect:SetSize( 128, 128 )
                amb_guide_effect:SetPos( w/2-72, h - amb_guide_end:GetTall() - 106 )
                amb_guide_effect.Paint = function( self, w, h )
                    draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,0) )

                    surface.SetDrawColor( 255, 255, 255, 255 )
                    surface.SetMaterial( effect_png )
                    surface.DrawTexturedRect( 0, 0, 128, 128 )
                end
            end )
        end )

        timer.Simple( 14.6, function()
                AmbGuide.endGuide( false )
                bandit:Remove()
                amb_guide_gun:Remove()
                amb_guide_effect:Remove()

                amb_guide_end = vgui.Create( 'DPanel' )
                amb_guide_end:MakePopup()
                amb_guide_end:SetSize( 640, 180 )
                amb_guide_end:SetPos( w/2 - amb_guide_end:GetWide()/2, h - amb_guide_end:GetTall() )
                amb_guide_end.Paint = function( self, w, h )
                    draw.RoundedBox( 4, 0, 0, w, h, AMB_COLOR_AMBITION )
                    draw.RoundedBox( 4, 4, 4, w-8, h-8, AMB_COLOR_SMALL_BLACK )

                    surface.SetDrawColor( 255, 255, 255, 255 )
                    surface.SetMaterial( bandit_two_png )
                    surface.DrawTexturedRect( 24, self:GetTall()/2-64, 128, 128 )
                end

                amb_guide_text = vgui.Create( "DLabel", amb_guide_end )
                amb_guide_text:SetPos( 160, 52 )
                amb_guide_text:SetFont( 'ambFont32' )
                amb_guide_text:SetTextColor( AMB_COLOR_WHITE )
                amb_guide_text:SetText( 'Хватит Болтавни Погнали Играть!' )
                amb_guide_text:SizeToContents()

                amb_guide_button = vgui.Create( 'DButton', amb_guide_end )
                amb_guide_button:SetSize( 128, 42 )
                amb_guide_button:SetPos( amb_guide_end:GetWide()/2-amb_guide_button:GetWide()/2, amb_guide_end:GetTall() - amb_guide_button:GetTall() - 16 )
                amb_guide_button:SetFont( 'ambFont32' )
                amb_guide_button:SetText( 'Играть' )
                amb_guide_button.Think = function()
                    amb_guide_button:SetTextColor( HSVToColor(  ( CurTime() * 64 ) % 360, 1, 1 ) )
                end
                amb_guide_button.Paint = function( self, w, h )
                    draw.RoundedBox( 2, 0, 0, w, h, AMB_COLOR_AMBITION )
                    draw.RoundedBox( 2, 2, 2, w-4, h-4, AMB_COLOR_SMALL_BLACK )
                end
                amb_guide_button.DoClick = function( self )
                    amb_guide_end:Remove()
                    AmbGuide.camPos( false )
                    LocalPlayer():ConCommand('amb_hud 1')
                end
            end )
    else
        if ValidPanel( amb_guide_end ) then amb_guide_end:Remove() end
    end
end
concommand.Add('puka', function() AmbGuide.startGuide() end )

function AmbGuide.camPos( start, frame )
    if ( start ) then
        hook.Add( 'CalcView', 'amb_0x8', function( ply, vector_pos, angle_angle, fov )
            local view = {
                origin = AmbGuide.main[frame].pos,
                angles = AmbGuide.main[frame].angle,
                fov = fov,
                drawviewer = true
            }

            return view
        end )
    else
        hook.Remove( 'CalcView', 'amb_0x8' )
    end
end
-- Сервер находится в полном подчинений проекта: [ Ambition ]

