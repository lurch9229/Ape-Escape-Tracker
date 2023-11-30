function club()
    return has ("club")
end

function net()
    return has ("net")
end

function hoop()
    return has ("hoop")
end

function punch()
    return ("punch")
end

function sling()
    return ("sling")
end

function car()
    return has ("car")
end

function flyer()
    return has ("flyer")
end

function water()
    return has ("water")
end

function radar()
    return has ("radar")
end

function op_no_ij()
    return has ("op_no_ij")
end

function op_et()
    return has ("op_et")
end


function worldUnlocks()
    print("test")
    lvl_list = {"ff", "po", "ml", "tj", "dr", "cr", "cb", "cc", "di", "sm", "fr", "hs", "st", "wsw", "cca", "cp", "sf", "tvt", "mm"}
    local iterator = Tracker:ProviderCountForCode("keyWorld")*3
    for index = iterator-2, iterator do
        if index < 20 then
            print(index)
            Tracker:FindObjectForCode(lvl_list[index].."_key").Active = true
        end
    end
end

ScriptHost:AddWatchForCode("worldkey handler", "keyWorld", worldUnlocks)