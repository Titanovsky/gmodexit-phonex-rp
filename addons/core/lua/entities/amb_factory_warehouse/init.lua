AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include( "shared.lua" )

local tab_instances = {
	'AK47',
	'M4A1',
	'PM',
	'DesertEagle',
	'AWP',
	'RPG'
}

function ENT:Initialize()
	self:SetModel( 'models/props/cs_militia/crate_extrasmallmill.mdl' )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetRenderMode( RENDERMODE_NORMAL )
	self:SetUseType( SIMPLE_USE )
	self:SetNWInt( 'Instance', 0 )
	self:SetNWInt( 'Plus', 0 )

	for _, instance in pairs( tab_instances ) do
		self:SetNWInt( 'Instance_'..instance, 0 )
	end

	local phys = self:GetPhysicsObject()
	if IsValid( phys ) then
	    phys:EnableMotion( false )
	end
end

local function CalcSalary( ePly )
	local reward = math.random( 4, 32 )
	local bonus = 0

	if ( AmbStats.Players.getStats( ePly, '!' ) <= 2 ) then 
		bonus = math.random( 12, 50 )
	elseif ( AmbStats.Players.getStats( ePly, '!' ) > 2 ) and ( AmbStats.Players.getStats( ePly, '!' ) < 8 ) then
		bonus = math.random( 2, 21 )
	end

	if bonus > 0 then
		AmbLib.chatSend( ePly, AMB_COLOR_AMBITION, '[•] ', AMB_COLOR_WHITE, 'Вы заработали: ', AMB_COLOR_GREEN, reward..'$', AMB_COLOR_GRAY, ' ( Бонус за уровень: '..bonus..'$ )' )
	else
		AmbLib.chatSend( ePly, AMB_COLOR_AMBITION, '[•] ', AMB_COLOR_WHITE, 'Вы заработали: ', AMB_COLOR_GREEN, reward..'$' )
	end

	AmbStats.Players.addStats( ePly, '$', reward + bonus )
end


function ENT:Use( ePly )

	if IsValid( ePly ) then

		if ePly:GetNWBool( 'amb_PickedMetal' ) then AmbLib.notifySend( ePly, 'Положите Металл в Верстак!', 1, 4, 'buttons/button10.wav' ) return end
		if not ePly:GetNWBool( 'amb_PickedHarvesting' ) then AmbLib.notifySend( ePly, 'Вам нужна Заготовка!', 1, 4, 'buttons/button10.wav' ) return end

		CalcSalary( ePly )
		ePly:SetNWBool( "amb_PickedHarvesting", false )

		local rand_count = math.random( 1, 4 )
		local rand_instance = table.Random( tab_instances )

		self:SetNWInt( 'Instance', self:GetNWInt( 'Instance' ) + rand_count )
		self:SetNWInt( 'Instance_'..rand_instance, self:GetNWInt( 'Instance_'..rand_instance ) + rand_count )
		self:SetNWInt( 'Plus', rand_count )
		self:EmitSound( "buttons/button14.wav" )
		timer.Simple( 3, function() self:SetNWInt( 'Plus', 0 ) end )
	end
end
