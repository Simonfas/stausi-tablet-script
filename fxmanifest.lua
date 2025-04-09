fx_version 'cerulean'
games {'gta5'}
author 'Simonfas'
description 'Stausi Tablet Script'
version '1.4'
lua54 'yes'
dependency "vrp"

ui_page 'html/index.html'

files {
    'html/index.html'
}

client_scripts {
    'lib/Proxy.lua',
    'lib/Tunnel.lua',
    'client.lua'
}

shared_scripts {
    'config.lua',
    --'@ox_lib/init.lua',
    '@vrp/lib/utils.lua',
}

server_scripts {
    'server.lua',
}
