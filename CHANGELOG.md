# Ape Escape Poptracker Changlelog

0.2.1

    - Layouts -:
    
        - Added World Key Consumable that interacts with individual world keys to open levels as a group (needs testing for auto-tracking). Thanks StripesOO7

        - Started work on an items only variant (hopefully be finished next release)

    - Logic -:

        - MM Professor now requires correct items
    
    - Autotracking -:

        - Enabled Autotracking for Items,Locations and Coins

        - Corrected Item ID's for autotracking

        - Added 60 lines to location_mapping for coins 
            locations and linked them to locations on the map

        - Corrected Monkey names and location names to match map location for tracking: 
            Dr Monk-> Dr. Monk
            BongBong-> Bong-Bong
            Fossil Fields/Fossil Field-> Fossil Fields/Fossil Fields
            VanillaS-> Vanilla S
            Eight 7-> Eighty 7
            Poople-> Poo-Pie

    - Locations - :
            - Changed coin names for their respective name in Archipelago-Ape-Escape pack "String.py"(ex.:Fossil Fields "Specter Coin" is now "Main") 

            - Changed location of monkey_madness.json from dim_x folder to a new folder to better fit the map : locations/specter_land/monkey_madness.json

            - Renamed NewFreezeLand/Open Area - Monkey to NewFreezeLand/Hot Springs

    - Fixes - :
            - Made Time Net active by default
            - Changed items.json to remove "allow_disabled": false

    - TODO - :
            - Add Dimension_X maps (Stadium Attack and Gladiator Attack) to track if you did the race,since locations are mapped for coins but not used

            - Calculate Coins and Monkeys per Level in the grid

            - Alternate layout option to separate Coins from Monkeys on the map
