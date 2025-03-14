function plogs.Register(type, network, color)
	plogs.types[type] = plogs.types[type] or {
		Type 	= type, 
		Network = network and plogs.cfg.EchoServer or network, 
		Color 	= color
	}
	plogs.data[type] = plogs.data[type] or {}
	return t
end

local count = 0
function plogs.AddHook(hook_name, func)
	if (SERVER) then
		hook.Add(hook_name, 'amblog.loghook.' .. count .. '.' .. hook_name, func)
		count = count + 1
	end
end

function plogs.Encode(data)
	return util.Compress(pon1.encode(data))
end

function plogs.Decode(data)
	return pon1.decode(util.Decompress(data))
end

function plogs.GetSaves()
	local files = file.Find('amblog/saves/*.dat', 'DATA', 'datedesc')
	for k, v in ipairs(files) do
		files[k] = string.StripExtension(v)
	end
	return files
end

function plogs.OpenSave(name)
	return plogs.Decode(file.Read('amblog/saves/' .. name .. '.dat', 'DATA'))
end

function plogs.DeleteSave(name)
	file.Delete('amblog/saves/' .. name .. '.dat')
end

function plogs.SaveExists(name)
	return file.Exists('amblog/saves/' .. string.Trim(name) .. '.dat', 'DATA')
end

function plogs.SaveLog(name, tbl)
	file.Write('amblog/saves/' .. string.Trim(name) .. '.dat', plogs.Encode(tbl)) 
end