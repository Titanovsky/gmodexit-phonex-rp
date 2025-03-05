 
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName		= "Красный фосфор"
ENT.Author			= "R4K0"
ENT.Contact			= "Steam"
ENT.Purpose			= "Meth"
ENT.Category = "RMeth"
ENT.Instructions	= "Use with care. Always handle with gloves."
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Bool",0,"Crushed")
	self:NetworkVar("Float",0,"Amount")
end