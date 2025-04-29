-- time_station = apeescape_location.new("time_station")
local ST_ENTRY = apeescape_location.new("ST_ENTRY")

local ST_ENTRY_TEMPLE = apeescape_location.new("ST_ENTRY_TEMPLE")
local ST_ENTRY_WELL = apeescape_location.new("ST_ENTRY_WELL")
local ST_TEMPLE = apeescape_location.new("ST_TEMPLE")
local ST_WELL = apeescape_location.new("ST_WELL")



--TS Main Hub
time_station:connect_one_way_entrance("Time Station - ST",ST_ENTRY,function() return ST_Access() end)

--Entrances
ST_ENTRY_TEMPLE:connect_one_way_entrance("ST_ENTRY_TEMPLE_to_ST_TEMPLE",ST_TEMPLE,true)
ST_ENTRY_WELL:connect_one_way_entrance("ST_ENTRY_WELL_to_ST_WELL",ST_WELL,true)
ST_TEMPLE:connect_one_way_entrance("ST_TEMPLE_to_ST_ENTRY_TEMPLE",ST_ENTRY_TEMPLE,true)
ST_WELL:connect_one_way_entrance("ST_WELL_to_ST_ENTRY_WELL",ST_ENTRY_WELL,true)

ST_ENTRY:connect_one_way_entrance("ST_ENTRY_to_ST_ENTRY_TEMPLE",ST_ENTRY_TEMPLE,true)
ST_ENTRY:connect_one_way_entrance("ST_ENTRY_to_ST_ENTRY_WELL",ST_ENTRY_WELL,true)
ST_ENTRY_TEMPLE:connect_one_way_entrance("ST_ENTRY_TEMPLE_to_ST_ENTRY",ST_ENTRY,true)
ST_ENTRY_WELL:connect_one_way_entrance("ST_ENTRY_WELL_to_ST_ENTRY",ST_ENTRY,true)


--Monkeys
--Entry
ST_ENTRY:connect_one_way("ST_Taku",function() return HasNet() end)
ST_ENTRY:connect_one_way("ST_Rocka",function() return HasNet() end)
ST_ENTRY:connect_one_way("ST_Maralea",function() return HasNet() end)

ST_ENTRY:connect_one_way("ST_Wog",function()
    result = any(
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasSling() or HasClub() or HasFlyer()) and HasNet()),1)
               )
    return result

end)
ST_ENTRY:connect_one_way("ST_Freeto",function() return HasNet() end)
--Temple
ST_TEMPLE:connect_one_way("ST_Mayi",function() return HasNet() end)
ST_TEMPLE:connect_one_way("ST_Owyang",function() return HasNet() end)
ST_TEMPLE:connect_one_way("ST_Long",function() return HasNet() end)
ST_TEMPLE:connect_one_way("ST_Elly",function()
    result = any(
                Eval_Logic((HasFlyer() and (HasHoop() or HasSling() or HasRC()) and HasNet()),0),
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),1)
               )
    return result

end)
ST_TEMPLE:connect_one_way("ST_Chunky",function()
    result = any(
                Eval_Logic((HasFlyer() and HasNet()),0),
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),1)
               )
    return result

end)
--Well
ST_WELL:connect_one_way("ST_Voti",function()
    result = any(
                Eval_Logic((HasSling() and HasNet()),0),
                Eval_Logic(((HasSling() or (HasHoop() and HasFlyer()) or SuperFlyer(ST_WELL,1)) and HasNet()),1)
               )
    return result

end)
ST_WELL:connect_one_way("ST_QuelTin",function() return HasNet() end)
ST_WELL:connect_one_way("ST_Phaldo",function() return HasNet() end)

--Coins
ST_ENTRY:connect_one_way("ST_C_Outside",true)
ST_TEMPLE:connect_one_way("ST_C_Temple",true)
ST_WELL:connect_one_way("ST_C_Well",function()
    result = any(
                Eval_Logic((HasFlyer()),0),
                Eval_Logic((HasFlyer() or IJ()),1)
               )
    return result

end)

--Mailboxes
ST_TEMPLE:connect_one_way("ST_M_Green Pants = Great Vision",function() return CanHitOnce() end)
ST_TEMPLE:connect_one_way("ST_M_Light Blue Pants = Gentle",function() return CanHitOnce() end)
ST_WELL:connect_one_way("ST_M_Rest and Relax",function() return CanHitOnce() end)