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

function getReqKeys()
	local KeyOption = Tracker:FindObjectForCode("op_keyoption").CurrentStage
	requiredKeys = {}
	if KeyOption == 0 then
        reqkeys = {0, 0, 0, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 6, 6}
		Tracker:FindObjectForCode("Keyworld").MaxCount = 6
    elseif KeyOption == 1 then
        reqkeys = {0, 0, 0, 1, 1, 1, 2, 3, 3, 3, 4, 4, 4, 5, 6, 6, 6, 7, 7, 7, 8, 8}
		Tracker:FindObjectForCode("Keyworld").MaxCount = 8

    elseif KeyOption == 2 then
        reqkeys = {0, 0, 0, 1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 10, 11, 12, 13, 14, 15, 16, 16}
		Tracker:FindObjectForCode("Keyworld").MaxCount = 16

    elseif KeyOption == 3 then
        reqkeys = {0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 18}
		Tracker:FindObjectForCode("Keyworld").MaxCount = 18

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
		if LevelRando > 0 then
			table.insert(lvl_order,index,value)
		else
			table.insert(lvl_order,index,index)
		end
    end
	print(dump_table(lvl_order))
	return lvl_order
end

function switchKey()
	for index = 1, 21 do
		Tracker:FindObjectForCode(lvl_list[index].."_key").Active = false
    end
	worldUnlocks()
end

function worldUnlocks()
	
	--Normal unlocks,non-shuffle
	
	lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "cca", "cp", "sf", "tvt", "mm"}
	getLvlOrder()
	getReqKeys()
	worldkeys = Tracker:ProviderCountForCode("keyWorld")
	LevelRando = Tracker:FindObjectForCode("op_entrance").CurrentStage
	already_checked = {}
	for index = 1, 21 do
		value = Tracker:FindObjectForCode("__er_"..lvl_list[index].."_dst").CurrentStage
		
		if value == 0 or LevelRando == 0 then
			value = index
		end
		level_reqKeys = requiredKeys[index]
		if not has_value(already_checked, value) then
			if worldkeys >= level_reqKeys then
				print("Activate: "..lvl_list[value].."_key")
				Tracker:FindObjectForCode(lvl_list[value].."_key").Active = true
				table.insert(already_checked,value)
			elseif worldkeys < level_reqKeys then
				print("Deactivate: "..lvl_list[value].."_key")
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

function setER()
	Auto_ER = Tracker:FindObjectForCode("__setting_auto_ent").CurrentStage
	if Auto_ER == 1 then
		-- set entrances mapping
		lvl_list = { "ff","po","ml","tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "cca", "cp", "sf", "tvt", "mm","ppm"}
		lvl_order = SLOT_DATA['entranceids']
		true_lvl_order = {}
		for k, v in pairs(lvl_order) do
			if v then
				index_lvl = k
				stage_value = levelsIdsToIndex[v]
				table.insert(true_lvl_order,k,stage_value)
				print(string.format("ER entrance %s | %s | %s", index_lvl,stage_value,lvl_list[index_lvl]))
				Tracker:FindObjectForCode("__er_"..lvl_list[index_lvl].."_dst").CurrentStage = stage_value
			end
		end
	end
end

function waternet()

	OP_WaterNet_Stage = Tracker:FindObjectForCode("op_waternet").CurrentStage
	WaterNet_Stage = Tracker:FindObjectForCode("waternet").CurrentStage
	print(WaterNet_Stage)
	--WaterNetShuffle is off
	if OP_WaterNet_Stage == 0 then
		--Do not allow going past stage 1 fo the item
		if WaterNet_Stage > 1 then
			WaterNet_Stage = 1
		end
	else
		if WaterNet_Stage < 2 then
			WaterNet_Stage = 0
		end
	end

	Tracker:FindObjectForCode("waternet").CurrentStage = WaterNet_Stage
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
ScriptHost:AddWatchForCode("er_label handler", "__er_label", switchKey)
ScriptHost:AddWatchForCode("er_entrance switch", "op_entrance", switchKey)


ScriptHost:AddWatchForCode("Clear ER entrances", "__er_clear", clearER)
ScriptHost:AddWatchForCode("Reset ER entrances", "__er_reset_all", resetER)
--ScriptHost:AddWatchForCode("water net handler2", "water", waternet)
--ScriptHost:AddWatchForCode("water net handler", "op_waternet", waternet)