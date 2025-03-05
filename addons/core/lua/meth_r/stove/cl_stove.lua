
local M1 = Material("rmeth/panel.png")
local M2 = Material("rmeth/trash.png","noclamp smooth")

surface.CreateFont( "Dotum30", {
	font = "Hobo Std", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )



local opened = false
local base = nil

hook.Add("Think","CloseMenu",function() -- I'd do it in death hook but it is only serverside and I wanna save the networking
	if not LocalPlayer():Alive() and opened then
		base:Close()
		opened = false
	end
end)

net.Receive("RMeth_Noti",function()
	local amount = net.ReadFloat()
	local amount2 = net.ReadFloat()
	chat.AddText(Color(255,100,100),"Том:",Color(255,255,255)," А вот и моя прелесть! Мхехе, молодец! Вот твои ",tostring(amount),"$!")
	if amount2 > 0 then
		chat.AddText(Color(255,100,100),"Том:",Color(255,255,255)," А за твои старания, вот тебе бонус "..tostring(amount2).."$!")
	end
end)


net.Receive("RMeth_StoveGUI",function(len)
	opened = true
	local entity = net.ReadEntity()
	base = vgui.Create("DFrame")
		base:SetSize(400,200)
		base:SetTitle("")
		base:Center()
		base:MakePopup()
		base.Paint = function()
			surface.SetDrawColor(255,255,255)
			surface.SetMaterial(M1)
			surface.DrawTexturedRect(0,0,base:GetWide(),base:GetTall())
		end
		base.OnClose = function()
			net.Start("RMeth_Closed")
				net.WriteEntity(entity)
			net.SendToServer()
			opened = false
		end

	local panel = vgui.Create("DPanel",base)
		panel:SetPos(120,50)
		panel:SetSize(160,45)
		panel.Paint = function()
			--[[surface.SetDrawColor(255,255,255)
			surface.DrawOutlinedRect(0,0,panel:GetWide(),panel:GetTall())--]]
		end

	local text = vgui.Create("DLabel",panel)
		text:SetFont("Dotum30")
		text:SetText(entity:GetStateS())
		text:SizeToContents()
		text:SetPos(panel:GetWide()/2-text:GetWide()/2,panel:GetTall()/2-text:GetTall()/2)

	local on = vgui.Create("DButton",base)
		on:SetSize(30,30)
		on:SetText("")
		on:SetPos(287.5,125)
		on.Paint = function()
		end
		on.DoClick = function()
			if entity:IsValid() then
				surface.PlaySound("ui/buttonclickrelease.wav")
				net.Start("RMeth_TurnON")
						net.WriteEntity(entity)
				net.SendToServer()
			timer.Simple(0.1,	function()
					text:SetText(entity:GetStateS())
					text:SizeToContents()
					text:SetPos(panel:GetWide()/2-text:GetWide()/2,panel:GetTall()/2-text:GetTall()/2)
					base:Close()
			end)
			end
		end


	local off = vgui.Create("DButton",base)
		off:SetSize(30,30)
		off:SetText("")
		off:SetPos(287.5+65,125)
		off.Paint = function()
		end
		off.DoClick = function()
			if entity:IsValid() then
				surface.PlaySound("ui/buttonclickrelease.wav")
					net.Start("RMeth_TurnOFF")
							net.WriteEntity(entity)
					net.SendToServer()
				timer.Simple(0.1,	function()
						text:SetText(entity:GetStateS())
						text:SizeToContents()
						text:SetPos(panel:GetWide()/2-text:GetWide()/2,panel:GetTall()/2-text:GetTall()/2)
						base:Close()
				end)
			end
		end


		local dump = vgui.Create("DButton",base)
			dump:SetSize(40,40)
			dump:SetText("")
			dump:SetPos(5,155)
			dump.Paint = function()
				surface.SetDrawColor(255,255,255)
				surface.SetMaterial(M2)
				surface.DrawTexturedRect(0,0,dump:GetWide(),dump:GetTall())
			end
			dump.DoClick = function()
				if entity:IsValid() then
					surface.PlaySound("ui/buttonclickrelease.wav")
					net.Start("RMeth_Dump")
							net.WriteEntity(entity)
					net.SendToServer()
				end
			end




end)

local mat = Material("backpack.png","smooth")

local pnl
local closing = false
net.Receive("MethUpdate",function(len,ply)

	local amt = net.ReadInt(32)
	if IsValid(pnl) and amt == 0 then pnl:Remove() return elseif amt == 0 then return end

	
	if !IsValid(pnl) then
		pnl = vgui.Create("DButton")
		pnl:SetAlpha(0)
		pnl:AlphaTo(255,0.5,0)
		pnl:SetPos(ScrW()/2-50,ScrH()*.80-50)
		pnl:SetSize(100,100)
		pnl:SetText("")
		pnl.Paint = function(s,w,h)
			surface.SetDrawColor(255, 255, 255)
			surface.SetMaterial(mat)
			surface.DrawTexturedRect(0, 0, w, h)
		end
		pnl.DoClick = function(s)
			if closing == true then return end
			net.Start("MethUpdate") net.SendToServer()
			closing = true
			pnl:AlphaTo(0, 0.5, 0, function(data,pnl) pnl:Remove() closing = false end)
		end
	end
end)
local closing2 = false
local mat2 = Material("hazmat2.png","mips smooth")
net.Receive("HazmPut",function(len,ply)
		
		local pnl = vgui.Create("DButton")
			pnl:SetAlpha(0)
			pnl:AlphaTo(255,0.5,0)
			pnl:SetPos(ScrW()/2-50,ScrH()*.9-50)
			pnl:SetSize(100,100)
			pnl:SetText("")
			pnl.Paint = function(s,w,h)
				surface.SetDrawColor(255, 255, 255)
				surface.SetMaterial(mat2)
				surface.DrawTexturedRect(0, 0, w, h)
			end
			pnl.Think = function(s)
				if LocalPlayer():GetModel() != RMETH.Hazmat then
					closing2 = true
					pnl:AlphaTo(0, 0.5, 0, function(data,pnl) pnl:Remove() closing2 = false end)
				end
			end
			pnl.DoClick = function(s)
				if closing2 then return end
				net.Start("HazmPut") net.SendToServer()
				pnl:AlphaTo(0, 0.5, 0, function(data,pnl) pnl:Remove() closing2 = false end)
			end
end)




