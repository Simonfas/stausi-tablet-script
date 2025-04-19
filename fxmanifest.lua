fx_version 'cerulean'
games {'gta5'}
author 'Simonfas'
description 'Stausi Tablet Script'
version '2.4'
lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/bootstrap.min.css'
}

client_scripts {
    'custom.lua',
    'lib/Proxy.lua',
    'lib/Tunnel.lua',
    'client.lua'
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
    '@vrp/lib/utils.lua',
}

server_scripts {
    'server.lua',
}
