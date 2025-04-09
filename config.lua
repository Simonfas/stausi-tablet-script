Config = {}
-- Sæt 2 streger foran dependency "vrp" og '@vrp/lib/utils.lua' i fxmanifest.lua, hvis du bruger ESX eller QBCORE --
Config.framework = "VRP" -- Skift mellem "VRP" eller "ESX" eller "QBCORE"

-- Fjern de 2 streger foran '@ox_lib/init.lua' i fxmanifest.lua, hvis du bruger ox_lib --
Config.oxnotify = false -- Hvis du bruger ox_lib, så sæt denne til true. Ellers lad den være false.

Config.politiurl = "http://localhost/police/pages/login.php" -- Politilogin URL
Config.laegeurl = "http://localhost/ems/pages/login.php" -- Lægelogin URL

-- Kun til VRP --
Config.politimenu = "police" -- Menunavn
Config.laegemenu = "ems" -- Menunavn

Config.politipermission = "police.menu_interaction" -- Jobnavn
Config.laegepermission = "emergency.menu" -- Jobnavn

-- Kun til ESX & QBCORE --
Config.politijob = "police" -- Jobnavn
Config.laegejob = "ambulance" -- Jobnavn

Config.politicommand = "tablet" -- Kommando til at åbne tablet for politijobbet
Config.lagecommand = "emstablet" -- Kommando til at åbne tablet for lægejobbet
