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
	return ((has ("op_wn_off") or has("op_wn_on")) and has ("water")) or (has ("op_wn_prog") and (has ("swim") or has ("dive")))
end

function Dive()
    return ((has ("op_wn_off") or has("op_wn_on")) and has ("water")) or (has ("op_wn_prog") and has ("dive"))
end

function WaterCatch()
    return ((has ("op_wn_off") or has("op_wn_on")) and has ("water")) or (has ("op_wn_prog") and has ("watercatch"))
end

function CB_Lamp()
    return ((has ("cb_lamp_on")) or (Net() and has ("op_lamps_off")))
end

function DI_Lamp()
    return ((has ("di_lamp_on")) or (Net() and has ("op_lamps_off")))
end

function CRC_Lamp()
    return ((has ("crc_lamp_on")) or (Net() and has ("op_lamps_off")))
end

function CP_Lamp()
    return ((has ("cp_lamp_on")) or (Net() and has ("op_lamps_off")))
end

function SF_Lamp()
    return ((has ("sf_lamp_on")) or (Net() and has ("op_lamps_off")))
end

function TVT_Lobby_Lamp()
	return ((has ("tvt_lamp_l_on")) or (Net() and has ("op_lamps_off")))
end

function TVT_Tank_Lamp()
	return ((has ("tvt_lamp_tr_on")) or (Net() and has ("op_lamps_off")))
end

function MM_Lamp()
	return ((has ("mm_lamp_on")) or (Net() and has ("op_lamps_off")))
end

function MM_Lobby_DoubleDoor()
    return (has ("mm_lobby_doubledoor"))
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
	print("====================SwitchKey==================")
	--getLvlOrder()
	-- Get lvl name of clicked label
	levelclicked = string.sub(label,6,-5)
	index = find_index(lvl_list,levelclicked)
	-- Before refreshing lvl_order,go see what level was there and deactivate the key
	disableKeyID = lvl_order[index]
	disableKeyLevel = lvl_list[disableKeyID]
	print("Disabled:"..disableKeyLevel.."_key")
	if disableKeyLevel ~= "ppm" then
		Tracker:FindObjectForCode(disableKeyLevel.."_key").Active = false
	end
	--Then do the world unlocks to reactivate the right keys depending on the new level_order
	worldUnlocks(index)
end

function resetworldUnlocks()
	
	lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "crc", "cp", "sf", "tvt", "mm"}
	for index = 1, 21 do
		Tracker:FindObjectForCode(lvl_list[index].."_key").Active = false
    end
end

function worldUnlocks(source)
	print("===================Unlocks====================")
	print(source)
	lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "crc", "cp", "sf", "tvt", "mm"}
	getLvlOrder()
	getReqKeys()
	worldkeys = Tracker:ProviderCountForCode("keyWorld")
	LevelRando = Tracker:FindObjectForCode("op_entrance").CurrentStage
	Auto_ER = Tracker:FindObjectForCode("__setting_auto_ent").CurrentStage
	already_checked = {}
	
	if LevelRando ~= 0 then
		Tracker:FindObjectForCode(lvl_list[1].."_key").Active = false
		Tracker:FindObjectForCode(lvl_list[2].."_key").Active = false
		Tracker:FindObjectForCode(lvl_list[3].."_key").Active = false
	end

	for index = 1, 21 do
		value = Tracker:FindObjectForCode("__er_"..lvl_list[index].."_dst").CurrentStage
		if LevelRando == 0 then
			--if value == 0 then
				value = index
			--end

		end
		--print(value)
		if value ~= 0 then
			level_reqKeys = requiredKeys[index]
			if has_value(already_checked, value) == false then
				if worldkeys >= level_reqKeys then
					print("activate_"..lvl_list[value].."_key")
					Tracker:FindObjectForCode(lvl_list[value].."_key").Active = true
					table.insert(already_checked,value)
				elseif worldkeys < level_reqKeys then
					print("--deactivate_"..lvl_list[value].."_key")
					Tracker:FindObjectForCode(lvl_list[value].."_key").Active = false
				end
			end
		else
			if has_value(already_checked, index) == false then
				--print(index)
				--print("--deactivate_"..lvl_list[index].."_key")
				Tracker:FindObjectForCode(lvl_list[index].."_key").Active = false
				--table.insert(already_checked,index)
			end
		end
    end
end

function worldUnlocks_Old()
	print("===================Unlocks====================")
	lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "crc", "cp", "sf", "tvt", "mm"}
	getLvlOrder()
	getReqKeys()
	worldkeys = Tracker:ProviderCountForCode("keyWorld")
	LevelRando = Tracker:FindObjectForCode("op_entrance").CurrentStage
	Auto_ER = Tracker:FindObjectForCode("__setting_auto_ent").CurrentStage
	already_checked = {}
	for index = 1, 21 do
		value = Tracker:FindObjectForCode("__er_"..lvl_list[index].."_dst").CurrentStage
		if LevelRando == 0 then
			if value == 0 then
				value = index
			end
		end
		if value ~= 0 then
			level_reqKeys = requiredKeys[index]
			if has_value(already_checked, value) == false then
				if worldkeys >= level_reqKeys then
					print("activate_"..lvl_list[value].."_key")
					Tracker:FindObjectForCode(lvl_list[value].."_key").Active = true
					--Tracker:FindObjectForCode(lvl_list[i].."_key").Active = false
					table.insert(already_checked,value)
				elseif worldkeys < level_reqKeys then
					print("--deactivate_"..lvl_list[value].."_key")
					Tracker:FindObjectForCode(lvl_list[value].."_key").Active = false
				end
			end
		end
    end
end


function clearER()
	lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "crc", "cp", "sf", "tvt", "mm"}
	for index = 1, 21 do
		Tracker:FindObjectForCode("__er_"..lvl_list[index].."_dst").CurrentStage = 0
    end
end

function resetER()
	lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "crc", "cp", "sf", "tvt", "mm"}
	for index = 1, 21 do
		Tracker:FindObjectForCode("__er_"..lvl_list[index].."_dst").CurrentStage = index
    end
end

function loadAP()
	resetworldUnlocks()
	setER()
	
end

function setER(source)	
	Auto_ER = Tracker:FindObjectForCode("__setting_auto_ent").CurrentStage
	reqKeys = getReqKeys()
	worldkeys = Tracker:ProviderCountForCode("keyWorld")
	
	if SLOT_DATA ~= nil then
	
		if Auto_ER == 1 then
			-- set entrances mapping respecting logic
			lvl_list = { "ff","po","ml","tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "crc", "cp", "sf", "tvt", "mm","ppm"}
			lvl_order = SLOT_DATA['entranceids']
			true_lvl_order = {}
			for k, v in pairs(lvl_order) do
				if v and k < 22 then -- Exclude PPM to not cause errors
					index_lvl = k
					stage_value = levelsIdsToIndex[v]
					table.insert(true_lvl_order,k,stage_value)
					
					print(string.format("ER entrance %s | %s | %s", index_lvl,stage_value,reqKeys[index_lvl]))
					if worldkeys >= reqKeys[index_lvl] then
						Tracker:FindObjectForCode("__er_"..lvl_list[index_lvl].."_dst").CurrentStage = stage_value
					else
						Tracker:FindObjectForCode("__er_"..lvl_list[index_lvl].."_dst").CurrentStage = 0
					end
				end
			end
		elseif Auto_ER == 2 then
			-- set entrances mapping despite not knowing logic
			lvl_list = { "ff","po","ml","tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "crc", "cp", "sf", "tvt", "mm","ppm"}
			lvl_order = SLOT_DATA['entranceids']
			true_lvl_order = {}
			for k, v in pairs(lvl_order) do
				if v and k < 22 then -- Exclude PPM to not cause errors
					index_lvl = k
					stage_value = levelsIdsToIndex[v]
					table.insert(true_lvl_order,k,stage_value)
					--print(string.format("ER entrance %s | %s | %s", index_lvl,stage_value,lvl_list[index_lvl]))
					Tracker:FindObjectForCode("__er_"..lvl_list[index_lvl].."_dst").CurrentStage = stage_value
				end
			end
		end
	end
end




function apItemLayoutChange()
  local waternet = Tracker:FindObjectForCode("op_waternet")
  local lamps = Tracker:FindObjectForCode("op_lamps")
  print(lamps.CurrentStage)
  if (Tracker.ActiveVariantUID == "map_tracker") or (Tracker.ActiveVariantUID == "map_tracker_alternative") then
    if waternet.CurrentStage == 0 or waternet.CurrentStage == 2 then
	    print("Option : off")
		Tracker:AddLayouts("layouts/itemGrids/item_grids_standard.json")
	elseif waternet.CurrentStage == 1 then
		print("Option : progressive")
        Tracker:AddLayouts("layouts/itemGrids/item_grids_waternet.json")
	end
  end
end

function apLevelsLayoutChange()
  local lamps = Tracker:FindObjectForCode("op_lamps")
  print(lamps.CurrentStage)
  if (Tracker.ActiveVariantUID == "map_tracker") then
    if lamps.CurrentStage == 0 then
	    print("Option : off")
	    --Tracker:AddLayouts("layouts/itemGrids/level_grid_standard.json")
    elseif lamps.CurrentStage == 1 then
	    print("Option : on")
	    --Tracker:AddLayouts("layouts/itemGrids/level_grid_standard_lamps.json")
    end
  end
  if (Tracker.ActiveVariantUID == "map_tracker_alternative") then
	if lamps.CurrentStage == 0 then
	    print("Option : off")
	    --Tracker:AddLayouts("layouts/itemGrids/level_grid_alternative.json")
    elseif lamps.CurrentStage == 1 then
	    print("Option : on")
	    --Tracker:AddLayouts("layouts/itemGrids/level_grid_alternative_lamps.json")
    end
  end
end



--Dev version check,remove when in prod!!!!
--==============================================================
function new_version_check()
	--print(SLOT_DATA)
	if Tracker:FindObjectForCode("ap_connected").Active == false then
		SLOT_DATA = nil
	end
	if SLOT_DATA then
		if SLOT_DATA['lamp'] == nil then
			Tracker:FindObjectForCode("mm_lobby_doubledoor").Active = true
			Tracker:FindObjectForCode("mm_lobby_doubledoor").Icon = ""
			Tracker:FindObjectForCode("op_lamps_off").Icon = ""
			Tracker:FindObjectForCode("op_lamps_on").Icon = ""
			Tracker:FindObjectForCode("op_lamps").CurrentStage = 0
		else
			Tracker:FindObjectForCode("mm_lobby_doubledoor").Icon = "images/items/MM_door_unlock.png"
			print("--------------------------------------------------------")
			Tracker:FindObjectForCode("op_lamps_off").Icon = "images/settings/lamps_off.png"
			Tracker:FindObjectForCode("op_lamps_on").Icon = "images/settings/lamps_on.png"
		end
	end
	MM_Door_Icon = Tracker:FindObjectForCode("mm_lobby_doubledoor").Icon
	lamps_off_Icon = Tracker:FindObjectForCode("op_lamps_off").Icon
	lamps_on_Icon = Tracker:FindObjectForCode("op_lamps_on").Icon
	--if Tracker:FindObjectForCode("ap_connected").Active == false then
		--Tracker:FindObjectForCode("op_lamps").CurrentStage = 0
		--ScriptHost:AddWatchForCode("useApLayout2", "op_lamps", apLevelsLayoutChange)
	--end
end


--ScriptHost:AddWatchForCode("Door Handler", "mm_lobby_doubledoor", new_version_check)
--ScriptHost:AddWatchForCode("Lamps Handler", "op_lamps", new_version_check)
--==============================================================










ScriptHost:AddWatchForCode("useApLayout", "op_waternet", apItemLayoutChange)
--ScriptHost:AddWatchForCode("useApLayout2", "op_lamps", apLevelsLayoutChange)
ScriptHost:AddWatchForCode("worldkey handler", "keyWorld", worldUnlocks)

lvl_list = {"ff", "po", "ml", "tj", "dr", "cr","sa", "cb", "cc", "di", "sm", "fr", "hs", "ga", "st", "wsw", "crc", "cp", "sf", "tvt", "mm"}
for index = 1, 21 do
	ScriptHost:AddWatchForCode("er_label handler_"..lvl_list[index], "__er_"..lvl_list[index].."_dst", switchKey)
end

ScriptHost:AddWatchForCode("op_entrance switch", "op_entrance", worldUnlocks)
ScriptHost:AddWatchForCode("op_keys switch", "op_keyoption", worldUnlocks)

ScriptHost:AddWatchForCode("Clear entrances (ER)", "__er_clear", clearER)
ScriptHost:AddWatchForCode("Reset entrances (ER)", "__er_reset_all", resetER)
ScriptHost:AddWatchForCode("Load from AP (ER)", "__er_load_ap", loadAP)