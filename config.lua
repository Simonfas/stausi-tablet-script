Config = {}

Config.framework = "VRP" -- Skift mellem ["VRP" eller "ESX" eller "QBCORE"]

-- Sæt de 2 streger foran '@ox_lib/init.lua' i fxmanifest.lua, hvis du IKKE bruger ox_lib --
Config.notify = "OX" -- ["OX", "VRP", "ESX", "QBCORE", "CUSTOM"] 

Config.politiurl = "http://localhost/police/pages/login.php" -- Politilogin URL
Config.laegeurl = "http://localhost/ems/pages/login.php" -- Lægelogin URL

Config.politilogo = "https://r2.fivemanage.com/LnnGKczEFgpRxvxjLg5xS/dansk-politi.png" -- Politilogo URL
Config.laegelogo = "https://r2.fivemanage.com/LnnGKczEFgpRxvxjLg5xS/image_2025-04-10_000605678.png" -- Lægelogo URL

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
