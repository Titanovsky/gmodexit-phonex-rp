if ( CLIENT ) then

	local function amb_DestroyAbsoluteMenu()
		local _remove_absolute_tables = { language.GetPhrase("spawnmenu.category.postprocess"), 
		language.GetPhrase("spawnmenu.category.dupes"), 
		language.GetPhrase("spawnmenu.category.saves") }

		for k, v in pairs( g_SpawnMenu.CreateMenu.Items ) do
			if table.HasValue( _remove_absolute_tables, v.Tab:GetText() ) then
	            g_SpawnMenu.CreateMenu:CloseTab( v.Tab, true )
	            amb_DestroyAbsoluteMenu()
	        end
	    end
	end
	hook.Add("SpawnMenuOpen", "amb_0x084", amb_DestroyAbsoluteMenu)

	local function amb_DestroySpawnMenu()
    	local _dont_block = { "superadmin","admin", "helper", "d_helper", "officer", 'sub_officer', 'moder', 'sub_moder', 'ahc', 'head_moder', 'manager', 'sub_head_admin', 'head_admin' }
        local _remove_tables = {
	        	language.GetPhrase("spawnmenu.content_tab"), 
		        language.GetPhrase("spawnmenu.category.npcs"), 
		        language.GetPhrase("spawnmenu.category.entities"), 
		        language.GetPhrase("spawnmenu.category.weapons"), 
		        language.GetPhrase("spawnmenu.category.vehicles")
    	}
    	local ply_group = LocalPlayer():GetUserGroup()

   		if not ( table.HasValue( _dont_block, ply_group ) ) then 
	    	for k, v in pairs( g_SpawnMenu.CreateMenu.Items ) do
	            if table.HasValue( _remove_tables, v.Tab:GetText() ) then
	                g_SpawnMenu.CreateMenu:CloseTab( v.Tab, true )
	                amb_DestroySpawnMenu()
	            end
	        end
	    end
    end
    hook.Add("SpawnMenuOpen", "amb_0x092", amb_DestroySpawnMenu)
end