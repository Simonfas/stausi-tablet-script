function noacces()
    lib.notify({
        title = 'Adgang nægtet',
        description = 'Du har ikke adgang til dette.',
        type = 'error'
    })
end

return {
    noacces = noacces
}
