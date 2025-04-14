-- Notify
function noacces()
    lib.notify({
        title = 'Adgang nægtet',
        description = 'Du har ikke adgang til dette.',
        type = 'error'
    })
end

-- Start Emote Kommando/Script
function startemote()
    ExecuteCommand("e tablet2")
end

-- Stop Emote Kommando/Script
function stopemote()
    ExecuteCommand("emotecancel")
end

return {
    noacces = noacces,
    startemote = startemote,
    stopemote = stopemote
}
