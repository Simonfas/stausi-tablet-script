local nuiOpen = false
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports['es_extended']:getSharedObject()
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
end)

function PlayTabletEmote()
    ExecuteCommand("e tablet2")
end

function StopTabletEmote()
    ExecuteCommand("emotecancel")
end

RegisterCommand(Config.politicommand, function()
    if PlayerData.job and PlayerData.job.name == Config.politijob then
        PlayTabletEmote()
        SendNUIMessage({ action = "show", url = "http://localhost/police/pages/login.php" })
        SetNuiFocus(true, true)
        nuiOpen = true
    else
        if Config.oxnotify then
            lib.notify({
                title = 'Adgang nægtet',
                description = 'Du har ikke adgang til dette.',
                type = 'error'
            })
        else
            ESX.ShowNotification('~r~Du har ikke adgang til dette.')
        end
    end
end)

RegisterCommand(Config.lagecommand, function()
    if PlayerData.job and PlayerData.job.name == Config.laegejob then
        PlayTabletEmote()
        SendNUIMessage({ action = "show", url = "http://localhost/ems/pages/login.php" })
        SetNuiFocus(true, true)
        nuiOpen = true
    else
        if Config.oxnotify == true then
            lib.notify({
                title = 'Adgang nægtet',
                description = 'Du har ikke adgang til dette.',
                type = 'error'
            })
        else
            ESX.ShowNotification('~r~Du har ikke adgang til dette.')
        end
    end
end)

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "hide" })
    nuiOpen = false
    StopTabletEmote()
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)
  
RegisterNetEvent('esx:setJob', function(job)
    PlayerData.job = job
end)
