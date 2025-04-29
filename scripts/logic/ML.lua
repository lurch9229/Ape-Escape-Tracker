-- time_station = apeescape_location.new("time_station")
local ML_Entry = apeescape_location.new("ML_Entry")
local ML_Volcano = apeescape_location.new("ML_Volcano")
local ML_Triceratops = apeescape_location.new("ML_Triceratops")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - ML",ML_Entry,function() return ML_Access() end)

ML_Entry:connect_two_ways_entrance("ML_ENTRY_VOLCANO",ML_Volcano)
ML_Entry:connect_two_ways_entrance("ML_ENTRY_TRICERATOPS",ML_Triceratops)
--Monkeys
ML_Entry:connect_one_way("ML_Scotty",function() return HasNet() end)
ML_Entry:connect_one_way("ML_Coco",function() return HasNet() end)
ML_Entry:connect_one_way("ML_JThomas",function()
    result = any(
                Eval_Logic(((HasClub() or HasPunch()) and HasNet()),0),
                Eval_Logic((CanHitOnce() and HasNet()),1)
               )
    return result

end)
ML_Entry:connect_one_way("ML_Moggan",function() return HasNet() end)
ML_Volcano:connect_one_way("ML_Barney",function() return HasNet() end)
ML_Volcano:connect_one_way("ML_Mattie",function() return HasNet() end)
ML_Triceratops:connect_one_way("ML_Rocky",function()
    result = any(
                Eval_Logic((HasSling() and (HasClub() or HasPunch()) and HasNet()),0),
                Eval_Logic((HasSling() and HasNet()),1)
               )
    return result

end)

--Coins
ML_Entry:connect_one_way("ML_C_Entry",true)

--Mailboxes
ML_Entry:connect_one_way("ML_M_Surrounded by a Cliff",true)
ML_Entry:connect_one_way("ML_M_Energy Chips",function() return CanHitOnce() end)
ML_Volcano:connect_one_way("ML_M_The T-Rex is Aggressive",true)
ML_Triceratops:connect_one_way("ML_M_Did I Give You That Yet?",true)
ML_Triceratops:connect_one_way("ML_M_Hit the Bombs!",function() return HasSling() end)
