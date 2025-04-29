-- time_station = apeescape_location.new("time_station")
local CCAVE_ENTRY = apeescape_location.new("CCAVE_ENTRY")

local CCAVE_ENTRY_SECOND_ROOM = apeescape_location.new("CCAVE_ENTRY_SECOND_ROOM")
local CCAVE_SECOND_ROOM_ENTRY = apeescape_location.new("CCAVE_SECOND_ROOM_ENTRY")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - CCAVE",CCAVE_ENTRY,function() return CCAVE_Access() end)

--Entrances
CCAVE_ENTRY_SECOND_ROOM:connect_one_way_entrance("CCAVE_ENTRY_SECOND_ROOM_to_CCAVE_SECOND_ROOM_ENTRY",CCAVE_SECOND_ROOM_ENTRY,true)
CCAVE_SECOND_ROOM_ENTRY:connect_one_way_entrance("CCAVE_SECOND_ROOM_ENTRY_to_CCAVE_ENTRY_SECOND_ROOM",CCAVE_ENTRY_SECOND_ROOM,true)
CCAVE_ENTRY:connect_one_way_entrance("CCAVE_ENTRY_to_CCAVE_ENTRY_SECOND_ROOM",CCAVE_ENTRY_SECOND_ROOM,function()
    result = any(
                Eval_Logic((CanSwim()),0),
                Eval_Logic((CanSwim() or IJ() or (HasHoop() and SuperFlyer(CCAVE_ENTRY,2))),2)
               )
    return result

end)
CCAVE_ENTRY_SECOND_ROOM:connect_one_way_entrance("CCAVE_ENTRY_SECOND_ROOM_to_CCAVE_ENTRY",CCAVE_ENTRY,function() return CanSwim() end)

--Monkeys
CCAVE_ENTRY:connect_one_way("CCAVE_Chip",function()
    result = any(
                Eval_Logic((CanSwim() and HasWaterNet()),0),
                Eval_Logic((CanSwim() and (HasNet() or HasWaterNet())),1)
               )
    return result

end)
CCAVE_ENTRY:connect_one_way("CCAVE_Oreo",function()
    result = any(
                Eval_Logic((((((HasHoop() and CanHitMultiple(0)) or HasSling()) and CanSwim()) or HasFlyer()) and HasNet()),0),
                Eval_Logic(((CanSwim() or HasFlyer() or HasHoop() or IJ()) and (CanHitWheel(1) or HasFlyer()) and HasNet()),1)
               )
    return result

end)
CCAVE_ENTRY:connect_one_way("CCAVE_Puddles",function()
    result = any(
                Eval_Logic((CanDive() and HasNet()),0),
                Eval_Logic(((CanDive() or (CanSwim() and IJ()) or SuperFlyer(CCAVE_ENTRY,1)) and HasNet()),1),
                Eval_Logic(((CanDive() or IJ() or SuperFlyer(CCAVE_ENTRY,2) or (HasHoop() and HasFlyer())) and HasNet()),2)
               )
    return result

end)
CCAVE_ENTRY:connect_one_way("CCAVE_Kalama",function()
    result = any(
                Eval_Logic(((((((HasHoop() and CanHitMultiple(0)) or HasSling()) and CanSwim()) or HasFlyer()) and HasNet()) or HasWaterNet()),0),
                Eval_Logic((((HasHoop() or HasFlyer() or IJ()) and HasNet()) or HasWaterNet()),1)
               )
    return result

end)

CCAVE_SECOND_ROOM_ENTRY:connect_one_way("CCAVE_Iz",function() return HasNet() end)
CCAVE_SECOND_ROOM_ENTRY:connect_one_way("CCAVE_BongBong",function()
    result = any(
                Eval_Logic(((CanHitMultiple() or HasHoop()) and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)

CCAVE_SECOND_ROOM_ENTRY:connect_one_way("CCAVE_Jux",function() return HasNet() end)
CCAVE_SECOND_ROOM_ENTRY:connect_one_way("CCAVE_Pickles",function()
    result = any(
                Eval_Logic(((HasClub() or HasSling() or HasPunch()) and HasNet()),0),
                Eval_Logic(((HasClub() or HasSling() or HasRC() or HasPunch()) and HasNet()),1)
               )
    return result

end)

--Coins
CCAVE_SECOND_ROOM_ENTRY:connect_one_way("CCAVE_C_Second Room",function()
    result = any(
                Eval_Logic((CanDive()),0),
                Eval_Logic((CanDive() or HasRC()),1)
               )
    return result

end)

--Mailboxes
CCAVE_SECOND_ROOM_ENTRY:connect_one_way("CCAVE_M_Yellow Pants",function() return CanHitOnce() end)
CCAVE_SECOND_ROOM_ENTRY:connect_one_way("CCAVE_M_Red Pants",function() return CanHitOnce() end)