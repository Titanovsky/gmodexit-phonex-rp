 
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName		= "Краситель"
ENT.Author			= "R4K0"
ENT.Contact			= "Steam"
ENT.Purpose			= ""
ENT.Instructions	= ""
ENT.Category = "RMeth"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Vector",0,"ColorC")
end