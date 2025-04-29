-- time_station = apeescape_location.new("time_station")

local ts_training = apeescape_location.new("ts_training")
local ts_minigame = apeescape_location.new("ts_minigame")

time_station:connect_one_way("Welcome!")
time_station:connect_one_way("Save Station")

time_station:connect_two_ways_entrance("TS - Minigame",ts_minigame,true)
ts_minigame:connect_one_way("Mini Game Corner")

time_station:connect_two_ways_entrance("TS - Training",ts_training,true)
ts_training:connect_one_way("Training Space",true)