 
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName		= "Соляная Кислота"
ENT.Author			= "R4K0"
ENT.Contact			= "Steam"
ENT.Category = "RMeth"
ENT.Purpose			= ""
ENT.Instructions	= ""
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("String",0,"Content")
	self:NetworkVar("Float",0,"Amount")
end