--[[
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua
https://darkrp.miraheze.org/wiki/DarkRP:CustomShipmentFields
]]

local drp = DarkRP
local setShip = drp.createShipment

local ALL_GROUPS = { 'user', 'vip', 'premium', 'titanium', 'helper', 'd_helper', 'sub_officer', 'sub_moder', 'officer', 'moder', 'manager', 'admin', 'head_moder', 'sub_head_admin', 'superadmin', 'head_admin' }
local VIP = { 'vip', 'premium', 'titanium', 'helper', 'd_helper', 'sub_officer', 'sub_moder', 'officer', 'moder', 'manager', 'admin', 'head_moder', 'sub_head_admin', 'superadmin', 'head_admin' }
local PREMIUM = { 'premium', 'titanium', 'manager', 'admin', 'head_moder', 'sub_head_admin', 'superadmin', 'head_admin' }
local TITANIUM = { 'titanium', 'sub_head_admin', 'superadmin', 'head_admin' }
local L1 = { 'titanium', 'helper', 'd_helper', 'sub_officer', 'sub_moder', 'officer', 'moder', 'manager', 'admin', 'head_moder', 'sub_head_admin', 'superadmin', 'head_admin' }
local L2 = { 'manager', 'admin', 'head_moder', 'sub_head_admin', 'superadmin', 'head_admin' }
local L3 = { 'sub_head_admin', 'superadmin', 'head_admin' }
local L4 = { 'superadmin' }


setShip( 
    'Ножи', 
    {
        entity = 'arccw_melee_knife',
        model = 'models/weapons/w_knife_t.mdl',
        price = 800 * 5 - 600,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = true,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Лёгкое Орудие'
    }
)
setShip( 
    'Мачете', 
    {
        entity = 'arccw_melee_machete',
        model = 'models/weapons/arccw/w_machete.mdl',
        price = 1800 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Макаровы', 
    {
        entity = 'arccw_makarov',
        model = 'models/weapons/arccw/w_pmt.mdl',
        price = 2700 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Glock-18', 
    {
        entity = 'arccw_g18',
        model = 'models/weapons/w_pist_glock18.mdl',
        price = 3800 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Python', 
    {
        entity = 'arccw_fml_python',
        model = 'models/weapons/arccw/w_ragingbull.mdl',
        price = 12000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'USP', 
    {
        entity = 'arccw_usp',
        model = 'models/weapons/w_pist_usp.mdl',
        price = 4500 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Shorty', 
    {
        entity = 'arccw_shorty',
        model = 'models/weapons/arccw/w_defender.mdl',
        price = 7000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Sawn-Off', 
    {
        entity = 'arccw_db_sawnoff',
        model = 'models/weapons/arccw/w_sawnoff.mdl',
        price = 6400 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'M1014', 
    {
        entity = 'arccw_m1014',
        model = 'models/weapons/arccw/w_as1217.mdl',
        price = 16000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Winchester 1873', 
    {
        entity = 'arccw_winchester1873',
        model = 'models/weapons/arccw/w_winchester1873.mdl',
        price = 8900 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Mac11', 
    {
        entity = 'arccw_mac11',
        model = 'models/weapons/arccw/w_mk201.mdl',
        price = 7000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'TMP', 
    {
        entity = 'arccw_tmp',
        model = 'models/weapons/arccw/w_tmp.mdl',
        price = 6000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Tec-9', 
    {
        entity = 'arccw_fml_tec9',
        model = 'models/weapons/arccw/w_tmp.mdl',
        price = 7000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'MP7', 
    {
        entity = 'arccw_mp7',
        model = 'models/weapons/arccw/w_mp7.mdl',
        price = 9001 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'MP5', 
    {
        entity = 'arccw_mp5',
        model = 'models/weapons/arccw/w_mp5.mdl',
        price = 8000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Vector', 
    {
        entity = 'arccw_vector',
        model = 'models/weapons/arccw/w_vector.mdl',
        price = 10000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Scout', 
    {
        entity = 'arccw_scout',
        model = 'models/weapons/arccw/w_psrs.mdl',
        price = 15000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund1, Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'AK-47', 
    {
        entity = 'arccw_ak47',
        model = 'models/weapons/arccw/w_type2.mdl',
        price = 20000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'M4A1', 
    {
        entity = 'arccw_m4a1',
        model = 'models/weapons/arccw/mk4.mdl',
        price = 18000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Абакан', 
    {
        entity = 'arccw_fml_an94',
        model = 'models/weapons/arccw/w_m14.mdl',
        price = 24000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'AUG', 
    {
        entity = 'arccw_aug',
        model = 'models/weapons/arccw/w_para.mdl',
        price = 18 * 10^3 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Galil 7.62', 
    {
        entity = 'arccw_galil762',
        model = 'models/weapons/arccw/w_galil762.mdl',
        price = 25000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'P90', 
    {
        entity = 'arccw_p90',
        model = 'models/weapons/arccw/w_pdw57.mdl',
        price = 18000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'M-14', 
    {
        entity = 'arccw_m14',
        model = 'models/weapons/arccw/w_m14.mdl',
        price = 22000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Raging Bull', 
    {
        entity = 'arccw_ragingbull',
        model = 'models/weapons/arccw/w_ragingbull.mdl',
        price = 15000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Desert Eagle', 
    {
        entity = 'arccw_deagle357',
        model = 'models/weapons/w_pist_deagle.mdl',
        price = 10^4 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'G36C', 
    {
        entity = 'arccw_g36c',
        model = 'models/weapons/arccw/w_g36c.mdl',
        price = 18000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'SG-552', 
    {
        entity = 'arccw_sg552',
        model = 'models/weapons/arccw/w_roland.mdl',
        price = 22000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'TommyGun', 
    {
        entity = 'arccw_tommygun',
        model = 'models/weapons/arccw/w_tommygun.mdl',
        price = 16000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'AWP', 
    {
        entity = 'arccw_awm',
        model = 'models/weapons/arccw/w_hs338.mdl',
        price = 32000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund2, Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Gold Deagle', 
    {
        entity = 'arccw_deagle50',
        model = 'models/weapons/arccw/w_gce.mdl',
        price = 27000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'Barret M107', 
    {
        entity = 'arccw_m107',
        model = 'models/weapons/arccw/w_bfg.mdl',
        price = 64000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'M-60', 
    {
        entity = 'arccw_m60',
        model = 'models/weapons/arccw/w_m60.mdl',
        price = 75000 * 5,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund3 },

        category = 'Other'
    }
)
setShip( 
    'RPG-7', 
    {
        entity = 'arccw_rpg7',
        model = 'models/weapons/arccw/w_rpg7.mdl',
        price = 99999 * 5 - 99999,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgund3 },

        category = 'Other'
    }
)



setShip( 
    'Палка-Уебалка', 
    {
        model = 'models/weapons/w_stunbaton.mdl',
        entity = 'stunstick',
        price = 2500,
        amount = 5,
        separate = false,
        pricesep = 100,
        noship = false,
        allowed = { Tgundealer1 },

        category = 'Other'
    }
)

setShip( 
    'Отмычки', 
    {
        entity = 'lockpick',
        model = 'models/weapons/w_crowbar.mdl',
        price = 16000,
        amount = 10,
        separate = false,
        pricesep = 1000,
        noship = false,
        allowed = { Tdealer },

        category = 'Other'
    }
)

setShip( 
    'S.L.A.M', 
    {
        entity = 'weapon_slam',
        model = 'models/weapons/w_slam.mdl',
        price = 25000,
        amount = 5,
        separate = false,
        pricesep = 5000,
        noship = false,
        allowed = { Tdealer },

        category = 'Other'
    }
)

setShip( 
    'S.L.A.M', 
    {
        entity = 'weapon_slam',
        model = 'models/weapons/w_slam.mdl',
        price = 25000,
        amount = 5,
        separate = false,
        pricesep = 5000,
        noship = false,
        allowed = { Tdealer },

        category = 'Other'
    }
)

setShip(
    'Верёвка', 
    {
        entity = 'weapon_cuff_rope',
        model = 'models/props_phx/construct/metal_plate_curve360.mdl',
        price = 150000,
        amount = 10,
        separate = false,
        pricesep = 5000,
        noship = false,
        allowed = { Tdealer },

        category = 'Other'
    }
)
