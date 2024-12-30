local roleTags = {
    ["owner"] = "Owner",
    ["co_owner"] = "Co Owner",
    ["dev_manager"] = "Development Manager",
    ["community_manager"] = "Community Manager",
    ["staff_manager"] = "Staff Manager",
    ["senior_admin"] = "Senior Admin",
    ["admin"] = "Admin",
    ["events_team"] = "Events Team",
    ["developer"] = "Developer",
    ["trial_developer"] = "Trial Developer",
    ["moderator"] = "Moderator",
    ["helper"] = "Helper",
    ["staff"] = "Staff",
    ["streamer"] = "Streamer",
    ["vip"] = "VIP",
    ["platinum_donator"] = "Platinum Donator",
    ["gold_donator"] = "Gold Donator",
    ["silver_donator"] = "Silver Donator",
    ["bronze_donator"] = "Bronze Donator",
    ["donator"] = "Donator",
    ["hyper_car_pack"] = "Hyper Car Pack",
    ["electric_car_pack"] = "Electric Car Pack",
    ["jdm_car_pack"] = "JDM Car Pack",
    ["roleplay_legend"] = "Roleplay Legend",
    ["lspd"] = "LSPD",
    ["ems"] = "EMS",
    ["detjon"] = "Detjon",
    ["fbi"] = "FBI",
    ["los_zetas_cartel"] = "Los Zetas Cartel",
    ["head_of_lspd"] = "Head of LSPD",
    ["head_of_fbi"] = "Head of FBI",
    ["head_of_ems"] = "Head of EMS"
}


RegisterCommand('setrole', function(source, args, rawCommand)
    local src = source
    if IsPlayerAceAllowed(src, "command.setrole") then
        local targetId = tonumber(args[1])
        local role = args[2]

        -- Validate input
        if not targetId or not role then
            TriggerClientEvent('chat:addMessage', src, {
                args = {"System", "Usage: /setrole <playerId> <role>"},
                color = {255, 0, 0}
            })
            print("[ERROR] Invalid usage of /setrole. TargetId or role is missing.")
            return
        end

        -- Check if the role exists
        if not roleTags[role] then
            TriggerClientEvent('chat:addMessage', src, {
                args = {"System", "Invalid role. Please check the role name and try again."},
                color = {255, 0, 0}
            })
            print("[ERROR] Invalid role '" .. role .. "' specified.")
            return
        end

        -- Assign the role
        TriggerClientEvent('headtags:updateTag', targetId, targetId, role)
        TriggerClientEvent('chat:addMessage', src, {
            args = {"System", "Role '" .. roleTags[role] .. "' assigned to player ID " .. targetId .. "."},
            color = {0, 255, 0}
        })

        print("[DEBUG] Role '" .. role .. "' assigned to player ID: " .. targetId)
        print("[DEBUG] Triggering 'headtags:updateTag' for player ID: " .. targetId .. " with role: " .. role)
    else
        TriggerClientEvent('chat:addMessage', src, {
            args = {"System", "You do not have permission to use this command."},
            color = {255, 0, 0}
        })
        print("[ERROR] Player " .. tostring(src) .. " tried to use /setrole without permission.")
    end
end, false)


-- ██████╗ ██╗███╗   ██╗ ██████╗  ██████╗ 
--██╔══██╗██║████╗  ██║██╔════╝ ██╔═══██╗
--██║  ██║██║██╔██╗ ██║██║  ███╗██║   ██║
--██║  ██║██║██║╚██╗██║██║   ██║██║   ██║
--██████╔╝██║██║ ╚████║╚██████╔╝╚██████╔╝
--╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ 
-- ██████╗ ███████╗██╗   ██╗███████╗██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗
-- ██╔══██╗██╔════╝██║   ██║██╔════╝██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
-- ██║  ██║█████╗  ██║   ██║█████╗  ██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║   
-- ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   
-- ██████╔╝███████╗ ╚████╔╝ ███████╗██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   
-- ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   
