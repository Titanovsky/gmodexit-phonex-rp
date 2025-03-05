AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include( "shared.lua" )

function ENT:Initialize()

	self:SetModel( "models/props_wasteland/controlroom_desk001b.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetRenderMode( RENDERMODE_NORMAL )
	self:SetUseType( SIMPLE_USE )
	self:SetNWBool( "amb_TableReload", false )

	local phys = self:GetPhysicsObject()
	if IsValid( phys ) then
	    phys:EnableMotion( false )
	end
end

function ENT:ReloadUse( time )
	timer.Simple( time, function() self:SetNWBool( "amb_TableReload", false ) end )

	for _, ply in pairs( player.GetAll() ) do
		ply:SendLua('AmbFactoryShowTimeTable('..tostring(time)..','..self:EntIndex()..')')
	end
end


function ENT:Use( ePly )

	if IsValid( ePly ) then

		if ePly:GetNWBool( 'amb_PickedMetal' ) then AmbLib.notifySend( ePly, 'Положите Металл в Верстак!', 1, 4, 'buttons/button10.wav' ) return end
		if ePly:GetNWBool( 'amb_PickedHarvesting' ) then AmbLib.notifySend( ePly, 'Отнесите Заготовку на Склад!', 1, 4, 'buttons/button10.wav' ) return end

		if self:GetNWBool( 'amb_TableReload' ) then return end

		ePly:SetWalkSpeed( ePly:GetWalkSpeed() / 3 )
		ePly:SetRunSpeed( ePly:GetRunSpeed() / 3 )
		ePly:SetNWBool( "amb_PickedMetal", true )
		AmbLib.notifySend( ePly, 'Вы взяли Металл, отнесите его к Верстаку!', 0, 5 )

		self:SetNWBool( "amb_TableReload", true )
		self:ReloadUse( 18 )

	end
end

