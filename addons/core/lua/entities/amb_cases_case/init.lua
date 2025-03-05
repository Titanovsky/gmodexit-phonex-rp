AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include( "shared.lua" )

function ENT:Initialize()

	self:SetModel( 'models/ptejack/props/crates/weapons_crate.mdl' )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetRenderMode( RENDERMODE_NORMAL )
	self:SetUseType( SIMPLE_USE )

	self:SetNWString( 'name', 'Unknow' )
	self:SetNWInt( 'type', 0 )

	local phys = self:GetPhysicsObject()
	if IsValid( phys ) then phys:Wake() end

end

function ENT:Use( ePly )

	if not IGS.PlayerPurchases( ePly )[ 'key_case' ] then return AmbLib.chatSend( ePly, AMB_COLOR_RED, '[•] ', AMB_COLOR_WHITE, 'Чтобы открыть нужен ключ (F1) или можно продать кейс Вору!' ) end

	local func = AmbCases.cases[ self:GetNWInt( 'type' ) ].func

	if IsValid( ePly ) then func( ePly ) end

	self:Remove()

end

