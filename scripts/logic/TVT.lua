-- time_station = apeescape_location.new("time_station")
local TVT_ENTRY = apeescape_location.new("TVT_ENTRY")

local TVT_OUTSIDE_LOBBY = apeescape_location.new("TVT_OUTSIDE_LOBBY")
local TVT_LOBBY_OUTSIDE = apeescape_location.new("TVT_LOBBY_OUTSIDE")
local TVT_LOBBY_WATER = apeescape_location.new("TVT_LOBBY_WATER")
local TVT_LOBBY_TANK = apeescape_location.new("TVT_LOBBY_TANK")
local TVT_WATER_LOBBY = apeescape_location.new("TVT_WATER_LOBBY")
local TVT_TANK_LOBBY = apeescape_location.new("TVT_TANK_LOBBY")
local TVT_TANK_FAN = apeescape_location.new("TVT_TANK_FAN")
local TVT_TANK_BOSS = apeescape_location.new("TVT_TANK_BOSS")
local TVT_FAN_TANK = apeescape_location.new("TVT_FAN_TANK")
local TVT_BOSS_TANK = apeescape_location.new("TVT_BOSS_TANK")



--TS Main Hub
time_station:connect_one_way_entrance("Time Station - TVT",TVT_ENTRY,function() return TVT_Access() end)

--Entrances
TVT_OUTSIDE_LOBBY:connect_one_way_entrance("TVT_OUTSIDE_LOBBY_to_TVT_LOBBY_OUTSIDE",TVT_LOBBY_OUTSIDE,true)
TVT_LOBBY_OUTSIDE:connect_one_way_entrance("TVT_LOBBY_OUTSIDE_to_TVT_OUTSIDE_LOBBY",TVT_OUTSIDE_LOBBY,true)
TVT_LOBBY_WATER:connect_one_way_entrance("TVT_LOBBY_WATER_to_TVT_WATER_LOBBY",TVT_WATER_LOBBY,true)
TVT_LOBBY_TANK:connect_one_way_entrance("TVT_LOBBY_TANK_to_TVT_TANK_LOBBY",TVT_TANK_LOBBY,true)
TVT_WATER_LOBBY:connect_one_way_entrance("TVT_WATER_LOBBY_to_TVT_LOBBY_WATER",TVT_LOBBY_WATER,true)
TVT_TANK_LOBBY:connect_one_way_entrance("TVT_TANK_LOBBY_to_TVT_LOBBY_TANK",TVT_LOBBY_TANK,true)
TVT_TANK_FAN:connect_one_way_entrance("TVT_TANK_FAN_to_TVT_FAN_TANK",TVT_FAN_TANK,true)
TVT_TANK_BOSS:connect_one_way_entrance("TVT_TANK_BOSS_to_TVT_BOSS_TANK",TVT_BOSS_TANK,true)
TVT_FAN_TANK:connect_one_way_entrance("TVT_FAN_TANK_to_TVT_TANK_FAN",TVT_TANK_FAN,true)
TVT_BOSS_TANK:connect_one_way_entrance("TVT_BOSS_TANK_to_TVT_TANK_BOSS",TVT_TANK_BOSS,true)

--Outside
TVT_ENTRY:connect_one_way_entrance("TVT_ENTRY_to_TVT_OUTSIDE_LOBBY",TVT_OUTSIDE_LOBBY,true)

--Lobby
TVT_LOBBY_OUTSIDE:connect_one_way_entrance("TVT_LOBBY_OUTSIDE_to_TVT_LOBBY_WATER",TVT_LOBBY_WATER,function()
    result = any(
                Eval_Logic((HasFlyer() or IJ()),0),
                Eval_Logic((HasFlyer() or HasSling() or HasHoop() or HasClub()),1)
               )
    return result

end)
TVT_LOBBY_OUTSIDE:connect_one_way_entrance("TVT_LOBBY_OUTSIDE_to_TVT_LOBBY_TANK",TVT_LOBBY_TANK,function() return TVT_Lobby_Lamp() end)
TVT_LOBBY_WATER:connect_one_way_entrance("TVT_LOBBY_WATER_to_TVT_LOBBY_OUTSIDE",TVT_LOBBY_OUTSIDE,function() return HasFlyer() or IJ() end)
TVT_LOBBY_TANK:connect_one_way_entrance("TVT_LOBBY_TANK_to_TVT_LOBBY_OUTSIDE",TVT_LOBBY_OUTSIDE,true)

-- Tank Room
TVT_TANK_LOBBY:connect_one_way_entrance("TVT_TANK_LOBBY_to_TVT_TANK_FAN",TVT_TANK_FAN,true)
TVT_TANK_LOBBY:connect_one_way_entrance("TVT_TANK_LOBBY_to_TVT_TANK_BOSS",TVT_TANK_BOSS,function() return TVT_Tank_Lamp() end)
TVT_TANK_FAN:connect_one_way_entrance("TVT_TANK_FAN_to_TVT_TANK_LOBBY",TVT_TANK_LOBBY,function()
    result = any(
                Eval_Logic((HasPunch()),0),
                Eval_Logic((HasPunch() or IJ() or SuperFlyer(TVT_TANK_FAN,1)),1)
               )
    return result

end)
TVT_TANK_BOSS:connect_one_way_entrance("TVT_TANK_BOSS_to_TVT_TANK_LOBBY",TVT_TANK_LOBBY,true)

--Monkeys

--Outside
TVT_ENTRY:connect_one_way("TVT_Fredo",function() return HasPunch() and HasNet() end)

--Basement
TVT_WATER_LOBBY:connect_one_way("TVT_Charlee",function()
    result = any(
                Eval_Logic(((HasSling() and HasNet())),0),
                Eval_Logic((CanHitOnce() and HasNet()),1)
               )
    return result

end)
TVT_WATER_LOBBY:connect_one_way("TVT_Mach3",function() return HasNet() or HasWaterNet() end)

--Lobby
TVT_LOBBY_OUTSIDE:connect_one_way("TVT_Tortuss",function() return HasNet() end)
TVT_WATER_LOBBY:connect_one_way("TVT_Manic",function()
    result = any(
                Eval_Logic(((HasFlyer() or IJ()) and HasNet()),0),
                Eval_Logic((HasFlyer() or IJ() or HasHoop()) and HasNet(),1)
               )
    return result

end)
--Tank
TVT_TANK_LOBBY:connect_one_way("TVT_Ruptdis",function() return HasNet() end)
TVT_TANK_LOBBY:connect_one_way("TVT_Eighty7",function() return HasNet() end)
TVT_TANK_FAN:connect_one_way("TVT_Danio",function() return HasNet() end)

--Fan
TVT_TANK_FAN:connect_one_way("TVT_Roosta",function() return CanHitOnce() and HasNet() end)
TVT_TANK_FAN:connect_one_way("TVT_Tellis",function() return CanHitOnce() and HasNet() end)
TVT_TANK_FAN:connect_one_way("TVT_Whack",function() return CanHitOnce() and HasNet() end)
TVT_TANK_FAN:connect_one_way("TVT_Frostee",function() return CanHitOnce() and HasNet() end)

--Boss
TVT_BOSS_TANK:connect_one_way("TVT_Boss",function()
    result = any(
                Eval_Logic((HasSling()),0),
                Eval_Logic((HasSling() or (HasFlyer() and HasRC())),1)
               )
    return result

end)

--Coins
TVT_WATER_LOBBY:connect_one_way("TVT_C_Water Basement",function()
    result = any(
                Eval_Logic((HasFlyer() or IJ()),0),
                Eval_Logic(true,1)
               )
    return result

end)
TVT_TANK_LOBBY:connect_one_way("TVT_C_Tank Room",true)

--Mailboxes