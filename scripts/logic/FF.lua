-- time_station = apeescape_location.new("time_station")
local FF_ENTRANCE = apeescape_location.new("FF_ENTRANCE")
local FF_ENTRY = apeescape_location.new("FF_ENTRY")
--local ts_minigame = apeescape_location.new("ts_minigame")
local start_rooms = {

    FF_ENTRY -- Stage 1 / Unknown (0)
}

-- 1. Main connection to the level hub
time_station:connect_one_way_entrance("Time Station - FF", FF_ENTRANCE, function() return FF_Access() end)

-- 2. Localized inline loop to map the dynamic start rooms
for stage_idx, room_node in ipairs(start_rooms) do
    FF_ENTRANCE:connect_one_way_entrance("FF Start - Stage " .. stage_idx, room_node, function()
        local current_stage = get_start_stage("ff")
        if current_stage == 0 then current_stage = 1 end

        return current_stage == stage_idx
    end)
end
--TS Main Hub
FF_ENTRY:connect_one_way("FF_Noonan",function() return HasNet() end)
FF_ENTRY:connect_one_way("FF_Jorjy",function() return HasNet() end)
FF_ENTRY:connect_one_way("FF_Nati",function() return HasNet() end)

FF_ENTRY:connect_one_way("FF_TrayC",function()
    result = any(
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)

FF_ENTRY:connect_one_way("FF_C_Main",true)
FF_ENTRY:connect_one_way("FF_M_Stun Club Tutorial",true)
FF_ENTRY:connect_one_way("FF_M_Switch Gadgets Tutorial",true)
FF_ENTRY:connect_one_way("FF_M_Don't Toss Your Cookies!",function() return CanHitOnce() end)