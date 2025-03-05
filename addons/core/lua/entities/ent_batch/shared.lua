 
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName		= "Пакет"
ENT.Author			= "R4K0"
ENT.Contact			= "Steam"
ENT.Purpose			= ""
ENT.Instructions	= ""
ENT.Category = "RMeth"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 1, "Total")


	if SERVER then
		self:SetTotal(0)
	end
end
