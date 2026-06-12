-- time_station = apeescape_location.new("time_station")
local ML_ENTRANCE = apeescape_location.new("ML_ENTRANCE")

local ML_ENTRY = apeescape_location.new("ML_ENTRY")
local ML_VOLCANO_ENTRY = apeescape_location.new("ML_VOLCANO_ENTRY")
local ML_TRICERATOPS_ENTRY = apeescape_location.new("ML_TRICERATOPS_ENTRY")

local start_rooms = {
    ML_ENTRY,            -- Stage 1 / Unknown (0)
    ML_VOLCANO_ENTRY,    -- Stage 2
    ML_TRICERATOPS_ENTRY -- Stage 3
}

-- 1. Main connection to the level hub
time_station:connect_one_way_entrance("Time Station - ML", ML_ENTRANCE, function() return ML_Access() end)

-- 2. Localized inline loop to map the dynamic start rooms
for stage_idx, room_node in ipairs(start_rooms) do
    ML_ENTRANCE:connect_one_way_entrance("ML Start - Stage " .. stage_idx, room_node, function()
        local current_stage = get_start_stage("ml")
        if current_stage == 0 then current_stage = 1 end

        return current_stage == stage_idx
    end)
end

ML_ENTRY:connect_two_ways_entrance("ML_ENTRY_VOLCANO",ML_VOLCANO_ENTRY)
ML_ENTRY:connect_two_ways_entrance("ML_ENTRY_TRICERATOPS",ML_TRICERATOPS_ENTRY)
--Monkeys
ML_ENTRY:connect_one_way("ML_Scotty",function() return HasNet() end)
ML_ENTRY:connect_one_way("ML_Coco",function() return HasNet() end)
ML_ENTRY:connect_one_way("ML_JThomas",function()
    result = any(
                Eval_Logic(((HasClub() or HasPunch()) and HasNet()),0),
                Eval_Logic((CanHitOnce() and HasNet()),1)
               )
    return result

end)
ML_ENTRY:connect_one_way("ML_Moggan",function() return HasNet() end)
ML_VOLCANO_ENTRY:connect_one_way("ML_Barney",function() return HasNet() end)
ML_VOLCANO_ENTRY:connect_one_way("ML_Mattie",function() return HasNet() end)
ML_TRICERATOPS_ENTRY:connect_one_way("ML_Rocky",function()
    result = any(
                Eval_Logic((HasSling() and (HasClub() or HasPunch()) and HasNet()),0),
                Eval_Logic((HasSling() and HasNet()),1)
               )
    return result

end)

--Coins
ML_ENTRY:connect_one_way("ML_C_Entry",true)

--Mailboxes
ML_ENTRY:connect_one_way("ML_M_Surrounded by a Cliff",true)
ML_ENTRY:connect_one_way("ML_M_Energy Chips",function() return CanHitOnce() end)
ML_VOLCANO_ENTRY:connect_one_way("ML_M_The T-Rex is Aggressive",true)
ML_TRICERATOPS_ENTRY:connect_one_way("ML_M_Did I Give You That Yet?",true)
ML_TRICERATOPS_ENTRY:connect_one_way("ML_M_Hit the Bombs!",function() return HasSling() end)
