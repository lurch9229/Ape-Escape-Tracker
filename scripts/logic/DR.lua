-- time_station = apeescape_location.new("time_station")
local DR_ENTRY = apeescape_location.new("DR_ENTRY")

local DR_OUTSIDE_FENCE = apeescape_location.new("DR_OUTSIDE_FENCE")
local DR_OUTSIDE_HOLE = apeescape_location.new("DR_OUTSIDE_HOLE")
local DR_OUTSIDE_OBELISK_BOTTOM = apeescape_location.new("DR_OUTSIDE_OBELISK_BOTTOM")
local DR_OUTSIDE_OBELISK_TOP = apeescape_location.new("DR_OUTSIDE_OBELISK_TOP")
local DR_OUTSIDE_WATER_BUTTON = apeescape_location.new("DR_OUTSIDE_WATER_BUTTON")
local DR_OUTSIDE_WATER_LEDGE = apeescape_location.new("DR_OUTSIDE_WATER_LEDGE")
local DR_FAN_OUTSIDE_FENCE = apeescape_location.new("DR_FAN_OUTSIDE_FENCE")
local DR_FAN_OUTSIDE_HOLE = apeescape_location.new("DR_FAN_OUTSIDE_HOLE")
local DR_OBELISK_BOTTOM = apeescape_location.new("DR_OBELISK_BOTTOM")
local DR_OBELISK_TOP = apeescape_location.new("DR_OBELISK_TOP")
local DR_WATER_SIDE = apeescape_location.new("DR_WATER_SIDE")
local DR_WATER_LEDGE = apeescape_location.new("DR_WATER_LEDGE")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - DR",DR_ENTRY,function() return DR_Access() end)

--Entrances
DR_OUTSIDE_FENCE:connect_one_way_entrance("DR_OUTSIDE_FENCE_to_DR_FAN_OUTSIDE_FENCE",DR_FAN_OUTSIDE_FENCE)
DR_OUTSIDE_HOLE:connect_one_way_entrance("DR_OUTSIDE_HOLE_to_DR_FAN_OUTSIDE_HOLE",DR_FAN_OUTSIDE_HOLE)
DR_OUTSIDE_OBELISK_BOTTOM:connect_one_way_entrance("DR_OUTSIDE_OBELISK_BOTTOM_to_DR_OBELISK_BOTTOM",DR_OBELISK_BOTTOM)
DR_OUTSIDE_OBELISK_TOP:connect_one_way_entrance("DR_OUTSIDE_OBELISK_TOP_to_DR_OBELISK_TOP",DR_OBELISK_TOP)
DR_OUTSIDE_WATER_BUTTON:connect_one_way_entrance("DR_OUTSIDE_WATER_BUTTON_to_DR_WATER_SIDE",DR_WATER_SIDE)
DR_OUTSIDE_WATER_LEDGE:connect_one_way_entrance("DR_OUTSIDE_WATER_LEDGE_to_DR_WATER_LEDGE",DR_WATER_LEDGE)
DR_FAN_OUTSIDE_FENCE:connect_one_way_entrance("DR_FAN_OUTSIDE_FENCE_to_DR_OUTSIDE_FENCE",DR_OUTSIDE_FENCE)
DR_FAN_OUTSIDE_HOLE:connect_one_way_entrance("DR_FAN_OUTSIDE_HOLE_to_DR_OUTSIDE_HOLE",DR_OUTSIDE_HOLE)
DR_OBELISK_BOTTOM:connect_one_way_entrance("DR_OBELISK_BOTTOM_to_DR_OUTSIDE_OBELISK_BOTTOM",DR_OUTSIDE_OBELISK_BOTTOM)
DR_OBELISK_TOP:connect_one_way_entrance("DR_OBELISK_TOP_to_DR_OUTSIDE_OBELISK_TOP",DR_OUTSIDE_OBELISK_TOP)
DR_WATER_SIDE:connect_one_way_entrance("DR_WATER_SIDE_to_DR_OUTSIDE_WATER_BUTTON",DR_OUTSIDE_WATER_BUTTON)
DR_WATER_LEDGE:connect_one_way_entrance("DR_WATER_LEDGE_to_DR_OUTSIDE_WATER_LEDGE",DR_OUTSIDE_WATER_LEDGE)


DR_ENTRY:connect_one_way_entrance("DR_ENTRY_to_DR_OUTSIDE_FENCE",DR_OUTSIDE_FENCE,function()
    result = any(
                Eval_Logic((HasFlyer() or IJ()),0),
                Eval_Logic((HasFlyer() or HasHoop() or IJ()),1),
                Eval_Logic(true,2)
               )
    return result

end)

DR_ENTRY:connect_one_way_entrance("DR_ENTRY_to_DR_OUTSIDE_HOLE",DR_OUTSIDE_HOLE,function() return HasFlyer() or IJ() end)
DR_ENTRY:connect_one_way_entrance("DR_ENTRY_to_DR_OUTSIDE_OBELISK_BOTTOM",DR_OUTSIDE_OBELISK_BOTTOM,true)
DR_ENTRY:connect_one_way_entrance("DR_ENTRY_to_DR_OUTSIDE_OBELISK_TOP",DR_OUTSIDE_OBELISK_TOP,function() return HasFlyer() or IJ() end)
DR_ENTRY:connect_one_way_entrance("DR_ENTRY_to_DR_OUTSIDE_WATER_BUTTON",DR_OUTSIDE_WATER_BUTTON,function() return CanHitOnce() end)
DR_ENTRY:connect_one_way_entrance("DR_ENTRY_to_DR_OUTSIDE_WATER_LEDGE",DR_OUTSIDE_WATER_LEDGE,function()
    result = any(
                Eval_Logic((HasFlyer()),0),
                Eval_Logic((HasFlyer() or IJ()),1)
               )
    return result

end)
DR_OUTSIDE_FENCE:connect_one_way_entrance("DR_OUTSIDE_FENCE_to_DR_ENTRY",DR_ENTRY,true)

--TODO : ---------------Rule does not work for now,since I do not track the events------------
DR_OUTSIDE_HOLE:connect_one_way_entrance("DR_OUTSIDE_HOLE_to_DR_ENTRY",DR_ENTRY,function() return has("DR-Block") end)
DR_OUTSIDE_OBELISK_BOTTOM:connect_one_way_entrance("DR_OUTSIDE_OBELISK_BOTTOM_to_DR_ENTRY",DR_ENTRY,true)
DR_OUTSIDE_OBELISK_TOP:connect_one_way_entrance("DR_OUTSIDE_OBELISK_TOP_to_DR_ENTRY",DR_ENTRY,true)
DR_OUTSIDE_WATER_BUTTON:connect_one_way_entrance("DR_OUTSIDE_WATER_BUTTON_to_DR_ENTRY",DR_ENTRY,true)
DR_OUTSIDE_WATER_LEDGE:connect_one_way_entrance("DR_OUTSIDE_WATER_LEDGE_to_DR_ENTRY",DR_ENTRY,true)
DR_FAN_OUTSIDE_FENCE:connect_one_way_entrance("DR_FAN_OUTSIDE_FENCE_to_DR_FAN_OUTSIDE_HOLE",DR_FAN_OUTSIDE_HOLE,true)
DR_FAN_OUTSIDE_HOLE:connect_one_way_entrance("DR_FAN_OUTSIDE_HOLE_to_DR_FAN_OUTSIDE_FENCE",DR_FAN_OUTSIDE_FENCE,true)
DR_OBELISK_BOTTOM:connect_one_way_entrance("DR_OBELISK_BOTTOM_to_DR_OBELISK_TOP",DR_OBELISK_TOP,true)
DR_OBELISK_TOP:connect_one_way_entrance("DR_OBELISK_TOP_to_DR_OBELISK_BOTTOM",DR_FAN_OUTSIDE_FENCE,true)
DR_WATER_SIDE:connect_one_way_entrance("DR_WATER_SIDE_to_DR_WATER_LEDGE",DR_WATER_LEDGE,true)
DR_WATER_LEDGE:connect_one_way_entrance("DR_OBELISK_TOP_to_DR_WATER_SIDE",DR_WATER_SIDE,true)

--Monkeys
DR_ENTRY:connect_one_way("DR_Kyle",function()
    result = any(
                Eval_Logic((HasFlyer() and HasNet()),0),
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),1)
               )
    return result

end)
DR_OUTSIDE_WATER_LEDGE:connect_one_way("DR_Kyle2",function() return HasNet() end)

DR_ENTRY:connect_one_way("DR_Stan",function()
    result = any(
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),0),
                Eval_Logic(((HasFlyer() or HasHoop() or IJ()) and HasNet()),1),
                Eval_Logic((HasNet()),2)
               )
    return result

end)
DR_OUTSIDE_FENCE:connect_one_way("DR_Stan2",function() return HasNet() end)

DR_ENTRY:connect_one_way("DR_Kenny",function() return (HasFlyer() or IJ()) and HasNet() end)
DR_OUTSIDE_OBELISK_TOP:connect_one_way("DR_Kenny2",function() return HasNet() end)

DR_ENTRY:connect_one_way("DR_Cratman",function() return HasNet() end)
DR_ENTRY:connect_one_way("DR_Mooshy",function() return HasNet() end)

DR_FAN_OUTSIDE_HOLE:connect_one_way("DR_Nuzzy",function()
    result = any(
                Eval_Logic(((HasSling() or HasHoop() or HasPunch()) and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)
DR_FAN_OUTSIDE_HOLE:connect_one_way("DR_Mav",function() return HasNet() end)

DR_OBELISK_BOTTOM:connect_one_way("DR_Papou",function() return HasNet() end)
DR_OBELISK_BOTTOM:connect_one_way("DR_Trance",function() return HasNet() end)
DR_OBELISK_BOTTOM:connect_one_way("DR_Bernt",function() return (HasSling() and HasNet()) end)

DR_WATER_SIDE:connect_one_way("DR_Runt",function()
    result = any(
                Eval_Logic(((HasSling() or HasRC() or CanSwim()) and HasNet()),0),
                Eval_Logic(((HasSling() or HasHoop() or HasRC() or CanSwim()) and HasNet()),1),
                Eval_Logic((HasNet() or ((HasRC() or CanDive()) and HasWaterNet())),2)
               )
    return result

end)
DR_WATER_SIDE:connect_one_way("DR_Hoolah",function()
    result = any(
                Eval_Logic(((HasClub() or HasPunch()) and HasNet()),0),
                Eval_Logic(((HasClub() or HasSling() or HasPunch()) and HasNet()),1)
               )
    return result

end)
DR_WATER_SIDE:connect_one_way("DR_Chino",function()
    result = any(
                Eval_Logic(((HasSling() or HasRC() or CanSwim()) and HasNet()),0),
                Eval_Logic(((HasSling() or HasHoop() or HasRC() or CanSwim()) and HasNet()),1),
                Eval_Logic((HasNet() or ((HasRC() or CanDive()) and HasWaterNet())),2)
               )
    return result

end)

--Coins
DR_ENTRY:connect_one_way("DR_C_Outside",function()
    result = any(
                Eval_Logic((HasFlyer() or IJ()),0),
                Eval_Logic((HasFlyer() or HasHoop() or IJ()),1),
                Eval_Logic((true),2)
               )
    return result

end)
DR_OUTSIDE_FENCE:connect_one_way("DR_C_Outside2",true)

DR_FAN_OUTSIDE_HOLE:connect_one_way("DR_C_Fan Basement",true)
DR_OBELISK_BOTTOM:connect_one_way("DR_C_Obelisk Inside",function()
    result = any(
                Eval_Logic((HasRC() or HasPunch()),0),
                Eval_Logic((HasFlyer() or HasRC() or HasPunch()),1)
               )
    return result

end)
DR_WATER_SIDE:connect_one_way("DR_C_Water Basement",function() return CanDive() end)

--Mailboxes
DR_ENTRY:connect_one_way("DR_M_Monkey Attributes",true)
DR_ENTRY:connect_one_way("DR_M_Out of Place Block",function() return CanHitOnce() end)
DR_ENTRY:connect_one_way("DR_M_Difficult for Beginners",function() return CanHitOnce() end)
DR_ENTRY:connect_one_way("DR_M_Hmmm... Red Switch",true)
DR_FAN_OUTSIDE_HOLE:connect_one_way("DR_M_It'll Blow You Away",true)
DR_FAN_OUTSIDE_HOLE:connect_one_way("DR_M_D-pad Camera Tutorial",function() return CanHitOnce() end)
DR_OBELISK_BOTTOM:connect_one_way("DR_M_Monkeys Lights",function() return CanHitOnce() end)
