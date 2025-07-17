-- time_station = apeescape_location.new("time_station")
local WSW_ENTRY = apeescape_location.new("WSW_ENTRY")

local WSW_ENTRY_GONG = apeescape_location.new("WSW_ENTRY_GONG")
local WSW_GONG_ENTRY = apeescape_location.new("WSW_GONG_ENTRY")
local WSW_GONG_MIDDLE = apeescape_location.new("WSW_GONG_MIDDLE")
local WSW_MIDDLE_GONG = apeescape_location.new("WSW_MIDDLE_GONG")
local WSW_MIDDLE_OBSTACLE = apeescape_location.new("WSW_MIDDLE_OBSTACLE")
local WSW_OBSTACLE_MIDDLE = apeescape_location.new("WSW_OBSTACLE_MIDDLE")
local WSW_OBSTACLE_BARREL = apeescape_location.new("WSW_OBSTACLE_BARREL")
local WSW_BARREL_OBSTACLE = apeescape_location.new("WSW_BARREL_OBSTACLE")


--TS Main Hub
time_station:connect_one_way_entrance("Time Station - WSW",WSW_ENTRY,function() return WSW_Access() end)

--Entrances
WSW_ENTRY_GONG:connect_one_way_entrance("WSW_ENTRY_GONG_to_WSW_GONG_ENTRY",WSW_GONG_ENTRY,true)
WSW_GONG_ENTRY:connect_one_way_entrance("WSW_GONG_ENTRY_to_WSW_ENTRY_GONG",WSW_ENTRY_GONG,true)
WSW_GONG_MIDDLE:connect_one_way_entrance("WSW_GONG_MIDDLE_to_WSW_MIDDLE_GONG",WSW_MIDDLE_GONG,true)
WSW_MIDDLE_GONG:connect_one_way_entrance("WSW_MIDDLE_GONG_to_WSW_GONG_MIDDLE",WSW_GONG_MIDDLE,true)
WSW_MIDDLE_OBSTACLE:connect_one_way_entrance("WSW_MIDDLE_OBSTACLE_to_WSW_OBSTACLE_MIDDLE",WSW_OBSTACLE_MIDDLE,true)
WSW_OBSTACLE_MIDDLE:connect_one_way_entrance("WSW_OBSTACLE_MIDDLE_to_WSW_MIDDLE_OBSTACLE",WSW_MIDDLE_OBSTACLE,true)
WSW_OBSTACLE_BARREL:connect_one_way_entrance("WSW_OBSTACLE_BARREL_to_WSW_BARREL_OBSTACLE",WSW_BARREL_OBSTACLE,true)
WSW_BARREL_OBSTACLE:connect_one_way_entrance("WSW_BARREL_OBSTACLE_to_WSW_OBSTACLE_BARREL",WSW_OBSTACLE_BARREL,true)

WSW_ENTRY:connect_one_way_entrance("WSW_ENTRY_to_WSW_ENTRY_GONG",WSW_ENTRY_GONG,true)
WSW_GONG_ENTRY:connect_one_way_entrance("WSW_GONG_ENTRY_to_WSW_GONG_MIDDLE",WSW_GONG_MIDDLE,function()
    result = any(
                Eval_Logic((HasNet() or IJ()),0),
                Eval_Logic((HasNet() or IJ() or HasFlyer()),1)
               )
    return result
end)
WSW_GONG_MIDDLE:connect_one_way_entrance("WSW_GONG_MIDDLE_to_WSW_GONG_ENTRY",WSW_GONG_ENTRY,true)
WSW_MIDDLE_GONG:connect_one_way_entrance("WSW_MIDDLE_GONG_to_WSW_MIDDLE_OBSTACLE",WSW_MIDDLE_OBSTACLE,function()
    result = any(
                Eval_Logic((HasSling() or HasFlyer()),0),
                Eval_Logic((HasSling() or HasHoop() or HasFlyer()),1)
               )
    return result
end)
WSW_MIDDLE_OBSTACLE:connect_one_way_entrance("WSW_MIDDLE_OBSTACLE_to_WSW_MIDDLE_GONG",WSW_MIDDLE_GONG,true)
WSW_OBSTACLE_MIDDLE:connect_one_way_entrance("WSW_OBSTACLE_MIDDLE_to_WSW_OBSTACLE_BARREL",WSW_OBSTACLE_BARREL,function()
    result = any(
                Eval_Logic((CanHitWheel(0) or HasFlyer()),0),
                Eval_Logic((CanHitWheel(1) or HasFlyer() or HasNet()),1),
                Eval_Logic((true),2)
               )
    return result
end)
WSW_OBSTACLE_BARREL:connect_one_way_entrance("WSW_OBSTACLE_BARREL_to_WSW_OBSTACLE_MIDDLE",WSW_OBSTACLE_MIDDLE,true)

--Monkeys
--Entry
WSW_ENTRY_GONG:connect_one_way("WSW_Minky",function() return HasNet() end)
WSW_ENTRY_GONG:connect_one_way("WSW_Zobbro",function() return HasNet() end)
--Gong
WSW_GONG_ENTRY:connect_one_way("WSW_Xeeto",function() return HasNet() end)
WSW_GONG_ENTRY:connect_one_way("WSW_Moops",function() return HasNet() end)
WSW_GONG_ENTRY:connect_one_way("WSW_Zanabi",function() return HasNet() end)
--Middle
WSW_MIDDLE_OBSTACLE:connect_one_way("WSW_Doxs",function() return HasNet() end)
--Obstacle
WSW_OBSTACLE_BARREL:connect_one_way("WSW_Buddha",function() return HasNet() end)
WSW_OBSTACLE_MIDDLE:connect_one_way("WSW_Fooey",function()
    result = any(
                Eval_Logic((HasRC() and HasNet()),0),
                Eval_Logic(((HasSling() or HasRC()) and HasNet()),1)
               )
    return result

end)
--Barrel
WSW_BARREL_OBSTACLE:connect_one_way("WSW_Kong",function()
    result = any(
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasSling() or HasHoop()) and HasNet()),1)
               )
    return result

end)

WSW_BARREL_OBSTACLE:connect_one_way("WSW_Phool",function()
    result = any(
                Eval_Logic(((HasFlyer() or HasSling() or (HasHoop() and (HasClub() or HasPunch()))) and HasNet()),0),
                Eval_Logic(((HasFlyer() or HasSling() or HasHoop()) and HasNet()),1)
               )
    return result

end)
--Coins
WSW_ENTRY_GONG:connect_one_way("WSW_C_First Room",true)
WSW_GONG_ENTRY:connect_one_way("WSW_C_Gong Room",function() return HasNet() end)
WSW_BARREL_OBSTACLE:connect_one_way("WSW_C_Barrel Room",function()
    result = any(
                Eval_Logic((HasFlyer()),0),
                Eval_Logic((HasFlyer() or IJ()),2)
               )
    return result

end)

--Mailboxes
WSW_GONG_ENTRY:connect_one_way("WSW_M_White Pants = Very Alert",function() return CanHitOnce() end)
WSW_MIDDLE_GONG:connect_one_way("WSW_M_Guided Pellet Tutorial",function() return CanHitOnce() end)
WSW_MIDDLE_OBSTACLE:connect_one_way("WSW_M_Big Cogwheel",function() return CanHitOnce() end)
WSW_OBSTACLE_MIDDLE:connect_one_way("WSW_M_Black Pants = Dangerous",function() return CanHitWheel() or HasFlyer() end)