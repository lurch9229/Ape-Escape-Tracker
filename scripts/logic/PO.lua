-- time_station = apeescape_location.new("time_station")
local PO_ENTRANCE = apeescape_location.new("PO_ENTRANCE")
local PO_ENTRY = apeescape_location.new("PO_ENTRY")

local start_rooms = {
    PO_ENTRY -- Stage 1 / Unknown (0)
}

-- 1. Main connection to the level hub
time_station:connect_one_way_entrance("Time Station - PO", PO_ENTRANCE, function() return PO_Access() end)

-- 2. Localized inline loop to map the dynamic start rooms
for stage_idx, room_node in ipairs(start_rooms) do
    PO_ENTRANCE:connect_one_way_entrance("PO Start - Stage " .. stage_idx, room_node, function()
        local current_stage = get_start_stage("po")
        if current_stage == 0 then current_stage = 1 end

        return current_stage == stage_idx
    end)
end
--TS Main Hub
PO_ENTRY:connect_one_way("PO_Shay",function() return HasNet() end)
PO_ENTRY:connect_one_way("PO_Dr. Monk",function() return HasNet() end)
PO_ENTRY:connect_one_way("PO_Ah-Choo",function() return HasNet() or HasWaterNet() end)

PO_ENTRY:connect_one_way("PO_Grunt",function()
    result = any(
                Eval_Logic(((CanSwim() or HasFlyer()) and HasNet()),0),
                Eval_Logic((CanSwim() or HasHoop() or HasFlyer() or IJ()) and HasNet(),1),
                Eval_Logic(HasNet(),2)
               )
    return result

end)

PO_ENTRY:connect_one_way("PO_Tyrone",function() return HasNet() end)
PO_ENTRY:connect_one_way("PO_Gornif",function()
    result = any(
                Eval_Logic((CanSwim() and (HasNet() or HasWaterNet())),0),
                Eval_Logic((HasNet() or HasWaterNet()),1)
               )
    return result

end)

PO_ENTRY:connect_one_way("PO_C_Main",function() return CanDive() end)

PO_ENTRY:connect_one_way("PO_M_Dive Reminder",true)
PO_ENTRY:connect_one_way("PO_M_Climb a Tree",true)
PO_ENTRY:connect_one_way("PO_M_Camera Tutorial",true)
PO_ENTRY:connect_one_way("PO_M_Crawl Tutorial",true)