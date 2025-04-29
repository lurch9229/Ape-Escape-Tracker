-- time_station = apeescape_location.new("time_station")
local FF_Entry = apeescape_location.new("FF_Entry")
--local ts_minigame = apeescape_location.new("ts_minigame")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - FF",FF_Entry,function() return FF_Access() end)
FF_Entry:connect_one_way("FF_Noonan",function() return HasNet() end)
FF_Entry:connect_one_way("FF_Jorjy",function() return HasNet() end)
FF_Entry:connect_one_way("FF_Nati",function() return HasNet() end)

FF_Entry:connect_one_way("FF_TrayC",function()
    result = any(
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)

FF_Entry:connect_one_way("FF_C_Main",true)
FF_Entry:connect_one_way("FF_M_Stun Club Tutorial",true)
FF_Entry:connect_one_way("FF_M_Switch Gadgets Tutorial",true)
FF_Entry:connect_one_way("FF_M_Don't Toss Your Cookies!",function() return CanHitOnce() end)