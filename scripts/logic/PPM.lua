-- time_station = apeescape_location.new("time_station")
local PPM_ENTRY = apeescape_location.new("PPM_ENTRY")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - PPM",PPM_ENTRY,function() return PPM_Access() end)

--Boss
PPM_ENTRY:connect_one_way("PPM_Specter2",function() return HasSling() and (HasClub() or HasHoop() or HasPunch()) and HasNet() end)
