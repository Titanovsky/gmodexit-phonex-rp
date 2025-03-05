AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include( "shared.lua" )

local mdls = {
	'models/bag/bag.mdl',
	'models/candy_01/candy_01.mdl',
	'models/apple/apple.mdl'
}

function ENT:Initialize()

	self:SetModel( table.Random( mdls ) )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( MOVETYPE_VPHYSICS )
	self:SetRenderMode( RENDERMODE_TRANSALPHA )
	self:SetUseType( SIMPLE_USE )

	if self:GetModel() ~= mdls[1] then self:SetModelScale( 4, 0 ) end

end

function ENT:Use( ePly )

	ePly:SetNWInt( 'Candy', ePly:GetNWInt( 'Candy' )+1 )
	AmbStats.Players.addStats( ePly, '$', 1 )
	AmbLib.notifySend( ePly, 'Вы собрали одну сладость!', 0, 6 )
	self:Remove()

end
