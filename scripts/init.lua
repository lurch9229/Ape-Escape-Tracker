ENABLE_DEBUG_LOG = false

local variant = Tracker.ActiveVariantUID
print("\n-- Loading Ape Escape Tracker --")
print("Variant: ", variant)
if Tracker.AllowDeferredLogicUpdate ~= nil then
	Tracker.AllowDeferredLogicUpdate = true
end
ScriptHost:LoadScript("scripts/logic/items.lua")
ScriptHost:LoadScript("scripts/logic/level_logic.lua")
ScriptHost:LoadScript("scripts/autotracking.lua")

ScriptHost:LoadScript("scripts/utils.lua")

Tracker:AddItems("items/items.json")
Tracker:AddItems("items/levels.json")
Tracker:AddItems("items/ER.json")
Tracker:AddItems("items/settings.json")

ScriptHost:LoadScript("scripts/layouts.lua")

Tracker:AddMaps("maps/maps.json")

Tracker:AddLayouts("layouts/display/broadcast_horizontal.json")
Tracker:AddLocations("locations/timestation/time_station.json")
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