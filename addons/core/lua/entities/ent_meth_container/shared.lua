ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName = "Термо Контейнер"
ENT.Author = "R4K0"
ENT.Contact = "Via steam"
ENT.Purpose = "Sell it at the buyer"
ENT.Instructions = "Use wisely"
ENT.Category = "RMeth"
ENT.Spawnable = true
ENT.AdminSpawnable = false


function ENT:SetupDataTables()
	self:NetworkVar("Float",0,"StoredMeth")
	self:NetworkVar("Bool",0,"Warm")
end