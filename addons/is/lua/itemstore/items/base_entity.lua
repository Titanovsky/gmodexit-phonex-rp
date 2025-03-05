-- Использую лик, обязательно его куплю, пожалуйста, берите лицуху!
-- Проект: [ Ambition ]. Сервер: PhonexRP
-- Steam: https://steamcommunity.com/groups/ambitiongmod

-- Переделано проектом [ Ambition ]

ITEM.Name = "Entity Item Base"
ITEM.Model = "models/error.mdl"

function ITEM:Load()
	self:RegisterPickup( self.Class )
end

function ITEM:CreateEntity( pos )
	local ent = ents.Create( self.Class )
	ent:SetPos( pos )
	self:LoadData( ent )
	ent:Spawn()

	return ent
end

function ITEM:SaveData()
end

function ITEM:LoadData()
end