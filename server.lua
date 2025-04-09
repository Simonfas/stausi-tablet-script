if Config.framework == "VRP" then
    local Tunnel = module("vrp", "lib/Tunnel")
    local Proxy = module("vrp", "lib/Proxy")
    
    vRP = Proxy.getInterface("vRP")
    
    vRP.registerMenuBuilder({Config.politimenu, function(add, data)
        local user_id = vRP.getUserId({data.player})
        if user_id ~= nil and vRP.hasPermission({user_id, Config.politipermission}) then
            local submenu = {}
    
            submenu["Åben Tablet"] = {
                function(player, choice)
                    TriggerClientEvent("tablet:open", player)
                end,
                "Åben politiets tablet."
            }
    
            add(submenu)
        end
    end}) 

    vRP.registerMenuBuilder({Config.laegemenu, function(add, data)
        local user_id = vRP.getUserId({data.player})
        if user_id ~= nil and vRP.hasPermission({user_id, Config.laegepermission}) then
            local submenu = {}
    
            submenu["Åben Tablet"] = {
                function(player, choice)
                    TriggerClientEvent("tablet:emsopen", player)
                end,
                "Åben lægernes tablet."
            }
    
            add(submenu)
        end
    end}) 
end
