-- Использую лик, обязательно его куплю, пожалуйста, берите лицуху!
-- Проект: [ Ambition ]. Сервер: PhonexRP
-- Steam: https://steamcommunity.com/groups/ambitiongmod

-- Переделано проектом [ Ambition ]

ENT.Type = "anim"
ENT.Base = "itemstore_box"

ENT.PrintName = '• Лут умершего'
ENT.Category = '[ AMB ] Инвентарь'

ENT.Spawnable = false
ENT.AdminOnly = false

if SERVER then
	AddCSLuaFile()

	ENT.DefaultHealth = itemstore.config.BoxHealth
	ENT.Model = "models/props_junk/wood_crate001a_damaged.mdl"

	ENT.ContainerWidth = 5
	ENT.ContainerHeight = 5
	ENT.ContainerPages = 2

	ENT.Timeout = 0

	function ENT:Think()
		if self.Timeout < CurTime() then self:Remove() end
	end
end
