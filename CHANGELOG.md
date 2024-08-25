# Ape Escape Poptracker Changlelog

0.2.2

    Layouts -:

	    - [New] Map Tracker (Alternative) :
            - More of a vertical layout that occupy half a screen,so you can put your game/text client on the other half
        - Map Tracker : 
            - Added Total coins and Monkeys into "Map Tracker" layout
            - Changed Settings position to align (or try to) with Totals

    Autotracking -:

	    - Poptracker v0.27 : Implemented AddOnLocationSectionChangedHandler
            - Per Level Monkeys and Coins count tracking
            - Total Monkeys and Coins count tracking
	    - Changed location names for Dimension X coins (Both races)
        - Import settings from slot_data
            - As of the current release of the apeescape.apworld,this is not YET working. 
            - It is a work in progress but I will soon PR to the apworld to include it,
              so the tracker will be able to use it instantly when released

    Items/Locations -:

	    - Made Coins and Monkeys type "non-interractive" in the Layout
            - This change prevents user interaction while still allowing LocationSectionChangedHandler to update the Items int the layout (Per Level AND Totals)
            - Coins/Monkeys are always synced to map locations.
        - Changed World Keys initial quantity to 0
	    - Fixed Wrong coin totals for some levels  (WSW,TT and MM)
	    - Changed Total coins to 60 instead of 40
	    - Corrected wrong images for Monkey Total
	    - Split Dimension X coins into 5 distinct locations to better track them
	    - Fixed Cryptic Relics Monkeys images
	    - Changed fossil_field.json to fossil_fields.json to match real name of the location
	    - Corrected Wabi Sabi Wall and Crumbling Castle "code" not matching the Items in the grid properly
	    - Fixed Stadium Attack and Gladiator Attack access rules (Noew requires respectivly 1 Key and 3 Keys,in addition to existing rules)
	
    Logic -:
        - Dexter's Island: Corrected access rules for Frederick, Baba and Quirck

    Syntax errors & Misc-:
        - Deleted Duplicate statements in levels.json

0.2.1

    Layouts -:
        - Added World Key Consumable that interacts with individual world keys to open levels as a group (needs testing for auto-tracking). Thanks StripesOO7
        - Started work on an items only variant (hopefully be finished next release)

    Logic -:
        - MM Professor now requires correct items
    
    Autotracking -:
        - Enabled Autotracking for Items,Locations and Coins
        - Corrected Item ID's for autotracking
        - Added 60 lines to location_mapping for coins locations and linked them to locations on the map
        - Corrected Monkey names and location names to match map location for tracking: 
            Dr Monk-> Dr. Monk
            BongBong-> Bong-Bong
            Fossil Fields/Fossil Field-> Fossil Fields/Fossil Fields
            VanillaS-> Vanilla S
            Eight 7-> Eighty 7
            Poople-> Poo-Pie

    - Locations -:
            - Changed coin names for their respective name in Archipelago-Ape-Escape pack "String.py"(ex.:Fossil Fields "Specter Coin" is now "Main")
            - Changed location of monkey_madness.json from dim_x folder to a new folder to better fit the map : locations/specter_land/monkey_madness.json
            - Renamed NewFreezeLand/Open Area - Monkey to NewFreezeLand/Hot Springs

    - Fixes -:
            - Made Time Net active by default
            - Changed items.json to remove "allow_disabled": false
Dev version 0.0.2D (0.2.0)

	Features/Bug fixes -:
		- Added settings
		- Made Specter Coins viewable
		- Changed how world keys work. Now a Consumable that toggles specific level keys
