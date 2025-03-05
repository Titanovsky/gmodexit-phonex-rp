-- Использую лик, обязательно его куплю, пожалуйста, берите лицуху!
-- Проект: [ Ambition ]. Сервер: PhonexRP
-- Steam: https://steamcommunity.com/groups/ambitiongmod

-- Переделано проектом [ Ambition ]

ENT.Type = "anim"
ENT.Base = "itemstore_box"

ENT.PrintName = "• Коробка 2"
ENT.Category = '[ AMB ] Инвентарь'

ENT.Spawnable = true
ENT.AdminOnly = true

if SERVER then
	AddCSLuaFile()

	ENT.DefaultHealth = itemstore.config.BoxHealth
	ENT.Model = "models/props/cs_office/cardboard_box01.mdl"

	ENT.ContainerWidth = 4
	ENT.ContainerHeight = 4
	ENT.ContainerPages = 1
end
