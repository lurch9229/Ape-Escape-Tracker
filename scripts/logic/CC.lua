-- time_station = apeescape_location.new("time_station")
local CC_ENTRY = apeescape_location.new("CC_ENTRY")

local CC_ENTRY_CASTLE = apeescape_location.new("CC_ENTRY_CASTLE")
local CC_ENTRY_BELL = apeescape_location.new("CC_ENTRY_BELL")
local CC_ENTRY_BASEMENT = apeescape_location.new("CC_ENTRY_BASEMENT")
local CC_ENTRY_BOSS = apeescape_location.new("CC_ENTRY_BOSS")
local CC_CASTLEMAIN_ENTRY = apeescape_location.new("CC_CASTLEMAIN_ENTRY")
local CC_CASTLEMAINTHRONEROOM = apeescape_location.new("CC_CASTLEMAINTHRONEROOM")
local CC_CASTLEMAIN_BELL = apeescape_location.new("CC_CASTLEMAIN_BELL")
local CC_CASTLEMAIN_ELEVATOR = apeescape_location.new("CC_CASTLEMAIN_ELEVATOR")
local CC_BELL_ENTRY = apeescape_location.new("CC_BELL_ENTRY")
local CC_BELL_CASTLE = apeescape_location.new("CC_BELL_CASTLE")
local CC_ELEVATOR_CASTLEMAIN = apeescape_location.new("CC_ELEVATOR_CASTLEMAIN")
local CC_ELEVATOR_BASEMENT = apeescape_location.new("CC_ELEVATOR_BASEMENT")
local CC_BASEMENT_ENTRY = apeescape_location.new("CC_BASEMENT_ENTRY")
local CC_BASEMENT_ELEVATOR = apeescape_location.new("CC_BASEMENT_ELEVATOR")
local CC_BASEMENT_BUTTON_DOWN = apeescape_location.new("CC_BASEMENT_BUTTON_DOWN")
local CC_BASEMENT_BUTTON_UP = apeescape_location.new("CC_BASEMENT_BUTTON_UP")
local CC_BUTTON_BASEMENT_WATER = apeescape_location.new("CC_BUTTON_BASEMENT_WATER")
local CC_BUTTON_BASEMENT_LEDGE = apeescape_location.new("CC_BUTTON_BASEMENT_LEDGE")
local CC_BOSS_ROOM = apeescape_location.new("CC_BOSS_ROOM")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - CC",CC_ENTRY,function() return CC_Access() end)

--Entrances
CC_ENTRY_CASTLE:connect_one_way_entrance("CC_ENTRY_CASTLE_to_CC_CASTLEMAIN_ENTRY",CC_CASTLEMAIN_ENTRY,true)
CC_ENTRY_BELL:connect_one_way_entrance("CC_ENTRY_BELL_to_CC_BELL_ENTRY",CC_BELL_ENTRY,true)
CC_ENTRY_BASEMENT:connect_one_way_entrance("CC_ENTRY_BASEMENT_to_CC_BASEMENT_ENTRY",CC_BASEMENT_ENTRY,true)
CC_ENTRY_BOSS:connect_one_way_entrance("CC_ENTRY_BOSS_to_CC_BOSS_ROOM",CC_BOSS_ROOM,true)
CC_CASTLEMAIN_ENTRY:connect_one_way_entrance("CC_CASTLEMAIN_ENTRY_to_CC_ENTRY_CASTLE",CC_ENTRY_CASTLE,true)
CC_CASTLEMAIN_BELL:connect_one_way_entrance("CC_CASTLEMAIN_BELL_to_CC_BELL_CASTLE",CC_BELL_CASTLE,true)
CC_CASTLEMAIN_ELEVATOR:connect_one_way_entrance("CC_CASTLEMAIN_ELEVATOR_to_CC_ELEVATOR_CASTLEMAIN",CC_ELEVATOR_CASTLEMAIN,true)
CC_BELL_ENTRY:connect_one_way_entrance("CC_BELL_ENTRY_to_CC_ENTRY_BELL",CC_ENTRY_BELL,true)
CC_BELL_CASTLE:connect_one_way_entrance("CC_BELL_CASTLE_to_CC_CASTLEMAIN_BELL",CC_CASTLEMAIN_BELL,true)
CC_ELEVATOR_CASTLEMAIN:connect_one_way_entrance("CC_ELEVATOR_CASTLEMAIN_to_CC_CASTLEMAIN_ELEVATOR",CC_CASTLEMAIN_ELEVATOR,true)
CC_ELEVATOR_BASEMENT:connect_one_way_entrance("CC_ELEVATOR_BASEMENT_to_CC_BASEMENT_ELEVATOR",CC_BASEMENT_ELEVATOR,true)
CC_BASEMENT_ENTRY:connect_one_way_entrance("CC_BASEMENT_ENTRY_to_CC_ENTRY_BASEMENT",CC_ENTRY_BASEMENT,true)
CC_BASEMENT_ELEVATOR:connect_one_way_entrance("CC_BASEMENT_ELEVATOR_to_CC_ELEVATOR_BASEMENT",CC_ELEVATOR_BASEMENT,true)
CC_BASEMENT_BUTTON_DOWN:connect_one_way_entrance("CC_BASEMENT_BUTTON_DOWN_to_CC_BUTTON_BASEMENT_WATER",CC_BUTTON_BASEMENT_WATER,true)
CC_BASEMENT_BUTTON_UP:connect_one_way_entrance("CC_BASEMENT_BUTTON_UP_to_CC_BUTTON_BASEMENT_LEDGE",CC_BUTTON_BASEMENT_LEDGE,true)
CC_BUTTON_BASEMENT_WATER:connect_one_way_entrance("CC_BUTTON_BASEMENT_WATER_to_CC_BASEMENT_BUTTON_DOWN",CC_BASEMENT_BUTTON_DOWN,true)
CC_BUTTON_BASEMENT_LEDGE:connect_one_way_entrance("CC_BUTTON_BASEMENT_LEDGE_to_CC_BASEMENT_BUTTON_UP",CC_BASEMENT_BUTTON_UP,true)
CC_BOSS_ROOM:connect_one_way_entrance("CC_BOSS_ROOM_to_CC_ENTRY_BOSS",CC_ENTRY_BOSS,true)


CC_ENTRY:connect_one_way_entrance("CC_ENTRY_to_CC_ENTRY_CASTLE",CC_ENTRY_CASTLE,true)
CC_ENTRY:connect_one_way_entrance("CC_ENTRY_to_CC_ENTRY_BASEMENT",CC_ENTRY_BASEMENT,function()
    result = any(
                Eval_Logic((CanSwim()),0),
                Eval_Logic((CanSwim() or HasFlyer()),2)
               )
    return result

end)
CC_ENTRY:connect_one_way_entrance("CC_ENTRY_to_CC_ENTRY_BELL",CC_ENTRY_BELL,function() return HasFlyer() or IJ() end)
CC_ENTRY_CASTLE:connect_one_way_entrance("CC_ENTRY_CASTLE_to_CC_ENTRY",CC_ENTRY,true)
CC_ENTRY_BASEMENT:connect_one_way_entrance("CC_ENTRY_BASEMENT_to_CC_ENTRY",CC_ENTRY,function() return CanSwim() end)
CC_ENTRY_BELL:connect_one_way_entrance("CC_ENTRY_BELL_to_CC_ENTRY",CC_ENTRY,true)
CC_ENTRY_BELL:connect_one_way_entrance("CC_ENTRY_BELL_to_CC_ENTRY_BOSS",CC_ENTRY_BOSS,function() return has("CC-Button") and CanHitOnce() end)
CC_CASTLEMAIN_ENTRY:connect_one_way_entrance("CC_CASTLEMAIN_ENTRY_to_CC_CASTLEMAIN_BELL",CC_CASTLEMAIN_BELL,true)
CC_CASTLEMAIN_BELL:connect_one_way_entrance("CC_CASTLEMAIN_BELL_to_CC_CASTLEMAIN_ENTRY",CC_CASTLEMAIN_ENTRY,true)
CC_CASTLEMAIN_ENTRY:connect_one_way_entrance("CC_CASTLEMAIN_ENTRY_to_CC_CASTLEMAIN_ELEVATOR",CC_CASTLEMAIN_ELEVATOR,function()
    result = any(
                Eval_Logic((CRC_Lamp()),0),
                Eval_Logic((CRC_Lamp() or SuperFlyer(CC_CASTLEMAIN_ENTRY,2) or IJ()),2)
               )
    return result

end)
CC_CASTLEMAIN_ELEVATOR:connect_one_way_entrance("CC_CASTLEMAIN_ELEVATOR_to_CC_CASTLEMAIN_ENTRY",CC_CASTLEMAIN_ENTRY,function()
    result = any(
                Eval_Logic((HasFlyer()),0),
                Eval_Logic((HasFlyer() or IJ()),1)
               )
    return result

end)
CC_CASTLEMAIN_ENTRY:connect_one_way_entrance("CC_CASTLEMAIN_ENTRY_to_CC_CASTLEMAINTHRONEROOM",CC_CASTLEMAINTHRONEROOM,function()
    result = any(
                Eval_Logic((CRC_Lamp()),0),
                Eval_Logic((CRC_Lamp() or IJ()),2)
               )
    return result

end)
CC_CASTLEMAIN_ELEVATOR:connect_one_way_entrance("CC_CASTLEMAIN_ELEVATOR_to_CC_CASTLEMAINTHRONEROOM",CC_CASTLEMAINTHRONEROOM,function()
    result = any(
                Eval_Logic((HasFlyer() and CRC_Lamp()),0),
                Eval_Logic(( SuperFlyer(CC_CASTLEMAIN_ELEVATOR,1)),1)
                --Eval_Logic(((HasFlyer() and CRC_Lamp()) or IJ() or SuperFlyer(CC_CASTLEMAIN_ELEVATOR,1)),1)
               )
    return result

end)
CC_BELL_CASTLE:connect_one_way_entrance("CC_BELL_CASTLE_to_CC_BELL_ENTRY",CC_BELL_ENTRY,function() return CanHitWheel() or HasFlyer() end)
CC_BELL_ENTRY:connect_one_way_entrance("CC_BELL_ENTRY_to_CC_BELL_CASTLE",CC_BELL_CASTLE,true)
CC_ELEVATOR_CASTLEMAIN:connect_one_way_entrance("CC_ELEVATOR_CASTLEMAIN_to_CC_ELEVATOR_BASEMENT",CC_ELEVATOR_BASEMENT,function()
    result = any(
                Eval_Logic((HasClub() or HasSling() or HasPunch()),0),
                Eval_Logic((CanHitOnce()),1)
               )
    return result

end)
CC_ELEVATOR_BASEMENT:connect_one_way_entrance("CC_ELEVATOR_BASEMENT_to_CC_ELEVATOR_CASTLEMAIN",CC_ELEVATOR_CASTLEMAIN,true)
CC_BASEMENT_ENTRY:connect_one_way_entrance("CC_BASEMENT_ENTRY_to_CC_BASEMENT_ELEVATOR",CC_BASEMENT_ELEVATOR,function()
    result = any(
                Eval_Logic((CanSwim() and HasPunch()),0),
                Eval_Logic((CanSwim() and (HasPunch() or IJ() or HasFlyer())),1)
               )
    return result

end)
CC_BASEMENT_BUTTON_DOWN:connect_one_way_entrance("CC_BASEMENT_BUTTON_DOWN_to_CC_BASEMENT_ELEVATOR",CC_BASEMENT_ELEVATOR,function()
    result = any(
                Eval_Logic((CanSwim()),0),
                Eval_Logic(((CanSwim() or SuperFlyer(CC_BASEMENT_BUTTON_DOWN,1))),1),
                Eval_Logic((CanSwim() or SuperFlyer(CC_BASEMENT_BUTTON_DOWN,2) or IJ()),2)
               )
    return result

end)
CC_BASEMENT_BUTTON_UP:connect_one_way_entrance("CC_BASEMENT_BUTTON_UP_to_CC_BASEMENT_ELEVATOR",CC_BASEMENT_ELEVATOR,true)
CC_BASEMENT_ELEVATOR:connect_one_way_entrance("CC_BASEMENT_ELEVATOR_to_CC_BASEMENT_ENTRY",CC_BASEMENT_ENTRY,function()
    result = any(
                Eval_Logic((CanHitOnce() and (CanSwim() or HasFlyer())),0),
                Eval_Logic((CanHitOnce() and (CanSwim() or IJ() or HasHoop() or HasFlyer())),1),
                Eval_Logic((CanHitOnce()),2)
               )
    return result

end)
CC_BASEMENT_ELEVATOR:connect_one_way_entrance("CC_BASEMENT_ELEVATOR_to_CC_BASEMENT_BUTTON_DOWN",CC_BASEMENT_BUTTON_DOWN,function()
    result = any(
                Eval_Logic((CanSwim()),0),
                Eval_Logic((CanSwim() or IJ() or HasFlyer()),1)
               )
    return result

end)
CC_BASEMENT_ELEVATOR:connect_one_way_entrance("CC_BASEMENT_ELEVATOR_to_CC_BASEMENT_BUTTON_UP",CC_BASEMENT_BUTTON_UP,function()
    result = any(
                Eval_Logic((IJ()),0),
                Eval_Logic((IJ() or HasFlyer()),1)
               )
    return result

end)
CC_BUTTON_BASEMENT_WATER:connect_one_way_entrance("CC_BUTTON_BASEMENT_WATER_to_CC_BUTTON_BASEMENT_LEDGE",CC_BUTTON_BASEMENT_LEDGE,true)
CC_BASEMENT_BUTTON_UP:connect_one_way_entrance("CC_BUTTON_BASEMENT_LEDGE_to_CC_BUTTON_BASEMENT_WATER",CC_BUTTON_BASEMENT_WATER,true)

--Monkeys
CC_ENTRY:connect_one_way("CC_Robart",function() return HasNet() end)
CC_ENTRY:connect_one_way("CC_Igor",function() return HasNet() end)
CC_ENTRY:connect_one_way("CC_Naners",function() return HasNet() end)
CC_ENTRY:connect_one_way("CC_Neeners",function() return HasNet() end)
CC_ENTRY:connect_one_way("CC_Charles",function() return HasPunch() and HasNet() end)
CC_CASTLEMAINTHRONEROOM:connect_one_way("CC_Gustav",function() return HasNet() end)
CC_CASTLEMAINTHRONEROOM:connect_one_way("CC_Wilhelm",function() return HasNet() end)
CC_CASTLEMAINTHRONEROOM:connect_one_way("CC_Emmanuel",function() return HasNet() end)
CC_CASTLEMAINTHRONEROOM:connect_one_way("CC_SirCutty",function() return HasNet() end)
CC_BASEMENT_ELEVATOR:connect_one_way("CC_Calligan",function() return (HasPunch() or CanDive()) and HasNet() end)
CC_BASEMENT_ELEVATOR:connect_one_way("CC_Castalist",function() return CanDive() and HasWaterNet() end)
CC_BASEMENT_ELEVATOR:connect_one_way("CC_Deveneom",function()
    result = any(
                Eval_Logic((HasWaterNet() or (HasNet() and CanSwim())),0),
                Eval_Logic((HasWaterNet() or (HasNet() and (HasFlyer() or CanSwim()))),1),
                Eval_Logic((HasWaterNet() or (HasNet() and (HasFlyer() or IJ() or CanSwim()))),2)
               )
    return result

end)
CC_BUTTON_BASEMENT_WATER:connect_one_way("CC_Astur",function() return HasNet() end)
CC_BUTTON_BASEMENT_WATER:connect_one_way("CC_Kilserack",function() return HasNet() or (HasWaterNet() and CanDive()) end)
CC_ELEVATOR_CASTLEMAIN:connect_one_way("CC_Ringo",function() return HasNet() end)
CC_ELEVATOR_CASTLEMAIN:connect_one_way("CC_Densil",function() return HasNet() end)
CC_ELEVATOR_CASTLEMAIN:connect_one_way("CC_Figero",function()
    result = any(
                Eval_Logic((HasFlyer() and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)
CC_BELL_ENTRY:connect_one_way("CC_Fej",function() return HasNet() end)
CC_BELL_ENTRY:connect_one_way("CC_Joey",function()
    result = any(
                Eval_Logic((HasFlyer() and HasNet()),0),
                Eval_Logic(((HasHoop() or HasFlyer()) and HasNet()),1),
                Eval_Logic((HasNet()),2)
               )
    return result

end)
CC_BELL_CASTLE:connect_one_way("CC_Donqui",function() return HasNet() end)
CC_BOSS_ROOM:connect_one_way("CC_Boss",function() return CanHitMultiple() end)

--Coins

CC_ENTRY_BELL:connect_one_way("CC_C_Outside",true)
CC_CASTLEMAINTHRONEROOM:connect_one_way("CC_C_Castle Main",true)
CC_BUTTON_BASEMENT_WATER:connect_one_way("CC_C_Button Room",true)
CC_ELEVATOR_CASTLEMAIN:connect_one_way("CC_C_Elevator Room",true)

--Mailboxes
CC_ENTRY:connect_one_way("CC_M_Think Clearly",function() return CanHitOnce() end)