-- time_station = apeescape_location.new("time_station")
local TJ_ENTRY = apeescape_location.new("TJ_Entry")
local TJ_MUSHROOM = apeescape_location.new("TJ_MUSHROOM")
local TJ_FISH = apeescape_location.new("TJ_FISH")
local TJ_BOULDER = apeescape_location.new("TJ_BOULDER")
local TJ_TENT = apeescape_location.new("TJ_TENT")

local TJ_ENTRY_MUSHROOM = apeescape_location.new("TJ_ENTRY_MUSHROOM")
local TJ_ENTRY_FISH = apeescape_location.new("TJ_ENTRY_FISH")
local TJ_ENTRY_BOULDER = apeescape_location.new("TJ_ENTRY_BOULDER")
local TJ_MUSHROOM_ENTRY = apeescape_location.new("TJ_MUSHROOM_ENTRY")
local TJ_MUSHROOMMAIN = apeescape_location.new("TJ_MUSHROOMMAIN")
local TJ_FISH_ENTRY = apeescape_location.new("TJ_FISH_ENTRY")
local TJ_FISHBOAT = apeescape_location.new("TJ_FISHBOAT")
local TJ_FISH_TENT = apeescape_location.new("TJ_FISH_TENT")
local TJ_TENT_FISH = apeescape_location.new("TJ_TENT_FISH")
local TJ_TENT_BOULDER = apeescape_location.new("TJ_TENT_BOULDER")
local TJ_BOULDER_TENT = apeescape_location.new("TJ_BOULDER_TENT")
local TJ_BOULDER_ENTRY = apeescape_location.new("TJ_BOULDER_TENT")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - TJ",TJ_ENTRY,function() return TJ_Access() end)

--Entrances
TJ_ENTRY_MUSHROOM:connect_one_way_entrance("TJ_ENTRY_MUSHROOM_to_TJ_MUSHROOM_ENTRY",TJ_MUSHROOM_ENTRY)
TJ_ENTRY_FISH:connect_one_way_entrance("TJ_ENTRY_FISH_to_TJ_FISH_ENTRY",TJ_FISH_ENTRY)
TJ_ENTRY_BOULDER:connect_one_way_entrance("TJ_ENTRY_BOULDER_to_TJ_BOULDER_ENTRY",TJ_BOULDER_ENTRY)
TJ_MUSHROOM_ENTRY:connect_one_way_entrance("TJ_MUSHROOM_ENTRY_to_TJ_ENTRY_MUSHROOM",TJ_ENTRY_MUSHROOM)
TJ_FISH_ENTRY:connect_one_way_entrance("TJ_FISH_ENTRY_to_TJ_ENTRY_FISH",TJ_ENTRY_FISH)
TJ_FISH_TENT:connect_one_way_entrance("TJ_FISH_TENT_to_TJ_TENT_FISH",TJ_TENT_FISH)
TJ_TENT_FISH:connect_one_way_entrance("TJ_TENT_FISH_to_TJ_FISH_TENT",TJ_FISH_TENT)
TJ_TENT_BOULDER:connect_one_way_entrance("TJ_TENT_BOULDER_to_TJ_BOULDER_TENT",TJ_BOULDER_TENT)
TJ_BOULDER_ENTRY:connect_one_way_entrance("TJ_BOULDER_ENTRY_to_TJ_ENTRY_BOULDER",TJ_ENTRY_BOULDER)
TJ_BOULDER_TENT:connect_one_way_entrance("TJ_BOULDER_TENT_to_TJ_TENT_BOULDER",TJ_TENT_BOULDER)


TJ_ENTRY:connect_one_way_entrance("TJ_ENTRY_to_TJ_ENTRY_MUSHROOM",TJ_ENTRY_MUSHROOM,true)
TJ_ENTRY:connect_one_way_entrance("TJ_ENTRY_to_TJ_ENTRY_FISH",TJ_ENTRY_FISH,function()
    result = any(
                Eval_Logic((CanSwim()),0),
                Eval_Logic((CanSwim() or ((IJ() or HasHoop()) and HasFlyer())),2)
               )
    return result

end)

TJ_ENTRY:connect_one_way_entrance("TJ_ENTRY_to_TJ_ENTRY_BOULDER",TJ_ENTRY_BOULDER,function()
    result = any(
                Eval_Logic((CanSwim()),0),
                Eval_Logic((CanSwim() or HasFlyer()),1)
               )
    return result

end)

TJ_ENTRY_MUSHROOM:connect_one_way_entrance("TJ_ENTRY_MUSHROOM_to_TJ_ENTRY",TJ_ENTRY,true)
TJ_ENTRY_FISH:connect_one_way_entrance("TJ_ENTRY_FISH_to_TJ_ENTRY",TJ_ENTRY,function() return CanDive() end)
TJ_ENTRY_BOULDER:connect_one_way_entrance("TJ_ENTRY_BOULDER_to_TJ_ENTRY",TJ_ENTRY,function() return CanSwim() end)
TJ_MUSHROOM_ENTRY:connect_one_way_entrance("TJ_MUSHROOM_ENTRY_to_TJ_MUSHROOMMAIN",TJ_MUSHROOMMAIN,function()
    result = any(
                Eval_Logic((HasFlyer() and CanHitWheel(0)),0),
                Eval_Logic((IJ() or HasHoop() or (HasFlyer() and CanHitWheel(1))),1),
                Eval_Logic((IJ() or HasHoop() or HasFlyer()),2)
               )
    return result

end)

TJ_FISH_ENTRY:connect_one_way_entrance("TJ_FISH_ENTRY_to_TJ_FISHBOAT",TJ_FISHBOAT,function()
    result = any(
                Eval_Logic((CanSwim() or HasFlyer()),0),
                Eval_Logic((CanSwim() or IJ() or HasHoop() or HasFlyer()),2)
               )
    return result

end)

TJ_FISH_TENT:connect_one_way_entrance("TJ_FISH_TENT_to_TJ_FISHBOAT",TJ_FISHBOAT,function()
    result = any(
                Eval_Logic((CanHitWheel(0) and CanSwim()),0),
                Eval_Logic(((CanHitWheel(1) or SuperFlyer(TJ_FISH_TENT,1)) and CanSwim()),1)
               )
    return result

end)

TJ_FISHBOAT:connect_one_way_entrance("TJ_FISHBOAT_to_TJ_FISH_TENT",TJ_FISH_TENT,function()
    result = any(
                Eval_Logic((HasSling() or HasPunch() or (CanSwim() and CanHitMultiple(0))),0),
                Eval_Logic((HasSling() or HasPunch() or (CanSwim() and CanHitMultiple(1)) or SuperFlyer(TJ_FISHBOAT,1)),1)
               )
    return result

end)
TJ_TENT_FISH:connect_one_way_entrance("TJ_TENT_FISH_to_TJ_TENT_BOULDER",TJ_TENT_BOULDER,true)
TJ_TENT_BOULDER:connect_one_way_entrance("TJ_TENT_BOULDER_to_TJ_TENT_FISH",TJ_TENT_FISH,function()
    result = any(
                Eval_Logic((CanSwim() or HasFlyer()),0),
                Eval_Logic((CanSwim() or HasHoop() or HasFlyer()),1),
                Eval_Logic((CanSwim() or IJ() or HasHoop() or HasFlyer()),2)
               )
    return result

end)
TJ_BOULDER_TENT:connect_one_way_entrance("TJ_BOULDER_TENT_to_TJ_BOULDER_ENTRY",TJ_BOULDER_ENTRY,function()
    result = any(
                Eval_Logic((CanSwim() and (HasFlyer() or IJ())),0),
                Eval_Logic((CanSwim()),1)
               )
    return result

end)

--Monkeys
TJ_ENTRY:connect_one_way("TJ_Marquez",function()
    result = any(
                Eval_Logic((CanHitMultiple(0) and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)
TJ_ENTRY:connect_one_way("TJ_Livinston",function()
    result = any(
                Eval_Logic((CanHitMultiple(0) and HasNet()),0),
                Eval_Logic((CanHitOnce() and HasNet()),1)
               )
    return result

end)
TJ_ENTRY:connect_one_way("TJ_George",function() return HasNet() end)
TJ_MUSHROOMMAIN:connect_one_way("TJ_Gonzo",function() return HasNet() end)
TJ_MUSHROOMMAIN:connect_one_way("TJ_Zanzibar",function() return HasNet() end)
TJ_MUSHROOM_ENTRY:connect_one_way("TJ_Alphonse",function()
    result = any(
                Eval_Logic((HasFlyer() and CanHitWheel(0) and HasNet()),0),
                Eval_Logic(((IJ() or HasHoop() or (HasFlyer() and CanHitWheel(1))) and HasNet()),1),
                Eval_Logic(((IJ() or HasHoop() or (HasFlyer() and (CanHitMultiple(1) or HasRC())) or SuperFlyer(TJ_MUSHROOM_ENTRY,1)) and HasNet()),2)
               )
    return result

end)
TJ_FISHBOAT:connect_one_way("TJ_Maki",function()
    result = any(
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasSling() or HasFlyer()) and HasNet()),1)
               )
    return result

end)
TJ_FISHBOAT:connect_one_way("TJ_Herb",function() return HasNet() end)
TJ_FISH_TENT:connect_one_way("TJ_Dilweed",function() return HasNet() end)
TJ_TENT_BOULDER:connect_one_way("TJ_Stoddy",function() return HasNet() end)
TJ_TENT_BOULDER:connect_one_way("TJ_Mitong",function() return HasNet() end)
TJ_TENT_BOULDER:connect_one_way("TJ_Nasus",function()
    result = any(
                Eval_Logic(((HasClub() or HasSling() or HasPunch()) and HasNet()),0),
                Eval_Logic((CanHitMultiple(1) and HasNet()),2)
               )
    return result

end)
TJ_BOULDER_ENTRY:connect_one_way("TJ_Elehcim",function()
    result = any(
                Eval_Logic((CanSwim() and HasSling() and HasNet()),0),
                Eval_Logic((CanSwim() and HasNet()),2)
               )
    return result

end)
TJ_BOULDER_TENT:connect_one_way("TJ_Selur",function()
    result = any(
                Eval_Logic(((HasSling() or HasFlyer()) and HasNet()),0),
                Eval_Logic(((HasClub() or HasSling() or HasFlyer()) and HasNet()),2)
               )
    return result

end)



--Coins
TJ_ENTRY:connect_one_way("TJ_C_Entry",function()
    result = any(
                Eval_Logic((HasFlyer()),0),
                Eval_Logic((IJ() or HasHoop() or HasFlyer()),2)
               )
    return result

end)

TJ_MUSHROOMMAIN:connect_one_way("TJ_C_Mushroom Area",true)
TJ_FISHBOAT:connect_one_way("TJ_C_Fish Room",true)
TJ_TENT_BOULDER:connect_one_way("TJ_C_Tent/Vine Room",true)

--Mailboxes
TJ_ENTRY:connect_one_way("TJ_M_Monkeys are Hiding",true)
TJ_ENTRY:connect_one_way("TJ_M_Monkey Camera Tutorial",true)
TJ_MUSHROOM_ENTRY:connect_one_way("TJ_M_A Flying Gadget",function() return CanHitOnce() end)
TJ_MUSHROOM_ENTRY:connect_one_way("TJ_M_Completely Cleared",function()
    result = any(
                Eval_Logic((HasFlyer()),0),
                Eval_Logic((IJ() or HasHoop() or HasFlyer()),2)
               )
    return result

end)
TJ_FISHBOAT:connect_one_way("TJ_M_You 'Must' Rowboat",true)
TJ_FISHBOAT:connect_one_way("TJ_M_Come Back Later!",function() return CanHitOnce() end)
TJ_FISHBOAT:connect_one_way("TJ_M_A Strange Device",true)
TJ_TENT_BOULDER:connect_one_way("TJ_M_Don't Hurt the Plants.",function() return CanHitOnce() end)
TJ_BOULDER_TENT:connect_one_way("TJ_M_Find Specter Coins",function() return CanHitOnce() end)
