-- Использую лик, обязательно его куплю, пожалуйста, берите лицуху!
-- Проект: [ Ambition ]. Сервер: PhonexRP
-- Steam: https://steamcommunity.com/groups/ambitiongmod

-- Переделано проектом [ Ambition ]

ITEM.Name = itemstore.Translate( "prop_name" )
ITEM.Description = itemstore.Translate( "prop_desc" )
ITEM.Base = "base_auto"

function ITEM:CanPickup( pl, ent )
	if CPPI then
		if ent:CPPIGetOwner() ~= pl then
			return false
		end
	end

	return true
end