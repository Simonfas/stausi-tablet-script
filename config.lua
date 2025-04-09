Config = {}
-- Sæt 2 streger foran dependency "vrp" og '@vrp/lib/utils.lua' i fxmanifest.lua, hvis du bruger ESX --
Config.framework = "VRP" -- Skift mellem "VRP" eller "ESX"

-- Fjern de 2 streger foran '@ox_lib/init.lua' i fxmanifest.lua, hvis du bruger ox_lib --
Config.oxnotify = false -- Hvis du bruger ox_lib, så sæt denne til true. Ellers lad den være false.

Config.politiurl = "http://localhost/police/pages/login.php" -- Politilogin URL
Config.laegeurl = "http://localhost/ems/pages/login.php" -- Lægelogin URL

-- Kun til VRP --
Config.politimenu = "police" -- Jobnavn
Config.laegemenu = "ems" -- Jobnavn

Config.politipermission = "police.menu_interaction" -- Jobnavn
Config.laegepermission = "emergency.menu" -- Jobnavn

-- Kun til ESX --
Config.politijob = "police" -- Jobnavn
Config.laegejob = "ambulance" -- Jobnavn

Config.politicommand = "tablet" -- Kommando til at åbne tablet for politijobbet
Config.lagecommand = "emstablet" -- Kommando til at åbne tablet for lægejobbet
