--[[
	Конфиг первого сервера: Phonex DarkRP.
	Основный скрипт параметров, влияющих на сервер.
	Комментируются все детали в amb_doc.lua
	Сервер находится в полном подчинений проекта: [ Ambition ]


	Примеры названий:

	local amb_var = nil
	local function AmbLib_func( sString, nNumber, fNumber )

	amb_var = nil -- global
	function AmbLib_funcStart() -- global

	local COLOR_BLOHA -- it's for static var

	tTableAdmins = {}

	[26.04.20]
		• Первая версия конфига.
	.
	[27.04.20]
		• Добавил chto-to.
	.
	[08.08.20]
		• Решил, что матрицей для DarkRP будет служить [RUs], а значит придётся обновить конфиг и сделать его более важным.
		• Добавил все существующие модули ( permaprops, duel, drinks, workshopdl и т.д ).
	.
	[09.08.20]
		• Потихоньку сюда добавляю модули, ибо в аддонах делаю проверку на них.
	.
	[10.08.20]
		• Добавил survive.
	.
	[16.08.20]
		• Добавил Phonex RP, теперь ветки разработки будут расходится
	.
	[26.08.20]
		• Добавил chemistry.
	.
	[30.08.20]
		• Добавил rob_train.
	.
]]

AMB = AMB or {} -- при reload инициализирует свою же, не создаёт миллион раз одну и ту же таблу.

AMB.config = {} -- инициализируем конфиг

-- ##############_MAIN_###################
AMB.config.loader_enable 		= true;
AMB.config.module_libs 			= true;
AMB.config.module_admins 		= false;
AMB.config.module_propcore 		= false;
AMB.config.module_stats 		= true;
-- #######################################

AMB.config.gamemode 	= "DarkRP"; -- define current gamemode.
--AMB.config.database 	= "sql" -- Type of databases: sql, mysql, data.

AMB.config.hurtplayers 			= 1; -- player can to damage others?
AMB.config.noclip 				= 0; -- player can to fly?
AMB.config.OnDeathSound 		= false; -- sound post death.

AMB.config.module_economic 		= true; -- [AMB] Ecomomic
AMB.config.module_events 		= false; -- [AMB] Events v1.0
AMB.config.module_drinks		= true; 
AMB.config.module_duel 			= false;
AMB.config.module_workshopdl 	= true;
AMB.config.module_permaprops 	= true;
AMB.config.module_antilag_sbox 	= false;
AMB.config.module_e2chips 		= false;
AMB.config.module_survive 		= false;
AMB.config.module_rob_train 	= true;

AMB.config.module_chemistry 	= true;

MsgN( "\n	| [Ambition] Phonex RP Config Has Loaded |         \n" )
-- Данное творение принадлежит проекту [ Ambition ]