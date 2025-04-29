-- time_station = apeescape_location.new("time_station")
local PO_Entry = apeescape_location.new("PO_Entry")
--local ts_minigame = apeescape_location.new("ts_minigame")

--TS Main Hub
time_station:connect_one_way_entrance("Time Station - PO",PO_Entry,function() return PO_Access() end)
PO_Entry:connect_one_way("PO_Shay",function() return HasNet() end)
PO_Entry:connect_one_way("PO_Dr. Monk",function() return HasNet() end)
PO_Entry:connect_one_way("PO_Ah-Choo",function() return HasNet() or HasWaterNet() end)

PO_Entry:connect_one_way("PO_Grunt",function()
    result = any(
                Eval_Logic(((CanSwim() or HasFlyer()) and HasNet()),0),
                Eval_Logic((CanSwim() or HasHoop() or HasFlyer() or IJ()) and HasNet(),1),
                Eval_Logic(HasNet(),2)
               )
    return result

end)

PO_Entry:connect_one_way("PO_Tyrone",function() return HasNet() end)
PO_Entry:connect_one_way("PO_Gornif",function() 
    if (CanSwim() and (HasNet() or HasWaterNet())) then
        return AccessibilityLevel.Normal
    elseif (HasNet() or HasWaterNet()) then
        if op_logic_n() then
            return AccessibilityLevel.SequenceBreak
        else
            return AccessibilityLevel.Normal
        end
    else
        return AccessibilityLevel.None
    end
end)

PO_Entry:connect_one_way("PO_C_Main",function() return CanDive() end)

PO_Entry:connect_one_way("PO_M_Dive Reminder",true)
PO_Entry:connect_one_way("PO_M_Climb a Tree",true)
PO_Entry:connect_one_way("PO_M_Camera Tutorial",true)
PO_Entry:connect_one_way("PO_M_Crawl Tutorial",true)