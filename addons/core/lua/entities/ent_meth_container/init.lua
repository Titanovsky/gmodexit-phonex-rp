AddCSLuaFile("cl_init.lua") -- Make sure clientside
AddCSLuaFile("shared.lua") -- and shared scripts are sent.
include('shared.lua')

function ENT:Initialize()

  self:SetModel("models/props_lab/jar01b.mdl")
  self:PhysicsInit(SOLID_VPHYSICS) -- Make us work with physics,
  self:SetMoveType(MOVETYPE_VPHYSICS) -- after all, gmod is a physics
  self:SetSolid(SOLID_VPHYSICS) -- Toolbox
  self:SetTrigger(true)
  self:SetUseType(SIMPLE_USE)
  self.storeable = 0

  local phys = self:GetPhysicsObject()
  if IsValid( phys ) then

    phys:Wake()
    self:SetStoredMeth(0)
    self:SetWarm(false)

  end

end

function ENT:OnTakeDamage(dmg)

  if dmg:GetDamage() > 20 and dmg:IsBulletDamage() then

    self:Remove()

  end

end

function ENT:Use(activator, caller)

  if self:GetStoredMeth() > 0 then

    local meth = ents.Create("ent_meth_crystal")
    meth.syscreated = true
    meth:SetPos(self:GetPos() + Vector(0, 0, 10) + self:GetRight() * 15)
    meth:SetQuality(self:GetStoredMeth())

    if self:GetWarm() == true then

      meth:SetWarm(true)

    else

      meth:SetWarm(false)

    end

    self:SetStoredMeth(0)
    self:SetWarm(false)
    self.storeable = CurTime() + 2
    self.t = 0
    meth:Spawn()
    meth:SetColor(self.storecol)
    self.storecol = nil
    meth = nil

  end

end

function ENT:EndTouch(ent)

  if IsValid(ent) then

    if ent:GetClass() == "ent_meth_crystal" and self:GetStoredMeth() == 0 and ent:GetQuality() > 0 and self.storeable < CurTime() then

      if ent.touched == nil then

        ent.touched = self

      end

      timer.Simple(0.1, function()

        if ent.touched == self then

          if ent:GetWarm() == true then

            self:SetWarm(true)
            self.t = CurTime() + 10

          else

            self:SetWarm(false)

          end

          self:SetStoredMeth(ent:GetQuality())
          self.storecol = ent:GetColor()
          ent:Remove()

        end

      end)

    end

  end

end

function ENT:Think()

  if self:GetWarm() and CurTime() > self.t then

    self:SetWarm(false)
    self.t = 0

  end

end
