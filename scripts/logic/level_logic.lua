function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
      return count > 0
    else
      return count == amount
    end
  end

function CanHitOnce()
    return 
    club() or sling() or punch()
    or 
    (op_no_ij() and (radar() or hoop() or flyer() or car()))
    or
    (op_et() and (radar() or hoop() or flyer() or car()))
end

function CanHitMultiple()
    return club() or punch()
    or 
    (op_no_ij() and (hoop() or sling()))
    or 
    (op_et() and (hoop() or sling()))
end

function HasMobility()
    return flyer()
    or
    (op_no_ij() and hoop())
    or
    (op_et() and (hoop() or sling()))
end

function RCMonkey()
    return
    car()
    or
    (op_et() and sling())
    or
    (op_no_ij() and sling())
end

--WATER NET
function CanSwim()
    return water()
end

function CanDive()
    return water()
end

function CanCatchWater()
    return water()
end

--THICK JUNGLE
function TJ_UFOEntry()
    return
    CanDive()
end

function TJ_UFOCliff()
    return 
    flyer()
    or
    (op_no_ij())
    or
    (op_et())
end

function TJ_FishEntry()
    return
    CanSwim()
    or
    (op_no_ij())
    or
    (op_et())
end

function TJ_Mushroom()
    return HasMobility()
end

function CR_Inside()
    return sling() or punch()
end

function DI_SecondHalf()
    return 
    CanHitOnce() and CanDive()
    or
    (op_et() and sling())
end

function DI_Boulders()
    return
    hoop() or car()
    or
    (op_no_ij() and flyer())
    or
    (op_et() and (flyer() or sling()))
end

function WSW_ThirdRoom()
    return
    sling() or flyer()
    or
    (op_no_ij() and hoop())
    or
    (op_et() and hoop())
end

function WSW_ForthRoom()
    return
    CanHitMultiple() and CanDive()
    or
    op_no_ij()
    or
    op_et()
end

function CC_5Monkeys()
    return club() or flyer() or punch()
    or
    (op_no_ij() and (hoop() or sling()))
    or
    (op_et() and (hoop() or sling()))
end

function CC_WaterRoom()
    return 
    CanHitMultiple() or (CanDive() and punch())
    or
    (op_no_ij() and (CanDive() and flyer()))
    or
    (op_et() and (CanDive() and (sling() or flyer())))
end

function CC_ButtonRoom()
    return 
    CC_WaterRoom() and CanSwim()
    or
    (op_no_ij() and flyer())
    or
    (op_et() and (flyer() or sling()))
end

function CP_FrontSewer()
    return car()
    or
    (op_et() and sling())
end

function CP_FrontBarrels()
    return CP_FrontSewer() and (CanSwim() or HasMobility())
end

function CP_BackSewer()
    return -- FALSE
    (op_no_ij() and (flyer() and CanDive()))
    or
    (op_et() and (sling() or ((flyer() and CanDive()))))
end

function SF_CarRoom()
    return car() or punch()
    or
    (op_no_ij() and (hoop() and flyer()))
    or
    (op_et() and (sling() or (hoop() and flyer())))
end

function SF_MechRoom()
    return club() and SF_CarRoom()
	or
	(op_no_ij() and ((hoop() and flyer()) or (club() and (sling() or car())) or punch()))
	or
	(op_et() and (sling() or (hoop() and flyer) or (club() and car()) or punch()))
end

function TVT_HitButton()
    return flyer() and CanHitOnce()
    or
    (op_no_ij() and (club() or sling() or flyer()))
    or
    (op_et() and (club() or sling() or flyer()))
end

function TVT_TankRoom()
    return TVT_HitButton()
end

function MM_Natalie()
    return CanHitMultiple()
    or
    (op_no_ij() and CanHitOnce())
    or
    (op_et() and CanHitOnce())
end

function MM_Professor()
    return flyer() and CanHitMultiple()
    or
    (op_no_ij() and flyer() and (club() or sling()))
    or
    (op_et() and sling() or (flyer() and (club() or sling())))
end

function Jake_Open()
    return MM_Natalie() and MM_Professor()
end

function MM_Jake()
    return CanHitMultiple() and Jake_Open()
    or
    (op_et() and (CanHitMultiple() and (sling() or Jake_Open())))
end

function MM_SHA()
    return MM_Natalie() and MM_Professor() and MM_Jake()
end

function MM_UFODoor()
    return MM_SHA() and sling()
    or
    (op_no_ij() and (club() or punch()))
    or
    (op_et() and (club() or punch()))
end

function MM_DoubleDoor()
    return (MM_UFODoor() and hoop() and car() and CanHitMultiple())
    or
    (op_no_ij() and (MM_UFODoor() and hoop() and car()))
    or
    (op_et() and (MM_UFODoor() and hoop() and car()))
end

function MM_SpaceMonkeys()
    return MM_DoubleDoor() and flyer()
	or
	(op_et() and (MM_DoubleDoor() and (sling() or flyer())))
end

function MM_FinalBoss()
    return MM_DoubleDoor() and sling() and flyer()
    or
    (op_et() and MM_UFODoor() and sling())
end

function LostLandsAccess()
    if WorldkeyTotal() >= 1 then
        Tracker:FindObjectForCode("ff_key").Active = true
        Tracker:FindObjectForCode("po_key").Active = true
        Tracker:FindObjectForCode("ml_key").Active = true
    end
end

function MystAgeAccess()
    if WorldkeyTotal() >= 2 then
        Tracker:FindObjectForCode("tj_key").Active = true
        Tracker:FindObjectForCode("dr_key").Active = true
        Tracker:FindObjectForCode("cr_key").Active = true
    end
end

function OceanaAccess()
    if WorldkeyTotal() >= 3 then
        Tracker:FindObjectForCode("cb_key").Active = true
        Tracker:FindObjectForCode("cc_key").Active = true
        Tracker:FindObjectForCode("di_key").Active = true
    end
end

function NewFreezelandAccess()
    if WorldkeyTotal() >= 4 then
        Tracker:FindObjectForCode("sm_key").Active = true
        Tracker:FindObjectForCode("fr_key").Active = true
        Tracker:FindObjectForCode("hs_key").Active = true
    end
end

function MediMadAccess()
    if WorldkeyTotal() >= 5 then
        Tracker:FindObjectForCode("st_key").Active = true
        Tracker:FindObjectForCode("wsw_key").Active = true
        Tracker:FindObjectForCode("cca_key").Active = true
    end
end

function FuturamaAccess()
    if WorldkeyTotal() >= 6 then
        Tracker:FindObjectForCode("cp_key").Active = true
        Tracker:FindObjectForCode("sf_key").Active = true
        Tracker:FindObjectForCode("tvt_key").Active = true
    end
end
