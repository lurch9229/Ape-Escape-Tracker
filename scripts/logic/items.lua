function Club()
    return has ("club")
end

function Net()
    return has ("net")
end

function Hoop()
    return has ("hoop")
end

function Punch()
    return has ("punch")
end

function Sling()
    return has ("sling")
end

function Car()
    return has ("car")
end

function Flyer()
    return has ("flyer")
end

function Swim()
    return has ("water") or has ("swim") or has ("dive")
end
function Dive()
    return has ("dive")
end

function WaterCatch()
    return has ("watercatch")
end

function Radar()
    return has ("radar")
end

function op_superflyer()
    return has ("op_sf_on")
end
function op_waternet()
    return has ("op_wn_on")
end

function op_gl()
    return has ("op_gl")
end

function op_no_ij()
    return has ("op_no_ij")
end

function op_et()
    return has ("op_et")
end


function worldUnlocks()
    --lvl_list = {"ff", "po", "ml", "tj", "dr", "cr", "cb", "cc", "di", "sm", "fr", "hs", "st", "wsw", "cca", "cp", "sf", "tvt", "mm"}
    lvl_list = { "tj", "dr", "cr", "cb", "cc", "di", "sm", "fr", "hs", "st", "wsw", "cca", "cp", "sf", "tvt", "mm"}
    local iterator = Tracker:ProviderCountForCode("keyWorld")*3 + 3
    print(iterator)
    for index = 1, 16 do
		if index < iterator-2 then
			--print(index)
			Tracker:FindObjectForCode(lvl_list[index].."_key").Active = true
		else
			Tracker:FindObjectForCode(lvl_list[index].."_key").Active = false
		end
    end
end

function waternet()
	
	OP_WaterNet_Stage = Tracker:FindObjectForCode("op_waternet").CurrentStage
	WaterNet_Stage = Tracker:FindObjectForCode("waternet").CurrentStage
	print(WaterNet_Stage)
	--WaterNetShuffle is off
	if OP_WaterNet_Stage == 0 then
		--Do not allow going past stage 1 fo the item
		if WaterNet_Stage > 1 then
			WaterNet_Stage = 1
		end
	else
		if WaterNet_Stage < 2 then
			WaterNet_Stage = 0
		end
	end
	
	Tracker:FindObjectForCode("waternet").CurrentStage = WaterNet_Stage
end

function apLayoutChange()
  local waternet = Tracker:FindObjectForCode("op_waternet")
  if (string.find(Tracker.ActiveVariantUID, "map_tracker")) or
  (string.find(Tracker.ActiveVariantUID, "map_tracker_alternative")) then
    if waternet.CurrentStage == 1 then
	    print("WaterNet")
        Tracker:AddLayouts("layouts/itemGrids/item_grids_waternet.json")
    else
		print("No water net")
		Tracker:AddLayouts("layouts/itemGrids/item_grids_standard.json")
	end
  end
end

ScriptHost:AddWatchForCode("useApLayout", "op_waternet", apLayoutChange)

ScriptHost:AddWatchForCode("worldkey handler", "keyWorld", worldUnlocks)
--ScriptHost:AddWatchForCode("water net handler2", "water", waternet)
--ScriptHost:AddWatchForCode("water net handler", "op_waternet", waternet)