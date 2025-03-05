--[[
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua
https://darkrp.miraheze.org/wiki/DarkRP:CustomJobFields
]]


local salaries = {
    ['homeless'] = 2,
    ['very_easy'] = 8,
    ['easy'] = 16,
    ['standart'] = 32,
    ['medium'] = 64,
    ['more_medium'] = 128,
    ['high'] = 256,
    ['very_high'] = 512,
    ['adminmode'] = 1024
}

local ALL_GROUPS = { 'user','premium', 'helper', 'd_moder', 'moder', 'manager', 'admin', 'ahc', 'sub_head_admin', 'head_admin', 'superadmin' }
local PREMIUM = { 'premium', 'manager', 'admin', 'ahc', 'sub_head_admin', 'head_admin', 'superadmin' }
local L1 = { 'ahc', 'sub_head_admin', 'head_admin', 'superadmin' }
local L2 = { 'd_moder', 'moder', 'manager', 'admin', 'ahc', 'sub_head_admin', 'head_admin', 'superadmin' }
local L3 = { 'sub_head_admin', 'superadmin', 'head_admin' }
local L4 = { 'superadmin' }

local drp = DarkRP
local setJob = drp.createJob


local COLOR_CITIZEN = Color( 6, 194, 71 )
local COLOR_WEAPONS = Color( 72, 10, 196 )


-- ## Мирные ######################################
Tcit = setJob( 
    'Житель', 
    {
        lvl = 1,
        color = COLOR_CITIZEN,
        model = {
            --'models/player/Group01/male_09.mdl'
            'models/player/stalker/packboy.mdl'
        },
        description = '• Обычный гражданин, работяга.', --  спасибо, фалька, что насрал свой DarkRP и заставляешь страдать
        admin = 0, --  спасибо, фалька, что насрал свой DarkRP и заставляешь страдать
        command = "jc1",
        max = 0,
        salary = salaries.standart,
        vote = false,
        props = 32, -- я добавил лимит пропов
        hasLicense = false,
        candemote = false,
        PlayerSetModel = function( ePly )
            if ( #ePly:GetNWString('amb_players_skin') > 1 ) then return ePly:GetNWString('amb_players_skin') end
        end,
        PlayerSpawn = function( ePly )
            timer.Simple( 0, function() ePly:SetupHands() end )
        end,

        category = "Мирные"
    }
)
Tgund1 = setJob( 
    'Оружейник', 
    {
        lvl = 1,
        color = AMB_COLOR_AMBITION,
        props = 64,
        model = {
            'models/player/monk.mdl'
        },
        description = '• Продавец Холодного, Лёгкого и Полу-Тяжёлого оружия.', 
        admin = 0, 
        command = "jc2",
        max = 0,
        salary = salaries.standart,
        vote = false,
        hasLicense = false,
        candemote = true,

        category = 'Мирные'
    }
)
Tgund3 = setJob( 
    'Продавец Оружия [Premium]', 
    {
        lvl = 1,
        color = COLOR_WEAPONS,
        weapons = { 'stunstick' },
        props = 64,
        PlayerSpawn = function( ePly )
            ePly:SetHealth( 150 ) 
            ePly:SetMaxHealth( 150 )
        end,
        model = {
            'models/player/dod_american.mdl',
            'models/player/dod_german.mdl',
        },
        description = '• Продавец всех орудий.', 
        admin = 0, 
        command = "jc4",
        max = 0,
        salary = salaries.standart,
        vote = false,
        hasLicense = false,
        candemote = false,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = "Купить ранг: Premium на F1 (/donat)",

        category = 'Мирные'
    }
)
Tgund2 = Tgund3
Tbussiness = setJob( 
    'Предприниматель', 
    {
        lvl = 4,
        color = COLOR_CITIZEN,
        props = 256,
        model = {
            'models/player/magnusson.mdl'
        },
        description = '• Человек, создающий крутой бизнес любыми путями.', 
        admin = 0, 
        command = "jbussiness1",
        max = 2,
        salary = salaries.standart,
        vote = false,
        hasLicense = false,
        candemote = true,

        category = 'Мирные'
    }
)

local COLOR_HOBO = Color( 133, 67, 16 )

Thobo1 = setJob( 
    'Бездомный', 
    {
        lvl = 1,
        color = COLOR_HOBO,
        weapons = { 'weapon_bugbait' },
        props = 64,
        model = {
            'models/player/corpse1.mdl'
        },
        description = '• Человек без определённого места жительства.', 
        admin = 0, 
        command = "jhobo1",
        max = 0,
        hobo = true,
        salary = salaries.homeless,
        vote = false,
        hasLicense = false,
        candemote = false,

        category = 'Мирные'
    }
)

Thobo1b = setJob( 
    'Император Бомжей [Premium]', 
    {
        lvl = 3,
        color = COLOR_WEAPONS,
        props = 128,
        weapons = { 'weapon_bugbait', 'weapon_crowbar' },
        model = {
            'models/player/corpse1.mdl'
        },
        description = '• Повелитель БомжеГрада.', 
        admin = 0, 
        command = "jhobo1b",
        max = 1,
        hobo = true,
        salary = salaries.standart,
        vote = false,
        hasLicense = false,
        candemote = true,
        PlayerSpawn = function( ePly )
            ePly:SetHealth( 250 ) 
            ePly:SetMaxHealth( 250 )
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = "Купить ранг: Premium на F1 (/donat)",

        category = 'Мирные'
    }
)

local COLOR_SEC = Color( 71, 186, 209 )

Tsec1 = setJob( 
    'Охранник', 
    {
        lvl = 3,
        weapons = { 'stunstick' },
        color = COLOR_SEC,
        model = {
            'models/player/odessa.mdl'
        },
        description = '• Простой охранник из пятёрочки.', 
        admin = 0, 
        command = "jsec1",
        max = 4,
        salary = salaries.standart,
        vote = false,
        hasLicense = true,
        candemote = true,

        category = 'Мирные'
    }
)

Tsec1a = setJob( 
    'Телохранитель [Premium]', 
    {
        lvl = 2,
        color = COLOR_SEC,
        weapons = { 'stunstick', 'weaponchecker', 'arccw_tmp' },
        model = {
            'models/player/leet.mdl'
        },
        description = '• Опытный телохранитель, обладатель большой палки-уебалки.', 
        admin = 0, 
        command = "jsec1a",
        max = 2,
        salary = salaries.high,
        vote = false,
        hasLicense = true,
        candemote = true,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = "Купить ранг: Premium на F1 (/donat)",

        category = 'Мирные'
    }
)

Tbank1 = setJob( 
    'Банкир', 
    {
        lvl = 4,
        color = AMB_COLOR_GREEN,
        props = 64,
        weapons = {},
        model = {
            'models/player/magnusson.mdl'
        },
        description = '• Банкир, может легально хранить маники граждан в Банке.', 
        admin = 0, 
        command = "jbank1",
        max = 2,
        salary = salaries.high,
        vote = true,
        hasLicense = true,
        candemote = true,

        category = 'Мирные'
    }
)
-- ################################################

local COLOR_MAYOR = Color( 186, 18, 9 )

-- ## Мэрия #######################################
Tmayor = setJob( 
    'Мэр', 
    {
        lvl = 3,
        description = '• Мэр Phonex, отвечающий за все социальные/экономические дела',
        admin = 0,
        color = COLOR_MAYOR,
        props = 128,
        model = {
            'models/player/putin.mdl',
            'models/player/mossman_arctic.mdl'
        },
        weapons = { 'unarrest_stick' },
        command = 'jgover1',
        max = 1,
        salary = salaries.very_high,
        vote = true,
        mayor = true,
        hasLicense = true,
        candemote = true,
        PlayerSpawn = function( ePly )
            ePly:SetHealth( 150 ) 
        end,
        PlayerDeath = function( ePly, weapon, killer ) 

            ePly:changeTeam( Tcit, true )

            if killer:IsPlayer() then
                if ( killer:Team() == Trev1 ) then
                    killer:changeTeam( Tmayor, true )
                    killer:ChatPrint('Отныне Вы мэр!')
                end
            end

            local random = math.random( 0, 1 )
            if IsValid( killer ) and killer:IsPlayer() then
                if random == 1 then
                    killer:ChatPrint('Вас поймали!')
                    killer:arrest( 300 )
                else
                    killer:ChatPrint('Вас не смогли поймать')
                end
            end
        end,

        category = 'Правительство'
    }
)

Tgover1 = setJob( 
    'Секретарь Мэра', 
    {
        lvl = 6,
        description = '• Помощник Мэра по делам раздачи лицензии и ком. часа',
        admin = 0,
        color = COLOR_MAYOR,
        props = 64,
        model = {
            'models/player/breen.mdl'
        },
        weapons = { 'stunstick' },
        command = 'jgover2',
        max = 2,
        salary = salaries.high,
        vote = true,
        mayor = true,
        hasLicense = true,
        candemote = true,

        category = 'Правительство'
    }
)

Tgover3 = setJob( 
    'Адвокат [Premium]', 
    {
        lvl = 4,
        description = '• Человек, выпускающий из тюрьмы людей под залог!',
        admin = 0,
        color = AMB_COLOR_BLUE,
        model = {
            'models/player/magnusson.mdl'
        },
        weapons = {},
        command = 'jgover3',
        max = 2,
        salary = salaries.high,
        vote = false,
        hasLicense = true,
        candemote = true,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = "Купить ранг: Premium на F1 (/donat)",

        category = 'Правительство'
    }
)

Tgover4 = setJob( 
    'ФСУ', 
    {
        lvl = 5,
        description = '• Охрана мэра и его секретаря, имеет мощное оружие',
        admin = 0,
        color = AMB_COLOR_BLUE,
        weapons = { 'stunstick', 'weaponchecker', 'arccw_usp', 'arccw_shorty', 'arccw_mp5' },
        model = {
            'models/player/barney.mdl'
        },
        command = 'jgover4',
        max = 2,
        salary = salaries.high,
        vote = true,
        hasLicense = true,
        candemote = true,
        PlayerSpawn = function( ePly )
            ePly:SetHealth( 175 ) 
            ePly:SetMaxHealth( 175 )
            ePly:SetArmor( 255 )
        end,

        category = 'Правительство'
    }
)
-- ################################################


local COLOR_BANDIT = Color( 56, 56, 56 )


-- ## Криминал ####################################
Tdealer = setJob( 
    'Нелегальный Продавец', 
    {
        lvl = 2,
        color = COLOR_WEAPONS,
        props = 128,
        model = { 'models/player/dod_german.mdl' },
        description = '• Продавец различных украденных и уникальных вещей.', 
        admin = 0, 
        command = "jcrim0",
        max = 1,
        salary = salaries.standart,
        vote = false,
        hasLicense = false,
        candemote = true,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = "Купить ранг: Premium на F1 (/donat)",

        category = 'Криминал'
    }
)

Tbandit1 = setJob( 
    'Бандит', 
    {
        lvl = 1,
        color = COLOR_BANDIT,
        props = 32,
        model = {
            'models/player/Group03/male_09.mdl'
        },
        description = '• Гражданин, ставший на путь криминала.', 
        admin = 0, 
        command = "jcrim1",
        max = 8,
        salary = salaries.easy,
        vote = false,
        hasLicense = false,
        candemote = true,
        PlayerSetModel = function( ePly )
            if ( #ePly:GetNWString('amb_players_skin') > 1 ) then return ePly:GetNWString('amb_players_skin') end
        end,
        PlayerSpawn = function( ePly )
            timer.Simple( 0, function() ePly:SetupHands() end )
        end,

        category = 'Криминал'
    }
)

Tbandit1a = setJob( 
    'Бандит-Ветеран [Premium]', 
    {
        lvl = 4,
        color = COLOR_BANDIT,
        weapons = { 'arccw_g18', 'arccw_melee_knife' },
        props = 64,
        model = {
            'models/player/arctic.mdl'
        },
        description = '• Настоящий Бандит с опытом, у которого всегда есть оружие.', 
        admin = 0, 
        command = "jcrim1a",
        max = 4,
        salary = salaries.standart,
        vote = false,
        hasLicense = false,
        candemote = true,
        PlayerSetModel = function( ePly )
            if ( #ePly:GetNWString('amb_players_skin') > 1 ) then return ePly:GetNWString('amb_players_skin') end
        end,
        PlayerSpawn = function( ePly )
            timer.Simple( 0, function() ePly:SetupHands() end )
            ePly:ChatPrint('[•] Введите /kit gang для получения оружия')
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = 'Купить ранг: Premium на F1 (/donat)',

        category = 'Криминал'
    }
)

local COLOR_DANGER_BANDIT = Color( 94, 0, 0 )

Tbandit1b = setJob( 
    'Призрак [Premium]', 
    {
        lvl = 3,
        color = COLOR_DANGER_BANDIT,
        weapons = { 'arccw_welrod', 'arccw_melee_knife', 'arccw_tmp' },
        props = 128,
        model = {
            'models/player/lcg/insurgentbravo.mdl'
        },
        description = '• Один из самых опасных Бандитов в городе, есть лицензии и доступ к RPG.', 
        admin = 0, 
        command = "jcrim1b",
        max = 2,
        salary = salaries.standart,
        vote = false,
        hasLicense = false,
        candemote = true,
        PlayerSpawn = function( ePly ) 
            ePly:SetHealth( 200 )
            ePly:SetMaxHealth( 200 )
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = 'Купить ранг: Premium на F1 (/donat)',

        category = 'Криминал'
    }
)

Tbandit2 = setJob( 
    'Взломщик', 
    {
        lvl = 2,
        color = COLOR_BANDIT,
        weapons = { },
        model = {
            'models/player/arctic.mdl'
        },
        description = '• Умелец в сфере Взламывание KeyPad и Дверей.', 
        admin = 0, 
        command = "jcrim2",
        max = 4,
        salary = salaries.easy,
        vote = false,
        hasLicense = false,
        candemote = true,
        PlayerSpawn = function( ePly ) ePly:ChatPrint( 'Вы должны сами купить отмычку!' ) end,

        category = 'Криминал'
    }
)
Tbandit2a = setJob( 
    'Домушник [Premium]', 
    {
        lvl = 2,
        color = COLOR_BANDIT,
        weapons = { 'lockpick' },
        model = {
            'models/player/lcg/insurgentcharlie.mdl'
        },
        description = '• Обладатель качественных отмычек и быстрой скорости.', 
        admin = 0, 
        command = "jcrim2a",
        max = 2,
        salary = salaries.easy,
        vote = false,
        hasLicense = false,
        candemote = true,
        PlayerSpawn = function( ePly ) 
            ePly:SetHealth( 120 )
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = 'Купить ранг: Premium на F1 (/donat)',

        category = 'Криминал'
    }
)
Tbandit2b = setJob( 
    'Грабитель [Premium]', 
    {
        lvl = 5,
        color = COLOR_DANGER_BANDIT,
        weapons = { 'lockpick', 'arccw_shorty' },
        model = {
            'models/player/lcg/insurgentcharlie.mdl'
        },
        description = '• Бандит с невероятной скоростью и лучшими инструментами.', 
        admin = 0, 
        command = "jcrim2b",
        max = 2,
        salary = salaries.easy,
        vote = false,
        hasLicense = false,
        candemote = true,
        PlayerSpawn = function( ePly ) 
            ePly:SetHealth( 175 )
            ePly:SetMaxHealth( 175 )
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = 'Купить ранг: Premium на F1 (/donat)',

        category = 'Криминал'
    }
)

Tbandit3 = setJob( 
    'Пахан [VIP]', 
    {
        lvl = 8,
        color = COLOR_BANDIT,
        weapons = { 'unarrest_stick', 'lockpick' },
        props = 128,
        model = {
            'models/player/gman_high.mdl'
        },
        description = '• Бандит, управляющий мелкими бандитами, собирающий банды.', 
        admin = 0, 
        command = "jcrim3",
        max = 1,
        salary = salaries.standart,
        vote = true,
        hasLicense = false,
        candemote = true,
        PlayerSpawn = function( ePly ) 
            ePly:SetHealth( 200 )
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = 'Купить ранг: Premium на F1 (/donat)',

        category = 'Криминал'
    }
)
Tbandit3a = setJob( 
    'Вор в законе [Premium]', 
    {
        lvl = 16,
        color = COLOR_DANGER_BANDIT,
        props = 256,
        weapons = { 'unarrest_stick', 'lockpick', 'arccw_ragingbull', 'arccw_fml_an94' },
        model = {
            'models/player/gman_high.mdl'
        },
        description = '• Невероятно умный и сильный человек, управляющий бандами в городе.', 
        admin = 0, 
        command = "jcrim3a",
        max = 1,
        salary = salaries.high,
        vote = false,
        hasLicense = true,
        candemote = true,
        PlayerSpawn = function( ePly ) 
            ePly:SetHealth( 220 )
            ePly:SetMaxHealth( 220 )
            ePly:SetArmor( 255 )
            ePly:SetRunSpeed( ePly:GetRunSpeed() * 1.4 )
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = 'Купить ранг: Titanium на F1 (/donat)',

        category = 'Криминал'
    }
)

Tdrug1 = setJob( 
    'Нарковарщик', 
    {
        lvl = 3,
        color = AMB_COLOR_BLACK,
        props = 64,
        model = {
            'models/player/hostage/hostage_04.mdl',
            'models/player/hostage/hostage_03.mdl'
        },
        description = '• Бандит, умеющий варить Метамфетамин.', 
        admin = 0, 
        command = "jnarko1",
        max = 4,
        salary = salaries.standart,
        vote = false,
        hasLicense = false,
        candemote = true,

        category = 'Криминал'
    }
)

Tchemic1 = setJob( 
    'Химик', 
    {
        lvl = 2,
        color = AMB_COLOR_RED,
        weapons = { 'stunstick' },
        props = 256,
        model = {
            'models/player/kleiner.mdl'
        },
        description = '• Учёный, который может синтезировать любые наркотики/лекарства/вирусы.', 
        admin = 0, 
        command = "jnarko2",
        max = 1,
        salary = salaries.standart,
        vote = false,
        hasLicense = false,
        candemote = true,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = "Купить ранг: Premium на F1 (/donat)",

        category = 'Криминал'
    }
)

Trev1 = setJob( 
    'Революционер', 
    {
        lvl = 4,
        color = AMB_COLOR_RED,
        weapons = {  'arccw_melee_knife' },
        model = {
            'models/player/breen.mdl'
        },
        description = '• Революционер, который может свергнуть Мэра и стать новым Мэром!', 
        admin = 0, 
        command = "jrev1",
        max = 1,
        salary = salaries.standart,
        vote = false,
        hasLicense = false,
        candemote = true,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = 'Купить ранг: Premium на F1 (/donat)',

        category = 'Криминал'
    }
)

Tkiller1 = setJob( 
    'Наёмник', 
    {
        lvl = 6,
        color = COLOR_BANDIT,
        model = {
            'models/player/leet.mdl'
        },
        description = '• Вы - наёмный убийца. Ваша цель - выполнять грязные заказы', 
        admin = 0, 
        command = "jkiller1",
        max = 2,
        salary = salaries.standart,
        vote = false,
        hasLicense = false,
        candemote = true,

        category = 'Криминал'
    }
)

Tkiller1a = setJob( 
    'Ассасин', 
    {
        lvl = 6,
        color = COLOR_BANDIT,
        weapons = { 'stunstick', 'arccw_melee_machete' },
        model = {
            'models/player/phoenix.mdl'
        },
        description = '• .', 
        admin = 0, 
        command = "jkiller1a",
        max = 2,
        salary = salaries.medium,
        vote = false,
        hasLicense = false,
        candemote = true,
        PlayerSpawn = function( ePly )
            ePly:SetHealth( 150 ) 
            ePly:SetMaxHealth( 150 )
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = "Купить ранг: Premium на F1 (/donat)",

        category = 'Криминал'
    }
)
-- ################################################

local cops = {
    'models/player/clannypolice/male_09.mdl',
    'models/player/clannypolice/male_08.mdl',
    'models/player/clannypolice/male_07.mdl',
    'models/player/clannypolice/male_06.mdl',
    'models/player/clannypolice/male_05.mdl',
    'models/player/clannypolice/male_04.mdl',
    'models/player/clannypolice/male_02.mdl'
}


-- ## ПУ ##########################################
local COLOR_POLICE = Color( 26, 104, 214 )
Tpolice1 = setJob( 
    'Кадет', 
    {
        lvl = 2,
        color = COLOR_POLICE,
        weapons = { 'weapon_cuff_police', 'arrest_stick', 'stunstick', 'arccw_g18', 'weaponchecker' },
        model = cops,
        description = '• Только что выпущенный из кадетского корпуса полицейский.', 
        admin = 0, 
        command = "jpolice1",
        max = 8,
        salary = salaries.medium,
        vote = false,
        hasLicense = true,
        candemote = true,

        category = 'МВД'
    }
)

Tpolice2 = setJob( 
    'Офицер', 
    {
        lvl = 3,
        color = COLOR_POLICE,
        weapons = { 'weapon_cuff_police', 'arrest_stick', 'door_ram', 'stunstick', 'unarrest_stick', 'arccw_g18', 'arccw_shorty', 'weaponchecker' },
        model = cops,
        description = '• Полицейский со стажем.', 
        admin = 0, 
        command = "jpolice2",
        max = 4,
        salary = salaries.medium,
        NeedToChangeFrom = Tpolice1,
        vote = false,
        hasLicense = true,
        candemote = true,

        category = 'МВД'
    }
)
Tpolice2a = setJob( 
    'Детектив', 
    {
        lvl = 3,
        color = COLOR_POLICE,
        weapons = { 'weapon_cuff_police', 'door_ram', 'arrest_stick', 'stunstick', 'unarrest_stick', 'arccw_ragingbull', 'arccw_scout', 'arccw_shorty', 'weaponchecker' },
        model = cops,
        description = '• Ваша задача - раскрывать убийства и поддерживать порядок в этом городе.', 
        admin = 0, 
        command = "jpolice2a",
        max = 2,
        salary = salaries.medium,
        NeedToChangeFrom = Tpolice1,
        vote = true,
        hasLicense = true,
        candemote = true,

        category = 'МВД'
    }
)

Tpolice3 = setJob( 
    'Помощник Шерифа', 
    {
        lvl = 4,
        color = COLOR_POLICE,
        weapons = { 'weapon_cuff_police', 'arrest_stick', 'door_ram', 'stunstick', 'unarrest_stick', 'arccw_ragingbull', 'arccw_mp5', 'weaponchecker' },
        model = cops,
        props = 32,
        description = '• Правая рука Шерифа и его верный помощник.', 
        admin = 0, 
        command = "jpolice3",
        max = 2,
        salary = salaries.more_medium,
        vote = false,
        hasLicense = true,
        candemote = true,
        NeedToChangeFrom = Tpolice2,

        category = 'МВД'
    }
)

Tpolice4 = setJob( 
    'SWAT', 
    {
        lvl = 5,
        color = COLOR_POLICE,
        weapons = { 'weapon_cuff_police', 'arrest_stick', 'door_ram', 'stunstick', 'unarrest_stick', 'arccw_usp', 'arccw_sg552', 'arccw_m4a1', 'arccw_m1014', 'weaponchecker' },
        model = {
            'models/player/urban.mdl',
            'models/player/gasmask.mdl'
        },
        description = '• Спецназ, используемый в операциях с высоким риском.', 
        admin = 0, 
        command = "jpolice4",
        max = 4,
        salary = salaries.more_medium,
        vote = true,
        hasLicense = true,
        candemote = true,
        NeedToChangeFrom = Tpolice2,
        PlayerSpawn = function( ePly ) 
            ePly:SetHealth( 100 )
            ePly:SetArmor( 255 )
        end,

        category = 'МВД'
    }
)
Tpolice4a = setJob( 
    'SWAT-Снайпер [PREMIUM]', 
    {
        lvl = 4,
        color = COLOR_POLICE,
        weapons = { 'weapon_cuff_police', 'arrest_stick', 'door_ram', 'stunstick', 'unarrest_stick', 'arccw_usp', 'arccw_sg552', 'arccw_awm', 'weaponchecker' },
        model = {
            'models/player/swat.mdl'
        },
        description = '• Снайпер, прикрывающий свой отряд издалека.', 
        admin = 0, 
        command = "jpolice4a",
        max = 2,
        salary = salaries.more_medium,
        vote = false,
        hasLicense = true,
        candemote = true,
        PlayerSpawn = function( ePly ) 
            ePly:SetHealth( 100 )
            ePly:SetArmor( 255 )
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = "Купить ранг: PREMIUM на F1 (/donat)",

        category = 'МВД'
    }
)
Tpolice4b = setJob( 
    'SWAT-Медик [PREMIUM]', 
    {
        lvl = 2,
        color = COLOR_POLICE,
        weapons = { 'weapon_cuff_police', 'arrest_stick', 'door_ram', 'stunstick', 'unarrest_stick', 'arccw_usp', 'arccw_mp5', 'med_kit', 'weaponchecker' },
        model = {
            'models/player/gasmask.mdl'
        },
        description = '• Полевой медик, оказывающий первую помощь спецназу при ранениях.', 
        admin = 0, 
        command = "jpolice4b",
        max = 4,
        salary = salaries.more_medium,
        vote = false,
        hasLicense = true,
        candemote = true,
        PlayerSpawn = function( ePly ) 
            ePly:SetHealth( 100 )
            ePly:SetArmor( 255 )
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = "Купить ранг: PREMIUM на F1 (/donat)",

        category = 'МВД'
    }
)
Tpolice4c = setJob( 
    'SWAT-Лидер [Premium]', 
    {
        lvl = 4,
        color = COLOR_POLICE,
        weapons = { 'weapon_cuff_police', 'arrest_stick', 'door_ram', 'stunstick', 'unarrest_stick', 'arccw_usp', 'arccw_m1014', 'arccw_g36c', 'weaponchecker' },
        model = {
            'models/player/riot.mdl'
        },
        description = '• Капитан отделения SWAT.', 
        admin = 0, 
        command = "jpolice4c",
        props = 64,
        max = 1,
        salary = salaries.more_medium,
        vote = false,
        hasLicense = true,
        candemote = true,
        PlayerSpawn = function( ePly ) 
            ePly:SetHealth( 120 )
            ePly:SetMaxHealth( 175 )
            ePly:SetArmor( 255 )
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = "Купить ранг: Premium на F1 (/donat)",

        category = 'МВД'
    }
)

Tpolice4f = setJob( 
    'Агент Кремля', 
    {
        lvl = 5,
        color = AMB_COLOR_BLUE,
        weapons = { },
        model = { 'models/player/dewobedil/vocaloid/hatsune_miku/bikini_p.mdl' },
        description = '• [Донат Профессия] Челик придет и скажет мне как ее настроить.', 
        admin = 0, 
        command = "jpolice4f",
        props = 64,
        max = 1,
        salary = salaries.medium,
        vote = false,
        hasLicense = true,
        candemote = true,
        PlayerSpawn = function( ePly )
            ePly:SetHealth( 300 )
            ePly:SetArmor( 255 )
            ePly:Give( 'arccw_minigun' )
            ePly:Give( 'weapon_crowbar' )
            ePly:Give( 'arccw_ak47' )
            ePly:Give( 'arccw_m107' )
            ePly:Give( 'arccw_nade_flash' )
            ePly:Give( 'arccw_nade_frag' )
        end,
        customCheck = function( ePly )
            return ( ePly:SteamID() == 'STEAM_0:0:175927099' )
        end,
        CustomCheckFailMsg = "Сделать свою профессию на F1 (/donat)",

        category = 'МВД'
    }
)

Tpolice5 = setJob( 
    'Шериф', 
    {
        lvl = 5,
        color = COLOR_POLICE,
        weapons = { 'weapon_cuff_police', 'door_ram', 'arrest_stick', 'stunstick', 'unarrest_stick', 'arccw_m4a1', 'arccw_shorty', 'weaponchecker' },
        model = cops,
        description = '• Вы здесь закон.', 
        admin = 0, 
        command = "jpolice5",
        props = 64,
        max = 1,
        salary = salaries.more_medium,
        vote = false,
        hasLicense = true,
        candemote = true,
        NeedToChangeFrom = Tpolice3,
        PlayerSpawn = function( ePly ) 
            ePly:SetHealth( 120 )
            ePly:SetArmor( 255 )
        end,

        category = 'МВД'
    }
)

GAMEMODE.CivilProtection = {
    [ Tpolice1 ] = true,
    [ Tpolice2 ] = true,
    [ Tpolice2a ] = true,
    [ Tpolice3 ] = true,
    [ Tpolice4 ] = true,
    [ Tpolice4a ] = true,
    [ Tpolice4b ] = true,
    [ Tpolice4c ] = true,
    [ Tpolice4f ] = true,
    [ Tpolice5 ] = true,
    [ Tmayor ] = true,
}


local COLOR_ALIENS = Color( 255, 0, 64 )

-- ## Чужие -- ####################################
Talien1 = setJob( 
    'Маньяк', 
    {
        lvl = 6,
        color = COLOR_ALIENS,
        model = {
            'models/player/pyramidhead/pyramidhead.mdl'
        },
        description = '• Психопат-убийца, что скрывается в тени.', 
        admin = 0, 
        command = "jalien1",
        max = 2,
        salary = salaries.very_easy,
        vote = false,
        hasLicense = false,
        candemote = true,
        hobo = true,
        PlayerSpawn = function( ePly ) 
            ePly:SetHealth( 255 ) 
            ePly:SetMaxHealth( 255 )
            ePly:SetRunSpeed( ePly:GetRunSpeed()*1.6 )
            ePly:EmitSound( 'ambition/amb_zombie_mode_sounds_pack/zombie/infected/infect1.wav', 999 )
        end,
        OnPlayerChangedTeam = function( ePly )
            ePly:EmitSound( 'ambition/amb_zombie_mode_sounds_pack/zombie/idle/idle_boss1.wav' ) 
        end,

        category = 'Чужие'
    }
)

Talien1a = setJob( 
    'Потрошитель [Premium]', 
    {
        lvl = 2,
        color = COLOR_ALIENS,
        weapons = { 'arccw_nade_flash', 'arccw_melee_machete', 'arccw_nade_smoke' },
        model = {
            'models/player/grimreaper/grimreaper.mdl'
        },
        description = '• Серийный убийца, за которым гоняется вся полиция.', 
        admin = 0, 
        command = "jalien1a",
        max = 1,
        salary = salaries.standart,
        vote = false,
        hasLicense = true,
        candemote = true,
        hobo = true,
        PlayerSpawn = function( ePly )
            ePly:SetHealth( 400 ) 
            ePly:SetMaxHealth( 400 )
            ePly:SetRunSpeed( ePly:GetRunSpeed()*1.6 )
            ePly:EmitSound( 'ambition/amb_zombie_mode_sounds_pack/zombie/attack/attack_warn1.wav' )
        end,
        OnPlayerChangedTeam = function( ePly )
            ePly:EmitSound( 'ambition/amb_zombie_mode_sounds_pack/zombie/idle/idle_voice1.wav' ) 
        end,
        customCheck = function( ePly )
            for _, rank in pairs( PREMIUM ) do
                if ( ePly:GetUserGroup() == rank ) then return true end
            end
            return false
        end,
        CustomCheckFailMsg = "Купить ранг: Premium на F1 (/donat)",

        category = 'Чужие'
    }
)

Talien3 = setJob( 
    'Санитар', 
    {
        lvl = 4,
        color = COLOR_ALIENS,
        weapons = { 'med_kit', 'stunstick' },
        model = {
            'models/player/sanitar_cohrt.mdl',
            'models/player/sanitar_male_02.mdl',
            'models/player/sanitar_male_04.mdl',
            'models/player/sanitar_male_05.mdl',
            'models/player/sanitar_male_06.mdl',
            'models/player/sanitar_male_07.mdl',
            'models/player/sanitar_male_08.mdl',
            'models/player/sanitar_male_09.mdl'
        },
        description = '• Постройте дурку и положите в неё людей у которых беда с бошкой.', 
        admin = 0, 
        command = "jalien3",
        max = 4,
        props = 124,
        salary = salaries.medium,
        vote = false,
        hasLicense = true,
        candemote = true,

        category = 'Чужие'
    }
)

-- ## Donate ######################################
Tnazi4 = setJob( 
    'Лидер C.W.T.C', 
    {
        lvl = 6,
        color = AMB_COLOR_GRAY,
        weapons = { 'arccw_melee_knife', 'arccw_vector', 'arccw_ruger', 'weapon_cuff_rope' },
        model = { 'models/agroenner/03_agroenners.mdl' },
        description = '• [Донат Профессия] Правительство города.', 
        admin = 0, 
        command = "jnazi4",
        props = 128,
        max = 1,
        salary = salaries.medium,
        vote = false,
        hasLicense = false,
        candemote = true,
        PlayerSpawn = function( ePly )
            ePly:SetBodyGroups('3011011')
        end,
        customCheck = function( ePly )
            return ePly:SteamID() == 'STEAM_0:0:103023757'
        end,
        CustomCheckFailMsg = "Сделать свою профессию на F1 (/donat)",

        category = 'Чужие'
    }
)

Talien4 = setJob( 
    'Библиотекарь', 
    {
        lvl = 3,
        color = COLOR_ALIENS,
        weapons = { 'stunstick' },
        model = { 'models/babavalya/babka.mdl' },
        description = '• Баба Валя - библиотекарь, тайный агент Кремля.', 
        admin = 0, 
        command = "jalien4",
        max = 2,
        props = 64,
        salary = salaries.very_easy,
        vote = false,
        hasLicense = false,
        candemote = true,

        category = 'Чужие'
    }
)

Tnazi1 = setJob( 
    'Агент C.W.T.C', 
    {
        lvl = 4,
        color = AMB_COLOR_GRAY,
        weapons = { 'weapon_crowbar', 'arccw_ruger', 'weapon_cuff_rope' },
        model = { 'models/bloocobalt/resident_evil/re6_agent.mdl' },
        description = '• [Донат Профессия] Агенты правительства города.', 
        admin = 0, 
        command = "jnazi1",
        props = 64,
        max = 2,
        salary = salaries.medium,
        vote = false,
        hasLicense = false,
        candemote = true,
        PlayerSpawn = function( ePly )
            ePly:SetHealth( 120 )
            ePly:SetArmor( 50 )
        end,
        customCheck = function( ePly )
            return ePly:SteamID() == 'STEAM_0:0:187776687' or ePly:SteamID() == 'STEAM_0:1:181540331'
        end,
        CustomCheckFailMsg = "Сделать свою профессию на F1 (/donat)",

        category = 'Чужие'
    }
)
-- ###############################################

GAMEMODE.DefaultTeam = Tcit
DarkRP.addHitmanTeam( Tkiller1 )
DarkRP.addHitmanTeam( Tkiller1a )