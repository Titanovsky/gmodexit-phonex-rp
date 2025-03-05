-- https://darkrp.miraheze.org/wiki/DarkRP:Categories
-- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".

local drp = DarkRP
local setCat = drp.createCategory
local COLOR_STANDART = Color( 255, 255, 255 )


-- ## Работы ######################################
setCat{
    name = 'Мирные', 
    categorises = 'jobs', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'Правительство', 
    categorises = 'jobs', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'МВД', 
    categorises = 'jobs', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'Криминал', 
    categorises = 'jobs', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'Чужие', 
    categorises = 'jobs', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}
-- ################################################




-- ## Оружия ######################################
setCat{
    name = 'Холодное Орудие', 
    categorises = 'entities', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'Лёгкое Орудие', 
    categorises = 'entities', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'Полу-Тяжёлое Орудие', 
    categorises = 'entities', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'Тяжёлое Орудие', 
    categorises = 'entities', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}
-- ################################################




-- ## Предметы ####################################
setCat{
    name = 'Патроны', 
    categorises = 'entities', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'Медикаменты', 
    categorises = 'entities', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'Денежный Принтер', 
    categorises = 'entities', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'Наркотики', 
    categorises = 'entities', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'Выращивание Травы', 
    categorises = 'entities', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}

setCat{
    name = 'Варка Метамфетамина', 
    categorises = 'entities', 
    startExpanded = true,
    color = COLOR_STANDART,
    canSee = function( ePly ) return true end,
    sortOrder = 100,
}
-- ################################################