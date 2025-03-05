AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')


function ENT:Initialize()
	self:SetModel("models/Humans/Group02/male_03.mdl");
	self:SetHullType(HULL_HUMAN);
	self:SetHullSizeNormal();
	self:SetNPCState(NPC_STATE_SCRIPT);
	self:SetUseType(SIMPLE_USE);
	self:SetBloodColor(BLOOD_COLOR_RED);
	self:SetMoveType( MOVETYPE_STEP )
	--self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid( SOLID_OBB );
	self:SetNWBool( "IsSmile", false );
	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:EnableMotion(false)
	end


	self.Removed = true;
end;

function ENT:AcceptInput(name, activator, caller)
	if (!self.nextUse or CurTime() >= self.nextUse) then
		if (name == "Use" and caller:IsPlayer() and (caller:GetNWInt("player_meth") == 0)) then
			caller:SendLua("local tab = {Color(1,241,249,255), [[Meth Addicted: ]], Color(255,255,255), [["..table.Random(EML_Meth_Salesman_NoMeth).."]] } chat.AddText(unpack(tab))");
		elseif (name == "Use") and (caller:IsPlayer()) and (caller:GetNWInt("player_meth") > 0) then
			AmbStats.Players.addStats( caller, '$', caller:GetNWInt('player_meth') )
			caller:SendLua("local tab = {Color(1,241,249,255), [[Meth Addicted: ]], Color(255,255,255), [["..table.Random(EML_Meth_Salesman_GotMeth)..", here is your ]], Color(128, 255, 128), [["..caller:GetNWInt("player_meth").."$.]] } chat.AddText(unpack(tab))");
			caller:SetNWInt("player_meth", 0);
			timer.Simple(0.25, function() self:EmitSound(table.Random(EML_Meth_Salesman_GotMeth_Sound), 100, 100) end);
		end;
		self.nextUse = CurTime() + 1;
	end;
end;

function ENT:OnTakeDamage(dmginfo)
	return false;
end;

function ENT:OnTakeDamage(dmginfo)
	return false;
end;