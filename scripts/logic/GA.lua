-- time_station = apeescape_location.new("time_station")
local GA_ENTRANCE = apeescape_location.new("GA_ENTRANCE")
local GA_ENTRY = apeescape_location.new("GA_ENTRY")
local GA_COMPLETE = apeescape_location.new("GA_COMPLETE")

local start_rooms = {
    GA_ENTRY -- Stage 1 / Unknown (0)
}

-- 1. Main connection to the level hub
time_station:connect_one_way_entrance("Time Station - GA", GA_ENTRANCE, function() return GA_Access() end)

-- 2. Localized inline loop to map the dynamic start rooms
for stage_idx, room_node in ipairs(start_rooms) do
    GA_ENTRANCE:connect_one_way_entrance("GA Start - Stage " .. stage_idx, room_node, function()
        local current_stage = get_start_stage("ga")
        if current_stage == 0 then current_stage = 1 end

        return current_stage == stage_idx
    end)
end

--Entrances
GA_ENTRY:connect_one_way_entrance("GA_ENTRY_to_GA_COMPLETE",GA_COMPLETE,function() return HasFlyer() end)

--Coins
--Not needed,but just in case
GA_COMPLETE:connect_one_way("GA_C_Coin 1",true)
GA_COMPLETE:connect_one_way("GA_C_Coin 2",true)
GA_COMPLETE:connect_one_way("GA_C_Coin 3",true)
GA_COMPLETE:connect_one_way("GA_C_Coin 4",true)
GA_COMPLETE:connect_one_way("GA_C_Coin 5",true)