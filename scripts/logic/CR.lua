-- time_station = apeescape_location.new("time_station")
local CR_ENTRY = apeescape_location.new("CR_ENTRY")

local CR_ENTRY_SIDE_ROOM = apeescape_location.new("CR_ENTRY_SIDE_ROOM")
local CR_ENTRY_MAIN_RUINS = apeescape_location.new("CR_ENTRY_MAIN_RUINS")
local CR_SIDE_ROOM_ENTRY = apeescape_location.new("CR_SIDE_ROOM_ENTRY")
local CR_MAIN_RUINS_ENTRY = apeescape_location.new("CR_MAIN_RUINS_ENTRY")
local CR_MAIN_RUINS_PILLAR_ROOM = apeescape_location.new("CR_MAIN_RUINS_PILLAR_ROOM")
local CR_PILLAR_ROOM_MAIN_RUINS = apeescape_location.new("CR_PILLAR_ROOM_MAIN_RUINS")

local CR_ENTRYOBA = apeescape_location.new("CR_ENTRYOBA")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - CR",CR_ENTRY,function() return CR_Access() end)

--Entrances
CR_ENTRY_SIDE_ROOM:connect_one_way_entrance("CR_ENTRY_SIDE_ROOM_to_CR_SIDE_ROOM_ENTRY",CR_SIDE_ROOM_ENTRY,true)
CR_ENTRY_MAIN_RUINS:connect_one_way_entrance("CR_ENTRY_MAIN_RUINS_to_CR_MAIN_RUINS_ENTRY",CR_MAIN_RUINS_ENTRY,true)
CR_SIDE_ROOM_ENTRY:connect_one_way_entrance("CR_SIDE_ROOM_ENTRY_to_CR_ENTRY_SIDE_ROOM",CR_ENTRY_SIDE_ROOM,true)
CR_MAIN_RUINS_ENTRY:connect_one_way_entrance("CR_MAIN_RUINS_ENTRY_to_CR_ENTRY_MAIN_RUINS",CR_ENTRY_MAIN_RUINS,true)
CR_MAIN_RUINS_PILLAR_ROOM:connect_one_way_entrance("CR_MAIN_RUINS_PILLAR_ROOM_to_CR_PILLAR_ROOM_MAIN_RUINS",CR_PILLAR_ROOM_MAIN_RUINS,true)
CR_PILLAR_ROOM_MAIN_RUINS:connect_one_way_entrance("CR_PILLAR_ROOM_MAIN_RUINS_to_CR_MAIN_RUINS_PILLAR_ROOM",CR_MAIN_RUINS_PILLAR_ROOM,true)

CR_ENTRY:connect_one_way_entrance("CR_ENTRY_to_CR_ENTRYOBA",CR_ENTRYOBA,function() return CanHitOnce() end)
CR_ENTRY_SIDE_ROOM:connect_one_way_entrance("CR_ENTRY_SIDE_ROOM_to_CR_ENTRYOBA",CR_ENTRYOBA,true)
CR_ENTRY_MAIN_RUINS:connect_one_way_entrance("CR_ENTRY_MAIN_RUINS_to_CR_ENTRYOBA",CR_ENTRYOBA,true)
CR_ENTRYOBA:connect_one_way_entrance("CR_ENTRYOBA_to_CR_ENTRY_SIDE_ROOM",CR_ENTRY_SIDE_ROOM,function() return CanHitOnce() end)
CR_ENTRYOBA:connect_one_way_entrance("CR_ENTRYOBA_to_CR_ENTRY_MAIN_RUINS",CR_ENTRY_MAIN_RUINS,function() return CanHitOnce() end)
CR_ENTRYOBA:connect_one_way_entrance("CR_ENTRYOBA_to_CR_ENTRY",CR_ENTRY,function()
    result = any(
                Eval_Logic((HasFlyer()),0),
                Eval_Logic((HasFlyer() or IJ()),2)
               )
    return result

end)
CR_MAIN_RUINS_ENTRY:connect_one_way_entrance("CR_MAIN_RUINS_ENTRY_to_CR_MAIN_RUINS_PILLAR_ROOM",CR_MAIN_RUINS_PILLAR_ROOM,function() return HasSling() or HasPunch() end)
CR_MAIN_RUINS_PILLAR_ROOM:connect_one_way_entrance("CR_MAIN_RUINS_PILLAR_ROOM_to_CR_MAIN_RUINS_ENTRY",CR_MAIN_RUINS_ENTRY,function() return CanHitOnce() end)

--Monkeys
CR_ENTRY:connect_one_way("CR_Bazzle",function()
    result = any(
                Eval_Logic(((HasSling() or HasFlyer()) and HasNet()),0),
                Eval_Logic((HasNet()),2)
               )
    return result

end)
CR_ENTRY:connect_one_way("CR_Freeto",function() return HasNet() end)
CR_ENTRYOBA:connect_one_way("CR_Freeto2",function() return IJ() and HasPunch() and HasNet() end)

CR_SIDE_ROOM_ENTRY:connect_one_way("CR_Troopa",function()
    result = any(
                Eval_Logic(((HasSling() or HasFlyer()) and HasNet()),0),
                Eval_Logic(((HasFlyer() or HasHoop() or IJ()) and HasNet()),1)
               )
    return result

end)

CR_MAIN_RUINS_PILLAR_ROOM:connect_one_way("CR_Stymie",function() return HasNet() end)
CR_MAIN_RUINS_PILLAR_ROOM:connect_one_way("CR_Spanky",function()
    result = any(
                Eval_Logic(((CanHitWheel(0) or HasFlyer()) and CanSwim() and HasNet()),0),
                Eval_Logic((((CanHitWheel(1) and CanSwim()) or IJ() or HasFlyer()) and HasNet()),1),
                Eval_Logic((((CanHitWheel(2) and CanSwim()) or IJ() or HasHoop() or HasFlyer()) and HasNet()),2)
               )
    return result

end)
CR_MAIN_RUINS_PILLAR_ROOM:connect_one_way("CR_Jesta",function() return ((CanHitWheel() or (HasFlyer() and CanSwim())) and HasNet()) end)

CR_PILLAR_ROOM_MAIN_RUINS:connect_one_way("CR_Pally",function()
    result = any(
                Eval_Logic(((CanHitMultiple(0) or HasFlyer()) and HasNet()),0),
                Eval_Logic((CanHitOnce() and HasNet()),1)
               )
    return result

end)
CR_PILLAR_ROOM_MAIN_RUINS:connect_one_way("CR_Crash",function()
    result = any(
                Eval_Logic((HasRC() and HasNet()),0),
                Eval_Logic(((HasRC() or HasSling() or SuperFlyer(CR_PILLAR_ROOM_MAIN_RUINS,1)) and HasNet()),1)
               )
    return result

end)


--Coins

CR_MAIN_RUINS_PILLAR_ROOM:connect_one_way("CR_C_Main Ruins",function()
    result = any(
                Eval_Logic(((CanHitWheel(0) and CanSwim()) or IJ() or HasFlyer()),0),
                Eval_Logic(((CanHitWheel(2) and CanSwim()) or IJ() or HasFlyer() or HasHoop()),2)
               )
    return result

end)

--Mailboxes
CR_ENTRY:connect_one_way("CR_M_Get Rid of the Enemy",function() return CanHitOnce() end)
CR_ENTRY:connect_one_way("CR_M_Don't Forget Your Sling",true)
CR_MAIN_RUINS_PILLAR_ROOM:connect_one_way("CR_M_Back Camera Tutorial",function() return CanHitOnce() end)
CR_MAIN_RUINS_PILLAR_ROOM:connect_one_way("CR_M_Remember to Save",function() return ((CanHitWheel() or HasFlyer()) and CanSwim()) end)
CR_PILLAR_ROOM_MAIN_RUINS:connect_one_way("CR_M_Come Back Later!",function() return CanHitOnce() end)
