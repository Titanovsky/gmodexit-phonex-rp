--[[
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua
https://darkrp.miraheze.org/wiki/DarkRP:CustomEntityFields
]]

local drp = DarkRP
local setEnt = drp.createEntity

local ALL_GROUPS = { 'user', 'vip', 'premium', 'titanium', 'helper', 'd_helper', 'sub_officer', 'sub_moder', 'officer', 'moder', 'manager', 'admin', 'head_moder', 'sub_head_admin', 'superadmin', 'head_admin' }
local VIP = { 'vip', 'premium', 'titanium', 'helper', 'd_helper', 'sub_officer', 'sub_moder', 'officer', 'moder', 'manager', 'admin', 'head_moder', 'sub_head_admin', 'superadmin', 'head_admin' }
local PREMIUM = { 'premium', 'titanium', 'manager', 'admin', 'head_moder', 'sub_head_admin', 'superadmin', 'head_admin' }
local TITANIUM = { 'titanium', 'sub_head_admin', 'superadmin', 'head_admin' }
local L1 = { 'titanium', 'helper', 'd_helper', 'sub_officer', 'sub_moder', 'officer', 'moder', 'manager', 'admin', 'head_moder', 'sub_head_admin', 'superadmin', 'head_admin' }
local L2 = { 'manager', 'admin', 'head_moder', 'sub_head_admin', 'superadmin', 'head_admin' }
local L3 = { 'sub_head_admin', 'superadmin', 'head_admin' }
local L4 = { 'superadmin' }


-- ## Ammo ###################################
setEnt(
    'Пистолетные Патроны', 
    {
        sortOrder = 100,
        ent = 'item_ammo_pistol',
        model = 'models/items/boxsrounds.mdl',
        price = 40,
        max = 2,
        cmd = 'buyam1',
        
        category = 'Other'
    }  
)

setEnt(
    'Rifle Патроны', 
    {
        sortOrder = 100,
        ent = 'item_ammo_ar2',
        model = 'models/items/combine_rifle_cartridge01.mdl',
        price = 120,
        max = 2,
        cmd = 'buyent14',
        
        category = 'Other'
    }  
)

setEnt(
    'Shotgun Патроны', 
    {
        sortOrder = 100,
        ent = 'item_box_buckshot',
        model = 'models/items/boxbuckshot.mdl',
        price = 80,
        max = 2,
        cmd = 'buyam3',
        
        category = 'Other'
    }  
)

setEnt(
    'SMG Патроны', 
    {
        sortOrder = 100,
        ent = 'item_ammo_smg1',
        model = 'models/items/boxmrounds.mdl',
        price = 60,
        max = 2,
        cmd = 'buyam4',
        
        category = 'Other'
    }  
)

setEnt(
    'Revolver Патроны', 
    {
        sortOrder = 100,
        ent = 'item_ammo_357',
        model = 'models/items/357ammo.mdl',
        price = 80,
        max = 2,
        cmd = 'buyam5',
        
        category = 'Other'
    }  
)
-- ###########################################


setEnt(
    'Денежный Принтер', 
    {
        sortOrder = 100,
        ent = 'amb_money_printer',
        model = 'models/props_c17/consolebox01a.mdl',
        price = 3500,
        max = 2,
        cmd = 'buymoneyprinter1',
        
        category = 'Other'
    }  
)


setEnt(
    'Аптечка +10 HP', 
    {
        sortOrder = 100,
        ent = 'item_healthvial',
        model = 'models/healthvial.mdl',
        price = 80,
        max = 2,
        cmd = 'buyent1',
        
        category = 'Other'
    }  
)

setEnt(
    'Аптечка +25 HP', 
    {
        sortOrder = 100,
        ent = 'item_healthkit',
        model = 'models/items/healthkit.mdl',
        price = 160,
        max = 2,
        cmd = 'buyent2',
        
        category = 'Other'
    }  
)

setEnt(
    'Защита +15 ARMOR', 
    {
        sortOrder = 100,
        ent = 'item_battery',
        model = 'models/items/battery.mdl',
        price = 80,
        max = 2,
        cmd = 'buyent3',
        
        category = 'Other'
    }  
)

setEnt(
    'Фотоаппарат', 
    {
        sortOrder = 100,
        ent = 'gmod_camera',
        model = 'models/MaxOfS2D/camera.mdl',
        price = 500,
        max = 2,
        cmd = 'buyent4',
        
        category = 'Other'
    }  
)

setEnt(
    'Раздатчик Здоровья', 
    {
        sortOrder = 100,
        ent = 'health_recharger',
        model = 'models/props_c17/consolebox03a.mdl',
        price = 12000,
        max = 2,
        cmd = 'buyrech1',
        
        category = 'Other'
    }  
)

setEnt(
    'Раздатчик Здоровья (VIP)', 
    {
        sortOrder = 100,
        ent = 'vip_health_recharger',
        model = 'models/props_lab/reciever01a.mdl',
        price = 16000,
        max = 1,
        cmd = 'buyrech2',
        
        category = 'Other'
    }  
)

setEnt(
    'Раздатчик Брони', 
    {
        sortOrder = 100,
        ent = 'armor_recharger',
        model = 'models/props_c17/consolebox03a.mdl',
        price = 9000,
        max = 2,
        cmd = 'buyrech3',
        
        category = 'Other'
    }  
)

setEnt(
    'Раздатчик Брони (VIP)', 
    {
        sortOrder = 100,
        ent = 'vip_armor_recharger',
        model = 'models/props_lab/reciever01a.mdl',
        price = 12000,
        max = 1,
        cmd = 'buyrech4',
        
        category = 'Other'
    }  
)

setEnt(
    'Вейп (Классика)', 
    {
        sortOrder = 100,
        ent = 'weapon_vape',
        model = 'models/swamponions/vape.mdl',
        price = 8000,
        max = 2,
        cmd = 'buydealer1',
        allowed = { Tdealer },
        
        category = 'Тяжёлое Орудие'
    }  
)

setEnt(
    'Вейп (Лечебный)', 
    {
        sortOrder = 100,
        ent = 'weapon_vape_medicinal',
        model = 'models/swamponions/vape.mdl',
        price = 24000,
        max = 2,
        cmd = 'buydealer2',
        allowed = { Tdealer },
        
        category = 'Тяжёлое Орудие'
    }  
)

setEnt(
    'Вейп (Наркоманский)', 
    {
        sortOrder = 100,
        ent = 'weapon_vape_hallucinogenic',
        model = 'models/swamponions/vape.mdl',
        price = 16000,
        max = 2,
        cmd = 'buydealer3',
        allowed = { Tdealer },
        
        category = 'Тяжёлое Орудие'
    }  
)



setEnt(
    'Лаборатория',
    {
        ent = 'amb_chemistry_lab',
        model = 'models/props_lab/servers.mdl',
        price = 8000,
        max = 2,
        cmd = 'buychem1',
        allowed = { Tchemic1 },

        category = 'Other'
    }
)





-- ## Attachments ####################################
setEnt(
    'T-1', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_t1',
        model = 'models/weapons/arccw/atts/t1.mdl',
        price = 200,
        max = 1,
        cmd = 'buyatt1',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Docter', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_docter',
        model = 'models/weapons/arccw/atts/docter.mdl',
        price = 250,
        max = 1,
        cmd = 'buyatt1a',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Delta', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_delta',
        model = 'models/weapons/arccw/atts/delta.mdl',
        price = 250,
        max = 1,
        cmd = 'buyatt1b',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Aimpoint', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_aimpoint',
        model = 'models/weapons/arccw/atts/aimpoint.mdl',
        price = 300,
        max = 1,
        cmd = 'buyatt2',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Reflex', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_reflex',
        model = 'models/weapons/arccw/atts/reflex.mdl',
        price = 380,
        max = 1,
        cmd = 'buyatt2a',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'MRS', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_mrs',
        model = 'models/weapons/arccw/atts/mrs.mdl',
        price = 420,
        max = 1,
        cmd = 'buyatt3',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Kobra', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_kobra',
        model = 'models/weapons/arccw/atts/kobra.mdl',
        price = 460,
        max = 1,
        cmd = 'buyatt3a',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'OKP-7', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_okp',
        model = 'models/weapons/arccw/atts/okp.mdl',
        price = 480,
        max = 1,
        cmd = 'buyatt3b',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Holographic', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_holo',
        model = 'models/weapons/arccw/atts/eotech.mdl',
        price = 500,
        max = 1,
        cmd = 'buyatt3c',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Micro 2x', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_micro',
        model = 'models/weapons/arccw/atts/micro.mdl',
        price = 800,
        max = 1,
        cmd = 'buyatt4',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'HAMR 2.7x', 
    {
        sortOrder = 100,
        ent = 'acwatt_optic_hamr',
        model = 'models/weapons/arccw/atts/hamr.mdl',
        price = 1200,
        max = 1,
        cmd = 'buyatt4a',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'ACOG 3x', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_acog',
        model = 'models/weapons/arccw/atts/acog.mdl',
        price = 1600,
        max = 1,
        cmd = 'buyatt4b',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Hunter 2-5x', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_hunter',
        model = 'models/weapons/arccw/atts/hunter.mdl',
        price = 1000,
        max = 1,
        cmd = 'buyatt4c',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Magnus 3-6x', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_magnus',
        model = 'models/weapons/arccw/atts/magnus.mdl',
        price = 1300,
        max = 1,
        cmd = 'buyatt4d',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Fireview 4-9x', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_farview',
        model = 'models/weapons/arccw/atts/farview.mdl',
        price = 1800,
        max = 1,
        cmd = 'buyatt4f',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'M2014-S', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_gauss_scope',
        model = 'models/weapons/arccw/atts/gauss_scope.mdl',
        price = 2500,
        max = 1,
        cmd = 'buyatt4g',
        allowed = { Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Vampire', 
    {
        sortOrder = 2,
        ent = 'acwatt_optic_vampire',
        model = 'models/weapons/arccw/atts/vampire.mdl',
        price = 3600,
        max = 1,
        cmd = 'buyatt4e',
        allowed = { Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)


setEnt(
    'Subsonic Глушитель', 
    {
        sortOrder = 2,
        ent = 'acwatt_supp_subsonic',
        model = 'models/weapons/arccw/atts/supp_subsonic.mdl',
        price = 800,
        max = 1,
        cmd = 'buyatt6',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'LP Глушитель', 
    {
        sortOrder = 2,
        ent = 'acwatt_supp_g36c',
        model = 'models/weapons/arccw/atts/supp_g36c.mdl',
        price = 800,
        max = 1,
        cmd = 'buyatt6a',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Tactical Глушитель', 
    {
        sortOrder = 2,
        ent = 'acwatt_supp_med',
        model = 'models/weapons/arccw/atts/supp_medium.mdl',
        price = 1200,
        max = 1,
        cmd = 'buyatt6b',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Colossal Глушитель', 
    {
        sortOrder = 2,
        ent = 'acwatt_supp_heavy',
        model = 'models/weapons/arccw/atts/supp_heavy.mdl',
        price = 1800,
        max = 1,
        cmd = 'buyatt6c',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)

setEnt(
    'Дульный Ускоритель', 
    {
        sortOrder = 2,
        ent = 'acwatt_muzz_booster',
        model = 'models/weapons/arccw/atts/muzz_booster.mdl',
        price = 800,
        max = 1,
        cmd = 'buyatt7',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Пламегаситель', 
    {
        sortOrder = 2,
        ent = 'acwatt_muzz_flashhider',
        model = 'models/weapons/arccw/atts/muzz_flashhider.mdl',
        price = 1200,
        max = 1,
        cmd = 'buyatt7a',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Зубила', 
    {
        sortOrder = 2,
        ent = 'acwatt_muzz_breacher',
        model = 'models/weapons/arccw/atts/muzz_breacher.mdl',
        price = 1500,
        max = 1,
        cmd = 'buyatt7b',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Сошки', 
    {
        sortOrder = 2,
        ent = 'acwatt_bipod',
        model = 'models/weapons/arccw/atts/bipod.mdl',
        price = 2000,
        max = 1,
        cmd = 'buyatt8',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Grip Сошки', 
    {
        sortOrder = 2,
        ent = 'acwatt_grippod',
        model = 'models/weapons/arccw/atts/fml_grippod.mdl',
        price = 2400,
        max = 1,
        cmd = 'buyatt8a',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Smooth Рукоятка', 
    {
        sortOrder = 2,
        ent = 'acwatt_foregrip_cqc',
        model = 'models/weapons/arccw/atts/foregrip_cqc.mdl',
        price = 1000,
        max = 1,
        cmd = 'buyatt8b',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Ergo Рукоятка', 
    {
        sortOrder = 2,
        ent = 'acwatt_grip_ergo',
        model = 'models/weapons/arccw/atts/foregrip_cqc.mdl',
        price = 1000,
        max = 1,
        cmd = 'buyatt8c',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Sturdy Рукоятка', 
    {
        sortOrder = 2,
        ent = 'acwatt_grip_sturdy',
        model = 'models/weapons/arccw/atts/foregrip_cqc.mdl',
        price = 1500,
        max = 1,
        cmd = 'buyatt8d',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Sturdy Рукоятка', 
    {
        sortOrder = 2,
        ent = 'acwatt_grip_sturdy',
        model = 'models/weapons/arccw/atts/foregrip_cqc.mdl',
        price = 1500,
        max = 1,
        cmd = 'buyatt8f',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Rubberized Рукоятка', 
    {
        sortOrder = 2,
        ent = 'acwatt_grip_rubberized',
        model = 'models/weapons/arccw/atts/foregrip_cqc.mdl',
        price = 1500,
        max = 1,
        cmd = 'buyatt8e',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)

setEnt(
    'Skeleton Приклад', 
    {
        sortOrder = 2,
        ent = 'acwatt_stock_skeleton',
        model = 'models/weapons/arccw/atts/fml_grippod.mdl',
        price = 1500,
        max = 1,
        cmd = 'buyatt9',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Heavy Приклад', 
    {
        sortOrder = 2,
        ent = 'acwatt_stock_heavy',
        model = 'models/weapons/arccw/atts/fml_grippod.mdl',
        price = 2000,
        max = 1,
        cmd = 'buyatt9a',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Sturdy Приклад', 
    {
        sortOrder = 2,
        ent = 'acwatt_stock_sturdy',
        model = 'models/weapons/arccw/atts/fml_grippod.mdl',
        price = 2000,
        max = 1,
        cmd = 'buyatt9b',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Adjustable Приклад', 
    {
        sortOrder = 2,
        ent = 'acwatt_stock_strafe',
        model = 'models/weapons/arccw/atts/fml_grippod.mdl',
        price = 2500,
        max = 1,
        cmd = 'buyatt9c',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Light Приклад', 
    {
        sortOrder = 2,
        ent = 'acwatt_stock_light',
        model = 'models/weapons/arccw/atts/fml_grippod.mdl',
        price = 2500,
        max = 1,
        cmd = 'buyatt9d',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)


-- ## Drugs       ####################################
setEnt(
    '[1] Плита', 
    {
        sortOrder = 100,
        ent = 'eml_stove',
        model = 'models/props_c17/furniturestove001a.mdl',
        price = 8000,
        max = 2,
        cmd = 'buymeth1',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  
)
setEnt(
    '[1] Газ', 
    {
        sortOrder = 100,
        ent = 'eml_gas',
        model = 'models/props_c17/canister01a.mdl',
        price = 3500,
        max = 2,
        cmd = 'buymeth1a',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  
)
setEnt(
    '[1] Банка', 
    {
        sortOrder = 100,
        ent = 'eml_jar',
        model = 'models/props_lab/jar01a.mdl',
        price = 500,
        max = 2,
        cmd = 'buymeth2',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  
)
setEnt(
    '[1] Кастрюля Мета', 
    {
        sortOrder = 100,
        ent = 'eml_spot',
        model = 'models/props_c17/metalpot001a.mdl',
        price = 500,
        max = 2,
        cmd = 'buymeth3',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  
)
setEnt(
    '[1] Кастрюля Фосфора', 
    {
        sortOrder = 100,
        ent = 'eml_pot',
        model = 'models/props_c17/metalpot001a.mdl',
        price = 500,
        max = 4,
        cmd = 'buymeth4',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  
)
setEnt(
    '[1] Соляная Кислота', 
    {
        sortOrder = 100,
        ent = 'eml_macid',
        model = 'models/props_junk/garbage_plasticbottle001a.mdl',
        price = 200,
        max = 5,
        cmd = 'buymeth5a',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  
)
setEnt(
    '[1] Вода', 
    {
        sortOrder = 100,
        ent = 'eml_water',
        model = 'models/props_junk/garbage_plasticbottle003a.mdl',
        price = 200,
        max = 5,
        cmd = 'buymeth5b',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  
)
setEnt(
    '[1] Жидкая Сера', 
    {
        sortOrder = 100,
        ent = 'eml_sulfur',
        model = 'models/props_lab/jar01b.mdl',
        price = 100,
        max = 5,
        cmd = 'buymeth5c',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  
)
setEnt(
    '[1] Жидкий Йод', 
    {
        sortOrder = 100,
        ent = 'eml_iodine',
        model = 'models/props_lab/jar01b.mdl',
        price = 100,
        max = 5,
        cmd = 'buymeth5d',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  
)
-- ###################################################

setEnt(

    '[2] Мет. Лаба', 

    {
        sortOrder = 100,
        ent = 'zmlab_combiner',
        model = 'models/zerochain/zmlab/zmlab_combiner.mdl',
        price = 15000,
        max = 1,
        cmd = 'buymethz1',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[2] Фильтер', 

    {
        sortOrder = 100,
        ent = 'zmlab_filter',
        model = 'models/zerochain/zmlab/zmlab_filter.mdl',
        price = 2000,
        max = 1,
        cmd = 'buymethz2',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[2] Морозилка', 

    {
        sortOrder = 100,
        ent = 'zmlab_frezzer',
        model = 'models/zerochain/zmlab/zmlab_frezzer.mdl',
        price = 4200,
        max = 3,
        cmd = 'buymethz3',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[2] Сборщик', 

    {
        sortOrder = 100,
        ent = 'zmlab_palette',
        model = 'models/props_junk/wood_pallet001a.mdl',
        price = 3500,
        max = 2,
        cmd = 'buymethz4',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[2] Лоток', 

    {
        sortOrder = 100,
        ent = 'zmlab_collectcrate',
        model = 'models/zerochain/zmlab/zmlab_transportcrate.mdl',
        price = 600,
        max = 12,
        cmd = 'buymethz5',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[2] Метиламин', 

    {
        sortOrder = 100,
        ent = 'zmlab_methylamin',
        model = 'models/zerochain/zmlab/zmlab_methylamin.mdl',
        price = 2500,
        max = 2,
        cmd = 'buymethz6',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[2] Алюминий', 

    {
        sortOrder = 100,
        ent = 'zmlab_aluminium',
        model = 'models/zerochain/zmlab/zmlab_aluminiumbox.mdl',
        price = 800,
        max = 4,
        cmd = 'buymethz7',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[2] Черная Дыра Мета', 

    {
        sortOrder = 100,
        ent = 'zmlab_methdropoff',
        model = 'models/zerochain/zmlab/zmlab_dropoffshaft.mdl',
        price = 9000,
        max = 1,
        cmd = 'buymethz8',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)
-- ## ################################################

setEnt(

    '[3] Мет. Лаба.', 

    {
        sortOrder = 100,
        ent = 'ent_table',
        model = 'models/props_wasteland/kitchen_counter001c.mdl',
        price = 4000,
        max = 2,
        cmd = 'buymethr1',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[3] Лампа', 

    {
        sortOrder = 100,
        ent = 'ent_torch',
        model = 'models/items/combine_rifle_ammo01.mdl',
        price = 2000,
        max = 1,
        cmd = 'buymethr2',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[3] Колбы', 

    {
        sortOrder = 100,
        ent = 'ent_glassware',
        model = 'models/props_junk/cardboard_box001a.mdl',
        price = 2500,
        max = 1,
        cmd = 'buymethr3',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[3] Термо-контейнер', 

    {
        sortOrder = 100,
        ent = 'ent_meth_container',
        model = 'models/props_lab/jar01b.mdl',
        price = 2500,
        max = 2,
        cmd = 'buymethr4',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[3] Костюм Хим. Защиты', 

    {
        sortOrder = 100,
        ent = 'ent_hazmat',
        model = 'models/props_c17/briefcase001a.mdl',
        price = 1000,
        max = 1,
        cmd = 'buymethr5',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[3] Коробка', 

    {
        sortOrder = 100,
        ent = 'ent_batch',
        model = 'models/props_junk/cardboard_box001a.mdl',
        price = 2000,
        max = 2,
        cmd = 'buymethr6',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[3] Краситель', 

    {
        sortOrder = 100,
        ent = 'ent_dye',
        model = 'models/props_lab/jar01b.mdl',
        price = 500,
        max = 4,
        cmd = 'buymethr7',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[3] Вода', 

    {
        sortOrder = 100,
        ent = 'ent_water',
        model = 'models/props_junk/glassjug01.mdl',
        price = 200,
        max = 4,
        cmd = 'buymethr8',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)

setEnt(

    '[3] Жидкий Йод', 

    {
        sortOrder = 100,
        ent = 'ent_iodine',
        model = 'models/props_junk/glassjug01.mdl',
        price = 350,
        max = 4,
        cmd = 'buymethr9',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)


setEnt(

    '[3] Красный Фосфор', 

    {
        sortOrder = 100,
        ent = 'ent_redpho',
        model = 'models/props_junk/glassbottle01a.mdl',
        price = 400,
        max = 2,
        cmd = 'buymethr10',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)


setEnt(

    '[3] Соляная Кислота', 

    {
        sortOrder = 100,
        ent = 'ent_muriatic',
        model = 'models/props_junk/glassjug01.mdl',
        price = 400,
        max = 4,
        cmd = 'buymethr11',
        allowed = { Tdrug1, Tchemic1 },
        
        category = 'Other'
    }  

)



-- ## Guns ###########################################
setEnt(
    'Знания Бокса', 
    {
        sortOrder = 1,
        is_weapon = true,
        ent = 'arccw_melee_fists',
        model = 'models/Gibs/HGIBS.mdl',
        price = 500,
        max = 4,
        cmd = 'buycold1',
        
        category = 'Холодное Орудие'
    }  
)
setEnt(
    'Нож', 
    {
        sortOrder = 1,
        is_weapon = true,
        ent = 'arccw_melee_knife',
        model = 'models/weapons/w_knife_t.mdl',
        price = 800,
        max = 2,
        cmd = 'buycold2',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Холодное Орудие'
    }  
)
setEnt(
    'Мачете', 
    {
        sortOrder = 1,
        is_weapon = true,
        ent = 'arccw_melee_machete',
        model = 'models/weapons/arccw/w_machete.mdl',
        price = 1800,
        max = 2,
        cmd = 'buycold3',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Холодное Орудие'
    }  
)


setEnt(
    'Макаров', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_makarov',
        model = 'models/weapons/arccw/w_pmt.mdl',
        price = 2700,
        max = 2,
        cmd = 'buywepeasy1',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Лёгкое Орудие'
    }  
)
setEnt(
    'Glock 18', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_g18',
        model = 'models/weapons/w_pist_glock18.mdl',
        price = 3800,
        max = 2,
        cmd = 'buywepeasy2',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Лёгкое Орудие'
    }  
)
setEnt(
    'Python', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_fml_python',
        model = 'models/weapons/arccw/w_ragingbull.mdl',
        price = 12000,
        max = 2,
        cmd = 'buywepeasy3',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Лёгкое Орудие'
    }  
)
setEnt(
    'USP', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_usp',
        model = 'models/weapons/w_pist_usp.mdl',
        price = 4500,
        max = 2,
        cmd = 'buywepeasy4',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Лёгкое Орудие'
    }  
)



setEnt(
    'Shorty', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_shorty',
        model = 'models/weapons/arccw/w_defender.mdl',
        price = 7000,
        max = 2,
        cmd = 'buywepmedium1',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Полу-Тяжёлое Орудие'
    }  
)
setEnt(
    'Sawn-Off', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_db_sawnoff',
        model = 'models/weapons/arccw/w_sawnoff.mdl',
        price = 6400,
        max = 2,
        cmd = 'buywepmedium2',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Полу-Тяжёлое Орудие'
    }  
)
setEnt(
    'M1014', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_m1014',
        model = 'models/weapons/arccw/w_as1217.mdl',
        price = 16000,
        max = 2,
        cmd = 'buywepmedium3',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Полу-Тяжёлое Орудие'
    }  
)
setEnt(
    'Winchester1873', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_winchester1873',
        model = 'models/weapons/arccw/w_winchester1873.mdl',
        price = 8900,
        max = 2,
        cmd = 'buywepmedium4',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Полу-Тяжёлое Орудие'
    }  
)


setEnt(
    'Mac11', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_mac11',
        model = 'models/weapons/arccw/w_mk201.mdl',
        price = 7000,
        max = 2,
        cmd = 'buywepmedium5',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Полу-Тяжёлое Орудие'
    }  
)
setEnt(
    'TMP', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_tmp',
        model = 'models/weapons/arccw/w_tmp.mdl',
        price = 6000,
        max = 2,
        cmd = 'buywepmedium6',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Полу-Тяжёлое Орудие'
    }  
)
setEnt(
    'Tec9', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_fml_tec9',
        model = 'models/weapons/arccw/w_tmp.mdl',
        price = 7000,
        max = 2,
        cmd = 'buywepmedium7',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Полу-Тяжёлое Орудие'
    }  
)
setEnt(
    'MP7', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_mp7',
        model = 'models/weapons/arccw/w_mp7.mdl',
        price = 9001,
        max = 2,
        cmd = 'buywepmedium8',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Полу-Тяжёлое Орудие'
    }  
)
setEnt(
    'MP5', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_mp5',
        model = 'models/weapons/arccw/w_mp5.mdl',
        price = 8000,
        max = 2,
        cmd = 'buywepmedium9',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Полу-Тяжёлое Орудие'
    }  
)
setEnt(
    'Vector', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_vector',
        model = 'models/weapons/arccw/w_vector.mdl',
        price = 10000,
        max = 2,
        cmd = 'buywepmedium10',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Полу-Тяжёлое Орудие'
    }  
)
setEnt(
    'Scout', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_scout',
        model = 'models/weapons/arccw/w_psrs.mdl',
        price = 15000,
        max = 2,
        cmd = 'buywepmedium11',
        allowed = { Tgund1, Tgund2, Tgund3 },
        
        category = 'Полу-Тяжёлое Орудие'
    }  
)





setEnt(
    'AK47', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_ak47',
        model = 'models/weapons/arccw/w_type2.mdl',
        price = 20000,
        max = 1,
        cmd = 'buywephard1',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'M4A1', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_m4a1',
        model = 'models/weapons/arccw/mk4.mdl',
        price = 18000,
        max = 1,
        cmd = 'buywephard2',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Абакан', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_fml_an94',
        model = 'models/weapons/arccw/w_m14.mdl',
        price = 24000,
        max = 1,
        cmd = 'buywephard3',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'AUG', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_aug',
        model = 'models/weapons/arccw/w_para.mdl',
        price = 18 * 10^3,
        max = 1,
        cmd = 'buywephard4',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Galil 7.62', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_galil762',
        model = 'models/weapons/arccw/w_galil762.mdl',
        price = 25000,
        max = 1,
        cmd = 'buywephard6',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'P90', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_p90',
        model = 'models/weapons/arccw/w_pdw57.mdl',
        price = 18000,
        max = 1,
        cmd = 'buywephard7',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'M-14', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_m14',
        model = 'models/weapons/arccw/w_m14.mdl',
        price = 22000,
        max = 1,
        cmd = 'buywephard8',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Raging Bull', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_ragingbull',
        model = 'models/weapons/arccw/w_ragingbull.mdl',
        price = 15000,
        max = 1,
        cmd = 'buywephard9',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Gold Deagle', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_deagle50',
        model = 'models/weapons/arccw/w_gce.mdl',
        price = 27000,
        max = 1,
        cmd = 'buywephard10',
        allowed = { Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Desert Eagle', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_deagle357',
        model = 'models/weapons/w_pist_deagle.mdl',
        price = 10^4,
        max = 1,
        cmd = 'buywephard11',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'G36C', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_g36c',
        model = 'models/weapons/arccw/w_g36c.mdl',
        price = 18000,
        max = 1,
        cmd = 'buywephard12',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'SG-552', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_sg552',
        model = 'models/weapons/arccw/w_roland.mdl',
        price = 22000,
        max = 1,
        cmd = 'buywephard13',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)

setEnt(
    'TommyGun', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_tommygun',
        model = 'models/weapons/arccw/w_tommygun.mdl',
        price = 14000,
        max = 1,
        cmd = 'buywephard14',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)

setEnt(
    'AWP', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_awm',
        model = 'models/weapons/arccw/w_hs338.mdl',
        price = 32000,
        max = 1,
        cmd = 'buywephard15',
        allowed = { Tgund2, Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'Barret M107', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_m107',
        model = 'models/weapons/arccw/w_bfg.mdl',
        price = 64000,
        max = 1,
        cmd = 'buywephard16',
        allowed = { Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'M-60', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_m60',
        model = 'models/weapons/arccw/w_m60.mdl',
        price = 64000,
        max = 1,
        cmd = 'buywephard17',
        allowed = { Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
setEnt(
    'RPG-7', 
    {
        sortOrder = 2,
        is_weapon = true,
        ent = 'arccw_rpg7',
        model = 'models/weapons/arccw/w_rpg7.mdl',
        price = 80999,
        max = 1,
        cmd = 'buywephard18',
        allowed = { Tgund3 },
        
        category = 'Тяжёлое Орудие'
    }  
)
-- ###################################################

setEnt(
    'Отмычка', 
    {
        sortOrder = 2,
        ent = 'lockpick',
        is_weapon = true,
        model = 'models/weapons/w_crowbar.mdl',
        price = 4000,
        max = 1,
        cmd = 'buyweplockpick1',
        allowed = { Tbandit2, Tbandit2a, Tbandit2b, Tbandit3, Tbandit3a },
        
        category = 'Лёгкое Орудие'
    }  
)

-- ###################################################

setEnt(
    'Эластичная Веревка', 
    {
        sortOrder = 2,
        ent = 'weapon_cuff_elastic',
        is_weapon = true,
        model = 'models/props_phx/construct/metal_plate_curve360.mdl',
        price = 3500,
        max = 1,
        cmd = 'buycuff1',
        allowed = { Talien1, Talien1a, Talien3, Tbandit1, Tbandit1a, Tbandit1b, Tbandit2, Tbandit2a, Tbandit2b, Tbandit3, Tbandit3a },
        
        category = 'Лёгкое Орудие'
    }  
)

setEnt(
    'Кандалы', 
    {
        sortOrder = 2,
        ent = 'weapon_cuff_shackles',
        is_weapon = true,
        model = 'models/props_phx/construct/metal_plate_curve360.mdl',
        price = 8000,
        max = 1,
        cmd = 'buycuff2',
        allowed = { Talien1, Talien1a, Talien3, Tbandit1, Tbandit1a, Tbandit1b, Tbandit2, Tbandit2a, Tbandit2b, Tbandit3, Tbandit3a },
        
        category = 'Лёгкое Орудие'
    }  
)

setEnt(
    'Верёвка', 
    {
        sortOrder = 2,
        ent = 'weapon_cuff_rope',
        is_weapon = true,
        model = 'models/props_phx/construct/metal_plate_curve360.mdl',
        price = 12000,
        max = 1,
        cmd = 'buycuff3',
        allowed = { Talien1, Talien1a, Talien3, Tbandit1, Tbandit1a, Tbandit1b, Tbandit2, Tbandit2a, Tbandit2b, Tbandit3, Tbandit3a },
        
        category = 'Лёгкое Орудие'
    }  
)

setEnt(
    'Светлое Пиво', 
    {
        sortOrder = 2,
        ent = 'amb_drink_beer',
        model = 'models/props_junk/garbage_glassbottle003a.mdl',
        price = 160,
        max = 2,
        cmd = 'buydrink1',
        
        category = 'Other'
    }  
)

setEnt(
    'Квас', 
    {
        sortOrder = 2,
        ent = 'amb_drink_kvass',
        model = 'models/props_junk/garbage_plasticbottle003a.mdl',
        price = 180,
        max = 2,
        cmd = 'buydrink2',
        
        category = 'Other'
    }  
)

setEnt(
    'Шампанское', 
    {
        sortOrder = 2,
        ent = 'amb_drink_champagne',
        model = 'models/props_junk/garbage_glassbottle002a.mdl',
        price = 250,
        max = 2,
        cmd = 'buydrink3',
        
        category = 'Other'
    }  
)

setEnt(
    'Вино', 
    {
        sortOrder = 2,
        ent = 'amb_drink_wine',
        model = 'models/props_junk/garbage_glassbottle001a.mdl',
        price = 425,
        max = 2,
        cmd = 'buydrink4',
        
        category = 'Other'
    }  
)

setEnt(
    'Водка', 
    {
        sortOrder = 2,
        ent = 'amb_drink_vodka',
        model = 'models/props_junk/glassjug01.mdl',
        price = 800,
        max = 2,
        cmd = 'buydrink5',
        
        category = 'Other'
    }  
)
