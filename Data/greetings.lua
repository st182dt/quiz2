local _, db = ...
db.allSoundsToMute = {
    --toMute_elf_man
    556579, 556573, 556582, 556589, 556578, 556588, 556576, 556585,
    556584, 556590, 556570, 556556, 556567, 556558, 556562, 556572,
    556560, 556565, 556601, 556592, 556593, 556595, 556599, 556598,
    556600, 556602, 556605, 556608, 556557, 556569, 556559, 556571,
    556564, 556591, 556577, 556587, 556583, 556581, 556574, 556607,
    556594,
    --toMute_elf_woman
    556543, 556550, 556546, 556542, 556551, 556549, 556509, 556518,
    556523, 556514, 556511, 556521, 556507, 556534, 556527, 556538,
    556535, 556537, 556529, 556536, 556516, 556515, 556525, 556533,
    556530, 556526, 556524, 556544, 556540, 556513, 556508, 556520,
    556512, 556510, 556555, 556554, 556553, 556547, 556552,
    --toMute_dryad
    547788, 547796, 547785, 547790,
    --toMute_man
    552196, 552200, 552210, 552197, 552198, 552195, 552204, 552202,
    552218, 552223, 552220, 552214, 552221, 552187, 552190, 552191,
    552188, 552185, 552194, 552211, 552213, 552219, 552229, 552222,
    552199, 552209, 552208, 552205, 552224, 552217, 552228, 552215,
    552175, 552183, 552189, 552180, 552179, 552176, 552182, 552177,
    --toMute_woman
    552153, 552155, 552160, 552151, 552149, 552162, 552133, 552141,
    552137, 552142, 552144, 552146, 552131, 552135, 552136, 552140,
    552118, 552120, 552126, 552114, 552121, 552130, 552138, 552145,
    552132, 552158, 552161, 552147, 552154, 552159, 552163, 552150,
    552152, 552148, 552117, 552122, 552115, 552127, 552112, 552124,
    552119, 552129, 552128, 552125,
    --toMute_tauren_man
    561550, 561534, 561548, 561539, 561542, 561545, 561553, 561549,
    561558, 561570, 561560, 561562, 561554, 561559, 561561, 561577,
    561587, 561581, 561582, 561571, 561543, 561540, 561551, 561547,
    561537, 561546, 561556, 561555, 561564, 561565, 561568, 561586,
    561585, 561573, 561572, 561583, 561579, 561578, 561576,
    --toMute_tauren_woman
    561528, 561520, 561530, 561529, 561523, 561521, 561533, 561526,
    561525, 561497, 561487, 561491, 561489, 561494, 561495, 561500,
    561486, 561499, 561493, 561502, 561498, 561496, 561516, 561514,
    561512, 561513, 561510, 561511, 561518, 561517, 561507, 561508,
    561509, 561524, 561531
}
db.npc_groups_config = {
    elf_man_1 = {
        names = {
            ["Barithras Moonshade"] = true,
            ["Terenthis"] = true,
            ["Dendrite Starblaze"] = true,
            ["Dazalar"] = true,
            ["Iverron"] = true,
            ["Erion Shadewhisper"] = true,
            ["Gilshalan Windwalker"] = true,
            ["Denalan"] = true,
            ["Arch Druid Fandral Staghelm"] = true
        },
        greeting = "elf_man_1_greeting_", farewell = "elf_man_1_farewell_"
    },
    elf_man_2 = {
        names = {
            ["Thundris Windweaver"] = true,
            ["Volcor"] = true,
            ["Zenn Foulhoof"] = true,
            ["Vesprystus"] = true,
            ["Zarrin"] = true,
            ["Oben Rageclaw"] = true,
            ["Conservator Ilthalaine"] = true,
            ["Tenaron Stormgrip"] = true,
            ["Erelas Ambersky"] = true
        },
        greeting = "elf_man_2_greeting_", farewell = "elf_man_2_farewell_"
    },
    elf_man_3 = {
        names = {
            ["Asterion"] = true,
            ["Gershala Nightwhisper"] = true,
            ["Laird"] = true,
            ["Wynd Nightchaser"] = true,
            ["Troyas Moonbreeze"] = true,
            ["Melithar Staghelm"] = true,
            ["Rellian Greenspyre"] = true,
            ["Porthannius"] = true
        },
        greeting = "elf_man_3_greeting_", farewell = "elf_man_3_farewell_"
    },
    elf_man_4 = {
        names = {
            ["Cerellean Whiteclaw"] = true,
            ["Tharnariun Treetender"] = true,
            ["Keeper Remulos"] = true,
            ["Kal"] = true,
            ["Frahun Shadewhisper"] = true,
            ["Athridas Bearmantle"] = true,
            ["Corithras Moonrage"] = true,
            ["Innkeeper Keldamyr"] = true
        },
        greeting = "elf_man_4_greeting_", farewell = "elf_man_4_farewell_"
    },
    elf_man_5 = {
        names = {
            ["Balthule Shadowstrike"] = true,
            ["Kerlonian Evershade"] = true,
            ["Mathrengyl Bearwalker"] = true,
            ["Gaerolas Talvethren"] = true,
            ["Tallonkai Swiftroot"] = true,
            ["Jannok Breezesong"] = true,
            ["Mardant Strongoak"] = true
        },
        greeting = "elf_man_5_greeting_", farewell = "elf_man_5_farewell_"
    },
    woman_5 = {
        names = {
            ["Sentinel Glynda Nal'Shea"] = true,
            ["Moon Priestess Amara"] = true,
            ["Priestess Alathea"] = true,
            ["High Priestess Laurena"] = true
        },
        greeting = "woman_5_greeting_", farewell = "woman_5_farewell_"
    },
    elf_woman_1 = {
        names = {
            ["Sentinel Tysha Moonblade"] = true,
            ["Sentinel Onaeya"] = true,
            ["Sentinel Arynia Cloudsbreak"] = true,
            ["Daryn Lightwind"] = true,
            ["Dirania Silvershine"] = true
        },
        greeting = "elf_woman_1_greeting_", farewell = "elf_woman_1_farewell_"
    },
    elf_woman_2 = {
        names = {
            ["Sentinel Elissa Starbreeze"] = true,
            ["Ranshalla"] = true,
            ["Alyissia"] = true,
            ["Laurna Morninglight"] = true
        },
        greeting = "elf_woman_2_greeting_", farewell = "elf_woman_2_farewell_"
    },
    elf_woman_3 = {
        names = {
            ["Sentinel Selarin"] = true,
            ["Jocaste"] = true,
            ["Ayanna Everstride"] = true,
            ["Syral Bladeleaf"] = true
        },
        greeting = "elf_woman_3_greeting_", farewell = "elf_woman_3_farewell_"
    },
    elf_woman_4 = {
        names = {
            ["Raene Wolfrunner"] = true,
            ["Syurna"] = true,
            ["Shanda"] = true,
            ["Nessa Shadowsong"] = true,
            ["Tarindrella"] = true
        },
        greeting = "elf_woman_4_greeting_", farewell = "elf_woman_4_farewell_"
    },
    woman_1 = {
        names = {
            ["Daphne Stilwell"] = true,
            ["Salma Saldean"] = true,
            ["Priestess Anetta"] = true,
            ["Auntie Bernice Stonefield"] = true,
            ["Keryn Sylvius"] = true
        },
        greeting = "woman_1_greeting_", farewell = "woman_1_farewell_"
    },
    woman_2 = {
        names = {
            ["Agent Kearnen"] = true,
            ["Verna Furlbrow"] = true,
            ["Priestess Josetta"] = true,
            ["Drusilla La Salle"] = true,
            ["Ma Stonefield"] = true
        },
        greeting = "woman_2_greeting_", farewell = "woman_2_farewell_"
    },
    woman_3 = {
        names = {
            ["Curgle Cranklehop"] = true,
            ["Innkeeper Allison"] = true,
            ["Scout Riell"] = true,
            ["Sara Timberlain"] = true,
            ["Supervisor Raelen"] = true,
            ["Jennea Cannon"] = true
        },
        greeting = "woman_3_greeting_", farewell = "woman_3_farewell_"
    },
    woman_4 = {
        names = {
            ["Aelthalyste"] = true
        },
        greeting = "woman_4_greeting_", farewell = "woman_4_farewell_"
    },
    man_1 = {
        names = {
            ["Osric Strang"] = true,
            ["Duthorian Rall"] = true,
            ["Innkeeper Farley"] = true,
            ["Brother Kristoff"] = true,
            ["Theocritus"] = true,
            ["Tavernkeep Smitts"] = true,
            ["Zaldimar Wefhellt"] = true,
            ["Remen Marcot"] = true
        },
        greeting = "man_1_greeting_", farewell = "man_1_farewell_"
    },
    man_2 = {
        names = {
            ["Quartermaster Lewis"] = true,
            ["Smith Argus"] = true,
            ["Caretaker Folsom"] = true,
            ["Brother Paxton"] = true,
            ["Marshal McBride"] = true,
            ["Llane Beshere"] = true,
            ["Reginald Windsor"] = true,
            ["Remy \"Two Times\""] = true,
            ["Morgan Pestle"] = true
        },
        greeting = "man_2_greeting_", farewell = "man_2_farewell_"
    },
    man_3 = {
        names = {
            ["Wiley the Black"] = true,
            ["Brother Wilhelm"] = true,
            ["Jorik Kerridan"] = true,
            ["Highlord Bolvar Fordragon"] = true,
            ["Master Mathias Shaw"] = true,
            ["William Pestle"] = true
        },
        greeting = "man_3_greeting_", farewell = "man_3_farewell_"
    },
    man_4 = {
        names = {
            ["Great-father Winter"] = true,
            ["Yaw Sharpmane"] = true,
            ["Captain Grayson"] = true,
            ["Verner Osgood"] = true,
            ["Foreman Oslow"] = true,
            ["Khelden Bremen"] = true,
            ["Guard Thomas"] = true,
            ["Marshal Haggard"] = true,
            ["Gakin the Darkbinder"] = true
        },
        greeting = "man_4_greeting_", farewell = "man_4_farewell_"
    },
    man_5 = {
        names = {
            ["Delgren the Purifier"] = true,
            ["Apothecary Lydon"] = true,
            ["Farmer Saldean"] = true,
            ["The Defias Traitor"] = true
        },
        greeting = "man_5_greeting_", farewell = "man_5_farewell_"
    },
    man_6 = {
        names = {
            ["Scout Galiaan"] = true,
            ["Gryan Stoutmantle"] = true,
            ["Farmer Furlbrow"] = true
        },
        greeting = "man_6_greeting_", farewell = "man_6_farewell_"
    },
    man_7 = {
        names = {
            ["Clerk Daltry"] = true,
            ["Thor"] = true,
            ["Magistrate Solomon"] = true,
            ["Captain Danuvin"] = true
        },
        greeting = "man_7_greeting_", farewell = "man_7_farewell_"
    },
    tauren_man_1 = {
        names = {
            ["Ruul Eagletalon"] = true,
            ["Chief Hawkwind"] = true,
            ["Seer Wiserunner"] = true,
            ["Melor Stonehoof"] = true,
            ["Lanka Farshot"] = true
        },
        greeting = "tauren_man_1_greeting_", farewell = "tauren_man_1_farewell_"
    },
    tauren_man_2 = {
        names = {
            ["Grull Hawkwind"] = true,
            ["Seer Graytongue"] = true,
            ["Ancestral Spirit"] = true,
            ["Innkeeper Kauth"] = true,
            ["Turak Runetotem"] = true
        },
        greeting = "tauren_man_2_greeting_", farewell = "tauren_man_2_farewell_"
    },
    tauren_man_3 = {
        names = {
            ["Mull Thunderhorn"] = true,
            ["Harken Windtotem"] = true,
            ["Cairne Bloodhoof"] = true,
            ["Narm Skychaser"] = true,
            ["Holt Thunderhorn"] = true
        },
        greeting = "tauren_man_3_greeting_", farewell = "tauren_man_3_farewell_"
    },
    tauren_man_4 = {
        names = {
            ["Morin Cloudstalker"] = true,
            ["Maur Raincaller"] = true,
            ["Lorekeeper Raintotem"] = true,
            ["Harutt Thunderhorn"] = true
        },
        greeting = "tauren_man_4_greeting_", farewell = "tauren_man_4_farewell_"
    },
    tauren_man_5 = {
        names = {
            ["Baine Bloodhoof"] = true,
            ["Zarlman Two-Moons"] = true,
            ["Skorn Whitecloud"] = true,
            ["Gart Mistrunner"] = true
        },
        greeting = "tauren_man_5_greeting_", farewell = "tauren_man_5_farewell_"
    },
    tauren_woman_1 = {
        names = {
            ["Antur Fallow"] = true
        },
        greeting = "tauren_woman_1_greeting_", farewell = "tauren_woman_1_farewell_"
    },
    tauren_woman_2 = {
        names = {
            ["Greatmother Hawkwind"] = true
        },
        greeting = "tauren_woman_2_greeting_", farewell = "tauren_woman_2_farewell_"
    },
    tauren_woman_3 = {
        names = {
            ["Meela Dawnstrider"] = true
        },
        greeting = "tauren_woman_3_greeting_", farewell = "tauren_woman_3_farewell_"
    },
    tauren_woman_4 = {
        names = {
            ["Brave Windfeather"] = true
        },
        greeting = "tauren_woman_4_greeting_", farewell = "tauren_woman_4_farewell_"
    },
    tauren_woman_5 = {
        names = {
            ["Gennia Runetotem"] = true
        },
        greeting = "tauren_woman_5_greeting_", farewell = "tauren_woman_5_farewell_"
    }
}