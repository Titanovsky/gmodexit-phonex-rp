-- Использую лик, обязательно его куплю, пожалуйста, берите лицуху!
-- Проект: [ Ambition ]. Сервер: PhonexRP
-- Steam: https://steamcommunity.com/groups/ambitiongmod

-- Переделано проектом [ Ambition ]

ITEM.Name = "DarkRP Item Base"
ITEM.Model = "models/error.mdl"
ITEM.Base = "base_entity"

function ITEM:CanPickup( pl, ent )
	if not ent.dt or not ent.dt.owning_ent then return true end

	if not itemstore.config.IgnoreOwner and ent:Getowning_ent() ~= pl then
		pl:ChatPrint( "Нельзя сотворить ЗДЕСЬ!" )
		return false
	end

	return true
end
