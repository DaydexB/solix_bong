fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'solix'

description 'Simple Bong Script that allows you to target any bong on the map to smoke'

shared_scripts {
    'Config.lua',
    '@es_extended/imports.lua'
}

client_scripts {
    'client.lua',
}
server_script 'server.lua'

