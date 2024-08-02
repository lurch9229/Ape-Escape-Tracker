ENABLE_DEBUG_LOG = true

ScriptHost:LoadScript("scripts/logic/items.lua")
ScriptHost:LoadScript("scripts/logic/level_logic.lua")
ScriptHost:LoadScript("scripts/autotracking.lua")

Tracker:AddItems("items/items.json")
Tracker:AddItems("items/levels.json")
Tracker:AddItems("items/settings.json")

Tracker:AddMaps("maps/maps.json")


if (Tracker.ActiveVariantUID == "map_tracker") then

	Tracker:AddLayouts("layouts/display/tracker.json")
	Tracker:AddLayouts("layouts/itemGrids/item_grids_standard.json")
	Tracker:AddLayouts("layouts/itemGrids/level_grid_left_standard.json")
	Tracker:AddLayouts("layouts/itemGrids/level_grid_right_standard.json")
	
elseif (Tracker.ActiveVariantUID == "map_tracker_alternative") then

	Tracker:AddLayouts("layouts/itemGrids/item_grids_standard.json")
	Tracker:AddLayouts("layouts/display/tracker_alternative.json")
	Tracker:AddLayouts("layouts/itemGrids/settings_grid.json")
	Tracker:AddLayouts("layouts/itemGrids/level_grid_alternative.json")
	
elseif (Tracker.ActiveVariantUID == "items_only") then

	Tracker:AddLayouts("layouts/display/items_minimal.json")
	
end
Tracker:AddLayouts("layouts/display/broadcast_horizontal.json")
Tracker:AddLocations("locations/lost_lands/fossil_fields.json")
Tracker:AddLocations("locations/lost_lands/primordial_ooze.json")
Tracker:AddLocations("locations/lost_lands/molten_lava.json")
Tracker:AddLocations("locations/myst_age/thick_jungle.json")
Tracker:AddLocations("locations/myst_age/dark_ruins.json")
Tracker:AddLocations("locations/myst_age/cryptic_relics.json")
Tracker:AddLocations("locations/oceana/crabby_beach.json")
Tracker:AddLocations("locations/oceana/coral_cave.json")
Tracker:AddLocations("locations/oceana/dexters_island.json")
Tracker:AddLocations("locations/freeze/snowy_mammoth.json")
Tracker:AddLocations("locations/freeze/frosty_retreat.json")
Tracker:AddLocations("locations/freeze/hot_springs.json")
Tracker:AddLocations("locations/medi_may/sushi_temple.json")
Tracker:AddLocations("locations/medi_may/wabi_sabi_wall.json")
Tracker:AddLocations("locations/medi_may/crumbling_castle.json")
Tracker:AddLocations("locations/futurama/city_park.json")
Tracker:AddLocations("locations/futurama/specters_factory.json")
Tracker:AddLocations("locations/futurama/tv_tower.json")
Tracker:AddLocations("locations/specter_land/monkey_madness.json")
Tracker:AddLocations("locations/dimension_x/dim_x.json")
