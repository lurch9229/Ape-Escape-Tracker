-- time_station = apeescape_location.new("time_station")
local MM_SL_HUB = apeescape_location.new("MM_SL_HUB")

local MM_SL_HUB_WESTERN = apeescape_location.new("MM_SL_HUB_WESTERN")
local MM_SL_HUB_COASTER = apeescape_location.new("MM_SL_HUB_COASTER")
local MM_SL_HUB_CIRCUS = apeescape_location.new("MM_SL_HUB_CIRCUS")
local MM_SL_HUB_GO_KARZ = apeescape_location.new("MM_SL_HUB_GO_KARZ")
local MM_SL_HUB_CRATER = apeescape_location.new("MM_SL_HUB_CRATER")
local MM_WESTERN_SL_HUB = apeescape_location.new("MM_WESTERN_SL_HUB")
local MM_COASTER_ENTRY_SL_HUB = apeescape_location.new("MM_COASTER_ENTRY_SL_HUB")
local MM_COASTER_ENTRY_COASTER1 = apeescape_location.new("MM_COASTER_ENTRY_COASTER1")
local MM_CIRCUS_SL_HUB = apeescape_location.new("MM_CIRCUS_SL_HUB")
local MM_GO_KARZ_SL_HUB = apeescape_location.new("MM_GO_KARZ_SL_HUB")
local MM_COASTER1_COASTER2 = apeescape_location.new("MM_COASTER1_COASTER2")
local MM_COASTER2_HAUNTED_HOUSE = apeescape_location.new("MM_COASTER2_HAUNTED_HOUSE")
local MM_HAUNTED_HOUSE_COFFIN = apeescape_location.new("MM_HAUNTED_HOUSE_COFFIN")
local MM_COFFIN_COASTER_ENTRY = apeescape_location.new("MM_COFFIN_COASTER_ENTRY")
local MM_COFFIN_HAUNTED_HOUSE = apeescape_location.new("MM_COFFIN_HAUNTED_HOUSE")
local MM_CRATER_SL_HUB = apeescape_location.new("MM_CRATER_SL_HUB")
local MM_CRATER_OUTSIDE_CASTLE = apeescape_location.new("MM_CRATER_OUTSIDE_CASTLE")
local MM_OUTSIDE_CASTLE_CRATER = apeescape_location.new("MM_OUTSIDE_CASTLE_CRATER")
local MM_OUTSIDE_CASTLE_SIDE_ENTRY = apeescape_location.new("MM_OUTSIDE_CASTLE_SIDE_ENTRY")
local MM_OUTSIDE_CASTLE_CASTLE_MAIN = apeescape_location.new("MM_OUTSIDE_CASTLE_CASTLE_MAIN")
local MM_SIDE_ENTRY_OUTSIDE_CASTLE = apeescape_location.new("MM_SIDE_ENTRY_OUTSIDE_CASTLE")
local MM_CASTLE_MAIN_OUTSIDE_CASTLE = apeescape_location.new("MM_CASTLE_MAIN_OUTSIDE_CASTLE")
local MM_CASTLE_MAIN_MONKEY_HEAD = apeescape_location.new("MM_CASTLE_MAIN_MONKEY_HEAD")
local MM_CASTLE_MAIN_INSIDE_CLIMB = apeescape_location.new("MM_CASTLE_MAIN_INSIDE_CLIMB")
local MM_CASTLE_MAIN_SPECTER1 = apeescape_location.new("MM_CASTLE_MAIN_SPECTER1")
local MM_MONKEY_HEAD_CASTLE_MAIN = apeescape_location.new("MM_MONKEY_HEAD_CASTLE_MAIN")
local MM_INSIDE_CLIMB_CASTLE_MAIN = apeescape_location.new("MM_INSIDE_CLIMB_CASTLE_MAIN")
local MM_INSIDE_CLIMB_OUTSIDE_CLIMB = apeescape_location.new("MM_INSIDE_CLIMB_OUTSIDE_CLIMB")
local MM_OUTSIDE_CLIMB_INSIDE_CLIMB = apeescape_location.new("MM_OUTSIDE_CLIMB_INSIDE_CLIMB")
local MM_OUTSIDE_CLIMB_CASTLE_MAIN = apeescape_location.new("MM_OUTSIDE_CLIMB_CASTLE_MAIN")
local MM_COASTER1_ENTRY = apeescape_location.new("MM_COASTER1_ENTRY")
local MM_COASTER2_ENTRY = apeescape_location.new("MM_COASTER2_ENTRY")
local MM_HAUNTED_HOUSE_DISEMBARK = apeescape_location.new("MM_HAUNTED_HOUSE_DISEMBARK")
local MM_COASTER_ENTRY_DISEMBARK = apeescape_location.new("MM_COASTER_ENTRY_DISEMBARK")
local MM_SPECTER1_ROOM = apeescape_location.new("MM_SPECTER1_ROOM")
local MM_CASTLE_MAIN_FROM_OUTSIDE = apeescape_location.new("MM_CASTLE_MAIN_FROM_OUTSIDE")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - MM",MM_SL_HUB,function() return MM_Access() end)

--Entrances
MM_SL_HUB_WESTERN:connect_one_way_entrance("MM_SL_HUB_WESTERN_to_MM_WESTERN_SL_HUB",MM_WESTERN_SL_HUB,true)
MM_SL_HUB_COASTER:connect_one_way_entrance("MM_SL_HUB_COASTER_to_MM_COASTER_ENTRY_SL_HUB",MM_COASTER_ENTRY_SL_HUB,true)
MM_SL_HUB_CIRCUS:connect_one_way_entrance("MM_SL_HUB_CIRCUS_to_MM_CIRCUS_SL_HUB",MM_CIRCUS_SL_HUB,true)
MM_SL_HUB_GO_KARZ:connect_one_way_entrance("MM_SL_HUB_GO_KARZ_to_MM_GO_KARZ_SL_HUB",MM_GO_KARZ_SL_HUB,true)
MM_SL_HUB_CRATER:connect_one_way_entrance("MM_SL_HUB_CRATER_to_MM_CRATER_SL_HUB",MM_CRATER_SL_HUB,true)
MM_WESTERN_SL_HUB:connect_one_way_entrance("MM_WESTERN_SL_HUB_to_MM_SL_HUB_WESTERN",MM_SL_HUB_WESTERN,true)
MM_COASTER_ENTRY_SL_HUB:connect_one_way_entrance("MM_COASTER_ENTRY_SL_HUB_to_MM_SL_HUB_COASTER",MM_SL_HUB_COASTER,true)
MM_COASTER_ENTRY_COASTER1:connect_one_way_entrance("MM_COASTER_ENTRY_COASTER1_to_MM_COASTER1_ENTRY",MM_COASTER1_ENTRY,true)
MM_CIRCUS_SL_HUB:connect_one_way_entrance("MM_CIRCUS_SL_HUB_to_MM_SL_HUB_CIRCUS",MM_SL_HUB_CIRCUS,true)
MM_GO_KARZ_SL_HUB:connect_one_way_entrance("MM_GO_KARZ_SL_HUB_to_MM_SL_HUB_GO_KARZ",MM_SL_HUB_GO_KARZ,true)
MM_COASTER1_COASTER2:connect_one_way_entrance("MM_COASTER1_COASTER2_to_MM_COASTER2_ENTRY",MM_COASTER2_ENTRY,true)
MM_COASTER2_HAUNTED_HOUSE:connect_one_way_entrance("MM_COASTER2_HAUNTED_HOUSE_to_MM_HAUNTED_HOUSE_DISEMBARK",MM_HAUNTED_HOUSE_DISEMBARK,true)
MM_HAUNTED_HOUSE_COFFIN:connect_one_way_entrance("MM_HAUNTED_HOUSE_COFFIN_to_MM_COFFIN_HAUNTED_HOUSE",MM_COFFIN_HAUNTED_HOUSE,true)
MM_COFFIN_COASTER_ENTRY:connect_one_way_entrance("MM_COFFIN_COASTER_ENTRY_to_MM_COASTER_ENTRY_DISEMBARK",MM_COASTER_ENTRY_DISEMBARK,true)
MM_COFFIN_HAUNTED_HOUSE:connect_one_way_entrance("MM_COFFIN_HAUNTED_HOUSE_to_MM_HAUNTED_HOUSE_COFFIN",MM_HAUNTED_HOUSE_COFFIN,true)
MM_CRATER_SL_HUB:connect_one_way_entrance("MM_CRATER_SL_HUB_to_MM_SL_HUB_CRATER",MM_SL_HUB_CRATER,true)
MM_CRATER_OUTSIDE_CASTLE:connect_one_way_entrance("MM_CRATER_OUTSIDE_CASTLE_to_MM_OUTSIDE_CASTLE_CRATER",MM_OUTSIDE_CASTLE_CRATER,true)
MM_OUTSIDE_CASTLE_CRATER:connect_one_way_entrance("MM_OUTSIDE_CASTLE_CRATER_to_MM_CRATER_OUTSIDE_CASTLE",MM_CRATER_OUTSIDE_CASTLE,true)
MM_OUTSIDE_CASTLE_SIDE_ENTRY:connect_one_way_entrance("MM_OUTSIDE_CASTLE_SIDE_ENTRY_to_MM_SIDE_ENTRY_OUTSIDE_CASTLE",MM_SIDE_ENTRY_OUTSIDE_CASTLE,true)
MM_OUTSIDE_CASTLE_CASTLE_MAIN:connect_one_way_entrance("MM_OUTSIDE_CASTLE_CASTLE_MAIN_to_MM_CASTLE_MAIN_OUTSIDE_CASTLE",MM_CASTLE_MAIN_OUTSIDE_CASTLE,true)
MM_SIDE_ENTRY_OUTSIDE_CASTLE:connect_one_way_entrance("MM_SIDE_ENTRY_OUTSIDE_CASTLE_to_MM_OUTSIDE_CASTLE_SIDE_ENTRY",MM_OUTSIDE_CASTLE_SIDE_ENTRY,true)
MM_CASTLE_MAIN_OUTSIDE_CASTLE:connect_one_way_entrance("MM_CASTLE_MAIN_OUTSIDE_CASTLE_to_MM_OUTSIDE_CASTLE_CASTLE_MAIN",MM_OUTSIDE_CASTLE_CASTLE_MAIN,true)
MM_CASTLE_MAIN_MONKEY_HEAD:connect_one_way_entrance("MM_CASTLE_MAIN_MONKEY_HEAD_to_MM_MONKEY_HEAD_CASTLE_MAIN",MM_MONKEY_HEAD_CASTLE_MAIN,true)
MM_CASTLE_MAIN_INSIDE_CLIMB:connect_one_way_entrance("MM_CASTLE_MAIN_INSIDE_CLIMB_to_MM_INSIDE_CLIMB_CASTLE_MAIN",MM_INSIDE_CLIMB_CASTLE_MAIN,true)
MM_CASTLE_MAIN_SPECTER1:connect_one_way_entrance("MM_CASTLE_MAIN_SPECTER1_to_MM_SPECTER1_ROOM",MM_SPECTER1_ROOM,true)
MM_MONKEY_HEAD_CASTLE_MAIN:connect_one_way_entrance("MM_MONKEY_HEAD_CASTLE_MAIN_to_MM_CASTLE_MAIN_MONKEY_HEAD",MM_CASTLE_MAIN_MONKEY_HEAD,true)
MM_INSIDE_CLIMB_CASTLE_MAIN:connect_one_way_entrance("MM_INSIDE_CLIMB_CASTLE_MAIN_to_MM_CASTLE_MAIN_INSIDE_CLIMB",MM_CASTLE_MAIN_INSIDE_CLIMB,true)
MM_INSIDE_CLIMB_OUTSIDE_CLIMB:connect_one_way_entrance("MM_INSIDE_CLIMB_OUTSIDE_CLIMB_to_MM_OUTSIDE_CLIMB_INSIDE_CLIMB",MM_OUTSIDE_CLIMB_INSIDE_CLIMB,true)
MM_OUTSIDE_CLIMB_INSIDE_CLIMB:connect_one_way_entrance("MM_OUTSIDE_CLIMB_INSIDE_CLIMB_to_MM_INSIDE_CLIMB_OUTSIDE_CLIMB",MM_INSIDE_CLIMB_OUTSIDE_CLIMB,true)
MM_OUTSIDE_CLIMB_CASTLE_MAIN:connect_one_way_entrance("MM_OUTSIDE_CLIMB_CASTLE_MAIN_to_MM_CASTLE_MAIN_FROM_OUTSIDE",MM_CASTLE_MAIN_FROM_OUTSIDE,true)

--Specter Land
MM_SL_HUB:connect_one_way_entrance("MM_SL_HUB_to_MM_SL_HUB_WESTERN",MM_SL_HUB_WESTERN,true)
MM_SL_HUB:connect_one_way_entrance("MM_SL_HUB_to_MM_SL_HUB_COASTER",MM_SL_HUB_COASTER,true)
MM_SL_HUB:connect_one_way_entrance("MM_SL_HUB_to_MM_SL_HUB_CIRCUS",MM_SL_HUB_CIRCUS,true)
MM_SL_HUB:connect_one_way_entrance("MM_SL_HUB_to_MM_SL_HUB_GO_KARZ",MM_SL_HUB_GO_KARZ,true)
MM_SL_HUB:connect_one_way_entrance("MM_SL_HUB_to_MM_SL_HUB_CRATER",MM_SL_HUB_CRATER,function() return MM_DoubleDoor() end)

MM_SL_HUB_WESTERN:connect_one_way_entrance("MM_SL_HUB_WESTERN_to_MM_SL_HUB",MM_SL_HUB,true)
MM_SL_HUB_COASTER:connect_one_way_entrance("MM_SL_HUB_COASTER_to_MM_SL_HUB",MM_SL_HUB,true)
MM_SL_HUB_CIRCUS:connect_one_way_entrance("MM_SL_HUB_CIRCUS_to_MM_SL_HUB",MM_SL_HUB,true)
MM_SL_HUB_GO_KARZ:connect_one_way_entrance("MM_SL_HUB_GO_KARZ_to_MM_SL_HUB",MM_SL_HUB,true)
MM_SL_HUB_CRATER:connect_one_way_entrance("MM_SL_HUB_CRATER_to_MM_SL_HUB",MM_SL_HUB,true)


--Coaster
MM_COASTER_ENTRY_SL_HUB:connect_one_way_entrance("MM_COASTER_ENTRY_SL_HUB_to_MM_COASTER_ENTRY_COASTER1",MM_COASTER_ENTRY_COASTER1,true)
MM_COASTER1_ENTRY:connect_one_way_entrance("MM_COASTER1_ENTRY_to_MM_COASTER1_COASTER2",MM_COASTER1_COASTER2,true)
MM_COASTER2_ENTRY:connect_one_way_entrance("MM_COASTER2_ENTRY_to_MM_COASTER2_HAUNTED_HOUSE",MM_COASTER2_HAUNTED_HOUSE,true)
MM_HAUNTED_HOUSE_DISEMBARK:connect_one_way_entrance("MM_HAUNTED_HOUSE_DISEMBARK_to_MM_HAUNTED_HOUSE_COFFIN",MM_HAUNTED_HOUSE_COFFIN,function()
    result = any(
                Eval_Logic((CanHitMultiple(0) or HasHoop()),0),
                Eval_Logic((CanHitOnce()),1)
               )
    return result

end)
MM_COFFIN_HAUNTED_HOUSE:connect_one_way_entrance("MM_COFFIN_HAUNTED_HOUSE_to_MM_COFFIN_COASTER_ENTRY",MM_COFFIN_COASTER_ENTRY,function() return HasNet() end)
MM_COASTER_ENTRY_DISEMBARK:connect_one_way_entrance("MM_COASTER_ENTRY_DISEMBARK_to_MM_COASTER_ENTRY_SL_HUB",MM_COASTER_ENTRY_SL_HUB,true)

--Crater
MM_CRATER_SL_HUB:connect_one_way_entrance("MM_CRATER_SL_HUB_to_MM_CRATER_OUTSIDE_CASTLE",MM_CRATER_OUTSIDE_CASTLE,true)
MM_CRATER_OUTSIDE_CASTLE:connect_one_way_entrance("MM_CRATER_OUTSIDE_CASTLE_to_MM_CRATER_SL_HUB",MM_CRATER_SL_HUB,function()
    result = any(
                Eval_Logic((HasFlyer()),0),
                Eval_Logic((HasFlyer() or IJ()),1)
               )
    return result

end)

-- Castle Outside
MM_OUTSIDE_CASTLE_CRATER:connect_one_way_entrance("MM_OUTSIDE_CASTLE_CRATER_to_MM_OUTSIDE_CASTLE_SIDE_ENTRY",MM_OUTSIDE_CASTLE_SIDE_ENTRY,true)
MM_OUTSIDE_CASTLE_CRATER:connect_one_way_entrance("MM_OUTSIDE_CASTLE_CRATER_to_MM_OUTSIDE_CASTLE_CASTLE_MAIN",MM_OUTSIDE_CASTLE_CASTLE_MAIN,function() return MM_Lamp() end)
MM_OUTSIDE_CASTLE_SIDE_ENTRY:connect_one_way_entrance("MM_OUTSIDE_CASTLE_SIDE_ENTRY_to_MM_OUTSIDE_CASTLE_CRATER",MM_OUTSIDE_CASTLE_CRATER,true)
MM_OUTSIDE_CASTLE_CASTLE_MAIN:connect_one_way_entrance("MM_OUTSIDE_CASTLE_CASTLE_MAIN_to_MM_OUTSIDE_CASTLE_CRATER",MM_OUTSIDE_CASTLE_CRATER,true)

--Castle Foyer
MM_OUTSIDE_CASTLE_CASTLE_MAIN:connect_one_way_entrance("MM_OUTSIDE_CASTLE_CASTLE_MAIN_to_MM_CASTLE_MAIN_MONKEY_HEAD",MM_CASTLE_MAIN_MONKEY_HEAD,function()
    result = any(
                Eval_Logic((HasHoop() and HasRC()),0),
                Eval_Logic((HasRC()),2)
               )
    return result

end)
MM_OUTSIDE_CASTLE_CASTLE_MAIN:connect_one_way_entrance("MM_OUTSIDE_CASTLE_CASTLE_MAIN_to_MM_CASTLE_MAIN_SPECTER1",MM_CASTLE_MAIN_SPECTER1,function()
    result = any(
                Eval_Logic((has("MM-Painting")),0),
                Eval_Logic((has("MM-Painting") or IJ() or SuperFlyer(MM_OUTSIDE_CASTLE_CASTLE_MAIN,1)),1)
               )
    return result

end)
MM_CASTLE_MAIN_MONKEY_HEAD:connect_one_way_entrance("MM_CASTLE_MAIN_MONKEY_HEAD_to_MM_CASTLE_MAIN_OUTSIDE_CASTLE",MM_CASTLE_MAIN_OUTSIDE_CASTLE,function() return has("MM-Painting") or IJ() or SuperFlyer(MM_CASTLE_MAIN_OUTSIDE_CASTLE,0) end)
MM_CASTLE_MAIN_MONKEY_HEAD:connect_one_way_entrance("MM_CASTLE_MAIN_MONKEY_HEAD_to_MM_CASTLE_MAIN_INSIDE_CLIMB",MM_CASTLE_MAIN_INSIDE_CLIMB,function() return HasHoop() or HasRC() end)
MM_CASTLE_MAIN_INSIDE_CLIMB:connect_one_way_entrance("MM_CASTLE_MAIN_INSIDE_CLIMB_to_MM_CASTLE_MAIN_MONKEY_HEAD",MM_CASTLE_MAIN_MONKEY_HEAD,function() return has("MM-Button") and (CanHitWheel() or HasFlyer()) end)
MM_CASTLE_MAIN_FROM_OUTSIDE:connect_one_way_entrance("MM_CASTLE_MAIN_FROM_OUTSIDE_to_MM_CASTLE_MAIN_OUTSIDE_CASTLE",MM_CASTLE_MAIN_OUTSIDE_CASTLE,true)

-- Monkey Head + Inside + Outside Climb
MM_INSIDE_CLIMB_CASTLE_MAIN:connect_one_way_entrance("MM_INSIDE_CLIMB_CASTLE_MAIN_to_MM_INSIDE_CLIMB_OUTSIDE_CLIMB",MM_INSIDE_CLIMB_OUTSIDE_CLIMB,true)
MM_INSIDE_CLIMB_OUTSIDE_CLIMB:connect_one_way_entrance("MM_INSIDE_CLIMB_OUTSIDE_CLIMB_to_MM_INSIDE_CLIMB_CASTLE_MAIN",MM_INSIDE_CLIMB_CASTLE_MAIN,true)
MM_OUTSIDE_CLIMB_INSIDE_CLIMB:connect_one_way_entrance("MM_OUTSIDE_CLIMB_INSIDE_CLIMB_to_MM_OUTSIDE_CLIMB_CASTLE_MAIN",MM_OUTSIDE_CLIMB_CASTLE_MAIN,function()
    result = any(
                Eval_Logic((HasFlyer() and HasRC() and HasSling()),0),
                Eval_Logic(((HasFlyer() and HasRC() and HasSling()) or IJ()),2)
               )
    return result

end)

--Monkeys
--Coaster
MM_COASTER_ENTRY_SL_HUB:connect_one_way("MM_Goopo",function() return HasNet() end)

--Haunted House
MM_HAUNTED_HOUSE_DISEMBARK:connect_one_way("MM_Porto",function()
    result = any(
                Eval_Logic(((CanHitMultiple(0) or HasHoop()) and HasNet()),0),
                Eval_Logic((CanHitOnce() and HasNet()),1)
               )
    return result

end)

--Coffin Room
MM_COFFIN_HAUNTED_HOUSE:connect_one_way("MM_Slam",function() return HasNet() end)
MM_COFFIN_HAUNTED_HOUSE:connect_one_way("MM_Junk",function() return HasNet() end)
MM_COFFIN_HAUNTED_HOUSE:connect_one_way("MM_Crib",function() return HasNet() end)

--Circus
MM_CIRCUS_SL_HUB:connect_one_way("MM_Professor",function()
    result = any(
                Eval_Logic((HasFlyer() and (HasClub() or HasSling() or HasPunch())),0),
                Eval_Logic(((HasFlyer() or IJ()) and (HasClub() or HasSling() or HasPunch())),1),
                Eval_Logic(((HasFlyer() or IJ()) and (CanHitMultiple(2) or HasRC())),2)
               )
    return result

end)

--Go Karz
MM_GO_KARZ_SL_HUB:connect_one_way("MM_Jake",function()
    result = any(
                Eval_Logic((HasClub() or HasPunch()),0),
                Eval_Logic((CanHitMultiple(1)),1)
               )
    return result

end)

--Western Land
MM_WESTERN_SL_HUB:connect_one_way("MM_Nak",function()
    result = any(
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasSling() or HasHoop()) and HasNet()),1),
                Eval_Logic(((HasSling() or HasHoop() or HasFlyer()) and HasNet()),2)
               )
    return result

end)
MM_WESTERN_SL_HUB:connect_one_way("MM_Cloy",function() return HasNet() end)
MM_WESTERN_SL_HUB:connect_one_way("MM_Shaw",function()
    result = any(
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasSling() or HasHoop()) and HasNet()),1),
                Eval_Logic(((HasSling() or HasHoop() or HasFlyer()) and HasNet()),2)
               )
    return result

end)
MM_WESTERN_SL_HUB:connect_one_way("MM_Flea",function()
    result = any(
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasSling() or HasHoop()) and HasNet()),1),
                Eval_Logic(((HasSling() or HasHoop() or HasFlyer()) and HasNet()),2)
               )
    return result

end)

--Crater
MM_CRATER_SL_HUB:connect_one_way("MM_Schafette",function()
    result = any(
                Eval_Logic((HasFlyer() and HasNet()),0),
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),1),
                Eval_Logic(((HasFlyer() or IJ() or HasHoop()) and HasNet()),2)
               )
    return result

end)

--Castle Outside
MM_OUTSIDE_CASTLE_CRATER:connect_one_way("MM_Donovan",function()
    result = any(
                --Eval_Logic((has("MM-UFOs") and HasSling() and HasNet()),0),
                --Eval_Logic((has("MM-UFOs") and (HasClub() or HasSling() or HasPunch()) and HasNet()),1)
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasClub() or HasSling() or HasPunch()) and HasNet()),1)
               )
    return result

end)
MM_OUTSIDE_CASTLE_CRATER:connect_one_way("MM_Laura",function()
    result = any(
                --Eval_Logic((has("MM-UFOs") and HasSling() and HasNet()),0),
                --Eval_Logic((has("MM-UFOs") and (HasClub() or HasSling() or HasPunch()) and HasNet()),1)
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasClub() or HasSling() or HasPunch()) and HasNet()),1)
               )
    return result

end)

--Castle Foyer
MM_CASTLE_MAIN_OUTSIDE_CASTLE:connect_one_way("MM_Uribe",function() return HasPunch() and HasNet() end)
MM_CASTLE_MAIN_OUTSIDE_CASTLE:connect_one_way("MM_Gordo",function()
    result = any(
                Eval_Logic((HasRC() and HasNet()),0),
                Eval_Logic(((HasRC() or HasFlyer()) and HasNet()),1)
               )
    return result

end)
MM_CASTLE_MAIN_OUTSIDE_CASTLE:connect_one_way("MM_Raeski",function() return HasNet() end)
MM_CASTLE_MAIN_OUTSIDE_CASTLE:connect_one_way("MM_Poopie",function() return CanHitOnce() and HasNet() end)

--Inside Climb
MM_INSIDE_CLIMB_CASTLE_MAIN:connect_one_way("MM_Teacup",function() return HasNet() end)
MM_INSIDE_CLIMB_CASTLE_MAIN:connect_one_way("MM_Shine",function() return HasNet() end)

--Space Climb
MM_OUTSIDE_CLIMB_INSIDE_CLIMB:connect_one_way("MM_Wrench",function() return (HasFlyer() or IJ()) and HasNet() end)
MM_OUTSIDE_CLIMB_INSIDE_CLIMB:connect_one_way("MM_Bronson",function()
    result = any(
                Eval_Logic((HasFlyer() and HasRC() and HasNet()),0),
                Eval_Logic((((HasFlyer() and HasRC()) or IJ()) and HasNet()),2)
               )
    return result

end)

--Monkey Head Room
MM_MONKEY_HEAD_CASTLE_MAIN:connect_one_way("MM_Bungee",function() return (CanHitWheel() or HasFlyer()) and HasNet() end)
MM_MONKEY_HEAD_CASTLE_MAIN:connect_one_way("MM_Carro",function()
    result = any(
                Eval_Logic(((CanHitWheel(0) or HasFlyer()) and HasRC() and HasNet()),0),
                Eval_Logic(((CanHitWheel(1) or HasFlyer()) and (HasRC() or HasSling()) and HasNet()),1)
               )
    return result

end)
MM_MONKEY_HEAD_CASTLE_MAIN:connect_one_way("MM_Carlito",function()
    result = any(
                Eval_Logic((HasSling() and HasFlyer() and HasNet()),0),
                Eval_Logic((HasClub() or HasSling() or HasPunch() or HasFlyer()),1),
                Eval_Logic(((CanHitWheel(2) or HasFlyer()) and HasNet()),2)
               )
    return result

end)

--"Warning" Side Room
MM_SIDE_ENTRY_OUTSIDE_CASTLE:connect_one_way("MM_BG",function()
    result = any(
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasSling() or HasFlyer()) and HasNet()),1)
               )
    return result

end)

--Specter 1
MM_SPECTER1_ROOM:connect_one_way("MM_Specter",function()
    result = any(
                Eval_Logic((HasClub() or HasPunch()) and ((isMMToken() == false) or Tokens()),0),
                Eval_Logic(((HasClub() or HasSling() or HasPunch()) and ((isMMToken() == false) or Tokens())),1)
               )
    return result

end)

--Coins
MM_COASTER1_ENTRY:connect_one_way("MM_C_Coaster (Room 1)",true)
MM_COASTER2_ENTRY:connect_one_way("MM_C_Coaster (Room 2)",true)
MM_HAUNTED_HOUSE_DISEMBARK:connect_one_way("MM_C_Haunted House",function() return HasFlyer() or IJ() end)
MM_WESTERN_SL_HUB:connect_one_way("MM_C_Western Land",true)
MM_CRATER_OUTSIDE_CASTLE:connect_one_way("MM_C_Crater",function() return HasFlyer() or IJ() end)
MM_OUTSIDE_CASTLE_CRATER:connect_one_way("MM_C_Outside Castle",true)
MM_CASTLE_MAIN_OUTSIDE_CASTLE:connect_one_way("MM_C_Castle Main",function() return CanHitOnce() end)
MM_OUTSIDE_CLIMB_INSIDE_CLIMB:connect_one_way("MM_C_Climb (Outside)",function()
    result = any(
                Eval_Logic((HasFlyer() and HasRC()),0),
                Eval_Logic(((HasFlyer() and HasRC()) or IJ()),2)
               )
    return result

end)
MM_MONKEY_HEAD_CASTLE_MAIN:connect_one_way("MM_C_Monkey Head",function()
    result = any(
                Eval_Logic((HasSling() and HasFlyer()),0),
                Eval_Logic(((HasClub() or HasSling() or HasPunch() or HasFlyer()) and HasNet()),1),
                Eval_Logic((CanHitWheel(2) or HasFlyer()),2)
               )
    return result

end)
MM_SIDE_ENTRY_OUTSIDE_CASTLE:connect_one_way("MM_C_Side Entry",function()
    result = any(
                Eval_Logic((HasFlyer()),0),
                Eval_Logic((HasFlyer() or IJ()),1)
               )
    return result

end)
--Mailboxes
MM_COASTER_ENTRY_SL_HUB:connect_one_way("MM_M_The Terror Coaster",true)
