--[[---------------------------------------------------------
Talking
 ---------------------------------------------------------]]
local function PM(ply, args)
    local namepos = string.find(args, " ")
    if not namepos then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
        return ""
    end

    local name = string.sub(args, 1, namepos - 1)
    local msg = string.sub(args, namepos + 1)

    if msg == "" then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
        return ""
    end

    local target = DarkRP.findPlayer(name)
    if target == ply then return "" end

    if target then
        local col = team.GetColor(ply:Team())
        local pname = ply:Nick()
        local col2 = Color(255, 255, 255, 255)
        DarkRP.talkToPerson(target, col, "(PM) " .. pname, col2, msg, ply)
        DarkRP.talkToPerson(ply, col, "(PM) " .. pname, col2, msg, ply)
    else
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("could_not_find", tostring(name)))
    end

    return ""
end
DarkRP.defineChatCommand("pm", PM, 1.5)

local function Whisper(ply, args)
    local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
            return ""
        end
        DarkRP.talkToRange(ply, "(" .. DarkRP.getPhrase("whisper") .. ") " .. ply:Nick(), text, GAMEMODE.Config.whisperDistance)
    end
    return args, DoSay
end
DarkRP.defineChatCommand("w", Whisper, 1.5)

local function Yell(ply, args)
    local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
            return ""
        end
        DarkRP.talkToRange(ply, "(" .. DarkRP.getPhrase("yell") .. ") " .. ply:Nick(), text, GAMEMODE.Config.yellDistance)
    end
    return args, DoSay
end
DarkRP.defineChatCommand("y", Yell, 1.5)

local function Me(ply, args)
    if args == "" then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
        return ""
    end

    local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
            return ""
        end
        if GAMEMODE.Config.alltalk then
            local col = team.GetColor(ply:Team())
            local name = ply:Nick()
            for _, target in ipairs(player.GetAll()) do
                DarkRP.talkToPerson(target, col, name .. " " .. text)
            end
        else
            DarkRP.talkToRange(ply, ply:Nick() .. " " .. text, "", GAMEMODE.Config.meDistance)
        end
    end
    return args, DoSay
end
DarkRP.defineChatCommand("me", Me, 1.5)

local function OOC(ply, args)
    if not GAMEMODE.Config.ooc then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("disabled", DarkRP.getPhrase("ooc"), ""))
        return ""
    end

    local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
            return ""
        end
        local col = team.GetColor(ply:Team())
        local col2 = Color(255, 255, 255, 255)
        if not ply:Alive() then
            col2 = Color(255, 200, 200, 255)
            col = col2
        end

        local phrase = DarkRP.getPhrase("ooc")
        local name = ply:Nick()
        for _, v in ipairs(player.GetAll()) do
            DarkRP.talkToPerson(v, col, "(" .. phrase .. ") " .. name, col2, text, ply)
        end
    end
    return args, DoSay
end
DarkRP.defineChatCommand("/", OOC, true, 1.5)
DarkRP.defineChatCommand("a", OOC, true, 1.5)
DarkRP.defineChatCommand("ooc", OOC, true, 1.5)

local function MayorBroadcast(ply, args)
    if args == "" then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
        return ""
    end
    local Team = ply:Team()
    if not RPExtraTeams[Team] or not RPExtraTeams[Team].mayor then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("incorrect_job", DarkRP.getPhrase("broadcast")))
        return ""
    end
    local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
            return
        end

        local col = team.GetColor(ply:Team())
        local col2 = Color(170, 0, 0, 255)
        local phrase = DarkRP.getPhrase("broadcast")
        local name = ply:Nick()
        for _, v in ipairs(player.GetAll()) do
            DarkRP.talkToPerson(v, col, phrase .. " " .. name, col2, text, ply)
        end
    end
    return args, DoSay
end
DarkRP.defineChatCommand("broadcast", MayorBroadcast, 1.5)

local function SetRadioChannel(ply,args)
    if tonumber(args) == nil or tonumber(args) < 0 or tonumber(args) > 100 then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), "0<" .. DarkRP.getPhrase("channel") .. "<100"))
        return ""
    end
    DarkRP.notify(ply, 2, 4, DarkRP.getPhrase("channel_set_to_x", args))
    ply.RadioChannel = tonumber(args)
    return ""
end
DarkRP.defineChatCommand("channel", SetRadioChannel)

local function SayThroughRadio(ply,args)
    if not ply.RadioChannel then ply.RadioChannel = 1 end
    local radioChannel = ply.RadioChannel
    if not args or args == "" then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
        return ""
    end
    local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
            return
        end
        local col = Color(180, 180, 180, 255)
        local phrase = DarkRP.getPhrase("radio_x", radioChannel)
        for _, v in ipairs(player.GetAll()) do
            if v.RadioChannel == radioChannel then
                DarkRP.talkToPerson(v, col, phrase, col, text, ply)
            end
        end
    end
    return args, DoSay
end
DarkRP.defineChatCommand("radio", SayThroughRadio, 1.5)

local function GroupMsg(ply, args)
    local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
            return
        end

        local col = team.GetColor(ply:Team())

        local groupChats = {}
        for _, func in pairs(GAMEMODE.DarkRPGroupChats) do
            -- not the group of the player
            if not func(ply) then continue end

            table.insert(groupChats, func)
        end

        if table.IsEmpty(groupChats) then return "" end

        local phrase = DarkRP.getPhrase("group")
        local name = ply:Nick()
        local color = Color(255, 255, 255, 255)
        for _, target in ipairs(player.GetAll()) do
            -- The target is in any of the group chats
            for _, func in ipairs(groupChats) do
                if not func(target, ply) then continue end

                DarkRP.talkToPerson(target, col, phrase .. " " .. name, color, text, ply)
                break
            end
        end
    end
    return args, DoSay
end
DarkRP.defineChatCommand("g", GroupMsg, 0)

