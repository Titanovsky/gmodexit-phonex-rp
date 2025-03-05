-- Использую лик, обязательно его куплю, пожалуйста, берите лицуху!
-- Проект: [ Ambition ]. Сервер: PhonexRP
-- Steam: https://steamcommunity.com/groups/ambitiongmod

-- Переделано проектом [ Ambition ]


itemstore.config.MaxStack = 2^5-math.log(2, 2)
itemstore.config.DataProvider = "f"
itemstore.config.SaveOnWrite = true
itemstore.config.GamemodeProvider = "phonex"
itemstore.config.SaveInterval = 180
itemstore.config.Language = "ambition"
-- Allow the use of the /invholster command
itemstore.config.EnableInvholster = true
-- Force player to holster all of their ammo as well as their gun when they use /invholster, ala DarkRP.
itemstore.config.InvholsterTakesAmmo = false
-- Split ammo on spawned_weapons instead of giving all ammo at once when used
itemstore.config.SplitWeaponAmmo = true
itemstore.config.PickupsGotoBank = false
itemstore.config.PickupDistance = 100
itemstore.config.DropDistance = 100
itemstore.config.PickupKey = -1

itemstore.config.BoxBreakable = true
itemstore.config.BoxHealth = 400

-- Should users be able to pick up other users' entities
itemstore.config.IgnoreOwner = true
itemstore.config.AntiDupe = true

-- Migrates text data from 2.0 to the current format.
-- This is experimental and may not function correctly. Please be careful if you decide to use this.
-- !!IMPORTANT!!
-- PLEASE make backups of your data -- this process is DESTRUCTIVE and will delete old data files 
-- and overwrite any inventory data that players currently have.
itemstore.config.MigrateOldData = false

-- <rank> = { <width>, <height>, <pages> }
itemstore.config.InventorySizes = {
	default = { 4, 4, 1 },
	--superadmin = { 4, 4, 1 },
	--admin = { 10, 3, 1 },
}

itemstore.config.BankSizes = {
	default = { 6, 6, 2 },
	--admin = { 12, 4, 1 }
}

itemstore.config.Skin = "flat"
itemstore.config.Colours = {
	Slot = Color( 0, 0, 0, 150 ),
	HoveredSlot = Color( 255, 255, 255, 150 ),
	Title = Color( 255, 255, 255 ),

	TitleBackground = Color( 0, 0, 0, 200 ),
	Upper = Color( 235, 235, 235, 200 ),
	Lower = Color( 235, 235, 235, 250 ),
	InnerBorder = Color( 0, 0, 0, 0 ),
	OuterBorder = Color( 0, 0, 0, 200 )
}


itemstore.config.DisabledItems = {
	spawned_shipment = false,
	spawned_weapon = false,
	spawned_ammo = false,
	spawned_money = true,

	prop_physics = true,
}

-- <entity class> = { "<name>", "<description>", <stackable (optional)> }
itemstore.config.CustomItems = {
	
	-- Attachments -----------------------------------------------------
	[ 'acwatt_muzz_8choke' ] = { '8-Choke', 'описание', 1 },
	[ 'acwatt_fcg_accelerator' ] = { 'Accelerator', 'описание', 1 },
	[ 'acwatt_optic_acog' ] = { 'ACOG', 'описание', 1 },
	[ 'acwatt_stock_strafe' ] = { 'Adjustable Stock', 'описание', 1 },
	[ 'acwatt_optic_aimpoint' ] = { 'Aimpoint (RDS)', 'Прицел', 1 },
	[ 'acwatt_perk_push' ] = { 'Airbender', 'описание', 1 },
	[ 'acwatt_ubgl_ak47' ] = { 'AK47-K(FMJ)', 'описание', 1 },
	[ 'acwatt_perk_extendedmags' ] = { 'American Action Hero', 'описание', 1 },
	[ 'acwatt_foregrip_angled' ] = { 'Angled Foregrip', 'описание', 1 },
	[ 'acwatt_fcg_auto' ] = { 'Automatic', 'описание', 1 },
	[ 'acwatt_perk_beefficient' ] = { 'Be Efficient', 'описание', 1 },
	[ 'acwatt_bipod' ] = { 'Сошки', 'Сошки', 1 },
	[ 'acwatt_ammo_birdshot' ] = { 'Birdshot', 'описание', 1 },
	[ 'acwatt_ammo_blank' ] = { 'Blanks', 'описание', 1 },
	[ 'acwatt_tac_pointer' ] = { 'Blue laser', 'описание', 1 },
	[ 'acwatt_perk_quickdraw' ] = { 'Bodyguards', 'описание', 1 },
	[ 'acwatt_muzz_breacher' ] = { 'Breaching Device', 'описание', 1 },
	[ 'acwatt_fcg_burst' ] = { 'Burst', 'описание', 1 },
	[ 'acwatt_ammo_cerberus' ] = { 'Cerberus', 'описание', 1 },
	[ 'acwatt_supp_heavy' ] = { 'Colossal Suppressor', 'описание', 1 },
	[ 'acwatt_laser_compact' ] = { 'Compact Laser', 'описание', 1 },
	[ 'acwatt_muzz_compensator' ] = { 'Compensator', 'Дульный компенсатор', 1 },
	[ 'acwatt_muzz_circlechoke' ] = { 'Concentric Choke', 'описание', 1 },
	[ 'acwatt_ammo_ricochet' ] = { 'Corner Fragger', 'описание', 1 },
	[ 'acwatt_foregrip_cqc' ] = { 'CQC Foregrip', 'описание', 1 },
	[ 'acwatt_muzz_crosschoke' ] = { 'Cross Choke', 'описание', 1 },
	[ 'acwatt_ammo_slug' ] = { 'Deer Slug', 'описание', 1 },
	[ 'acwatt_optic_delta' ] = { 'Delta (LP)', 'описание', 1 },
	[ 'acwatt_ammo_explosive' ] = { 'Devils Lance', 'описание', 1 },
	[ 'acwatt_perk_underwater' ] = { 'Diver', 'описание', 1 },
	[ 'acwatt_optic_docter' ] = { 'Docter', 'описание', 1 },
	[ 'acwatt_fcg_double' ] = { 'Double Stuff', 'описание', 1 },
	[ 'acwatt_laser_compact' ] = { 'Compact Laser', 'описание', 1 },
	[ 'acwatt_ammo_dragon' ] = { 'Dragons Breath', 'описание', 1 },
	[ 'acwatt_fcg_dualstage' ] = { 'Dual Stage Auto', 'описание', 1 },
	[ 'acwatt_muzz_duckbill' ] = { 'Duckbill Choke', 'описание', 1 },
	[ 'acwatt_grip_ergo' ] = { 'Ergo Gip', 'описание', 1 },
	[ 'acwatt_muzz_fchoke' ] = { 'F-Choke', 'описание', 1 },
	[ 'acwatt_optic_farview' ] = { 'Farview', 'описание', 1 },
	[ 'acwatt_ammo_api' ] = { 'Fire and Brimstone', 'Зажигательный Патрон', 1 },
	[ 'acwatt_muzz_flashhider' ] = { 'Flash Hider', 'описание', 1 },
	[ 'acwatt_ammo_flechette' ] = { 'Flechette', 'описание', 1 },
	[ 'acwatt_ubgl_gp25' ] = { 'GP25 (HEAT)', 'описание', 1 },
	[ 'acwatt_perk_fastbolt' ] = { 'Greased Bolt', 'описание', 1 },
	[ 'acwatt_tac_green' ] = { 'Green Laser', 'описание', 1 },
	[ 'acwatt_grippod' ] = { 'Grip Bipod', 'описание', 1 },
	[ 'acwatt_optic_hamr' ] = { 'HAMR (2.7x)', 'описание', 1 },
	[ 'acwatt_muzz_hbar' ] = { 'Heavy Barrel', 'описание', 1 },
	[ 'acwatt_stock_heavy' ] = { 'Heavy Stock', 'описание', 1 },
	[ 'acwatt_ammo_frangible' ] = { 'Hollow Point', 'описание', 1 },
	[ 'acwatt_optic_holo' ] = { 'Holographic (HOLO)', 'описание', 1 },
	[ 'acwatt_optic_hunter' ] = { 'Hunter (2-5x)', 'описание', 1 },
	[ 'acwatt_fcg_hyper' ] = { 'Hyper-Burst', 'описание', 1 },
	[ 'acwatt_perk_infinite' ] = { 'Infinity', 'описание', 1 },
	[ 'acwatt_optic_p90_ring'] = {'Integral Ring (HOLO)', 'описание', 1 },
	[ 'acwatt_muzz_mp5sd' ] = { 'Integral Schalldampfer', 'описание', 1 },
	[ 'acwatt_optic_aug_scope' ] = { 'Integral Scope (1.5-3x)', 'описание', 1 },
	[ 'acwatt_optic_kobra' ] = { 'Kobra (HOLO)`', 'описание', 1 },
	[ 'acwatt_muzz_lbar' ] = { 'Light Barrel', 'описание', 1 },
	[ 'acwatt_foregrip_pistol' ] = { 'Light Foregrip', 'описание', 1 },
	[ 'acwatt_perk_lightweight' ] = { 'Light Frame', 'описание', 1 },
	[ 'acwatt_stock_light' ] = { 'Light Stock', 'описание', 1 },
	[ 'acwatt_supp_light' ] = { 'Light Suppressor', 'описание', 1 },
	[ 'acwatt_supp_g36c' ] = { 'LP Suppressorr', 'описание', 1 },
	[ 'acwatt_optic_gauss_scope' ] = { 'M2014-S', 'описание', 1 },
	[ 'acwatt_ubgl_m203_training' ] = { 'M-203 (BATON)', 'описание', 1 },
	[ 'acwatt_ubgl_m203' ] = { 'M-203 (HE)', 'описание', 1 },
	[ 'acwatt_ammo_magnum' ] = { 'Magnum Buckshot', 'описание', 1 },
	[ 'acwatt_optic_magnus' ] = { 'Magnus (3-6x)', 'описание', 1 },
	[ 'acwatt_perk_owyn' ] = { 'Make It Count', 'описание', 1 },
	[ 'acwatt_ubgl_mass' ] = { 'MASS-12 (BUCK)', 'описание', 1 },
	[ 'acwatt_ammo_match' ] = { 'Match Ammo', 'описание', 1 },
	[ 'acwatt_perk_last' ] = { 'Memento Mori', 'описание', 1 },
	[ 'acwatt_optic_micro' ] = { 'Micro (2x)', 'описание', 1 },
	[ 'acwatt_mifl_foregrip_side' ] = { 'Mounted Foregrip', 'описание', 1 },
	[ 'acwatt_optic_mrs' ] = { 'MRS (HOLO)', 'описание', 1 },
	[ 'acwatt_muzz_booster' ] = { 'Muzzle Buster', 'описание', 1 },
	[ 'acwatt_mifl_foregrip_side' ] = { 'Mounted Foregrip', 'описание', 1 },
	-- -----------------------------------------------------------------
	

}

