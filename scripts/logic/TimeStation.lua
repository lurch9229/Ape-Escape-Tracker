-- time_station = apeescape_location.new("time_station")
local ts_training = apeescape_location.new("ts_training")
local ts_minigame = apeescape_location.new("ts_minigame")
local TIME_TRAINING_WATERNET = apeescape_location.new("TIME_TRAINING_WATERNET")
local TIME_TRAINING_RADAR = apeescape_location.new("TIME_TRAINING_RADAR")
local TIME_TRAINING_SLING = apeescape_location.new("TIME_TRAINING_SLING")
local TIME_TRAINING_HOOP = apeescape_location.new("TIME_TRAINING_HOOP")
local TIME_TRAINING_FLYER = apeescape_location.new("TIME_TRAINING_FLYER")
local TIME_TRAINING_CAR = apeescape_location.new("TIME_TRAINING_CAR")
local TIME_TRAINING_PUNCH = apeescape_location.new("TIME_TRAINING_PUNCH")

time_station:connect_one_way("Welcome!")
time_station:connect_one_way("Save Station")

time_station:connect_two_ways_entrance("TS - Minigame",ts_minigame,true)
ts_minigame:connect_one_way("Mini Game Corner")

time_station:connect_two_ways_entrance("TS - Training",ts_training,true)
ts_training:connect_one_way("Training Space",true)
ts_training:connect_one_way_entrance("TS - Water Net Training",TIME_TRAINING_WATERNET,true)
ts_training:connect_one_way_entrance("TS - Monkey Radar Training",TIME_TRAINING_RADAR,true)
ts_training:connect_one_way_entrance("TS - Slingback Shooter Training",TIME_TRAINING_SLING,true)
ts_training:connect_one_way_entrance("TS - Super Hoop Training",TIME_TRAINING_HOOP,true)
ts_training:connect_one_way_entrance("TS - Sky Flyer Training",TIME_TRAINING_FLYER,true)
ts_training:connect_one_way_entrance("TS - RC Car Training",TIME_TRAINING_CAR,true)
ts_training:connect_one_way_entrance("TS - Magic Punch Training",TIME_TRAINING_PUNCH,true)


-- Water Net Training
TIME_TRAINING_WATERNET:connect_one_way("TT_WN_The Water Net Appears",function() return true end)
TIME_TRAINING_WATERNET:connect_one_way("TT_WN_Push In the Sticks",function() return CanSwim() end)
TIME_TRAINING_WATERNET:connect_one_way("TT_WN_Launch the Net",function() return CanDive() end)
TIME_TRAINING_WATERNET:connect_one_way("TT_WN_You Passed!",function() return (CanDive() and HasWaterNet()) end)
TIME_TRAINING_WATERNET:connect_one_way("TT_WN_Completion",function() return (CanDive() and HasWaterNet()) end)

-- Monkey Radar Training
TIME_TRAINING_RADAR:connect_one_way("TT_MR_A Gadget For Finding Monkeys",function() return true end)
TIME_TRAINING_RADAR:connect_one_way("TT_MR_Use the Radar",function() return true end)
TIME_TRAINING_RADAR:connect_one_way("TT_MR_Gadget Select Screen",function() return HasRadar() end)
TIME_TRAINING_RADAR:connect_one_way("TT_MR_Completion",function() return HasRadar() end)

-- Slingback Shooter Training
TIME_TRAINING_SLING:connect_one_way("TT_SL_Destroy Distant Enemies",function() return true end)
TIME_TRAINING_SLING:connect_one_way("TT_SL_Switches Out of Reach",function() return HasSling() end)
TIME_TRAINING_SLING:connect_one_way("TT_SL_Types of Bullets",function() return HasSling() end)
TIME_TRAINING_SLING:connect_one_way("TT_SL_Nice Shooting!",function() return HasSling() end)
TIME_TRAINING_SLING:connect_one_way("TT_SL_Completion",function() return HasSling() end)

-- Super Hoop Training
TIME_TRAINING_HOOP:connect_one_way("TT_HP_Dash Shield",function() return true end)
TIME_TRAINING_HOOP:connect_one_way("TT_HP_Step On the Switch",function()
    result = any(
                Eval_Logic(HasHoop(),0),
                Eval_Logic(true,1)
               )
    return result
end)
TIME_TRAINING_HOOP:connect_one_way("TT_HP_Way To Go!",function()
    result = any(
                Eval_Logic(HasHoop(),0),
                Eval_Logic(true,2)
               )
    return result
end)
TIME_TRAINING_HOOP:connect_one_way("TT_HP_Completion",function()
    result = any(
                Eval_Logic(HasHoop(),0),
                Eval_Logic(true,2)
               )
    return result
end)

-- Sky Flyer Training
TIME_TRAINING_FLYER:connect_one_way("TT_FL_It's a Great Invention!",function() return true end)
TIME_TRAINING_FLYER:connect_one_way("TT_FL_Jump Long Distances",function() return HasFlyer() end)
TIME_TRAINING_FLYER:connect_one_way("TT_FL_Excellent Flying!!",function() return HasFlyer() end)
TIME_TRAINING_FLYER:connect_one_way("TT_FL_Completion",function() return HasFlyer() end)

-- RC Car Training
TIME_TRAINING_CAR:connect_one_way("TT_RC_The RC Car Appears",function() return true end)
TIME_TRAINING_CAR:connect_one_way("TT_RC_Trigger the Floor Switch",function() return true end)
TIME_TRAINING_CAR:connect_one_way("TT_RC_Through That Small Opening",function() return HasRC() end)
TIME_TRAINING_CAR:connect_one_way("TT_RC_What a Great Gadget!",function() return HasRC() end)
TIME_TRAINING_CAR:connect_one_way("TT_RC_Completion",function() return HasRC() end)

-- Magic Punch Training
TIME_TRAINING_PUNCH:connect_one_way("TT_MP_A Mighty Fist!",function() return true end)
TIME_TRAINING_PUNCH:connect_one_way("TT_MP_Aim Well!",function() return HasPunch() end)
TIME_TRAINING_PUNCH:connect_one_way("TT_MP_Packs a Powerful Punch",function() return HasPunch() end)
TIME_TRAINING_PUNCH:connect_one_way("TT_MP_Completion",function() return HasPunch() end)