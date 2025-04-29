-- time_station = apeescape_location.new("time_station")
local GA_ENTRY = apeescape_location.new("GA_ENTRY")
local GA_COMPLETE = apeescape_location.new("GA_COMPLETE")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - GA",GA_ENTRY,function() return GA_Access() end)

--Entrances
GA_ENTRY:connect_one_way_entrance("GA_ENTRY_to_GA_COMPLETE",GA_COMPLETE,function() return HasFlyer() end)

--Coins
--Not needed,but just in case
GA_COMPLETE:connect_one_way("GA_C_Coin 1",true)
GA_COMPLETE:connect_one_way("GA_C_Coin 2",true)
GA_COMPLETE:connect_one_way("GA_C_Coin 3",true)
GA_COMPLETE:connect_one_way("GA_C_Coin 4",true)
GA_COMPLETE:connect_one_way("GA_C_Coin 5",true)