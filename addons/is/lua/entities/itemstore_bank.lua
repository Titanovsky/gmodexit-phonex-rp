-- Использую лик, обязательно его куплю, пожалуйста, берите лицуху!
-- Проект: [ Ambition ]. Сервер: PhonexRP
-- Steam: https://steamcommunity.com/groups/ambitiongmod

-- Переделано проектом [ Ambition ]

ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.PrintName = '• Хранилище'
ENT.Category = '[ AMB ] Инвентарь'

ENT.Spawnable = true
ENT.AdminOnly = true

if SERVER then
	AddCSLuaFile()

	function ENT:Initialize()
		self:SetModel( "models/props_lab/reciever_cart.mdl" )

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )

		self:GetPhysicsObject():EnableMotion( false )
	end

	function ENT:SpawnFunction( pl, trace, class )
		local ent = ents.Create( class )
		ent:SetPos( trace.HitPos + trace.HitNormal * 16 )
		ent:Spawn()

		return ent
	end

	function ENT:Use( pl )
		if not IsValid( pl ) then return end

		pl.Bank:Sync()
		pl:OpenContainer( pl.Bank:GetID(), itemstore.Translate( "bank" ) ) -- Переделано проектом [ Ambition ]
	end

	concommand.Add( "itemstore_savebanks", function( pl )
		if not game.SinglePlayer() and IsValid( pl ) then return end

		local banks = {}

		for _, ent in ipairs( ents.FindByClass( "itemstore_bank" ) ) do
			table.insert( banks, {
				Position = ent:GetPos(),
				Angles = ent:GetAngles()
			} )
		end

		file.Write( "itemstore/banks/" .. game.GetMap() .. ".txt", util.TableToJSON( banks ) )

		print( "Banks for map " .. game.GetMap() .. " saved." )
	end )

	hook.Add( "InitPostEntity", "ItemStoreSpawnBanks", function()
		local banks = util.JSONToTable( file.Read( "itemstore/banks/" .. game.GetMap() .. ".txt", "DATA" ) or "" ) or {}

		for _, data in ipairs( banks ) do
			local bank = ents.Create( "itemstore_bank" )
			bank:SetPos( data.Position )
			bank:SetAngles( data.Angles )
			bank:Spawn()
		end
	end )
else

	local max_dist = 1200
	local font = 'ambFont32'

	function ENT:Draw()

		self:DrawShadow( false )

		local _,max = self:GetRotatedAABB( self:OBBMins(), self:OBBMaxs() )
		local rot = ( self:GetPos() - EyePos() ):Angle().yaw - 90
		local center = self:LocalToWorld( self:OBBCenter() )

		if ( self:GetPos():Distance( LocalPlayer():GetPos() ) < max_dist ) then

			self:DrawModel()

			cam.Start3D2D( center + Vector( 0, 0, math.abs( max.z / 2 ) + 4 ), Angle( 0, rot, 90 ), 0.13 )

				draw.SimpleTextOutlined( 'Хранилище', font, 24, -154, AMB_COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, AMB_COLOR_BLUE )

			cam.End3D2D()

		end

	end

end

-- Переделано проектом [ Ambition ]
