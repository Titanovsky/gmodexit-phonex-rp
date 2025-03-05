CLASSICADVERT = CLASSICADVERT or {}

CLASSICADVERT.chatPrefix = "[Объявление]"

CLASSICADVERT.advertTextColor = Color( 255, 255, 0, 255 )

CLASSICADVERT.failMessage = "Ошибка."

CLASSICADVERT.chatCommand = "advert" or "ad"

CLASSICADVERT.commandDescription = "Объявление всем жителям."

CLASSICADVERT.commandDelay = 2

--[[-------------------------------------------------------------------------
					END OF CONFIG
---------------------------------------------------------------------------]]

DarkRP.declareChatCommand{
    command = 'advert',
    description = 'Дать объявление',
    delay = 2
}