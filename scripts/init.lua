ENABLE_DEBUG_LOG = false

local variant = Tracker.ActiveVariantUID
print("\n-- Loading Ape Escape Tracker --")
print("Variant: ", variant)
if Tracker.AllowDeferredLogicUpdate ~= nil then
	Tracker.AllowDeferredLogicUpdate = false
end

ScriptHost:LoadScript("scripts/logic/items.lua")
ScriptHost:LoadScript("scripts/logic/level_logic.lua")
ScriptHost:LoadScript("scripts/utils.lua")

Tracker:AddItems("items/items.json")
Tracker:AddItems("items/levels.json")
Tracker:AddItems("items/ER.json")
Tracker:AddItems("items/settings.json")

ScriptHost:LoadScript("scripts/layouts.lua")

ScriptHost:LoadScript("scripts/logic/logic_helpers.lua")
ScriptHost:LoadScript("scripts/logic/logic_main.lua")
ScriptHost:LoadScript("scripts/logic_import.lua")

-- Locations
ScriptHost:LoadScript("scripts/locations_import.lua")

ScriptHost:LoadScript("scripts/autotracking.lua")




Tracker:AddMaps("maps/maps.json")

Tracker:AddLayouts("layouts/display/broadcast_horizontal.json")
