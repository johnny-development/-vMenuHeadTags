local serverName = "KRP"

local roleTags = {
    ["owner"] = {text = "Owner", color = {255, 0, 0, 215}}, -- Red
    ["co_owner"] = {text = "Co Owner", color = {255, 69, 0, 215}}, -- Orange-Red
    ["dev_manager"] = {text = "Development Manager", color = {0, 128, 0, 215}}, -- Dark Green
    ["community_manager"] = {text = "Community Manager", color = {0, 0, 255, 215}}, -- Blue
    ["staff_manager"] = {text = "Staff Manager", color = {75, 0, 130, 215}}, -- Indigo
    ["senior_admin"] = {text = "Senior Admin", color = {128, 0, 128, 215}}, -- Purple
    ["admin"] = {text = "Admin", color = {255, 140, 0, 215}}, -- Dark Orange
    ["events_team"] = {text = "Events Team", color = {255, 215, 0, 215}}, -- Gold
    ["developer"] = {text = "Developer", color = {0, 191, 255, 215}}, -- Deep Sky Blue
    ["trial_developer"] = {text = "Trial Developer", color = {70, 130, 180, 215}}, -- Steel Blue
    ["moderator"] = {text = "Moderator", color = {34, 139, 34, 215}}, -- Forest Green
    ["helper"] = {text = "Helper", color = {173, 216, 230, 215}}, -- Light Blue
    ["staff"] = {text = "Staff", color = {0, 100, 0, 215}}, -- Dark Green
    ["streamer"] = {text = "Streamer", color = {255, 20, 147, 215}}, -- Deep Pink
    ["vip"] = {text = "VIP", color = {218, 165, 32, 215}}, -- Goldenrod
    ["platinum_donator"] = {text = "Platinum Donator", color = {192, 192, 192, 215}}, -- Silver
    ["gold_donator"] = {text = "Gold Donator", color = {255, 215, 0, 215}}, -- Gold
    ["silver_donator"] = {text = "Silver Donator", color = {192, 192, 192, 215}}, -- Silver
    ["bronze_donator"] = {text = "Bronze Donator", color = {205, 127, 50, 215}}, -- Bronze
    ["donator"] = {text = "Donator", color = {255, 223, 0, 215}}, -- Yellow
    ["hyper_car_pack"] = {text = "Hyper Car Pack", color = {255, 105, 180, 215}}, -- Hot Pink
    ["electric_car_pack"] = {text = "Electric Car Pack", color = {100, 149, 237, 215}}, -- Cornflower Blue
    ["jdm_car_pack"] = {text = "JDM Car Pack", color = {60, 179, 113, 215}}, -- Medium Sea Green
    ["roleplay_legend"] = {text = "Roleplay Legend", color = {255, 0, 255, 215}}, -- Magenta
    ["lspd"] = {text = "LSPD", color = {0, 0, 139, 215}}, -- Dark Blue
    ["ems"] = {text = "EMS", color = {255, 69, 0, 215}}, -- Orange-Red
    ["detjon"] = {text = "Detjon", color = {0, 128, 128, 215}}, -- Teal
    ["fbi"] = {text = "FBI", color = {0, 0, 0, 215}}, -- Black
    ["los_zetas_cartel"] = {text = "Los Zetas Cartel", color = {139, 69, 19, 215}}, -- Saddle Brown
    ["head_of_lspd"] = {text = "Head of LSPD", color = {0, 191, 255, 215}}, -- Deep Sky Blue
    ["head_of_fbi"] = {text = "Head of FBI", color = {128, 0, 0, 215}}, -- Maroon
    ["head_of_ems"] = {text = "Head of EMS", color = {255, 105, 180, 215}} -- Hot Pink
}

RegisterNetEvent('headtags:updateTag')
AddEventHandler('headtags:updateTag', function(playerId, role)
    print("[DEBUG] Received updateTag event for playerId: " .. tostring(playerId) .. " with role: " .. tostring(role))

    local ped = GetPlayerPed(GetPlayerFromServerId(playerId))
    if not DoesEntityExist(ped) then
        print("[ERROR] Ped for playerId " .. tostring(playerId) .. " does not exist.")
        return
    end

    local roleData = roleTags[role]
    if not roleData then
        print("[ERROR] Role '" .. tostring(role) .. "' is not defined in roleTags.")
        return
    end

    print("[DEBUG] Displaying tag: " .. serverName .. " - " .. roleData.text .. " for playerId: " .. tostring(playerId))

    Citizen.CreateThread(function()
        while true do
            Wait(0)
            if DoesEntityExist(ped) and not IsEntityDead(ped) then
                local x, y, z = table.unpack(GetEntityCoords(ped, true))
                DrawTag(x, y, z + 1.2, serverName, roleData.text, roleData.color)
            else
                print("[DEBUG] Ped for playerId " .. tostring(playerId) .. " is either dead or does not exist.")
                break
            end
        end
    end)
end)

function DrawTag(x, y, z, serverName, tag, color)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if not onScreen then
        return
    end

    -- Draw text
    local text = serverName .. " - " .. tag
    SetTextScale(1.1, 1.1) -- Increased text size
    SetTextFont(4)
    SetTextProportional(1)
    SetTextCentre(true) -- Center align the text
    SetTextColour(color[1], color[2], color[3], color[4]) -- Use role-specific color
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(_x, _y - 0.025) -- Adjust Y offset to center vertically
end


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