# Ape-Escape-Tracker

Tracker for Ape Escape, for use with AP

Tracker version 0.3.0

Installation instructions:

- Download [Poptracker](https://github.com/black-sliver/PopTracker/releases)
- Place **Ape-Escape-Tracker.zip** in packs folder
- Run Poptracker

Upcoming Plans:
1. [ ] Better maps
2. [ ] Better descriptors for monkey locations
3. [x] ~~Calculate Coins and Monkeys per Level in the grid~~

See [CHANGELOG.md](https://github.com/lurch9229/Ape-Escape-Tracker/blob/main/CHANGELOG.md) for full changes

Version 0.3.0

	Autotracking -:
		- Autotracking of Mailboxes
  		- Added autotracking of new settings
	
	Layout -:
		- Updated layout to include Specter 1 and Specter 2
  		- Added Options : Mailboxes, SuperFlyer
    		- Layout adjustement to make rooms for more options (We are starting to have MANY options)
      		- Updated Map scaling to make it better
	
	Items/Locations -:
		- Added Mailboxes as locations
		- Revised ALL locations/item logic since it had been reworked in the apworld
  		- Added CCA boss and TVT Boss in the tracking for their respective locations
		- Verified/updated locations rules based on Net and WaterNet logic
  		- Added Peak Point Matrix as a map location
    		- Fixed Wabi Sabi Wall/Barrel Room Coin not being tracked properly
    		- Fixed Specter's Factory Lava Room Coin not being tracked properly
Version 0.2.2

	Autotracking -:
		- Implemented AddOnLocationSectionChangedHandler to track per level Monkeys/Coins and global Totals
		- Autotracking with slot_data now works
	
	Layout -:
		- New layout : Map Tracker (Alternative) -> A more vertical layout than the original one
		- Added Total Coins/Monkey into all layouts
	
	Items/Locations -:
		- Made Coins and Monkeys item type "non-interractive" in the Layout (Map locations still updates them)
		- Changed World Keys initial quantity to 0
		- Fixed Wrong total coin count for "coin_tot" and some levels in the grid
		- Fixed some items/locations images in various levels
		- Fixed Wabi Sabi Wall and Crumbling Castle "code" not matching the Items in the grid properly
		- Fixed some monkeys access rules for Desxter's Island
  		- Fixed Stadium Attack and Gladiator Attack access rules
Version 0.2.1

	Autotracking -:
		- Corrected Item ID's for tracking
		- Enabled Autotracking for Items,Locations and Coins
		- Corrected Monkey names and location names to match map location for tracking 
		- Changed the calculation of worldUnlocks to better match AP pack: (Thanks for the initial code StripesOO7)
		- Added Stadium Attack and Gladiator Attack for coin tracking
	Map -:
		- Changed coin names for their respective name in Archipelago-Ape-Escape pack "String.py"(ex.:Fossil Fields "Specter Coin" is now "Main") 
		- Moved monkey_madness.json from dim_x folder to the specter_land folder to better fit the map
		- Corrected location name for NewFreezeLand in map
	
	Fixes -:
		- Included code in archipelago.lua to put the Time Net Active by default.This is done as a placeholder since Net is not randomised in the pool yet
		- Changed items.json to remove "allow_disabled": false :

Dev version 0.0.2D (0.2.0)

	Features/Bug fixes -:
		- Added settings
		- Made Specter Coins viewable
		- Changed how world keys work. Now a Consumable that toggles specific level keys
