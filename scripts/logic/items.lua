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

function Water()
    return has ("water")
end

function Radar()
    return has ("radar")
end

function op_superflyer()
    return has ("op_sf_on")
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

ScriptHost:AddWatchForCode("worldkey handler", "keyWorld", worldUnlocks)
