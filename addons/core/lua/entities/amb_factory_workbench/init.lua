AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include( "shared.lua" )

function ENT:Initialize()
	self:SetModel( "models/props/cs_italy/it_mkt_table2.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetRenderMode( RENDERMODE_NORMAL )
	self:SetUseType( SIMPLE_USE )
	self:SetNWBool( "amb_WorkbenchBusy", false )
	self:SetNWFloat( 'lerp_start', SysTime() )
	self:SetNWFloat( 'lerp_max', 0 )

	local phys = self:GetPhysicsObject()
	if IsValid( phys ) then
	    phys:EnableMotion( false )
	end
end

function ENT:ReloadUse( time, ePly )
	timer.Simple( time, function() 
		self:SetNWBool( "amb_WorkbenchBusy", false )
		self:SetNWFloat( 'lerp_start', SysTime() )
		self:SetNWFloat( 'lerp_max', 2 )

		ePly:Freeze( false ) 
	    ePly:SetWalkSpeed( ePly:GetWalkSpeed() * 3 )
		ePly:SetRunSpeed( ePly:GetRunSpeed() * 3 )
		AmbLib.notifySend( ePly, 'Вы сделали Заготовку, положите её на Склад!', 0, 5, 'buttons/button15.wav' )
	end )
end

function ENT:Use( ePly )

	if IsValid( ePly ) then

		if not ePly:GetNWBool( 'amb_PickedMetal' ) then AmbLib.notifySend( ePly, 'Вам нужен Металл!', 1, 4, 'buttons/button10.wav' ) return end
		if ePly:GetNWBool( 'amb_PickedHarvesting' ) then AmbLib.notifySend( ePly, 'Отнесите Заготовку на Склад!', 1, 4, 'buttons/button10.wav' ) return end

		if self:GetNWBool( 'amb_WorkbenchBusy' ) then return end

		ePly:SetNWBool( "amb_PickedMetal", false )
	    ePly:SetNWBool( "amb_PickedHarvesting", true )
		ePly:Freeze( true )
		AmbLib.notifySend( ePly, 'Вы начали производство..', 0, 2 )

		self:SetNWBool( "amb_WorkbenchBusy", true )
		self:SetNWFloat( 'lerp_start', SysTime() )
		self:SetNWFloat( 'lerp_max', 666 )
		self:ReloadUse( 6, ePly )
	end
end

