AddCSLuaFile()

if CLIENT then

    SWEP.Slot = 5
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false

end

SWEP.PrintName = 'Лом'
SWEP.Author = "DarkRP Developers"
SWEP.Instructions = 'ПКМ/ЛКМ для взлома Дверей'
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IsDarkRPLockpick = true

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.ViewModel = Model("models/weapons/c_crowbar.mdl")
SWEP.WorldModel = Model("models/weapons/w_crowbar.mdl")

SWEP.UseHands = true

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "DarkRP (Utility)"

SWEP.Sound = Sound("physics/wood/wood_box_impact_hard3.wav")

SWEP.Primary.ClipSize = -1  
SWEP.Primary.DefaultClip = 0  
SWEP.Primary.Automatic = false 
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()

    self:SetHoldType("normal")

end

local function ValidationEnt( ent )

    if ( SERVER ) then

        if ( ent:GetClass() == 'prop_door_rotating' ) then return true end
        if ( ent:IsVehicle() ) then return true end
        if ( ent:GetClass() == 'prop_physics' and GAMEMODE.Config.lockpickfading and ent.isFadigDoor ) then return true end

        return false
    
    end

end

function SWEP:PrimaryAttack()

    self:GetOwner():LagCompensation(true)

    local trace = self:GetOwner():GetEyeTrace()

    self:GetOwner():LagCompensation(false)

    local ent = trace.Entity

    -- titanovsky: author weapon made a bad validation of ent, i'm remade.
    -- https://i.imgur.com/Gka37Ut.png

    if ( IsValid( ent ) == false or ent.DarkRPCanLockpick == false ) then return end

    if ( ValidationEnt( ent ) == false ) then return end

    if ( trace.HitPos:DistToSqr( self:GetOwner():GetShootPos() ) > 10000 ) then return end

    self:SetHoldType("pistol")

    if ( CLIENT ) then

        if ( IsFirstTimePredicted() ) then

            AmbMiniGames.RandColorSquare.Start( 1 )

        end

    end

end

function SWEP:SecondaryAttack()
    self:PrimaryAttack()
end
