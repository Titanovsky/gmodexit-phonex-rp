include("shared.lua")

function ENT:Initialize()
	self.OriginPos = self:GetPos()+Vector( 0, 0, 25 )
	self.Rotate = 0
	self.RotateTime = RealTime()
end

function ENT:Draw()

	self:SetRenderOrigin( self.OriginPos+Vector( 0, 0, math.sin( RealTime()*1 )*12 ) )
	self:DrawModel()
	self.Rotate = ( RealTime() - self.RotateTime )*180%360
	self:SetAngles( Angle( 0, self.Rotate, 0 ) )
end