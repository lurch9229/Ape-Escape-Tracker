-- time_station = apeescape_location.new("time_station")
local SA_ENTRY = apeescape_location.new("SA_ENTRY")
local SA_COMPLETE = apeescape_location.new("SA_COMPLETE")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - SA",SA_ENTRY,function() return SA_Access() end)

--Entrances
SA_ENTRY:connect_one_way_entrance("SA_ENTRY_to_SA_COMPLETE",SA_COMPLETE,function() return CanSwim() end)

--Coins
--Not needed,but just in case
SA_COMPLETE:connect_one_way("SA_C_Coin 1",true)
SA_COMPLETE:connect_one_way("SA_C_Coin 2",true)
SA_COMPLETE:connect_one_way("SA_C_Coin 3",true)
SA_COMPLETE:connect_one_way("SA_C_Coin 4",true)
SA_COMPLETE:connect_one_way("SA_C_Coin 5",true)