-- time_station = apeescape_location.new("time_station")
local DI_ENTRY = apeescape_location.new("DI_ENTRY")

local DI_ENTRY_STOMACH = apeescape_location.new("DI_ENTRY_STOMACH")
local DI_STOMACH_ENTRY = apeescape_location.new("DI_STOMACH_SLIDE_ROOM")
local DI_STOMACH_SLIDE_ROOM = apeescape_location.new("DI_STOMACH_SLIDE_ROOM")
local DI_SLIDE_ROOM_STOMACH = apeescape_location.new("DI_SLIDE_ROOM_STOMACH")
local DI_SLIDE_ROOM_GALLERY = apeescape_location.new("DI_SLIDE_ROOM_GALLERY")
local DI_SLIDE_ROOM_GALLERY_WATER = apeescape_location.new("DI_SLIDE_ROOM_GALLERY_WATER")
local DI_GALLERY_SLIDE_ROOM_TOP = apeescape_location.new("DI_GALLERY_SLIDE_ROOM_TOP")
local DI_GALLERY_SLIDE_ELEVATOR = apeescape_location.new("DI_GALLERY_SLIDE_ELEVATOR")
local DI_GALLERY_TENTACLE = apeescape_location.new("DI_GALLERY_TENTACLE")
local DI_TENTACLE = apeescape_location.new("DI_TENTACLE")

local DI_GALLERYBOULDER = apeescape_location.new("DI_GALLERYBOULDER")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - DI",DI_ENTRY,function() return DI_Access() end)

--Entrances
DI_ENTRY_STOMACH:connect_one_way_entrance("DI_ENTRY_STOMACH_to_DI_STOMACH_ENTRY",DI_STOMACH_ENTRY,true)
DI_STOMACH_ENTRY:connect_one_way_entrance("DI_STOMACH_ENTRY_to_DI_ENTRY_STOMACH",DI_ENTRY_STOMACH,true)
DI_STOMACH_SLIDE_ROOM:connect_one_way_entrance("DI_STOMACH_SLIDE_ROOM_to_DI_SLIDE_ROOM_STOMACH",DI_SLIDE_ROOM_STOMACH,true)
DI_SLIDE_ROOM_STOMACH:connect_one_way_entrance("DI_SLIDE_ROOM_STOMACH_to_DI_STOMACH_SLIDE_ROOM",DI_STOMACH_SLIDE_ROOM,true)
DI_SLIDE_ROOM_GALLERY:connect_one_way_entrance("DI_SLIDE_ROOM_GALLERY_to_DI_GALLERY_SLIDE_ROOM_TOP",DI_GALLERY_SLIDE_ROOM_TOP,true)
DI_SLIDE_ROOM_GALLERY_WATER:connect_one_way_entrance("DI_SLIDE_ROOM_GALLERY_WATER_to_DI_GALLERY_SLIDE_ELEVATOR",DI_GALLERY_SLIDE_ELEVATOR,true)
DI_GALLERY_SLIDE_ROOM_TOP:connect_one_way_entrance("DI_GALLERY_SLIDE_ROOM_TOP_to_DI_SLIDE_ROOM_GALLERY",DI_SLIDE_ROOM_GALLERY,true)
DI_GALLERY_SLIDE_ELEVATOR:connect_one_way_entrance("DI_GALLERY_SLIDE_ELEVATOR_to_DI_SLIDE_ROOM_GALLERY_WATER",DI_SLIDE_ROOM_GALLERY_WATER,true)
DI_GALLERY_TENTACLE:connect_one_way_entrance("DI_GALLERY_TENTACLE_to_DI_TENTACLE",DI_TENTACLE,true)
DI_TENTACLE:connect_one_way_entrance("DI_TENTACLE_to_DI_GALLERY_TENTACLE",DI_GALLERY_TENTACLE,true)


DI_ENTRY:connect_one_way_entrance("DI_ENTRY_to_DI_ENTRY_STOMACH",DI_ENTRY_STOMACH,function() return CanHitOnce() end)
DI_ENTRY_STOMACH:connect_one_way_entrance("DI_ENTRY_STOMACH_to_DI_ENTRY",DI_ENTRY,true)
DI_STOMACH_ENTRY:connect_one_way_entrance("DI_STOMACH_ENTRY_to_DI_STOMACH_SLIDE_ROOM",DI_STOMACH_SLIDE_ROOM,true)
DI_STOMACH_SLIDE_ROOM:connect_one_way_entrance("DI_STOMACH_SLIDE_ROOM_to_DI_STOMACH_ENTRY",DI_STOMACH_ENTRY,true)
DI_SLIDE_ROOM_STOMACH:connect_one_way_entrance("DI_SLIDE_ROOM_STOMACH_to_DI_SLIDE_ROOM_GALLERY_WATER",DI_SLIDE_ROOM_GALLERY_WATER,function()
    result = any(
                Eval_Logic(CanSwim() and CanHitMultiple(0),0),
                Eval_Logic(CanHitMultiple(1),1),
                Eval_Logic(CanHitOnce(),2)
               )
    return result

end)
DI_SLIDE_ROOM_STOMACH:connect_one_way_entrance("DI_SLIDE_ROOM_STOMACH_to_DI_SLIDE_ROOM_GALLERY",DI_SLIDE_ROOM_GALLERY,function()
    result = any(
                Eval_Logic(has("DI-Button") and CanHitOnce(),0),
                Eval_Logic((has("DI-Button") and CanHitOnce()) or IJ(),2)
               )
    return result

end)
DI_SLIDE_ROOM_GALLERY_WATER:connect_one_way_entrance("DI_SLIDE_ROOM_GALLERY_WATER_to_DI_SLIDE_ROOM_STOMACH",DI_SLIDE_ROOM_STOMACH,function()
    result = any(
                Eval_Logic(IJ(),2)
               )
    return result

end)
DI_SLIDE_ROOM_GALLERY:connect_one_way_entrance("DI_SLIDE_ROOM_GALLERY_to_DI_SLIDE_ROOM_STOMACH",DI_SLIDE_ROOM_STOMACH,function()return CanHitOnce() end)
DI_GALLERY_SLIDE_ELEVATOR:connect_one_way_entrance("DI_GALLERY_SLIDE_ELEVATOR_to_DI_GALLERY_SLIDE_ROOM_TOP",DI_GALLERY_SLIDE_ROOM_TOP,function()return CanDive() end)
DI_GALLERY_SLIDE_ROOM_TOP:connect_one_way_entrance("DI_GALLERY_SLIDE_ROOM_TOP_to_DI_GALLERY_SLIDE_ELEVATOR",DI_GALLERY_SLIDE_ELEVATOR,function()return CanDive() end)
DI_GALLERY_SLIDE_ROOM_TOP:connect_one_way_entrance("DI_GALLERY_SLIDE_ROOM_TOP_to_DI_GALLERYBOULDER",DI_GALLERYBOULDER,function()
    result = any(
                Eval_Logic((HasHoop() or HasRC()),0),
                Eval_Logic((HasHoop() or HasRC() or IJ() or HasFlyer()),1)
               )
    return result

end)
DI_GALLERYBOULDER:connect_one_way_entrance("DI_GALLERYBOULDER_to_DI_GALLERY_SLIDE_ROOM_TOP",DI_GALLERY_SLIDE_ROOM_TOP,function()return true end)
DI_GALLERYBOULDER:connect_one_way_entrance("DI_GALLERYBOULDER_to_DI_GALLERY_TENTACLE",DI_GALLERY_TENTACLE,function()return DI_Lamp() end)
DI_GALLERY_TENTACLE:connect_one_way_entrance("DI_GALLERY_TENTACLE_to_DI_GALLERYBOULDER",DI_GALLERYBOULDER,function()return DI_Lamp() end)

--Monkeys
DI_ENTRY:connect_one_way("DI_TonTon",function() return CanHitOnce() and HasNet() end)
DI_ENTRY:connect_one_way("DI_Stuw",function()
    result = any(
                Eval_Logic((CanHitOnce() and HasNet()),0),
                Eval_Logic(((CanHitOnce() or CanSwim()) and HasNet()),1)
               )
    return result

end)
DI_STOMACH_ENTRY:connect_one_way("DI_Mars",function()
    result = any(
                Eval_Logic((HasRC() and (HasNet() or (CanDive() and HasWaterNet()))),0),
                Eval_Logic((HasRC() and (HasNet() or HasWaterNet())),1)
               )
    return result

end)
DI_STOMACH_ENTRY:connect_one_way("DI_Murky",function() return HasNet() end)
DI_STOMACH_ENTRY:connect_one_way("DI_Horke",function()
    result = any(
                Eval_Logic(((CanSwim() or HasFlyer()) and CanHitMultiple(0) and HasNet()),0),
                Eval_Logic(((CanSwim() or HasFlyer()) and HasNet()),1),
                Eval_Logic(((CanSwim() or IJ() or HasFlyer()) and HasNet()),2)
               )
    return result

end)

DI_GALLERY_SLIDE_ROOM_TOP:connect_one_way("DI_Howeerd",function()
    result = any(
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasSling() or HasFlyer()) and HasNet()),2)
               )
    return result

end)
DI_GALLERY_SLIDE_ROOM_TOP:connect_one_way("DI_Robbin",function()
    result = any(
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasSling() or HasFlyer()) and HasNet()),2)
               )
    return result

end)
DI_GALLERYBOULDER:connect_one_way("DI_Jakkee",function() return HasNet() end)
DI_GALLERYBOULDER:connect_one_way("DI_Frederic",function() return HasNet() end)
DI_GALLERYBOULDER:connect_one_way("DI_Baba",function() return HasNet() end)
DI_TENTACLE:connect_one_way("DI_Quirck",function() return CanHitMultiple() and HasNet() end)

--Coins
DI_ENTRY:connect_one_way("DI_C_Outside",function()
    result = any(
                Eval_Logic((CanHitOnce()),0),
                Eval_Logic((CanHitOnce() or CanSwim()),1)
               )
    return result

end)
DI_STOMACH_ENTRY:connect_one_way("DI_C_Stomach",function() return CanDive() end)
DI_SLIDE_ROOM_STOMACH:connect_one_way("DI_C_Slide Room",function()
    result = any(
                Eval_Logic((CanSwim() and (HasPunch() or HasNet())),0),
                Eval_Logic((HasPunch() or HasNet()),1)
               )
    return result

end)
DI_SLIDE_ROOM_GALLERY_WATER:connect_one_way("DI_C_Slide Room2",function()
    result = any(
                Eval_Logic(((HasClub() or HasPunch() or IJ()) and (HasPunch() or HasNet())),1),
                Eval_Logic(((HasClub() or HasPunch() or IJ() or SuperFlyer(DI_SLIDE_ROOM_GALLERY_WATER,2)) and (HasPunch() or HasNet())),2)
               )
    return result

end)
--Mailboxes
DI_ENTRY:connect_one_way("DI_M_I Named Him Dexter",function() return CanHitOnce() end)
DI_ENTRY:connect_one_way("DI_M_Blue Pants",function() return CanHitOnce() end)
DI_SLIDE_ROOM_STOMACH:connect_one_way("DI_M_Don't Get Lost!",function() return CanHitOnce() end)
DI_GALLERY_SLIDE_ELEVATOR:connect_one_way("DI_M_Normal Pellet Scare",function() return CanHitOnce() end)