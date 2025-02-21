-- Tracker:AddLayouts("layouts/tracker_worldmap.json")
--Tracker:AddLayouts("layouts/events.json")
--Tracker:AddLayouts("layouts/settings_popup.json")
-- Tracker:AddLayouts("layouts/broadcast_horizontal.json")

if (Tracker.ActiveVariantUID == "map_tracker") then

	Tracker:AddLayouts("layouts/display/tracker.json")
	Tracker:AddLayouts("layouts/itemGrids/item_grids_standard.json")
	Tracker:AddLayouts("layouts/itemGrids/settings_grid.json")
	Tracker:AddLayouts("layouts/itemGrids/level_grid_standard.json")
	Tracker:AddLayouts("layouts/Entrances/entrance_grid_standard.json")
	Tracker:AddLayouts("layouts/settings.json")
	-- Setup for ER on reset
	new_version_check()
	worldUnlocks()
	
elseif (Tracker.ActiveVariantUID == "map_tracker_alternative") then

	Tracker:AddLayouts("layouts/itemGrids/item_grids_standard.json")
	Tracker:AddLayouts("layouts/display/tracker_alternative.json")
	Tracker:AddLayouts("layouts/itemGrids/settings_grid.json")
	Tracker:AddLayouts("layouts/itemGrids/level_grid_alternative.json")
	Tracker:AddLayouts("layouts/Entrances/entrance_grid_alternative.json")
	Tracker:AddLayouts("layouts/settings.json")
	-- Setup for ER on reset
	new_version_check()
	worldUnlocks()
elseif (Tracker.ActiveVariantUID == "items_only") then

	Tracker:AddLayouts("layouts/display/items_minimal.json")
	
end
