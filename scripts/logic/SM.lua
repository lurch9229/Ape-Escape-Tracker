-- time_station = apeescape_location.new("time_station")
local SM_ENTRY = apeescape_location.new("SM_ENTRY")
--local ts_minigame = apeescape_location.new("ts_minigame")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - SM",SM_ENTRY,function() return SM_Access() end)
--Entrances (None,One room level)

--Monkeys
SM_ENTRY:connect_one_way("SM_Popcicle",function() return HasNet() end)
SM_ENTRY:connect_one_way("SM_Iced",function() return CanHitOnce() and HasNet() end)
SM_ENTRY:connect_one_way("SM_Rickets",function()
    result = any(
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic((HasSling() or (HasClub() and HasFlyer())) and HasNet(),1),
                Eval_Logic(((HasSling() or HasPunch() or (HasClub() and HasFlyer())) and HasNet()),2)
               )
    return result

end)

SM_ENTRY:connect_one_way("SM_Skeens",function()
    result = any(
                Eval_Logic(((CanHitMultiple(0) or HasFlyer()) and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)
SM_ENTRY:connect_one_way("SM_Denggoy",function()
    result = any(
                Eval_Logic(((CanHitMultiple(0) or HasFlyer()) and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)
SM_ENTRY:connect_one_way("SM_Chilly",function()
    result = any(
                Eval_Logic(((CanHitMultiple(0) or HasFlyer()) and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)
--Coins
SM_ENTRY:connect_one_way("SM_C_Main",true)

--Mailboxes
SM_ENTRY:connect_one_way("SM_M_Severely Cold Sea",true)
SM_ENTRY:connect_one_way("SM_M_You Are Lost!",function() return CanHitOnce() end)
SM_ENTRY:connect_one_way("SM_M_This Hazardous Thing",function()
    result = any(
                Eval_Logic((CanHitMultiple(0) or HasFlyer()),0),
                Eval_Logic(true,1)
               )
    return result

end)
