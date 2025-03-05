ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName= "Кристальный мет"
ENT.Author= "R4K0"
ENT.Contact= "Via steam"
ENT.Purpose= "Sell it at the buyer"
ENT.Instructions= "Use wisely"
ENT.Category = "RMeth"
ENT.Spawnable = true
ENT.AdminSpawnable = false


function ENT:SetupDataTables()
	self:NetworkVar("Float",0,"Quality")
	self:NetworkVar("Bool",0,"Warm")
end