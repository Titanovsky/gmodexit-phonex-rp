ENT.Base = "base_ai"
ENT.Type = "ai"

ENT.PrintName 	= 'Покупатель'
ENT.Author 		= '[ Ambition ]'
ENT.Category	= '[ AMB ] Meth'

ENT.AutomaticFrameAdvance = true

ENT.Spawnable = true

function ENT:PhysicsCollide( data, physobj )
end

function ENT:PhysicsUpdate( physobj )
end

function ENT:SetAutomaticFrameAdvance( bUsingAnim )
	self.AutomaticFrameAdvance = bUsingAnim
end