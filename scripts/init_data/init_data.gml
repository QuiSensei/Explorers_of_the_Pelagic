function init_data() {
    gml_pragma("global", "init_data();");

    global.bestiary = json_decode(@'
        {
            "fish": [
                {
                    "name": "Anglerfish",
                    "sprite": "spr_angler",
                    "scientific_name": "Lophiiformes",
                    "description": "A living flashlight that thrives in the darkness. Its glowing lure is both its charm and its curse."
                },
                {
                    "name": "Saw Shark",
                    "sprite": "spr_sawshark",
                    "scientific_name": "Pristiophoridae",
                    "description": "A carpenter of the ocean with a saw-like snout that really cuts through the competition."
                },
                {
                    "name": "Shark",
                    "sprite": "spr_shark",
                    "scientific_name": "Selachimorpha",
                    "description": "The CEO of the ocean. Silent, efficient, and always circling the next big opportunity."
                },
                {
                    "name": "Bluefire Jellyfish",
                    "sprite": "spr_bluejellyfish",
                    "scientific_name": "Cyanea lamarckii",
                    "description": "The oceans neon sign, drifting lazily but electrifying to behold. Handle with care!"
                },
                {
                    "name": "Pink Jellyfish",
                    "sprite": "spr_pinkjellyfish",
                    "scientific_name": "Pelagia noctiluca",
                    "description": "A bubblegum-colored specter of the sea that dances gracefully but stings fiercely."
                },
                {
                    "name": "Goldfish",
                    "sprite": "spr_nemo",
                    "scientific_name": "Carassius auratus",
                    "description": "A tiny genius with a short attention span. It remembers more than you think, just not for long."
                },
                {
                    "name": "Emperor Tetra",
                    "sprite": "spr_purplefish",
                    "scientific_name": "Nematobrycon palmeri",
                    "description": "A royal presence in freshwater, with a crown of shimmering scales and an air of dignity."
                },
                {
                    "name": "Rosy Tetra",
                    "sprite": "spr_fishpink",
                    "scientific_name": "Hyphessobrycon rosaceus",
                    "description": "A blushing beauty of the river, always dressed to impress in subtle shades of pink."
                },
                {
                    "name": "Dagon",
                    "sprite": "spr_dagon_icon",
                    "scientific_name": "Mythicus abyssalus",
                    "description": "A deep-sea enigma shrouded in mystery. Legends say it is better admired from a distance."
                },
                {
                    "name": "Swordfish",
                    "sprite": "spr_swordfish",
                    "scientific_name": "Xiphias swiftus",
                    "description": "Known for its incredible speed of up to 60 mph, it’s said to outrun even the fastest sea myths. Legends say it’s better admired from a distance, unless you want a quick goodbye!"
                }
            ],
            
            "birds": [
                {
                    "name": "Seagull",
                    "sprite": "spr_seagull",
                    "scientific_name": "Larus",
                    "description": "Essentially a rat with wings. This birds primary food source is human garbage."
                },
                {
                    "name": "Puffin",
                    "sprite": "spr_puffin",
                    "scientific_name": "Fratercula arctica",
                    "description": "Squat of stature and short of beak, but don’t let looks deceive you. Puffins are known to be highly successful publishers of childrens books."
                },
                {
                    "name": "Penguin",
                    "sprite": "spr_penguin",
                    "scientific_name": "Spheniscidae",
                    "description": "While flightless, penguins can achieve extraordinary speeds in the ocean. It’s a bit reckless to swim with your eyes closed, though."
                },
                {
                    "name": "Duck",
                    "sprite": "spr_duck",
                    "scientific_name": "Anatidae",
                    "description": "If it’s not made of rubber, it probably won’t be much help with coding."
                },   
                {
                    "name": "Cute Dragon",
                    "sprite": "spr_cuteDragon",
                    "scientific_name": "Cutesiedaemon",
                    "description": "You may think this one is cute but it is not."
                },
                {
                    "name": "Sun",
                    "sprite": "spr_sun",
                    "scientific_name": "Not a bird",
                    "description": "Umm... Well, it’s in the sky, so I guess you could count this as a bird. If you were nuts."
                }
            ],

            "treasures": [
                {
                    "name": "Gold Crown",
                    "sprite": "spr_goldcrown",
                    "description": "A gleaming crown fit for royalty, lost to the depths of the ocean."
                },
                {
                    "name": "Gold Bars",
                    "sprite": "spr_goldbars",
                    "description": "Solid ingots of pure gold. A pirates dream come true."
                },
                {
                    "name": "Gold Dragon Statue",
                    "sprite": "spr_golddragon",
                    "description": "An intricately carved statue of a dragon, said to bring fortune to those who find it."
                },
                {
                    "name": "Gold Necklace",
                    "sprite": "spr_goldnecklace",
                    "description": "A delicate necklace adorned with gold and gems, once belonging to a sea queen."
                }
            ],

            "achievements": [
                {
                    "name": "Sky High",
                    "description": "Help a penguin fulfill its dreams."
                },
                {
                    "name": "Hot, Hot, Hot",
                    "description": "Grab ahold of the sun."
                },
                {
                    "name": "Gotta Scan Them All",
                    "description": "Examine every species."
                },
                {
                    "name": "Is it a sword or racecar??",
                    "description": "Spotted and examined a Swordfish."
                },
                {
                    "name": "Dream No More",
                    "description": "Disturb a sleeping beast."
                },
                {
                    "name": "Fly Fishing",
                    "description": "Spook a fish out of the water."
                },
                {
                    "name": "Jelly Juggler",
                    "description": "Encounter both the Pink and Bluefire Jellyfish without getting stung."
                },
                {
                    "name": "Shark Whisperer",
                    "description": "Swim alongside a Saw Shark and a regular Shark."
                },
                {
                    "name": "Royal Encounter",
                    "description": "Spot both the Emperor Tetra and Rosy Tetra in a single dive."
                },
                {
                    "name": "Did you see it? Did you really see it?",
                    "description": "Spot a (Cute) Dragon."
                },
                {
                    "name": "Oh! Shinning. Oh! lala",
                    "description": "Ancient treasures from lost city of Atlantis."
                },
                {
                    "name": "What do I do with this?",
                    "description": "Scan all hidden materials and collect them."
                },
                {
                    "name": "Legend Hunter",
                    "description": "Discover Dagon and live to tell the tale."
                }
            ]
        }
    ');

    global.save_filename = "save.sav";
    global.save = load_data();

    global.waterline = 0;
}
