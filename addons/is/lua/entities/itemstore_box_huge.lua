-- Использую лик, обязательно его куплю, пожалуйста, берите лицуху!
-- Проект: [ Ambition ]. Сервер: PhonexRP
-- Steam: https://steamcommunity.com/groups/ambitiongmod

-- Переделано проектом [ Ambition ]

ENT.Type = "anim"
ENT.Base = "itemstore_box"

ENT.PrintName = "• Коробка 3"
ENT.Category = '[ AMB ] Инвентарь'

ENT.Spawnable = true
ENT.AdminOnly = true

if SERVER then
	AddCSLuaFile()

	ENT.DefaultHealth = itemstore.config.BoxHealth
	ENT.Model = "models/props_junk/garbage_bag001a.mdl"

	ENT.ContainerWidth = 8
	ENT.ContainerHeight = 4
	ENT.ContainerPages = 2
end
