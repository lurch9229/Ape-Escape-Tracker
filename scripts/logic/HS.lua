-- time_station = apeescape_location.new("time_station")
local HS_ENTRY = apeescape_location.new("HS_ENTRY")

local HS_ENTRY_HOT_SPRING = apeescape_location.new("HS_ENTRY_HOT_SPRING")
local HS_ENTRY_POLAR_BEAR_CAVE = apeescape_location.new("HS_ENTRY_POLAR_BEAR_CAVE")
local HS_HOT_SPRING = apeescape_location.new("HS_HOT_SPRING")
local HS_POLAR_BEAR_CAVE = apeescape_location.new("HS_POLAR_BEAR_CAVE")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - HS",HS_ENTRY,function() return HS_Access() end)

--Entrances

HS_ENTRY_HOT_SPRING:connect_one_way_entrance("HS_ENTRY_HOT_SPRING_to_HS_HOT_SPRING",HS_HOT_SPRING,true)
HS_ENTRY_POLAR_BEAR_CAVE:connect_one_way_entrance("HS_ENTRY_POLAR_BEAR_CAVE_to_HS_POLAR_BEAR_CAVE",HS_POLAR_BEAR_CAVE,true)
HS_HOT_SPRING:connect_one_way_entrance("HS_HOT_SPRING_to_HS_ENTRY_HOT_SPRING",HS_ENTRY_HOT_SPRING,true)
HS_POLAR_BEAR_CAVE:connect_one_way_entrance("HS_POLAR_BEAR_CAVE_to_HS_ENTRY_POLAR_BEAR_CAVE",HS_ENTRY_POLAR_BEAR_CAVE,true)

HS_ENTRY:connect_one_way_entrance("HS_ENTRY_to_HS_ENTRY_HOT_SPRING",HS_ENTRY_HOT_SPRING,function()
    result = any(
                Eval_Logic((HasFlyer()),0),
                Eval_Logic((HasFlyer() or IJ()),2)
               )
    return result

end)
HS_ENTRY:connect_one_way_entrance("HS_ENTRY_to_HS_ENTRY_POLAR_BEAR_CAVE",HS_ENTRY_POLAR_BEAR_CAVE,true)
HS_ENTRY_HOT_SPRING:connect_one_way_entrance("HS_ENTRY_HOT_SPRING_to_HS_ENTRY",HS_ENTRY,true)
HS_ENTRY_POLAR_BEAR_CAVE:connect_one_way_entrance("HS_ENTRY_POLAR_BEAR_CAVE_to_HS_ENTRY",HS_ENTRY,true)

--Monkeys
HS_ENTRY:connect_one_way("HS_Punky",function() return HasNet() end)
HS_ENTRY:connect_one_way("HS_Ameego",function() return CanDive() and HasNet() end)
HS_ENTRY:connect_one_way("HS_Yoky",function()
    result = any(
                Eval_Logic((HasFlyer() and HasNet()),0),
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),1)
               )
    return result

end)
HS_ENTRY:connect_one_way("HS_Jory",function()
    result = any(
                Eval_Logic((HasFlyer() and HasNet()),0),
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),1)
               )
    return result

end)

--Alternate rules for 2 monkeys
HS_ENTRY_HOT_SPRING:connect_one_way("HS_Yoky2",function() return HasNet() end)
HS_ENTRY_HOT_SPRING:connect_one_way("HS_Jory2",function() return HasNet() end)

HS_HOT_SPRING:connect_one_way("HS_Crank",function() return HasNet() end)
HS_HOT_SPRING:connect_one_way("HS_Claxter",function() return HasNet() end)
HS_HOT_SPRING:connect_one_way("HS_Looza",function() return HasNet() end)

HS_POLAR_BEAR_CAVE:connect_one_way("HS_Roti",function()
    result = any(
                Eval_Logic((CanHitMultiple(0) and HasNet()),0),
                Eval_Logic(((CanHitMultiple(1) or IJ() or SuperFlyer(HS_POLAR_BEAR_CAVE,1)) and HasNet()),1)
               )
    return result

end)
HS_POLAR_BEAR_CAVE:connect_one_way("HS_Dissa",function()
    result = any(
                Eval_Logic((CanHitMultiple(0) and HasNet()),0),
                Eval_Logic(((CanHitMultiple(1) or IJ() or SuperFlyer(HS_POLAR_BEAR_CAVE,1)) and HasNet()),1)
               )
    return result

end)

--Coins
HS_HOT_SPRING:connect_one_way("HS_C_Hot Spring",true)
HS_POLAR_BEAR_CAVE:connect_one_way("HS_C_Polar Bear Cave",function()
    result = any(
                Eval_Logic((CanHitMultiple(0)),0),
                Eval_Logic((CanHitMultiple(1) or IJ() or SuperFlyer(HS_POLAR_BEAR_CAVE,1)),1)
               )
    return result

end)

--Mailboxes
HS_ENTRY:connect_one_way("HS_M_Ice Bridge Ahead",function() return (HasFlyer() or IJ()) and CanHitOnce() end)
HS_HOT_SPRING:connect_one_way("HS_M_Wonderful Hot Springs!!",function() return CanHitOnce() end)
HS_POLAR_BEAR_CAVE:connect_one_way("HS_M_Blocked by an Ice Column",true)