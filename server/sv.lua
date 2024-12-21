local ESX = exports["es_extended"]:getSharedObject()

local function SendToDiscord(playerName, playerIP, playerIdentifier)
    local webhookURL = 'INSERT HERE'

    local message = {
        {
            ["color"] = 15158332,
            ["title"] = "Nouveau Joueur Connecté",
            ["fields"] = {
                {
                    ["name"] = "Nom",
                    ["value"] = playerName or "Inconnu",
                    ["inline"] = true
                },
                {
                    ["name"] = "Identifiant",
                    ["value"] = playerIdentifier or "Inconnu",
                    ["inline"] = true
                },
                {
                    ["name"] = "IP",
                    ["value"] = playerIP or "Inconnu",
                    ["inline"] = true
                }
            }
        }
    }

    PerformHttpRequest(webhookURL, function(err, text, headers)
        if err ~= 200 then
            print("Erreur d'envoi au webhook Discord :", err)
        end
    end, 'POST', json.encode({username = "FiveM Logger", embeds = message}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerId)
    local src = playerId
    local playerIP = GetPlayerEndpoint(src) 
    local playerIdentifiers = GetPlayerIdentifiers(src)
    local playerIdentifier = playerIdentifiers[1]
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        local playerName = xPlayer.getName()
        print("Joueur connecté :", playerName, playerIP, playerIdentifier)
        SendToDiscord(playerName, playerIP, playerIdentifier)
    else
        print("Erreur : xPlayer introuvable pour le joueur source :", src)
    end
end)
