 
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName		= "Вода"
ENT.Author			= "R4K0"
ENT.Contact			= "Steam"
ENT.Purpose			= ""
ENT.Instructions	= ""
ENT.Category = "RMeth"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("String",0,"Content")
	self:NetworkVar("Float",0,"Amount")
end