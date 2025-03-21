-- this is an example/ default implementation for AP autotracking
-- it will use the mappings defined in item_mapping.lua and location_mapping.lua to track items and locations via thier ids
-- it will also load the AP slot data in the global SLOT_DATA, keep track of the current index of on_item messages in CUR_INDEX
-- addition it will keep track of what items are local items and which one are remote using the globals LOCAL_ITEMS and GLOBAL_ITEMS
-- this is useful since remote items will not reset but local items might
ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

function onClear(slot_data) 
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
    end
    SLOT_DATA = slot_data
    CUR_INDEX = -1
    -- reset locations
    for _, v in pairs(LOCATION_MAPPING) do
        if v[1] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing location %s", v[1]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                    obj.Active = false
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end
    -- reset items
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
					obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = obj.MinCount
				elseif v[2] == "non-interactive" then
                    obj.AcquiredCount = obj.MinCount
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end
    LOCAL_ITEMS = {}
    GLOBAL_ITEMS = {}
	
	
    if SLOT_DATA == nil then
        return
    end
	-- Logic :     
		-- 0 = glitchless
		-- 1 = noij
		-- 2 = ij
    if slot_data['logic'] == 0 then
        Tracker:FindObjectForCode("op_logic").CurrentStage = 0
    elseif slot_data['logic'] == 1 then
        Tracker:FindObjectForCode("op_logic").CurrentStage = 1
    elseif slot_data['logic'] == 2 then
        Tracker:FindObjectForCode("op_logic").CurrentStage = 2
    end

	-- Coins Shuffle:
		--0 = Off
		--1 = On
    if slot_data['coin'] == 0 then
        Tracker:FindObjectForCode("op_coins").CurrentStage = 0
	else
		Tracker:FindObjectForCode("op_coins").CurrentStage = 1
    end
    -- Goal:
		--0 = First
		--1 = Second
    if slot_data['goal'] == 0 then
        Tracker:FindObjectForCode("goal").CurrentStage = 0
    elseif slot_data['goal'] == 1 then
        Tracker:FindObjectForCode("goal").CurrentStage = 1
    end
    if slot_data['superflyer'] == 0 then
        Tracker:FindObjectForCode("op_superflyer").CurrentStage = 0
    elseif slot_data['superflyer'] == 1 then
        Tracker:FindObjectForCode("op_superflyer").CurrentStage = 1
    end
    if slot_data['mailbox'] == 0 then
        Tracker:FindObjectForCode("op_mailbox").CurrentStage = 0
    elseif slot_data['mailbox'] == 1 then
        Tracker:FindObjectForCode("op_mailbox").CurrentStage = 1
    end
    if slot_data['shufflewaternet'] == 0 then
        Tracker:FindObjectForCode("op_waternet").CurrentStage = 0
    elseif slot_data['shufflewaternet'] == 1 then
        Tracker:FindObjectForCode("op_waternet").CurrentStage = 1
    end
	if slot_data['unlocksperkey'] == 0 then
        Tracker:FindObjectForCode("op_keyoption").CurrentStage = 0
    elseif slot_data['unlocksperkey'] == 1 then
		Tracker:FindObjectForCode("op_keyoption").CurrentStage = 1
	elseif slot_data['unlocksperkey'] == 2 then
		Tracker:FindObjectForCode("op_keyoption").CurrentStage = 2
	elseif slot_data['unlocksperkey'] == 3 then
        Tracker:FindObjectForCode("op_keyoption").CurrentStage = 3
    end
	print(slot_data['entrance'])
	if slot_data['entrance'] == 0 then
        Tracker:FindObjectForCode("op_entrance").CurrentStage = 0
    elseif slot_data['entrance'] == 1 then
		Tracker:FindObjectForCode("op_entrance").CurrentStage = 1
	elseif slot_data['entrance'] == 2 then
		Tracker:FindObjectForCode("op_entrance").CurrentStage = 2
	elseif slot_data['entrance'] == 3 then
        Tracker:FindObjectForCode("op_entrance").CurrentStage = 3
	elseif slot_data['entrance'] == 4 then
        Tracker:FindObjectForCode("op_entrance").CurrentStage = 4
    end
	
	Tracker:FindObjectForCode("ap_connected").Active = true
	
	if slot_data['lamp'] == 0 or slot_data["lamp"] == nil then
		Tracker:FindObjectForCode("op_lamps").CurrentStage = 0
	else
		Tracker:FindObjectForCode("op_lamps").CurrentStage = 1
	end
	
	loadAP()
	--worldUnlocks()
end


-- called when an item gets collected
function onItem(index, item_id, item_name, player_number)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
    end
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]
    if not v then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: could not find item mapping for id %s", item_id))
        end
        return
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: code: %s, type %s", v[1], v[2]))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
    -- track local items via snes interface
    if is_local then
        if LOCAL_ITEMS[v[1]] then
            LOCAL_ITEMS[v[1]] = LOCAL_ITEMS[v[1]] + 1
        else
            LOCAL_ITEMS[v[1]] = 1
        end
    else
        if GLOBAL_ITEMS[v[1]] then
            GLOBAL_ITEMS[v[1]] = GLOBAL_ITEMS[v[1]] + 1
        else
            GLOBAL_ITEMS[v[1]] = 1
        end
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("local items: %s", dump_table(LOCAL_ITEMS)))
        print(string.format("global items: %s", dump_table(GLOBAL_ITEMS)))
    end
    if PopVersion < "0.20.1" or AutoTracker:GetConnectionState("SNES") == 3 then
        -- add snes interface functions here for local item tracking
    end
	
	setER()
	worldUnlocks()
end

--called when a location gets cleared
function onLocation(location_id, location_name)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onLocation: %s, %s", location_id, location_name))
    end
    local v = LOCATION_MAPPING[location_id]
    if not v and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[1]:sub(1, 1) == "@" then
            obj.AvailableChestCount = obj.AvailableChestCount - 1
        else
            obj.Active = true
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find object for code %s", v[1]))
    end
	
	setER()
	worldUnlocks()
end

-- called when a locations is scouted
function onScout(location_id, location_name, item_id, item_name, item_player)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onScout: %s, %s, %s, %s, %s", location_id, location_name, item_id, item_name,
            item_player))
    end
    -- not implemented yet :(
end

-- called when a bounce message is received 
function onBounce(json)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onBounce: %s", dump_table(json)))
    end
    -- your code goes here
end

-- add AP callbacks
-- un-/comment as needed
Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
-- Archipelago:AddScoutHandler("scout handler", onScout)
-- Archipelago:AddBouncedHandler("bounce handler", onBounce)
