AddCSLuaFile( 'shared.lua' )
AddCSLuaFile( 'cl_init.lua' )

include( 'shared.lua' )

function ENT:Initialize()

	self:SetModel( 'models/hunter/blocks/cube05x075x025.mdl' )
	self:SetMaterial( 'models/debug/debugwhite' )
	self:SetColor( AMB_COLOR_SMALL_BLACK )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	
	self:SetHealth( 500 )

	self:SetNWInt( 'Up_Money', 400 )
	self:SetNWInt( 'Up_Speed', 60 )
	self:SetNWInt( 'Up_Charge', 10 )
	self:SetNWFloat( 'Up_PhonexCoins', .001 )

	self:SetNWInt( 'Level_Speed', 1 )
	self:SetNWInt( 'Level_Money', 1 )
	self:SetNWInt( 'Level_PhonexCoins', 1 )
	self:SetNWInt( 'Level_Charge', 1 )
	self:SetNWInt( 'Level_Health', self:Health() )

	self:SetMode( 1 )
	self:SetCharge( 100 )

	self:SetNWInt( 'Level_Battery', self:GetCharge() )
	self:SetNWInt( 'Level_Cooler', 0 )

end

function ENT:OnTakeDamage( dmg )

	self:SetHealth( self:Health() - dmg:GetDamage() )
	self:SetNWInt( 'Level_Health', self:Health() )

	if ( self:Health() <= 0 ) and IsValid( self ) then self:Remove() end

end

function ENT:OnRemove()

	self:StopSound( 'ambition/money_printer/money_printer_loop.wav' )
	timer.Remove( 'AmbPrintMoney'..self:EntIndex() ) 

end

function ENT:AddDmg()

	self:SetHealth( self:Health() - math.random( 2*self:GetNWInt( 'Up_Charge' ), 5*self:GetNWInt( 'Up_Charge' ) ) )
	self:SetNWInt( 'Level_Health', self:Health() )

	if ( self:Health() <= 0 ) then self:Remove() end

end

-- ## CHARGE ######################

function ENT:AddCharge( nAmount )

	local plus = self:GetCharge()+nAmount

	self:SetNWInt( 'Charge', plus ) 

	if ( self:GetCharge() < 0 ) then self:SetNWInt( 'Charge', 0 ) end

	self:SetNWInt( 'Level_Battery', self:GetCharge() )

end

function ENT:SetCharge( nAmount )

	self:SetNWInt( 'Charge', nAmount )

	if ( self:GetCharge() < 0 ) then self:SetNWInt( 'Charge', 0 ) end

	self:SetNWInt( 'Level_Battery', self:GetCharge() )

end

function ENT:GetCharge()

	return self:GetNWInt( 'Charge' ) 

end

-- ################################

function ENT:GetMode()

	return self:GetNWInt( 'Mode' )

end

function ENT:SetMode( nMode )

	self:SetNWInt( 'Mode', nMode )
	self:StopSound( 'ambition/money_printer/money_printer_loop.wav' )
	timer.Remove( 'AmbMoneyPrinterSound'..self:EntIndex() ) 

	if ( nMode == 0 ) then

		return timer.Remove( 'AmbPrintMoney'..self:EntIndex() ) 

	end

	self:TimerCreate()
	self:PlaySound()

end

function ENT:TimerCreate()

	if not IsValid( self ) then return end

	timer.Create( 'AmbPrintMoney'..self:EntIndex(), self:GetNWInt( 'Up_Speed' ), 1, function()  

		self:PrintCount()
		self:TimerCreate()
	
	end )

end

function ENT:PrintCount()

	if ( self:GetMode() == 0 ) then self:StopSound( 'ambition/money_printer/money_printer_loop.wav' ) return end

	if ( self:GetMode() == 1 ) then 

		self:SetNWInt( 'Money', self:GetNWInt( 'Money' ) + self:GetNWInt( 'Up_Money' ) )
		self:AddCharge( -self:GetNWInt( 'Up_Charge' ) )
	
	end

	if ( self:GetMode() == 2 ) then 
	
		self:SetNWInt( 'PhonexCoins', self:GetNWInt( 'PhonexCoins' ) + self:GetNWInt( 'Up_PhonexCoins' ) )
		self:AddCharge( -self:GetNWInt( 'Up_Charge' )*2 )
		
	end

	if ( self:GetCharge() == 0 ) then return self:SetMode( 0 ) end

	self:TimerCreate()
	self:AddDmg()

end

function ENT:PlaySound()

	if ( self:GetNWInt( 'Mode' ) == 0 ) or self:GetNWBool( 'Cooler' ) or not IsValid( self ) then return end

	self:EmitSound( 'ambition/money_printer/money_printer_loop.wav', 45, 100, 0.9, CHAN_STATIC )

	timer.Create( 'AmbMoneyPrinterSound'..self:EntIndex(), 6, 1, function() 

		if IsValid( self ) then self:PlaySound() end

	end )

end

function ENT:TakeMoney( ePly )

	if  ( self:GetNWInt( 'Money' ) > 0 ) then 
	
		AmbStats.Players.addStats( ePly, '$', self:GetNWInt( 'Money' ) )
		self:SetNWInt( 'Money', 0 )

	end

	if ( self:GetNWInt( 'PhonexCoins' ) > 0 ) then

		AmbPhonexCoins.AddCoins( ePly, self:GetNWFloat( 'PhonexCoins' ) + #player.GetHumans()/1000 )
		self:SetNWFloat( 'PhonexCoins', 0 )

	end

end

-- ## UPDATE ######################

function ENT:SetUpdate( ePly, nType )

	local upd = self.Chunks[ nType ]

	if ( AmbStats.Players.getStats( ePly, '$' ) < upd.price ) then return ePly:ChatPrint( 'Не хватает денег!' ) end
	
	if ( nType == 5 ) and ( self:GetCharge() < upd.max ) then

		AmbStats.Players.addStats( ePly, '$', -upd.price )

		self:AddCharge( upd.count )
		if ( self:GetCharge() > upd.max ) then self:SetCharge( upd.max ) end
		self:SetNWInt( 'Level_'..upd.name, self:GetCharge() )
		return

	elseif ( nType == 6 ) and ( self:Health() < upd.max ) then

		AmbStats.Players.addStats( ePly, '$', -upd.price )

		self:SetHealth( self:Health() + upd.count )
		if ( self:Health() > upd.max ) then self:SetHealth( upd.max ) end
		self:SetNWInt( 'Level_'..upd.name, self:Health() )
		return

	elseif ( nType == 7 ) and not self:GetNWBool( 'Cooler' ) then

		AmbStats.Players.addStats( ePly, '$', -upd.price )
		self:StopSound( 'ambition/money_printer/money_printer_loop.wav' )
		self:SetNWInt( 'Level_'..upd.name, 1 )
		return self:SetNWBool( 'Cooler', true )

	end

	self:AddUpdate( ePly, nType )

end

function ENT:AddUpdate( ePly, nType )

	local upd = self.Chunks[ nType ]

	if ( AmbStats.Players.getStats( ePly, '$' ) < upd.price * self:GetNWInt( 'Level_'..upd.name ) ) then return ePly:ChatPrint( 'Не хватает денег!' ) end

	AmbStats.Players.addStats( ePly, '$', -upd.price * self:GetNWInt( 'Level_'..upd.name ) )
	
	self:SetNWInt( 'Level_'..upd.name, self:GetNWInt( 'LeveL_'..upd.name ) + 1 )

	if ( nType == 1 ) then

		self:SetNWInt( 'Up_Speed', self:GetNWInt( 'Up_Speed' ) + upd.count )
		self:SetNWInt( 'Up_Money', self:GetNWInt( 'Up_Money' ) + 20 )

	elseif ( nType == 2 ) then

		self:SetNWInt( 'Up_Charge', self:GetNWInt( 'Up_Charge' ) + upd.count )

	elseif ( nType == 3 ) then

		self:SetNWInt( 'Up_Money', self:GetNWInt( 'Up_Money' ) + upd.count )

	elseif ( nType == 4 ) then

		self:SetNWInt( 'Up_PhonexCoins', self:GetNWInt( 'Up_PhonexCoins' ) + upd.count )

	end

end

-- ################################

util.AddNetworkString( 'amb_money_printer_take' )
net.Receive( 'amb_money_printer_take', function( nLen, caller ) 

	if ( IsValid( caller ) == false ) or ( caller:Alive() == false ) then return end

	local ent = net.ReadEntity()

	if ( ent:GetClass() ~= 'amb_money_printer' ) then return caller:Kick( 'HIGHT PING >500' ) end
	if ( caller:GetEyeTrace().Entity ~= ent ) then return end
	if ( caller:GetPos():Distance( ent:GetPos() ) > 125 ) then return end

	ent:TakeMoney( caller )

end )

util.AddNetworkString( 'amb_money_printer_switch' )
net.Receive( 'amb_money_printer_switch', function( nLen, caller ) 

	if ( IsValid( caller ) == false ) or ( caller:Alive() == false ) then return end

	local ent = net.ReadEntity()

	if ( ent:GetClass() ~= 'amb_money_printer' ) then return caller:Kick( 'HIGHT PING >500' ) end
	if ( caller:GetEyeTrace().Entity ~= ent ) then return end
	if ( caller:GetPos():Distance( ent:GetPos() ) > 125 ) then return end
	if ( ent:GetCharge() == 0 ) then return AmbLib.notifySend( caller, 'В Денежном Принтере нет заряда', 1, 6 ) end

	if ent:GetMode() == 2 then return ent:SetMode( 0 ) end
	return ent:SetMode( ent:GetMode() + 1 )

end )

util.AddNetworkString( 'amb_money_printer_update' )
net.Receive( 'amb_money_printer_update', function( nLen, caller ) 

	if ( IsValid( caller ) == false ) or ( caller:Alive() == false ) then return end

	local ent = net.ReadEntity()

	if ( ent:GetClass() ~= 'amb_money_printer' ) then return caller:Kick( 'HIGHT PING >500' ) end
	if ( caller:GetEyeTrace().Entity ~= ent ) then return end
	if ( caller:GetPos():Distance( ent:GetPos() ) > 125 ) then return end

	local type_upd = net.ReadUInt( 4 )
	if ( ent:GetNWInt( 'Level_'..ent.Chunks[ type_upd ].name ) >= ent.Chunks[ type_upd ].max ) then return caller:Kick( 'HIGHT PING >420' ) end

	ent:SetUpdate( caller, type_upd )

end )