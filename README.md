# Ape-Escape-Tracker

Tracker for Ape Escape, for use with AP

Initial Tracker Release

Download Poptracker from https://github.com/black-sliver/PopTracker/releases

Place Ape-Escape-Tracker.zip in packs folder

Run Poptracker

- Upcoming Plans
  - autotracking
  - better maps
  - better descriptors for monkey locations
  
- Version 0.2.1
	- Autotracking :
		- Enabled Autotracking for Items,Locations and Coins
		- Corrected Item ID's for autotracking
		- Added 60 lines to location_mapping for coins locations and linked them to locations on the map
		- Corrected Monkey names and location names to match map location for tracking: 
			- Dr Monk->Dr. Monk, 
			- BongBong->Bong-Bong
			- Fossil Fields/Fossil Field->Fossil Fields/Fossil Fields
			- VanillaS->Vanilla S
			- Eight 7->Eighty 7
			- Poople->Poo-Pie
		- Changed the calculation of worldUnlocks to better match AP pack: (Thanks for the initial code StripesOO7)
			- The first 3 levels are always unlocked by default and then each key received will unlocks 3 more
			- Changed initial value to 0 and max to 6 in the grid,as there is 6 keys total in the item pool.
	- Map:
		- Changed coin names for their respective name in Archipelago-Ape-Escape pack "String.py"(ex.:Fossil Fields "Specter Coin" is now "Main") 
		- Changed location of monkey_madness.json from dim_x folder to a new folder to better fit the map : locations/specter_land/monkey_madness.json
		- Renamed NewFreezeLand/Open Area - Monkey to NewFreezeLand/Hot Springs
		- Added Stadium Attack and Gladiator Attack for coin tracking
	- Fixes:
		- Included code in archipelago.lua to put the Time Net Active by default.This is done as a placeholder since Net is not randomised in the pool yet
		- Changed items.json to remove "allow_disabled": false :
			- As for now, the icon showed always enabled but you could right click and logic would follow despite icon being still active,making it very confusing
	- TODO:
		- Calculate Coins and Monkeys per Level in the grid
		- Alternate layout option to separate Coins from Monkeys on the map tracker
- dev version 0.0.2D (0.2.0)
  - added settings
  - made Specter Coins viewable
  - Changed how world keys work. Now a Consumable that toggles specific level keys
