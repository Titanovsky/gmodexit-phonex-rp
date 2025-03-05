local include_sv = (SERVER) and include or function() end
local include_cl = (SERVER) and AddCSLuaFile or include
local include_sh = function(path) include_sv(path) include_cl(path) end

plogs		= plogs			or {}
plogs.cfg 	= plogs.cfg 	or {}
plogs.types	= plogs.types	or {}
plogs.data	= plogs.data	or {}

plogs.Version = '2.7.1'

function plogs.Error(str)
	return ErrorNoHalt('[Логи] ' .. str)
end


include_sh 'amblog/lib/pon1.lua'
include_cl 'amblog/lib/pdraw.lua'
include_sv 'amblog/lib/table.lua'

include_sh 'amblog_cfg.lua' 
include_sh 'amblog/workarounds/sanity_checker.lua'

include_sh 'amblog/core_sh.lua'
include_sv 'amblog/core_sv.lua'
include_sh 'amblog/console.lua'

include_cl 'amblog/vgui/skin.lua'
include_cl 'amblog/vgui/frame.lua'
include_cl 'amblog/vgui/tablist.lua'

include_cl 'amblog/menu.lua'

if (not file.IsDir('amblog/saves', 'data')) then
	file.CreateDir('amblog/saves')
end

hook.Add('Initialize', 'plogs.Loghooks.Initialize', function()
	local files, _ = file.Find('amblog_hooks' .. '/*.lua', 'LUA')
	for _, f in ipairs(files) do
	if plogs.cfg.LogTypes[f:sub(1, f:len() - 4):lower()] then continue end
		include_sh('amblog_hooks/' .. f)
	end
end)
