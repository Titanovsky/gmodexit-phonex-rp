plogs.Register('ULX', false)

plogs.AddHook(ULib.HOOK_COMMAND_CALLED, function(pl, cmd, args)
	if pl:IsPlayer() then 
		plogs.PlayerLog(pl, 'ULX', pl:NameID() .. ' ввёл команду "' .. cmd .. '" с аргументом "' .. table.concat(args, ' ') .. '"', {
			['Name']	= pl:Name(),
			['SteamID']	= pl:SteamID(),
		})
	end
end)
