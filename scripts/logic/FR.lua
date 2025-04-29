-- time_station = apeescape_location.new("time_station")
local FR_ENTRY = apeescape_location.new("FR_ENTRY")

local FR_ENTRY_CAVERNS = apeescape_location.new("FR_ENTRY_CAVERNS")
local FR_CAVERNS_ENTRY = apeescape_location.new("FR_CAVERNS_ENTRY")
local FR_CAVERNS_WATER = apeescape_location.new("FR_CAVERNS_WATER")
local FR_WATER_CAVERNS = apeescape_location.new("FR_WATER_CAVERNS")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - FR",FR_ENTRY,function() return FR_Access() end)

--Entrances

FR_ENTRY_CAVERNS:connect_one_way_entrance("FR_ENTRY_CAVERNS_to_FR_CAVERNS_ENTRY",FR_CAVERNS_ENTRY,true)
FR_CAVERNS_ENTRY:connect_one_way_entrance("FR_CAVERNS_ENTRY_to_FR_ENTRY_CAVERNS",FR_ENTRY_CAVERNS,true)
FR_CAVERNS_WATER:connect_one_way_entrance("FR_CAVERNS_WATER_to_FR_WATER_CAVERNS",FR_WATER_CAVERNS,true)
FR_WATER_CAVERNS:connect_one_way_entrance("FR_WATER_CAVERNS_to_FR_CAVERNS_WATER",FR_CAVERNS_WATER,true)

FR_ENTRY:connect_one_way_entrance("FR_ENTRY_to_FR_ENTRY_CAVERNS",FR_ENTRY_CAVERNS,function()
    result = any(
                Eval_Logic((HasFlyer() or IJ()),0),
                Eval_Logic((true),1)
               )
    return result

end)

FR_CAVERNS_ENTRY:connect_one_way_entrance("FR_CAVERNS_ENTRY_to_FR_CAVERNS_WATER",FR_CAVERNS_WATER,function()
    result = any(
                Eval_Logic((HasFlyer() or IJ()),0),
                Eval_Logic((true),1)
               )
    return result

end)
FR_CAVERNS_WATER:connect_one_way_entrance("FR_CAVERNS_WATER_to_FR_CAVERNS_ENTRY",FR_CAVERNS_ENTRY,true)


--Monkeys
FR_ENTRY_CAVERNS:connect_one_way("FR_Storm",function() return HasNet() end)
FR_ENTRY_CAVERNS:connect_one_way("FR_Qube",function() return HasNet() end)
FR_WATER_CAVERNS:connect_one_way("FR_Ranix",function()
    result = any(
                Eval_Logic(((CanSwim() and HasNet()) or (HasSling() and CanDive() and HasWaterNet())),0),
                Eval_Logic(((CanSwim() and HasNet()) or ((HasClub() or HasSling() or HasPunch()) and CanDive() and HasWaterNet())),1),
                Eval_Logic((((CanSwim() or IJ() or (HasSling() and HasHoop() and HasFlyer())) and HasNet()) or ((HasClub() or HasSling() or HasPunch()) and (HasNet() or (CanDive() and HasWaterNet())))),2)
               )
    return result

end)
FR_WATER_CAVERNS:connect_one_way("FR_Sharpe",function()
    result = any(
                Eval_Logic(((CanSwim() or HasSling() or HasFlyer()) and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)
FR_WATER_CAVERNS:connect_one_way("FR_Sticky",function() return HasNet() end)
FR_WATER_CAVERNS:connect_one_way("FR_Droog",function()
    result = any(
                Eval_Logic((CanDive() and HasNet()),0),
                Eval_Logic(((CanDive() or HasFlyer() or IJ()) and HasNet()),2)
               )
    return result

end)
FR_CAVERNS_ENTRY:connect_one_way("FR_Gash",function() return HasNet() end)
FR_CAVERNS_WATER:connect_one_way("FR_Kundra",function() return HasNet() end)
FR_WATER_CAVERNS:connect_one_way("FR_Shadow",function()
    result = any(
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),0),
                Eval_Logic((HasNet()),1)
               )
    return result

end)

--Coins
FR_ENTRY_CAVERNS:connect_one_way("FR_C_Entry",function()
    result = any(
                Eval_Logic((HasFlyer() or IJ()),0),
                Eval_Logic((true),1)
               )
    return result

end)
FR_WATER_CAVERNS:connect_one_way("FR_C_Water Room",function() return CanDive() end)
FR_ENTRY_CAVERNS:connect_one_way("FR_C_Caverns",function()
    result = any(
                Eval_Logic((CanSwim() or HasFlyer()),0),
                Eval_Logic((true),1)
               )
    return result

end)

--Mailboxes
FR_CAVERNS_ENTRY:connect_one_way("FR_M_Select Button Tutorial",function() return CanHitOnce() end)