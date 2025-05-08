-- time_station = apeescape_location.new("time_station")
local SF_ENTRY = apeescape_location.new("SF_ENTRY")

local SF_OUTSIDE_FACTORY = apeescape_location.new("SF_OUTSIDE_FACTORY")
local SF_FACTORY_OUTSIDE = apeescape_location.new("SF_FACTORY_OUTSIDE")
local SF_FACTORY_RC_CAR = apeescape_location.new("SF_FACTORY_RC_CAR")
local SF_FACTORY_WHEEL_BOTTOM = apeescape_location.new("SF_FACTORY_WHEEL_BOTTOM")
local SF_FACTORY_WHEEL_TOP = apeescape_location.new("SF_FACTORY_WHEEL_TOP")
local SF_FACTORY_MECH = apeescape_location.new("SF_FACTORY_MECH")
local SF_RC_CAR_FACTORY = apeescape_location.new("SF_RC_CAR_FACTORY")
local SF_WHEEL_FACTORY_BOTTOM = apeescape_location.new("SF_WHEEL_FACTORY_BOTTOM")
local SF_WHEEL_FACTORY_TOP = apeescape_location.new("SF_WHEEL_FACTORY_TOP")
local SF_MECH_FACTORY = apeescape_location.new("SF_MECH_FACTORY")
local SF_MECH_LAVA = apeescape_location.new("SF_MECH_LAVA")
local SF_LAVA_MECH = apeescape_location.new("SF_LAVA_MECH")
local SF_LAVA_CONVEYOR = apeescape_location.new("SF_LAVA_CONVEYOR")
local SF_CONVEYOR_LAVA = apeescape_location.new("SF_CONVEYOR_LAVA")
local SF_CONVEYOR1_ENTRY = apeescape_location.new("SF_CONVEYOR1_ENTRY")
local SF_CONVEYOR2_ENTRY = apeescape_location.new("SF_CONVEYOR2_ENTRY")
local SF_CONVEYOR3_ENTRY = apeescape_location.new("SF_CONVEYOR3_ENTRY")
local SF_CONVEYOR4_ENTRY = apeescape_location.new("SF_CONVEYOR4_ENTRY")
local SF_CONVEYOR5_ENTRY = apeescape_location.new("SF_CONVEYOR5_ENTRY")
local SF_CONVEYOR6_ENTRY = apeescape_location.new("SF_CONVEYOR6_ENTRY")
local SF_CONVEYOR7_ENTRY = apeescape_location.new("SF_CONVEYOR7_ENTRY")
local SF_CONVEYOR1_EXIT = apeescape_location.new("SF_CONVEYOR1_EXIT")
local SF_CONVEYOR2_EXIT = apeescape_location.new("SF_CONVEYOR2_EXIT")
local SF_CONVEYOR3_EXIT = apeescape_location.new("SF_CONVEYOR3_EXIT")
local SF_CONVEYOR4_EXIT = apeescape_location.new("SF_CONVEYOR4_EXIT")
local SF_CONVEYOR5_EXIT = apeescape_location.new("SF_CONVEYOR5_EXIT")
local SF_CONVEYOR6_EXIT = apeescape_location.new("SF_CONVEYOR6_EXIT")


--TS Main Hub
time_station:connect_one_way_entrance("Time Station - SF",SF_ENTRY,function() return SF_Access() end)

--Entrances
SF_OUTSIDE_FACTORY:connect_one_way_entrance("SF_OUTSIDE_FACTORY_to_SF_FACTORY_OUTSIDE",SF_FACTORY_OUTSIDE,true)
SF_FACTORY_OUTSIDE:connect_one_way_entrance("SF_FACTORY_OUTSIDE_to_SF_OUTSIDE_FACTORY",SF_OUTSIDE_FACTORY,true)
SF_FACTORY_RC_CAR:connect_one_way_entrance("SF_FACTORY_RC_CAR_to_SF_RC_CAR_FACTORY",SF_RC_CAR_FACTORY,true)
SF_FACTORY_WHEEL_BOTTOM:connect_one_way_entrance("SF_FACTORY_WHEEL_BOTTOM_to_SF_WHEEL_FACTORY_BOTTOM",SF_WHEEL_FACTORY_BOTTOM,true)
SF_FACTORY_WHEEL_TOP:connect_one_way_entrance("SF_FACTORY_WHEEL_TOP_to_SF_WHEEL_FACTORY_TOP",SF_WHEEL_FACTORY_TOP,true)
SF_FACTORY_MECH:connect_one_way_entrance("SF_FACTORY_MECH_to_SF_MECH_FACTORY",SF_MECH_FACTORY,true)
SF_RC_CAR_FACTORY:connect_one_way_entrance("SF_RC_CAR_FACTORY_to_SF_FACTORY_RC_CAR",SF_FACTORY_RC_CAR,true)
SF_WHEEL_FACTORY_BOTTOM:connect_one_way_entrance("SF_WHEEL_FACTORY_BOTTOM_to_SF_FACTORY_WHEEL_BOTTOM",SF_FACTORY_WHEEL_BOTTOM,true)
SF_WHEEL_FACTORY_TOP:connect_one_way_entrance("SF_WHEEL_FACTORY_TOP_to_SF_FACTORY_WHEEL_TOP",SF_FACTORY_WHEEL_TOP,true)
SF_MECH_FACTORY:connect_one_way_entrance("SF_MECH_FACTORY_to_SF_FACTORY_MECH",SF_FACTORY_MECH,true)
SF_MECH_LAVA:connect_one_way_entrance("SF_MECH_LAVA_to_SF_LAVA_MECH",SF_LAVA_MECH,true)
SF_LAVA_MECH:connect_one_way_entrance("SF_LAVA_MECH_to_SF_MECH_LAVA",SF_MECH_LAVA,true)
SF_LAVA_CONVEYOR:connect_one_way_entrance("SF_LAVA_CONVEYOR_to_SF_CONVEYOR_LAVA",SF_CONVEYOR_LAVA,true)
SF_CONVEYOR_LAVA:connect_one_way_entrance("SF_CONVEYOR_LAVA_to_SF_LAVA_CONVEYOR",SF_LAVA_CONVEYOR,true)
SF_CONVEYOR1_ENTRY:connect_one_way_entrance("SF_CONVEYOR1_ENTRY_to_SF_CONVEYOR1_EXIT",SF_CONVEYOR1_EXIT,true)
SF_CONVEYOR2_ENTRY:connect_one_way_entrance("SF_CONVEYOR2_ENTRY_to_SF_CONVEYOR1_EXIT",SF_CONVEYOR1_EXIT,true)
SF_CONVEYOR3_ENTRY:connect_one_way_entrance("SF_CONVEYOR3_ENTRY_to_SF_CONVEYOR2_EXIT",SF_CONVEYOR2_EXIT,true)
SF_CONVEYOR4_ENTRY:connect_one_way_entrance("SF_CONVEYOR4_ENTRY_to_SF_CONVEYOR3_EXIT",SF_CONVEYOR3_EXIT,true)
SF_CONVEYOR5_ENTRY:connect_one_way_entrance("SF_CONVEYOR5_ENTRY_to_SF_CONVEYOR4_EXIT",SF_CONVEYOR4_EXIT,true)
SF_CONVEYOR6_ENTRY:connect_one_way_entrance("SF_CONVEYOR6_ENTRY_to_SF_CONVEYOR5_EXIT",SF_CONVEYOR5_EXIT,true)
SF_CONVEYOR7_ENTRY:connect_one_way_entrance("SF_CONVEYOR7_ENTRY_to_SF_CONVEYOR6_EXIT",SF_CONVEYOR6_EXIT,true)




--Outside
SF_ENTRY:connect_one_way_entrance("SF_ENTRY_to_SF_OUTSIDE_FACTORY",SF_OUTSIDE_FACTORY,true)
SF_OUTSIDE_FACTORY:connect_one_way_entrance("SF_OUTSIDE_FACTORY_to_SF_ENTRY",SF_ENTRY,function() return HasFlyer() or HasPunch() end)

--Main Factory
SF_FACTORY_OUTSIDE:connect_one_way_entrance("SF_FACTORY_OUTSIDE_to_SF_FACTORY_RC_CAR",SF_FACTORY_RC_CAR,true)
SF_FACTORY_WHEEL_BOTTOM:connect_one_way_entrance("SF_FACTORY_WHEEL_BOTTOM_to_SF_FACTORY_RC_CAR",SF_FACTORY_RC_CAR,true)
SF_FACTORY_RC_CAR:connect_one_way_entrance("SF_FACTORY_RC_CAR_to_SF_FACTORY_OUTSIDE",SF_FACTORY_OUTSIDE,true)
SF_FACTORY_RC_CAR:connect_one_way_entrance("SF_FACTORY_RC_CAR_to_SF_FACTORY_WHEEL_BOTTOM",SF_FACTORY_WHEEL_BOTTOM,function() return SF_Lamp() end)

SF_FACTORY_RC_CAR:connect_one_way_entrance("SF_FACTORY_RC_CAR_to_SF_FACTORY_WHEEL_TOP",SF_FACTORY_WHEEL_TOP,function()
    result = any(
                Eval_Logic((IJ()),0),
                Eval_Logic(((HasHoop() and HasFlyer()) or SuperFlyer(SF_FACTORY_RC_CAR,1) or IJ()),1),
                Eval_Logic((HasFlyer() or IJ()),2)
               )
    return result

end)
SF_FACTORY_WHEEL_TOP:connect_one_way_entrance("SF_FACTORY_WHEEL_TOP_to_SF_FACTORY_RC_CAR",SF_FACTORY_RC_CAR,true)
SF_FACTORY_WHEEL_TOP:connect_one_way_entrance("SF_FACTORY_WHEEL_TOP_to_SF_FACTORY_MECH",SF_FACTORY_MECH,function()
    result = any(
                Eval_Logic((CanHitWheel(0)),0),
                Eval_Logic((CanHitWheel(1) or SuperFlyer(SF_FACTORY_WHEEL_TOP,1)),1),
                Eval_Logic((CanHitWheel(2)),2)
               )
    return result

end)
SF_FACTORY_MECH:connect_one_way_entrance("SF_FACTORY_MECH_to_SF_FACTORY_WHEEL_TOP",SF_FACTORY_WHEEL_TOP,function()return CanHitWheel() end)

-- Triple Wheel
SF_WHEEL_FACTORY_BOTTOM:connect_one_way_entrance("SF_WHEEL_FACTORY_BOTTOM_to_SF_WHEEL_FACTORY_TOP",SF_WHEEL_FACTORY_TOP,function()
    result = any(
                Eval_Logic((HasClub() or ((HasSling() or HasPunch()) and HasFlyer())),0),
                Eval_Logic((HasClub() or ((HasSling() or HasPunch() or HasHoop()) and HasFlyer()) or SuperFlyer(SF_WHEEL_FACTORY_BOTTOM,1)),1),
                Eval_Logic((HasClub() or HasHoop() or HasFlyer() or IJ() or (HasPunch() and (HasRadar() or HasSling() or HasRC() or HasNet()))),2)
               )
    return result

end)
SF_WHEEL_FACTORY_TOP:connect_one_way_entrance("SF_WHEEL_FACTORY_TOP_to_SF_WHEEL_FACTORY_BOTTOM",SF_WHEEL_FACTORY_BOTTOM,true)
-- Mech Room
SF_MECH_FACTORY:connect_one_way_entrance("SF_MECH_FACTORY_to_SF_MECH_LAVA",SF_MECH_LAVA,true)
SF_MECH_LAVA:connect_one_way_entrance("SF_MECH_LAVA_to_SF_MECH_FACTORY",SF_MECH_FACTORY,true)
-- Lava Room
SF_LAVA_MECH:connect_one_way_entrance("SF_LAVA_MECH_to_SF_LAVA_CONVEYOR",SF_LAVA_CONVEYOR,function()
    result = any(
                Eval_Logic((CanHitWheel(0)),0),
                Eval_Logic((CanHitWheel(1) or HasFlyer()),1),
                Eval_Logic((CanHitWheel(2)),2)
               )
    return result

end)
SF_LAVA_CONVEYOR:connect_one_way_entrance("SF_LAVA_CONVEYOR_to_SF_LAVA_MECH",SF_LAVA_MECH,true)

-- Conveyor Room
SF_CONVEYOR1_EXIT:connect_one_way_entrance("SF_CONVEYOR1_EXIT_to_SF_CONVEYOR_LAVA",SF_CONVEYOR_LAVA,true)
SF_CONVEYOR2_EXIT:connect_one_way_entrance("SF_CONVEYOR2_EXIT_to_SF_CONVEYOR_LAVA",SF_CONVEYOR_LAVA,true)
SF_CONVEYOR3_EXIT:connect_one_way_entrance("SF_CONVEYOR3_EXIT_to_SF_CONVEYOR_LAVA",SF_CONVEYOR_LAVA,true)
SF_CONVEYOR4_EXIT:connect_one_way_entrance("SF_CONVEYOR4_EXIT_to_SF_CONVEYOR_LAVA",SF_CONVEYOR_LAVA,true)
SF_CONVEYOR5_EXIT:connect_one_way_entrance("SF_CONVEYOR5_EXIT_to_SF_CONVEYOR_LAVA",SF_CONVEYOR_LAVA,true)
SF_CONVEYOR6_EXIT:connect_one_way_entrance("SF_CONVEYOR6_EXIT_to_SF_CONVEYOR_LAVA",SF_CONVEYOR_LAVA,true)
SF_CONVEYOR_LAVA:connect_one_way_entrance("SF_CONVEYOR_LAVA_to_SF_CONVEYOR1_ENTRY",SF_CONVEYOR1_ENTRY,true)
SF_CONVEYOR_LAVA:connect_one_way_entrance("SF_CONVEYOR_LAVA_to_SF_CONVEYOR2_ENTRY",SF_CONVEYOR2_ENTRY,true)
SF_CONVEYOR_LAVA:connect_one_way_entrance("SF_CONVEYOR_LAVA_to_SF_CONVEYOR3_ENTRY",SF_CONVEYOR3_ENTRY,true)
SF_CONVEYOR_LAVA:connect_one_way_entrance("SF_CONVEYOR_LAVA_to_SF_CONVEYOR4_ENTRY",SF_CONVEYOR4_ENTRY,true)
SF_CONVEYOR_LAVA:connect_one_way_entrance("SF_CONVEYOR_LAVA_to_SF_CONVEYOR5_ENTRY",SF_CONVEYOR5_ENTRY,true)
SF_CONVEYOR_LAVA:connect_one_way_entrance("SF_CONVEYOR_LAVA_to_SF_CONVEYOR6_ENTRY",SF_CONVEYOR6_ENTRY,true)
SF_CONVEYOR_LAVA:connect_one_way_entrance("SF_CONVEYOR_LAVA_to_SF_CONVEYOR7_ENTRY",SF_CONVEYOR7_ENTRY,true)


--Monkeys
-- Outside
SF_ENTRY:connect_one_way("SF_BigShow",function() return HasNet() end)
SF_OUTSIDE_FACTORY:connect_one_way("SF_Dreos",function() return HasNet() end)
SF_OUTSIDE_FACTORY:connect_one_way("SF_BigShow2",function()
    result = any(
                Eval_Logic(((HasSling() or HasPunch()) and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)


-- Factory
SF_FACTORY_WHEEL_TOP:connect_one_way("SF_Reznor",function() return HasNet() end)
-- Car Room
SF_RC_CAR_FACTORY:connect_one_way("SF_Urkel",function()
    result = any(
                Eval_Logic(((HasRC() or HasPunch() or IJ()) and HasNet()),0),
                Eval_Logic(((HasRC() or HasPunch() or IJ() or SuperFlyer(SF_RC_CAR_FACTORY,1) or (HasHoop() and HasFlyer())) and HasNet()),1)
               )
    return result

end)
-- Lava Room
SF_LAVA_MECH:connect_one_way("SF_VanillaS",function() return HasPunch() and HasNet() end)
SF_LAVA_MECH:connect_one_way("SF_Radd",function()
    result = any(
                Eval_Logic((CanHitWheel(0) and HasNet()),0),
                Eval_Logic(((CanHitWheel(1) or HasFlyer()) and HasNet()),1),
                Eval_Logic((CanHitWheel(2) and HasNet()),2)
               )
    return result

end)
SF_LAVA_MECH:connect_one_way("SF_Shimbo",function()
    result = any(
                Eval_Logic((HasRC() and HasNet()),0),
                Eval_Logic(((HasRC() or HasSling()) and HasNet()),1),
                Eval_Logic((HasNet()),2)
               )
    return result

end)
-- Conveyor Room
SF_CONVEYOR_LAVA:connect_one_way("SF_Hurt",function()
    result = any(
                Eval_Logic(((HasClub() or HasPunch()) and HasNet()),0),
                Eval_Logic(((HasClub() or HasPunch() or HasSling()) and HasNet()),1),
                Eval_Logic(((HasClub() or HasPunch() or HasSling() or HasHoop() or HasRC()) and HasNet()),2)
               )
    return result

end)
SF_CONVEYOR_LAVA:connect_one_way("SF_String",function() return HasNet() end)
-- Mech Room
SF_MECH_FACTORY:connect_one_way("SF_Khamo",function()
    result = any(
                Eval_Logic(((HasClub() or HasPunch()) and HasNet()),0),
                Eval_Logic(((HasClub() or HasPunch() or HasSling()) and HasNet()),1),
                Eval_Logic(((HasClub() or HasPunch() or HasSling() or HasHoop() or HasRC()) and HasNet()),2)
               )
    return result

end)
--Coins

SF_RC_CAR_FACTORY:connect_one_way("SF_C_RC Car Room",function()
    result = any(
                Eval_Logic((HasRC() or HasPunch() or IJ()),0),
                Eval_Logic((HasRC() or HasPunch() or IJ() or SuperFlyer(SF_RC_CAR_FACTORY,1) or (HasHoop() and HasFlyer())),1)
               )
    return result

end)
SF_LAVA_MECH:connect_one_way("SF_C_Lava Room",function()
    result = any(
                Eval_Logic((CanHitWheel(0)),0),
                Eval_Logic((CanHitWheel(1) or HasFlyer()),1),
                Eval_Logic((CanHitWheel(2)),2)
               )
    return result

end)

--Mailboxes
SF_ENTRY:connect_one_way("SF_M_Hop In The Tank",true)
