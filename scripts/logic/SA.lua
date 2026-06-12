-- time_station = apeescape_location.new("time_station")
local SA_ENTRANCE = apeescape_location.new("SA_ENTRANCE")
local SA_ENTRY = apeescape_location.new("SA_ENTRY")
local SA_COMPLETE = apeescape_location.new("SA_COMPLETE")

local start_rooms = {
    SA_ENTRY -- Stage 1 / Unknown (0)
}

-- 1. Main connection to the level hub
time_station:connect_one_way_entrance("Time Station - SA", SA_ENTRANCE, function() return SA_Access() end)

-- 2. Localized inline loop to map the dynamic start rooms
for stage_idx, room_node in ipairs(start_rooms) do
    SA_ENTRANCE:connect_one_way_entrance("SA Start - Stage " .. stage_idx, room_node, function()
        local current_stage = get_start_stage("sa")
        if current_stage == 0 then current_stage = 1 end

        return current_stage == stage_idx
    end)
end

--Entrances
SA_ENTRY:connect_one_way_entrance("SA_ENTRY_to_SA_COMPLETE",SA_COMPLETE,function() return CanSwim() end)

--Coins
--Not needed,but just in case
SA_COMPLETE:connect_one_way("SA_C_Coin 1",true)
SA_COMPLETE:connect_one_way("SA_C_Coin 2",true)
SA_COMPLETE:connect_one_way("SA_C_Coin 3",true)
SA_COMPLETE:connect_one_way("SA_C_Coin 4",true)
SA_COMPLETE:connect_one_way("SA_C_Coin 5",true)