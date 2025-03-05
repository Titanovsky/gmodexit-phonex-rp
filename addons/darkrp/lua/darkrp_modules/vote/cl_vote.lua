surface.CreateFont("DarkRPVoteButtonText", {
	font = "Arial",
	size = 15,
	weight = 100,
	antialias = true,
})

local QuestionVGUI = {}
local PanelNum = 0
local PanelOffSet = 0
local VoteVGUI = {}
local VoteVGUI_vote = {}
local Count = table.Count
local math = math
 
local function MsgDoVote()
	local question = net:ReadString()
	local voteid = net:ReadFloat()
	local timeleft = net:ReadFloat()
	
	if timeleft == 0 then
		timeleft = 100
	end

	local OldTime = CurTime()

	if not IsValid(LocalPlayer()) then return end
	LocalPlayer():EmitSound("Town.d1_town_02_elevbell1", 100, 100)
	question = question:gsub("\n"," ")
	question = DarkRP.textWrap( question, "DarkRPVoteButtonText", 350 - 12)
	
	local hifagenda = 0
	local dist = 5
	local agenda = LocalPlayer():getAgendaTable()
	if agenda then 
		hifagenda = 100 + dist
	end
	local PanelOpacity = 250
	local panelh = 50
	if question:find("\n") then
		question = question:sub(1, question:len() - 1) .. "..."
		panelh = 65
	end
	
	local panel = vgui.Create("DFrame")
	panel:SetPos(0,0)
	panel:MoveTo(0, hifagenda + PanelOffSet, 0.2)
	panel:SetTitle("")
	panel:SetSize(350, panelh)
	panel:SetSizable(false)
	panel.btnMaxim:SetVisible(false)                               
	panel.btnMinim:SetVisible(false)
	panel.btnClose:SetVisible(false)
	panel:SetDraggable(false)
	panel.Paint = function ()
		local time = math.Clamp(timeleft - (CurTime() - OldTime), 0, 9999)
		
		
		surface.SetDrawColor(0,0,0, PanelOpacity)
		surface.DrawRect(0, 0, panel:GetWide(), panel:GetTall())

		surface.SetDrawColor(255, 255, 255, 7)
		surface.DrawOutlinedRect(1, 1, panel:GetWide()-2, panel:GetTall()-2)
		
		surface.SetDrawColor(0,100,250)	
		surface.DrawRect(2, 2, time * (panel:GetWide() / timeleft) - 2, 3)
	end
	
	PanelOffSet = PanelOffSet + panel:GetTall() + dist
	
	if Count(VoteVGUI_vote)==0 then panel.now = true end
	VoteVGUI_vote[voteid..'_vote'] = panel	

	local label = vgui.Create("DLabel", panel)
	label:SetPos(6, 12)
	label:SetFont("DarkRPVoteButtonText")
	label:SetText(question)
	label:SizeToContents()
	label:SetVisible(true)

	function panel:Close()
		VoteVGUI_vote[voteid..'_vote'] = nil
		PanelOffSet = PanelOffSet - panel:GetTall() - dist
		
		local num = hifagenda
		
		for k,v in SortedPairs(VoteVGUI_vote) do
			if num == hifagenda then v.now = true end
			v:MoveTo(0, num, 0.2)
			num = num + v:GetTall() + dist
		end

		self:Remove()
	end	

	function panel:Think()
		if timeleft - (CurTime() - OldTime or 0) <= 0 then
			panel:Close()
		end

		if panel.now then
			if input.IsKeyDown(KEY_F1) && not next_keydown then
				LocalPlayer():ConCommand("vote " .. voteid .. " yea\n")	
				panel:Close()
				next_keydown=true
			elseif input.IsKeyDown(KEY_F2) && not next_keydown  then
				LocalPlayer():ConCommand("vote " .. voteid .. " nay\n")
				panel:Close()
				next_keydown=true
			end
			if not input.IsKeyDown(KEY_F1) && not input.IsKeyDown(KEY_F2) then
				next_keydown=false	
			end
		end
	end


	local ybutton = vgui.Create("Button")
	ybutton:SetParent(panel)
	ybutton:SetPos(2, panel:GetTall() - 2 - 15)
	ybutton:SetSize((panel:GetWide() - 4 - 2) / 2, 15)
	ybutton:SetText("")
	ybutton:SetVisible(true)
	ybutton.Paint = function()
		surface.SetDrawColor(0, 200, 0, 150)
		surface.DrawRect(0, 0, ybutton:GetWide(), ybutton:GetTall())
		draw.SimpleText(panel.now and "Да (F1)" or 'Да', "DarkRPVoteButtonText", ybutton:GetWide() / 2, ybutton:GetTall() / 2, Color(255,255,255), 1, 1)
	end
	ybutton.DoClick = function()
		LocalPlayer():ConCommand("vote " .. voteid .. " yea\n")
		panel:Close()
	end

	local nbutton = vgui.Create("Button")
	nbutton:SetParent(panel)
	nbutton:SetPos(2 + ybutton:GetWide() + 2, panel:GetTall() - 2 - 15)
	nbutton:SetSize((panel:GetWide() - 4 - 2) / 2, 15)
	nbutton:SetText("")
	nbutton:SetVisible(true)
	nbutton.Paint = function()
		surface.SetDrawColor(255, 200, 0, 150)
		surface.DrawRect(0, 0, nbutton:GetWide(), nbutton:GetTall())
		draw.SimpleText(panel.now and "Нет (F2)" or 'Нет', "DarkRPVoteButtonText", nbutton:GetWide() / 2, nbutton:GetTall() / 2, Color(255,255,255), 1, 1)
	end
	nbutton.DoClick = function()
		LocalPlayer():ConCommand("vote " .. voteid .. " nay\n")
		panel:Close()
	end
end
net.Receive("DoVote", MsgDoVote)

local function KillVoteVGUI()
	local id = net.ReadFloat()

	if VoteVGUI_vote[id .. "vote"] and VoteVGUI_vote[id .. "vote"]:IsValid() then
		VoteVGUI_vote[id.."vote"]:Close()

	end
end
net.Receive("KillVoteVGUI", KillVoteVGUI)

local function MsgDoQuestion()
	local question = net:ReadString()
	local quesid = net:ReadString()
	local timeleft = net:ReadFloat()
	if timeleft == 0 then
		timeleft = 100
	end
	local OldTime = CurTime()
	LocalPlayer():EmitSound("Town.d1_town_02_elevbell1", 100, 100)
	local panel = vgui.Create("DFrame")
	panel:SetPos(3 + PanelNum, ScrH() / 2 - 50)--Times 140 because if the quesion is the second screen, the first screen is always a vote screen.
	panel:SetSize(300, 140)
	panel:SetSizable(false)
	panel.btnClose:SetVisible(false)
	panel:SetKeyboardInputEnabled(false)
	panel:SetMouseInputEnabled(true)
	panel:SetVisible(true)

	function panel:Close()
		PanelNum = PanelNum - 300
		QuestionVGUI[quesid .. "ques"] = nil
		local num = 0
		for k,v in SortedPairs(VoteVGUI) do
			v:SetPos(num, ScrH() / 2 - 50)
			num = num + 140
		end

		for k,v in SortedPairs(QuestionVGUI) do
			v:SetPos(num, ScrH() / 2 - 50)
			num = num + 300
		end

		self:Remove()
	end

	function panel:Think()
		self:SetTitle(DarkRP.getPhrase("time", math.Clamp(math.ceil(timeleft - (CurTime() - OldTime)), 0, 9999)))
		if timeleft - (CurTime() - OldTime) <= 0 then
			panel:Close()
		end
	end

	local label = vgui.Create("DLabel")
	label:SetParent(panel)
	label:SetPos(5, 10)
	label:SetSize(380, 40)
	label:SetText(DarkRP.deLocalise(question))
	label:SetVisible(true)

	local divider = vgui.Create("Divider")
	divider:SetParent(panel)
	divider:SetPos(2, 80)
	divider:SetSize(380, 2)
	divider:SetVisible(true)

	local ybutton = vgui.Create("DButton")
	ybutton:SetParent(panel)
	ybutton:SetPos(105, 100)
	ybutton:SetSize(40, 20)
	ybutton:SetText(DarkRP.getPhrase("да"))
	ybutton:SetVisible(true)
	ybutton.DoClick = function()
		LocalPlayer():ConCommand("ans " .. quesid .. " 1\n")
		panel:Close()
	end

	local nbutton = vgui.Create("DButton")
	nbutton:SetParent(panel)
	nbutton:SetPos(155, 100)
	nbutton:SetSize(40, 20)
	nbutton:SetText(DarkRP.getPhrase("нет"))
	nbutton:SetVisible(true)
	nbutton.DoClick = function()
		LocalPlayer():ConCommand("ans " .. quesid .. " 2\n")
		panel:Close()
	end

	PanelNum = PanelNum + 300
	QuestionVGUI[quesid .. "ques"] = panel

	panel:SetSkin(GAMEMODE.Config.DarkRPSkin)
end
net.Receive("DoQuestion", MsgDoQuestion)

local function KillQuestionVGUI()
	local id = net.ReadString()

	if QuestionVGUI[id .. "ques"] and QuestionVGUI[id .. "ques"]:IsValid() then
		QuestionVGUI[id .. "ques"]:Close()
	end
end
net.Receive("KillQuestionVGUI", KillQuestionVGUI)

local function DoVoteAnswerQuestion(ply, cmd, args)
	if not args[1] then return end

	local vote = 0
	if tonumber(args[1]) == 1 or string.lower(args[1]) == "yes" or string.lower(args[1]) == "true" then vote = 1 end

	for k,v in pairs(VoteVGUI) do
		if ValidPanel(v) then
			local ID = string.sub(k, 1, -5)
			VoteVGUI[k]:Close()
			RunConsoleCommand("vote", ID, vote)
			return
		end
	end

	for k,v in pairs(QuestionVGUI) do
		if ValidPanel(v) then
			local ID = string.sub(k, 1, -5)
			QuestionVGUI[k]:Close()
			RunConsoleCommand("ans", ID, vote)
			return
		end
	end
end
concommand.Add("rp_vote", DoVoteAnswerQuestion)