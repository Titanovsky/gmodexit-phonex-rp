ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName= "Стол"
ENT.Author= "R4K0"
ENT.Contact= "Via steam"
ENT.Purpose= "Add it to your meth lab"
ENT.Instructions= "Use wisely"
ENT.Category = "RMeth"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.RenderGroup = RENDERGROUP_BOTH


function ENT:SetupDataTables()
	self:NetworkVar("Float",0,"RedP")
	self:NetworkVar("Float",1,"Mur")
	self:NetworkVar("Float",2,"Water")
	self:NetworkVar("Float",3,"Liquid")
	self:NetworkVar("String",0,"StateS")
	self:NetworkVar("Float",4,"Crystal")
	self:NetworkVar("Float",5,"Cooking")
	self:NetworkVar("Bool",0,"Assembly")
end