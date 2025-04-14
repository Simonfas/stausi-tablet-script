local nuiOpen = false
local Custom = require('custom')

Citizen.CreateThread(function()
    if Config.framework == "ESX" then
        ESX = nil
        while ESX == nil do
            ESX = exports['es_extended']:getSharedObject()
            Citizen.Wait(0)
        end
        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end
        PlayerData = ESX.GetPlayerData()
    elseif Config.framework == "QBCORE" then
        QBCore = exports['qb-core']:GetCoreObject()
        while not QBCore.Functions.GetPlayerData().job do
            Citizen.Wait(100)
        end
        PlayerData = QBCore.Functions.GetPlayerData()
    end
end)

if Config.emotescript == "RPEMOTES" then
    function PlayTabletEmote()
        ExecuteCommand("e tablet2")
    end
    
    function StopTabletEmote()
        ExecuteCommand("emotecancel")
    end

elseif Config.emotescript == "QBCORE" then
    function PlayTabletEmote()
        TriggerEvent("animations:client:EmoteCommandStart", {"tablet2"})
    end
    
    function StopTabletEmote()
        TriggerEvent("animations:client:EmoteCommandStart", {"c"})
    end

elseif Config.emotescript == "DPEMOTES" then
    function PlayTabletEmote()
        ExecuteCommand("e tablet2")
    end
    
    function StopTabletEmote()
        ExecuteCommand("e c")
    end

elseif Config.emotescript == "CUSTOM" then
    function PlayTabletEmote()
        Custom.startemote()
    end
    
    function StopTabletEmote()
        Custom.stopemote()
    end
end

RegisterCommand(Config.politicommand, function()
    if PlayerData.job and PlayerData.job.name == Config.politijob then
        PlayTabletEmote()
        SendNUIMessage({ action = "show", url = Config.politiurl })
        SetNuiFocus(true, true)
        nuiOpen = true
        SendNUIMessage({ action = "updateLogos", logoUrl = Config.politilogo, selector = "img[src*='logo_stort.png']"})
    else
        if Config.notify == "OX" then
            lib.notify({
                title = 'Adgang nægtet',
                description = 'Du har ikke adgang til dette.',
                type = 'error'
            })
        elseif Config.notify == "ESX" then
            ESX.ShowNotification('~r~Du har ikke adgang til dette.')
        elseif Config.notify == "VRP" then
            TriggerEvent("pNotify:SendNotification", {
                text = "Du har ikke adgang til dette.",
                type = "error",
                timeout = 3000,
                layout = "centerLeft"
            })
        elseif Config.notify == "QBCORE" then
            QBCore.Functions.Notify("Du har ikke adgang til dette.", "error")
        elseif Config.notify == "CUSTOM" then
            Custom.noacces()            
        end
    end
end)

RegisterCommand(Config.lagecommand, function()
    if PlayerData.job and PlayerData.job.name == Config.laegejob then
        PlayTabletEmote()
        SendNUIMessage({ action = "show", url = Config.laegeurl })
        SetNuiFocus(true, true)
        nuiOpen = true
        SendNUIMessage({ action = "updateLogos", logoUrl = Config.laegelogo, selector = "img[src*='logo_stort.png']"})
    else
        if Config.notify == "OX" then
            lib.notify({
                title = 'Adgang nægtet',
                description = 'Du har ikke adgang til dette.',
                type = 'error'
            })
        elseif Config.notify == "ESX" then
            ESX.ShowNotification('~r~Du har ikke adgang til dette.')
        elseif Config.notify == "VRP" then
            TriggerEvent("pNotify:SendNotification", {
                text = "Du har ikke adgang til dette.",
                type = "error",
                timeout = 3000,
                layout = "centerLeft"
            })
        elseif Config.notify == "QBCORE" then
            QBCore.Functions.Notify("Du har ikke adgang til dette.", "error")
        elseif Config.notify == "CUSTOM" then
            Custom.noacces()            
        end
    end
end)

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "hide" })
    nuiOpen = false
    if Config.framework == "ESX" then
        StopTabletEmote()
    end
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)
  
RegisterNetEvent('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

if Config.framework == "VRP" then
    RegisterNetEvent("tablet:open")
    AddEventHandler("tablet:open", function()
        SendNUIMessage({ action = "show", url = Config.politiurl })
        SetNuiFocus(true, true)
        nuiOpen = true
    end)

    RegisterNetEvent("tablet:emsopen")
    AddEventHandler("tablet:emsopen", function()
        SendNUIMessage({ action = "show", url = Config.laegeurl })
        SetNuiFocus(true, true)
        nuiOpen = true
    end)
end
