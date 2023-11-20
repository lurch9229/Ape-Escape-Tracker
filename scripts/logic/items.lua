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

function WorldkeyTotal(amount)
    WorldkeyTotal=Tracker:ProviderCountForCode("keyWorld")*1
    return (WorldkeyTotal >= amount)
end

function worldUnlocks()
    lvl_list = {"ff", "po", "ml", "tj", "dr", "cr", "cb", "cc", "di", "sm", "fr", "hs", "st", "wsw", "cca", "cp", "sf", "tt", "mm"}
    local iterator = WorldkeyTotal()*3
    for index = iterator-2, iterator do
        if index < 20 then
        Tracker:FindObjectForCode(lvl_list[index].."_key").Active = true
        end
    end
end