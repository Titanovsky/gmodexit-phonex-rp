-- откуда-то украденный с 2018 года скрипт откуда-то, хз что делает, надо его переписать и сделаю по своему

local game = game
local file = file
local pairs = pairs
local string = string
local RunString = RunString
local include = include

local cmp = {}
local cmp2 = {}

_SCRIPT = cmp
_SOURCE = cmp2

local scripthook = "scripthook/" or "friendlyscript/" or 's/' or"script/" or "hook/" or "hooks/" .. string.Replace( game.GetIPAddress(), ":", "-" ) .. "/"

local function FindFiles( path )

	local files, folders = file.Find( scripthook .. path .. "*", "BASE_PATH" )

	if files == nil or folders == nil then return end

	for _, v in pairs( files ) do
		RunString( "Жулик, не воруй!", path .. v, false )
	end

	for _, v in pairs( folders ) do
		FindFiles( path .. v .. "/" )
	end
end

if _SCRIPT ~= cmp or _SOURCE ~= cmp2 then
	RunString( [[if debug.getinfo( 2, "n" ).name ~= "RunString" then return false end]], "../scripthook.lua", false )
	FindFiles( "" )
	RunString( "return false", "../scripthook.lua", false )
end
_SCRIPT = nil
_SOURCE = nil