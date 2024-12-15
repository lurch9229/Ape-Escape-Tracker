function Club()
    return has ("club")
end

function Net()
    return has ("net")
end

function Hoop()
    return has ("hoop")
end

function Punch()
    return has ("punch")
end

function Sling()
    return has ("sling")
end

function Car()
    return has ("car")
end

function Flyer()
    return has ("flyer")
end

function Swim()
    return has ("water") or has ("swim") or has ("dive")
end
function Dive()
    return has ("dive")
end

function WaterCatch()
    return has ("watercatch")
end

function Radar()
    return has ("radar")
end

function op_superflyer()
    return has ("op_sf_on")
end
function op_waternet()
    return has ("op_wn_on")
end

function op_gl()
    return has ("op_gl")
end

function op_no_ij()
    return has ("op_no_ij")
end

function op_et()
    return has ("op_et")
end

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function find_index (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return index
        end
    end

    return -1
end

function getReqKeys()
	local KeyOption = Tracker:FindObjectForCode("op_keyoption").CurrentStage
	requiredKeys = {}
	if KeyOption == 0 then
        reqkeys = {0, 0, 0, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 6, 6}
		--Tracker:FindObjectForCode("Keyworld").MaxCount = 6
    elseif KeyOption == 1 then
        reqkeys = {0, 0, 0, 1, 1, 1, 2, 3, 3, 3, 4, 4, 4, 5, 6, 6, 6, 7, 7, 7, 8, 8}
		--Tracker:FindObjectForCode("Keyworld").MaxCount = 8
    elseif KeyOption == 2 then
        reqkeys = {0, 0, 0, 1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 10, 11, 12, 13, 14, 15, 16, 16}
		--Tracker:FindObjectForCode("Keyworld").MaxCount = 16
    elseif KeyOption == 3 then
        reqkeys = {0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 18}
		--Tracker:FindObjectForCode("Keyworld").MaxCount = 18
	end
	
	for index = 1, 21 do
		value = reqkeys[index]
		table.insert(requiredKeys,index,value)
    end
	
	return requiredKeys
end

function getLvlOrder()

	LevelRando = Tracker:FindObjectForCode("op_entrance").CurrentStage
	lvl_order = {}
	for index = 1, 21 do
		value = Tracker:FindObjectForCode("__er_"..lvl_list[index].."_dst").CurrentStage
		if value == 0 then
			value = index
		end
		table.insert(lvl_order,index,value)
    end
	--print(dump_table(lvl_order))
	return lvl_order
end

function switchKey(label)

	-- Get lvl name of clicked label
	levelclicked = string.sub(label,6,-5)
	index = find_index(lvl_list,levelclicked)
	-- Before refreshing lvl_order,go see what level was there and deactivate the key
	disableKeyID = lvl_order[index]
	disableKeyLevel = lvl_list[disableKeyID]
	Tracker:FindObjectForCode(disableKeyLevel.."_key").Active = false
	
	--Then do the world unlocks to reactivate the right keys depending on the new level_order
	worldUnlocks()
end

function resetworldUnlocks()
	
	lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "cca", "cp", "sf", "tvt", "mm"}
	for index = 1, 21 do
		Tracker:FindObjectForCode(lvl_list[index].."_key").Active = false
    end
end

function worldUnlocks()
	
	lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "cca", "cp", "sf", "tvt", "mm"}
	getLvlOrder()
	getReqKeys()
	worldkeys = Tracker:ProviderCountForCode("keyWorld")
	LevelRando = Tracker:FindObjectForCode("op_entrance").CurrentStage
	Auto_ER = Tracker:FindObjectForCode("__setting_auto_ent").CurrentStage
	already_checked = {}
	for index = 1, 21 do
		value = Tracker:FindObjectForCode("__er_"..lvl_list[index].."_dst").CurrentStage
		
		if value == 0 then
			value = index
		end
		level_reqKeys = requiredKeys[index]
		if not has_value(already_checked, value) then
			if worldkeys >= level_reqKeys then
				Tracker:FindObjectForCode(lvl_list[value].."_key").Active = true
				table.insert(already_checked,value)
			else
				Tracker:FindObjectForCode(lvl_list[value].."_key").Active = false
			end
		end
    end
end

function clearER()
	lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "cca", "cp", "sf", "tvt", "mm"}
	for index = 1, 21 do
		Tracker:FindObjectForCode("__er_"..lvl_list[index].."_dst").CurrentStage = 0
    end
end

function resetER()
	lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "cca", "cp", "sf", "tvt", "mm"}
	for index = 1, 21 do
		Tracker:FindObjectForCode("__er_"..lvl_list[index].."_dst").CurrentStage = index
    end
end

function setER(source)	
	Auto_ER = Tracker:FindObjectForCode("__setting_auto_ent").CurrentStage
	reqKeys = getReqKeys()
	worldkeys = Tracker:ProviderCountForCode("keyWorld")
	resetworldUnlocks()
	if SLOT_DATA ~= nil then
	
		if Auto_ER == 1 then
			-- set entrances mapping respecting logic
			lvl_list = { "ff","po","ml","tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "cca", "cp", "sf", "tvt", "mm","ppm"}
			lvl_order = SLOT_DATA['entranceids']
			true_lvl_order = {}
			for k, v in pairs(lvl_order) do
				if v then
					index_lvl = k
					stage_value = levelsIdsToIndex[v]
					table.insert(true_lvl_order,k,stage_value)
					
					--print(string.format("ER entrance %s | %s | %s", index_lvl,stage_value,lvl_list[index_lvl]))
					if worldkeys >= reqKeys[index_lvl] then
						Tracker:FindObjectForCode("__er_"..lvl_list[index_lvl].."_dst").CurrentStage = stage_value
					else
						Tracker:FindObjectForCode("__er_"..lvl_list[index_lvl].."_dst").CurrentStage = 0
					end
				end
			end
		elseif Auto_ER == 2 then
			-- set entrances mapping despite not knowing logic
			lvl_list = { "ff","po","ml","tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "cca", "cp", "sf", "tvt", "mm","ppm"}
			lvl_order = SLOT_DATA['entranceids']
			true_lvl_order = {}
			for k, v in pairs(lvl_order) do
				if v then
					index_lvl = k
					stage_value = levelsIdsToIndex[v]
					table.insert(true_lvl_order,k,stage_value)
					--print(string.format("ER entrance %s | %s | %s", index_lvl,stage_value,lvl_list[index_lvl]))
					Tracker:FindObjectForCode("__er_"..lvl_list[index_lvl].."_dst").CurrentStage = stage_value
				end
			end
		end
	end
	worldUnlocks()
end

function apLayoutChange()
  local waternet = Tracker:FindObjectForCode("op_waternet")
  if (string.find(Tracker.ActiveVariantUID, "map_tracker")) or
  (string.find(Tracker.ActiveVariantUID, "map_tracker_alternative")) then
    if waternet.CurrentStage == 1 then
	    print("WaterNet")
        Tracker:AddLayouts("layouts/itemGrids/item_grids_waternet.json")
    else
		print("No water net")
		Tracker:AddLayouts("layouts/itemGrids/item_grids_standard.json")
	end
  end
end

ScriptHost:AddWatchForCode("useApLayout", "op_waternet", apLayoutChange)
ScriptHost:AddWatchForCode("worldkey handler", "keyWorld", worldUnlocks)
lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "cca", "cp", "sf", "tvt", "mm"}
for index = 1, 21 do
	ScriptHost:AddWatchForCode("er_label handler_"..lvl_list[index], "__er_"..lvl_list[index].."_dst", switchKey)
end

ScriptHost:AddWatchForCode("op_entrance switch", "op_entrance", worldUnlocks)
ScriptHost:AddWatchForCode("op_keys switch", "op_keyoption", worldUnlocks)

ScriptHost:AddWatchForCode("Clear entrances (ER)", "__er_clear", clearER)
ScriptHost:AddWatchForCode("Reset entrances (ER)", "__er_reset_all", resetER)
ScriptHost:AddWatchForCode("Load from AP (ER)", "__er_load_ap", setER)