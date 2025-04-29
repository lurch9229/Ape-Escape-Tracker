-- time_station = apeescape_location.new("time_station")
local CB_ENTRY = apeescape_location.new("CB_ENTRY")

local CB_ENTRY_SECOND_ROOM = apeescape_location.new("CB_ENTRY_SECOND_ROOM")
local CB_SECOND_ROOM_ENTRY = apeescape_location.new("CB_SECOND_ROOM_ENTRY")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - CB",CB_ENTRY,function() return CB_Access() end)

--Entrances
CB_ENTRY_SECOND_ROOM:connect_one_way_entrance("CB_ENTRY_SECOND_ROOM_to_CB_SECOND_ROOM_ENTRY",CB_SECOND_ROOM_ENTRY,true)
CB_SECOND_ROOM_ENTRY:connect_one_way_entrance("CB_SECOND_ROOM_ENTRY_to_CB_ENTRY_SECOND_ROOM",CB_ENTRY_SECOND_ROOM,true)
CB_ENTRY:connect_one_way_entrance("CB_ENTRY_to_CB_ENTRY_SECOND_ROOM",CB_ENTRY_SECOND_ROOM,function() return CB_Lamp() end)
CB_ENTRY_SECOND_ROOM:connect_one_way_entrance("CB_ENTRY_SECOND_ROOM_to_CB_ENTRY",CB_ENTRY,true)



--Monkeys
CB_ENTRY:connect_one_way("CB_CoolBlue",function() return HasNet() or HasWaterNet() end)
CB_ENTRY:connect_one_way("CB_Sandy",function() return HasNet() end)
CB_ENTRY:connect_one_way("CB_ShellE",function() return HasNet() end)
CB_ENTRY:connect_one_way("CB_Gidget",function() return HasNet() end)

CB_SECOND_ROOM_ENTRY:connect_one_way("CB_Shaka",function() return HasNet() end)
CB_SECOND_ROOM_ENTRY:connect_one_way("CB_Puka",function() return (HasFlyer() or CanHitMultiple()) and HasNet() end)
CB_SECOND_ROOM_ENTRY:connect_one_way("CB_MaxMahalo",function()
    result = any(
                Eval_Logic((HasFlyer() and HasSling() and HasNet()),0),
                Eval_Logic(((IJ() or HasHoop() or HasFlyer()) and (HasSling() or HasClub() or HasPunch()) and HasNet()),1)
               )
    return result

end)
CB_SECOND_ROOM_ENTRY:connect_one_way("CB_Moko",function() return (HasFlyer() or IJ()) and HasNet() end)

--Coins
CB_SECOND_ROOM_ENTRY:connect_one_way("CB_C_Second Room",true)

--Mailboxes
CB_ENTRY:connect_one_way("CB_M_Hip Drop Attack",function() return CanHitOnce() end)
CB_ENTRY:connect_one_way("CB_M_Monkey Lamp Tutorial",true)
CB_SECOND_ROOM_ENTRY:connect_one_way("CB_M_Dangerous to Fall",function() return CanHitOnce() end)
