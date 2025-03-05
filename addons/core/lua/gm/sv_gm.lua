--[[
	Конфигурация Sandbox: [RUs].
	Сервер находится в полном подчинений проекта: [ Ambition ]

	[07.05.20]
		• Первые конфигурации.
	.
	[07.08.20]
		• Тут ещё странный синтаксис, лол local function AmbGM_pInit(), что это за 'p'
	.
	[09.08.20]
		• Немного поменял, в частности странный синтаксис.
	.
	[19.08.20]
		• Сделал для ДаркРП
	.
	[01.10.20]
		• Поправил табуляцию
	.
##########################################################################################
]]

if ( AMB == false ) then return end -- Don't Remove, Please!

local cmds = {

	['sbox_playershurtplayers'] = AMB.config.hurtplayers,
	['sbox_noclip'] = 0

}

local function AmbGamemode_init()

	MsgN( "  	[Ambition] Server Initialization" )

end
hook.Add( "Initialize", "amb_0x2", AmbGamemode_init )

local function AmbGamemode_gamemodeLoaded()

	MsgN("  	[Ambition] Gamemode Loaded")

end
hook.Add( "OnGamemodeLoaded", "amb_0x2", AmbGamemode_gamemodeLoaded )

local function AmbGamemode_deathSound()

	return false

end
hook.Add( "PlayerDeathSound", "amb_0x2", AmbGamemode_deathSound )

local function AmbGamemode_runCmds()

	for cmd, value in pairs( cmds ) do

		RunConsoleCommand( cmd, value )
		MsgN( " [Ambition] ConVar: "..cmd.." = "..tostring( value )..";" )

	end

end
AmbGamemode_runCmds()


local function AmbGamemode_DarkRP_suicideNot( ply )

	return false

end
hook.Add( 'CanPlayerSuicide', 'amb_0x2', AmbGamemode_DarkRP_suicideNot )
