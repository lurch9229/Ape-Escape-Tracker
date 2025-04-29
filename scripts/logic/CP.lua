-- time_station = apeescape_location.new("time_station")
local CP_ENTRY = apeescape_location.new("CP_ENTRY")

local CP_OUTSIDE_SEWERS_FRONT = apeescape_location.new("CP_OUTSIDE_SEWERS_FRONT")
local CP_OUTSIDE_BARREL = apeescape_location.new("CP_OUTSIDE_BARREL")
local CP_SEWERSFRONT_OUTSIDE = apeescape_location.new("CP_SEWERSFRONT_OUTSIDE")
local CP_SEWERSFRONT_BARREL = apeescape_location.new("CP_SEWERSFRONT_BARREL")
local CP_BARREL_OUTSIDE = apeescape_location.new("CP_BARREL_OUTSIDE")
local CP_BARREL_SEWERS_FRONT = apeescape_location.new("CP_BARREL_SEWERS_FRONT")
local CP_BARRELSEWERMIDDLE = apeescape_location.new("CP_BARRELSEWERMIDDLE")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - CP",CP_ENTRY,function() return CP_Access() end)

--Entrances
CP_OUTSIDE_SEWERS_FRONT:connect_one_way_entrance("CP_OUTSIDE_SEWERS_FRONT_to_CP_SEWERSFRONT_OUTSIDE",CP_SEWERSFRONT_OUTSIDE,true)
CP_OUTSIDE_BARREL:connect_one_way_entrance("CP_OUTSIDE_BARREL_to_CP_BARREL_OUTSIDE",CP_BARREL_OUTSIDE,true)
CP_SEWERSFRONT_OUTSIDE:connect_one_way_entrance("CP_SEWERSFRONT_OUTSIDE_to_CP_OUTSIDE_SEWERS_FRONT",CP_OUTSIDE_SEWERS_FRONT,true)
CP_SEWERSFRONT_BARREL:connect_one_way_entrance("CP_SEWERSFRONT_BARREL_to_CP_BARREL_SEWERS_FRONT",CP_BARREL_SEWERS_FRONT,true)
CP_BARREL_OUTSIDE:connect_one_way_entrance("CP_BARREL_OUTSIDE_to_CP_OUTSIDE_BARREL",CP_OUTSIDE_BARREL,true)
CP_BARREL_SEWERS_FRONT:connect_one_way_entrance("CP_BARREL_SEWERS_FRONT_to_CP_SEWERSFRONT_BARREL",CP_SEWERSFRONT_BARREL,true)

CP_ENTRY:connect_one_way_entrance("CP_ENTRY_to_CP_OUTSIDE_SEWERS_FRONT",CP_OUTSIDE_SEWERS_FRONT,function() return CP_Lamp() end)
CP_ENTRY:connect_one_way_entrance("CP_ENTRY_to_CP_OUTSIDE_BARREL",CP_OUTSIDE_BARREL,function()
    result = any(
                Eval_Logic(((IJ() and CanDive())),0),
                Eval_Logic(((IJ() or HasFlyer()) and CanDive()),1)
               )
    return result

end)
--Outside
CP_OUTSIDE_SEWERS_FRONT:connect_one_way_entrance("CP_OUTSIDE_SEWERS_FRONT_to_CP_ENTRY",CP_ENTRY,true)
CP_OUTSIDE_BARREL:connect_one_way_entrance("CP_OUTSIDE_BARREL_to_CP_ENTRY",CP_ENTRY,function() return CanDive() end)
--Front Sewer
CP_SEWERSFRONT_OUTSIDE:connect_one_way_entrance("CP_SEWERSFRONT_OUTSIDE_to_CP_SEWERSFRONT_BARREL",CP_SEWERSFRONT_BARREL,function()
    result = any(
                Eval_Logic((HasRC() and (CanSwim() or HasFlyer())),0),
                Eval_Logic(((HasRC() or IJ()) and (CanSwim() or HasFlyer() or HasHoop())),1),
                Eval_Logic(((HasRC() or IJ() or SuperFlyer(CP_SEWERSFRONT_OUTSIDE,2)) and (CanSwim() or HasFlyer() or HasHoop())),2)
               )
    return result

end)
CP_SEWERSFRONT_BARREL:connect_one_way_entrance("CP_SEWERSFRONT_BARREL_to_CP_SEWERSFRONT_OUTSIDE",CP_SEWERSFRONT_OUTSIDE,function()
    result = any(
                Eval_Logic((HasRC() and (CanSwim() or HasFlyer())),0),
                Eval_Logic((HasRC() or IJ()),1),
                Eval_Logic((HasRC() or IJ() or (HasHoop() and HasFlyer())),2)
               )
    return result

end)
-- Back Sewer
CP_BARREL_SEWERS_FRONT:connect_one_way_entrance("CP_BARREL_SEWERS_FRONT_to_CP_BARRELSEWERMIDDLE",CP_BARRELSEWERMIDDLE,function()
    result = any(
                Eval_Logic((HasFlyer() or IJ()),0),
                Eval_Logic((true),2)
               )
    return result

end)
CP_BARREL_OUTSIDE:connect_one_way_entrance("CP_BARREL_OUTSIDE_to_CP_BARRELSEWERMIDDLE",CP_BARRELSEWERMIDDLE,function() return CanDive() end)
CP_BARRELSEWERMIDDLE:connect_one_way_entrance("CP_BARRELSEWERMIDDLE_to_CP_BARREL_SEWERS_FRONT",CP_BARREL_SEWERS_FRONT,true)
CP_BARRELSEWERMIDDLE:connect_one_way_entrance("CP_BARRELSEWERMIDDLE_to_CP_BARREL_OUTSIDE",CP_BARREL_OUTSIDE,function() return CanDive() end)

--Monkeys
CP_ENTRY:connect_one_way("CP_Kaine",function()
    result = any(
                Eval_Logic(((HasRC() and HasNet())),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)
CP_ENTRY:connect_one_way("CP_Jaxx",function() return HasNet() end)
CP_ENTRY:connect_one_way("CP_Gehry",function()
    result = any(
                Eval_Logic(((IJ() and HasNet())),0),
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),1)
               )
    return result

end)
CP_ENTRY:connect_one_way("CP_Alcatraz",function() return HasNet() end)
CP_OUTSIDE_BARREL:connect_one_way("CP_Gehry2",function() return CanDive() and HasNet() end)
--Front Sewer
CP_SEWERSFRONT_OUTSIDE:connect_one_way("CP_Tino",function() return HasRC() and HasNet() end)
CP_SEWERSFRONT_OUTSIDE:connect_one_way("CP_QBee",function()
    result = any(
                Eval_Logic(((HasRC() and HasNet())),0),
                Eval_Logic(((HasRC() or IJ() or SuperFlyer(CP_SEWERSFRONT_OUTSIDE,1)) and HasNet()),1)
               )
    return result

end)
CP_SEWERSFRONT_OUTSIDE:connect_one_way("CP_McManic",function() return (HasRC() or HasFlyer() or IJ()) and HasNet() end)
CP_SEWERSFRONT_BARREL:connect_one_way("CP_QBee2",function()
    result = any(
                Eval_Logic((((CanSwim() or HasFlyer()) and HasNet())),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)
CP_SEWERSFRONT_BARREL:connect_one_way("CP_McManic2",function()
    result = any(
                Eval_Logic(((CanSwim() or HasFlyer()) and HasRC() and HasNet()),0),
                Eval_Logic((HasRC() and HasNet()),1),
                Eval_Logic(((HasRC() or IJ() or (HasHoop() and HasFlyer())) and HasNet()),2)
               )
    return result

end)
-- Back Sewer
CP_BARREL_SEWERS_FRONT:connect_one_way("CP_Dywan",function() return HasNet() end)
CP_BARRELSEWERMIDDLE:connect_one_way("CP_CKHutch",function() return CanDive() and HasNet() end)
CP_BARRELSEWERMIDDLE:connect_one_way("CP_Winky",function() return HasNet() or (CanDive() and HasWaterNet()) end)
CP_BARRELSEWERMIDDLE:connect_one_way("CP_BLuv",function()
    result = any(
                Eval_Logic(((CanSwim() or HasFlyer()) and HasNet()),0),
                Eval_Logic(((CanSwim() or HasFlyer() or IJ()) and HasNet()),2)
               )
    return result

end)
CP_BARRELSEWERMIDDLE:connect_one_way("CP_Camper",function()
    result = any(
                Eval_Logic((CanDive() and (HasWaterNet() or HasNet())),0),
                Eval_Logic(((CanDive() and (HasWaterNet() or HasNet())) or ((IJ() or SuperFlyer(CP_BARRELSEWERMIDDLE,2)) and HasRC() and HasNet())),2)
               )
    return result

end)
CP_BARRELSEWERMIDDLE:connect_one_way("CP_Huener",function()
    result = any(
                Eval_Logic((CanSwim() and HasFlyer() and HasNet()),0),
                Eval_Logic(((CanSwim() or HasHoop()) and HasFlyer() and HasNet()),1),
                Eval_Logic((HasFlyer() and HasNet()),2)
               )
    return result

end)
--Coins

CP_ENTRY:connect_one_way("CP_C_Outside",function()
    result = any(
                Eval_Logic((IJ()),0),
                Eval_Logic((HasFlyer() or IJ()),1)
               )
    return result

end)
CP_OUTSIDE_BARREL:connect_one_way("CP_C_Outside2",function() return CanDive() end)
CP_SEWERSFRONT_OUTSIDE:connect_one_way("CP_C_Sewers Front",function()
    result = any(
                Eval_Logic((HasRC()),0),
                Eval_Logic((HasRC() or IJ()),1),
                Eval_Logic((HasRC() or IJ() or (SuperFlyer(CP_SEWERSFRONT_OUTSIDE,2))),2)
               )
    return result

end)
CP_SEWERSFRONT_BARREL:connect_one_way("CP_C_Sewers Front2",function()
    result = any(
                Eval_Logic((HasRC()),0),
                Eval_Logic((HasRC() or IJ() or (HasHoop() and HasFlyer())),2)
               )
    return result

end)
CP_BARRELSEWERMIDDLE:connect_one_way("CP_C_Barrel Room",function() return HasFlyer() or IJ() end)

--Mailboxes