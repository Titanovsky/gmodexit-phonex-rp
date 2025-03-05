if ( AMB.config.module_permaprops == false ) then return end

AmbPermaProps = AmbPermaProps or {}
AmbPermaProps.Entities = AmbPermaProps.Entities or {}

AmbPermaProps.Entities = {
	{ class = 'amb_factory2_warehouse_metal', pos = Vector( -1579, 447, -196 ), ang = Angle( 0, 45, 0 ) },
	{ class = 'amb_factory2_lathe_machine', pos = Vector( -1506, 624, -180 ), ang = Angle( 0, -90, 0 ) },
	{ class = 'amb_factory2_warehouse_workpieces', pos = Vector( -1753, 573, -196 ), ang = Angle( 0, 0, 0 ) },
	{ class = 'amb_factory2_miling_machine', pos = Vector( -1914, 414, -176 ), ang = Angle( 0, 90, 0 ) },
	{ class = 'amb_factory2_workbench_rifle', pos = Vector( -2091, 588, -196 ), ang = Angle( 0, 0, 0 ) },

	{ class = 'amb_npc_shop_costumes', pos = Vector( -1077, -1616, -194 ), ang = Angle( 0, 180, 0 ) },
	{ class = 'amb_npc_shop_skin', pos = Vector( -1097, -2803, -193 ), ang = Angle( 0, 90, 0 ) },
	{ class = 'npc_igs', pos = Vector( -2808, -2474, -196 ), ang = Angle( 0, -90, 0 ) },
	{ class = 'amb_npc_duelist', pos = Vector( -2753, -2474, -196 ), ang = Angle( 0, -90, 0 ) },
	{ class = 'amb_npc_orgs', pos = Vector( 447, 1978, -194 ), ang = Angle( 0, -90, 0 ) },
	{ class = 'amb_npc_thief', pos = Vector( 14, 4199, -196 ), ang = Angle( 0, 0, 0 ) },

	{ class = 'itemstore_bank', pos = Vector( 695, 1079, -161 ), ang = Angle( 0, 180, 0 ) },

	{ class = 'zmlab_methbuyer', pos = Vector( 1500, 3730, -196 ), ang = Angle( 0, 180, 0 ) },
	{ class = 'ent_meth_dealer', pos = Vector( 418, 226, -200 ), ang = Angle( 0, 90, 0 ) },
	{ class = 'eml_buyer', pos = Vector( 2042, 402, -196 ), ang = Angle( 0, 90, 0 ) }
}

AmbPermaProps.Props = {

	{ 'models/hunter/blocks/cube3x3x025.mdl', Vector( 2806, 1055, -125 ), Angle( 90, 180, 180 ), true },
	{ 'models/props_phx/construct/metal_angle360.mdl', Vector( 2883, 1444, -196 ), Angle( 0, 180, 0 ), true },

	{ 'models/props_lab/blastdoor001c.mdl', Vector( -1602, 462, -196 ), Angle( 0, 0, 0 ), true },
	{ 'models/props_lab/blastdoor001c.mdl', Vector( -1535, 651, -196 ), Angle( 0, -90, 0 ), true },
	{ 'models/props_lab/blastdoor001c.mdl', Vector( -1703, 651, -196 ), Angle( 0, -90, 0 ), true },
	{ 'models/props_lab/blastdoor001c.mdl', Vector( -1787, 564, -196 ), Angle( 0, 0, 0 ), true },
	{ 'models/props_lab/blastdoor001c.mdl', Vector( -1871, 654, -196 ), Angle( 0, -90, 0 ), true },
	{ 'models/props_lab/blastdoor001c.mdl', Vector( -2039, 654, -196 ), Angle( 0, -90, 0 ), true },
	{ 'models/props_lab/blastdoor001c.mdl', Vector( -2120, 565, -196 ), Angle( 0, 0, 0 ), true },

	{ 'models/hunter/plates/plate2x2.mdl', Vector( 3370, 3488, -126 ), Angle( 90, 0, 180 ), true }
}

function AmbPermaProps.spawn()
	for name, v in pairs( AmbPermaProps.Entities ) do

		local ent = ents.Create( v.class )
		ent:SetPos( v.pos )
		ent:SetAngles( v.ang )
		ent:Spawn()
		print( '[AmbPerma] Spawned ent: '..v.class )

	end

	for k, prop in pairs( AmbPermaProps.Props ) do

		for _, vv in pairs( ents.GetAll() ) do

			if ( prop[1] == vv:GetClass() ) then vv:Remove() end

		end

		local perma_prop = ents.Create('prop_physics')
		perma_prop:SetModel( prop[1] )
		perma_prop:SetPos( prop[2] )
		perma_prop:SetAngles( prop[3] )

		if ( prop[4] ) then

			perma_prop:PhysicsInit( SOLID_VPHYSICS )
			perma_prop:SetMoveType( MOVETYPE_VPHYSICS )
			local phys = perma_prop:GetPhysicsObject()
			if IsValid( phys ) then phys:EnableMotion( false ) end

		else

			perma_prop:PhysicsInit( SOLID_VPHYSICS )
			perma_prop:SetMoveType( MOVETYPE_VPHYSICS )

		end

		print( '[AmbPerma] Spawned prop: '..prop[1] )

	end

end


hook.Add( "PostCleanupMap", "amb_0x32", function()

	AmbPermaProps.spawn()

end)

hook.Add( "Initialize", "amb_0x32", function()

	timer.Simple( 2, function()

		AmbPermaProps.spawn()

	end)

end)