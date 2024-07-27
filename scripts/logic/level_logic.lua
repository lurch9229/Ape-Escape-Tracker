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

local locationToCode ={
	--Monkeys
    ["Fossil Fields/Fossil Fields/Noonan"] = "Monkey_ff",
    ["Fossil Fields/Fossil Fields/Jorjy"] = "Monkey_ff",
    ["Fossil Fields/Fossil Fields/Nati"] = "Monkey_ff",
    ["Fossil Fields/Fossil Fields/Tray C"] = "Monkey_ff",
    ["Primordial Ooze/Primordial Ooze/Shay"] = "Monkey_po",
    ["Primordial Ooze/Primordial Ooze/Dr. Monk"] = "Monkey_po",
    ["Primordial Ooze/Primordial Ooze/Grunt"] = "Monkey_po",
    ["Primordial Ooze/Primordial Ooze/Ah-Choo"] = "Monkey_po",
    ["Primordial Ooze/Primordial Ooze/Gornif"] = "Monkey_po",
    ["Primordial Ooze/Primordial Ooze/Tyrone"] = "Monkey_po",
    ["Molten Lava/Molten Lava/Scotty"] = "Monkey_ml",
    ["Molten Lava/Molten Lava/Coco"] = "Monkey_ml",
    ["Molten Lava/Molten Lava/J. Thomas"] = "Monkey_ml",
    ["Molten Lava/Molten Lava/Mattie"] = "Monkey_ml",
    ["Molten Lava/Molten Lava/Barney"] = "Monkey_ml",
    ["Molten Lava/Molten Lava/Rocky"] = "Monkey_ml",
    ["Molten Lava/Molten Lava/Moggan"] = "Monkey_ml",
    ["Thick Jungle/Thick Jungle/Marquez"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Livinston"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/George"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Maki"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Herb"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Dilweed"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Mitong"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Stoddy"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Nasus"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Selur"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Elehcim"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Gonzo"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Alphonse"] = "Monkey_tj",
    ["Thick Jungle/Thick Jungle/Zanzibar"] = "Monkey_tj",
    ["Dark Ruins/Dark Ruins/Mooshy"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Kyle"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Cratman"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Nuzzy"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Mav"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Stan"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Bernt"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Runt"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Hoolah"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Papou"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Kenny"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Trance"] = "Monkey_dr",
    ["Dark Ruins/Dark Ruins/Chino"] = "Monkey_dr",
    ["Cryptic Relics/Cryptic Relics/Troopa"] = "Monkey_cr",
    ["Cryptic Relics/Cryptic Relics/Spanky"] = "Monkey_cr",
    ["Cryptic Relics/Cryptic Relics/Stymie"] = "Monkey_cr",
    ["Cryptic Relics/Cryptic Relics/Pally"] = "Monkey_cr",
    ["Cryptic Relics/Cryptic Relics/Freeto"] = "Monkey_cr",
    ["Cryptic Relics/Cryptic Relics/Jesta"] = "Monkey_cr",
    ["Cryptic Relics/Cryptic Relics/Bazzle"] = "Monkey_cr",
    ["Cryptic Relics/Cryptic Relics/Crash"] = "Monkey_cr",
    ["Crabby Beach/Crabby Beach/Cool Blue"] = "Monkey_cb",
    ["Crabby Beach/Crabby Beach/Sandy"] = "Monkey_cb",
    ["Crabby Beach/Crabby Beach/Shell E."] = "Monkey_cb",
    ["Crabby Beach/Crabby Beach/Gidget"] = "Monkey_cb",
    ["Crabby Beach/Crabby Beach/Shaka"] = "Monkey_cb",
    ["Crabby Beach/Crabby Beach/MaxMahalo"] = "Monkey_cb",
    ["Crabby Beach/Crabby Beach/Moko"] = "Monkey_cb",
    ["Crabby Beach/Crabby Beach/Puka"] = "Monkey_cb",
    ["Coral Cave/Coral Cave/Chip"] = "Monkey_cc",
    ["Coral Cave/Coral Cave/Oreo"] = "Monkey_cc",
    ["Coral Cave/Coral Cave/Puddles"] = "Monkey_cc",
    ["Coral Cave/Coral Cave/Kalama"] = "Monkey_cc",
    ["Coral Cave/Coral Cave/Iz"] = "Monkey_cc",
    ["Coral Cave/Coral Cave/Jux"] = "Monkey_cc",
    ["Coral Cave/Coral Cave/Bong-Bong"] = "Monkey_cc",
    ["Coral Cave/Coral Cave/Pickles"] = "Monkey_cc",
    ["Dexter's Island/Dexter's Island/Stuw"] = "Monkey_di",
    ["Dexter's Island/Dexter's Island/Ton Ton"] = "Monkey_di",
    ["Dexter's Island/Dexter's Island/Murky"] = "Monkey_di",
    ["Dexter's Island/Dexter's Island/Howeerd"] = "Monkey_di",
    ["Dexter's Island/Dexter's Island/Robbin"] = "Monkey_di",
    ["Dexter's Island/Dexter's Island/Jakkee"] = "Monkey_di",
    ["Dexter's Island/Dexter's Island/Frederic"] = "Monkey_di",
    ["Dexter's Island/Dexter's Island/Baba"] = "Monkey_di",
    ["Dexter's Island/Dexter's Island/Mars"] = "Monkey_di",
    ["Dexter's Island/Dexter's Island/Horke"] = "Monkey_di",
    ["Dexter's Island/Dexter's Island/Quirck"] = "Monkey_di",
    ["Snowy Mammoth/Snowy Mammoth/Popcicle"] = "Monkey_sm",
    ["Snowy Mammoth/Snowy Mammoth/Iced"] = "Monkey_sm",
    ["Snowy Mammoth/Snowy Mammoth/Denggoy"] = "Monkey_sm",
    ["Snowy Mammoth/Snowy Mammoth/Skeens"] = "Monkey_sm",
    ["Snowy Mammoth/Snowy Mammoth/Rickets"] = "Monkey_sm",
    ["Snowy Mammoth/Snowy Mammoth/Chilly"] = "Monkey_sm",
    ["Frosty Retreat/Frosty Retreat/Storm"] = "Monkey_fr",
    ["Frosty Retreat/Frosty Retreat/Qube"] = "Monkey_fr",
    ["Frosty Retreat/Frosty Retreat/Gash"] = "Monkey_fr",
    ["Frosty Retreat/Frosty Retreat/Kundra"] = "Monkey_fr",
    ["Frosty Retreat/Frosty Retreat/Shadow"] = "Monkey_fr",
    ["Frosty Retreat/Frosty Retreat/Ranix"] = "Monkey_fr",
    ["Frosty Retreat/Frosty Retreat/Sticky"] = "Monkey_fr",
    ["Frosty Retreat/Frosty Retreat/Sharpe"] = "Monkey_fr",
    ["Frosty Retreat/Frosty Retreat/Droog"] = "Monkey_fr",
    ["Hot Springs/Hot Springs/Punky"] = "Monkey_hs",
    ["Hot Springs/Hot Springs/Ameego"] = "Monkey_hs",
    ["Hot Springs/Hot Springs/Roti"] = "Monkey_hs",
    ["Hot Springs/Hot Springs/Dissa"] = "Monkey_hs",
    ["Hot Springs/Hot Springs/Yoky"] = "Monkey_hs",
    ["Hot Springs/Hot Springs/Jory"] = "Monkey_hs",
    ["Hot Springs/Hot Springs/Crank"] = "Monkey_hs",
    ["Hot Springs/Hot Springs/Claxter"] = "Monkey_hs",
    ["Hot Springs/Hot Springs/Looza"] = "Monkey_hs",
    ["Sushi Temple/Sushi Temple/Taku"] = "Monkey_st",
    ["Sushi Temple/Sushi Temple/Rocka"] = "Monkey_st",
    ["Sushi Temple/Sushi Temple/Mara-lea"] = "Monkey_st",
    ["Sushi Temple/Sushi Temple/Wog"] = "Monkey_st",
    ["Sushi Temple/Sushi Temple/Long"] = "Monkey_st",
    ["Sushi Temple/Sushi Temple/Mayi"] = "Monkey_st",
    ["Sushi Temple/Sushi Temple/Owyang"] = "Monkey_st",
    ["Sushi Temple/Sushi Temple/Quel Tin"] = "Monkey_st",
    ["Sushi Temple/Sushi Temple/Phaldo"] = "Monkey_st",
    ["Sushi Temple/Sushi Temple/Voti"] = "Monkey_st",
    ["Sushi Temple/Sushi Temple/Elly"] = "Monkey_st",
    ["Sushi Temple/Sushi Temple/Chunky"] = "Monkey_st",
    ["Wabi Sabi Wall/Wabi Sabi Wall/Minky"] = "Monkey_wsw",
    ["Wabi Sabi Wall/Wabi Sabi Wall/Zobbro"] = "Monkey_wsw",
    ["Wabi Sabi Wall/Wabi Sabi Wall/Xeeto"] = "Monkey_wsw",
    ["Wabi Sabi Wall/Wabi Sabi Wall/Moops"] = "Monkey_wsw",
    ["Wabi Sabi Wall/Wabi Sabi Wall/Zanabi"] = "Monkey_wsw",
    ["Wabi Sabi Wall/Wabi Sabi Wall/Buddha"] = "Monkey_wsw",
    ["Wabi Sabi Wall/Wabi Sabi Wall/Fooey"] = "Monkey_wsw",
    ["Wabi Sabi Wall/Wabi Sabi Wall/Doxs"] = "Monkey_wsw",
    ["Wabi Sabi Wall/Wabi Sabi Wall/Kong"] = "Monkey_wsw",
    ["Wabi Sabi Wall/Wabi Sabi Wall/Phool"] = "Monkey_wsw",
    ["Crumbling Castle/Crumbling Castle/Naners"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Robart"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Neeners"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Gustav"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Wilhelm"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Emmanuel"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Sir Cutty"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Calligan"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Castalist"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Deveneom"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Igor"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Charles"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Astur"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Kilserack"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Ringo"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Densil"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Figero"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Fej"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Joey"] = "Monkey_cca",
    ["Crumbling Castle/Crumbling Castle/Donqui"] = "Monkey_cca",
    ["City Park/City Park/Kaine"] = "Monkey_cp",
    ["City Park/City Park/Jaxx"] = "Monkey_cp",
    ["City Park/City Park/Gehry"] = "Monkey_cp",
    ["City Park/City Park/Alcatraz"] = "Monkey_cp",
    ["City Park/City Park/Tino"] = "Monkey_cp",
    ["City Park/City Park/Q. Bee"] = "Monkey_cp",
    ["City Park/City Park/McManic"] = "Monkey_cp",
    ["City Park/City Park/Dywan"] = "Monkey_cp",
    ["City Park/City Park/CK Hutch"] = "Monkey_cp",
    ["City Park/City Park/Winky"] = "Monkey_cp",
    ["City Park/City Park/B. Luv"] = "Monkey_cp",
    ["City Park/City Park/Camper"] = "Monkey_cp",
    ["City Park/City Park/Huener"] = "Monkey_cp",
    ["Specter's Factory/Specter's Factory/Big Show"] = "Monkey_sf",
    ["Specter's Factory/Specter's Factory/Dreos"] = "Monkey_sf",
    ["Specter's Factory/Specter's Factory/Reznor"] = "Monkey_sf",
    ["Specter's Factory/Specter's Factory/Urkel"] = "Monkey_sf",
    ["Specter's Factory/Specter's Factory/Vanilla S"] = "Monkey_sf",
    ["Specter's Factory/Specter's Factory/Radd"] = "Monkey_sf",
    ["Specter's Factory/Specter's Factory/Shimbo"] = "Monkey_sf",
    ["Specter's Factory/Specter's Factory/Hurt"] = "Monkey_sf",
    ["Specter's Factory/Specter's Factory/String"] = "Monkey_sf",
    ["Specter's Factory/Specter's Factory/Khamo"] = "Monkey_sf",
    ["TV Tower/TV Tower/Fredo"] = "Monkey_tvt",
    ["TV Tower/TV Tower/Charlee"] = "Monkey_tvt",
    ["TV Tower/TV Tower/Mach 3"] = "Monkey_tvt",
    ["TV Tower/TV Tower/Tortuss"] = "Monkey_tvt",
    ["TV Tower/TV Tower/Manic"] = "Monkey_tvt",
    ["TV Tower/TV Tower/Ruptdis"] = "Monkey_tvt",
    ["TV Tower/TV Tower/Eighty 7"] = "Monkey_tvt",
    ["TV Tower/TV Tower/Danio"] = "Monkey_tvt",
    ["TV Tower/TV Tower/Roosta"] = "Monkey_tvt",
    ["TV Tower/TV Tower/Tellis"] = "Monkey_tvt",
    ["TV Tower/TV Tower/Whack"] = "Monkey_tvt",
    ["TV Tower/TV Tower/Frostee"] = "Monkey_tvt",
    ["Monkey Madness/Monkey Madness/Goopo"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Porto"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Slam"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Junk"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Crib"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Nak"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Cloy"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Shaw"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Flea"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Schafette"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Donovan"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Laura"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Uribe"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Gordo"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Raeski"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Poo-Pie"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Teacup"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Shine"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Wrench"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Bronson"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Bungee"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Carro"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Carlito"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/BG"] = "Monkey_mm",
    ["Monkey Madness/Monkey Madness/Specter"] = "Monkey_mm",
	--Coins
	["Fossil Fields/Fossil Fields/Main"] = "coin_ff",
	["Primordial Ooze/Primordial Ooze/Main"] = "coin_po",
	["Molten Lava/Molten Lava/Entry"] = "coin_ml",
	["Thick Jungle/Thick Jungle/Entry"] = "coin_tj",
	["Thick Jungle/Thick Jungle/Fish Room"] = "coin_tj",
	["Thick Jungle/Thick Jungle/Mushroom Area"] = "coin_tj",
	["Thick Jungle/Thick Jungle/Tent-Vines Room"] = "coin_tj",
	["Dark Ruins/Dark Ruins/Fan Basement"] = "coin_dr",
	["Dark Ruins/Dark Ruins/Obelisk Inside"] = "coin_dr",
	["Dark Ruins/Dark Ruins/Outside"] = "coin_dr",
	["Dark Ruins/Dark Ruins/Water Basement"] = "coin_dr",
	["Cryptic Relics/Cryptic Relics/Main Ruins"] = "coin_cr",
	["Dimension X/Stadium Attack/Race Jake"] = "coin_sa",
	["Dimension X/Stadium Attack/Race Jake"] = "coin_sa",
	["Dimension X/Stadium Attack/Race Jake"] = "coin_sa",
	["Dimension X/Stadium Attack/Race Jake"] = "coin_sa",
	["Dimension X/Stadium Attack/Race Jake"] = "coin_sa",
	["Crabby Beach/Crabby Beach/Second Room"] = "coin_cb",
	["Coral Cave/Coral Cave/Second Room"] = "coin_cc",
	["Dexter's Island/Dexter's Island/Outside"] = "coin_di",
	["Dexter's Island/Dexter's Island/Slide Room"] = "coin_di",
	["Dexter's Island/Dexter's Island/Stomach"] = "coin_di",
	["Snowy Mammoth/Snowy Mammoth/Main"] = "coin_sm",
	["Frosty Retreat/Frosty Retreat/Caverns"] = "coin_fr",
	["Frosty Retreat/Frosty Retreat/Entry"] = "coin_fr",
	["Frosty Retreat/Frosty Retreat/Water Room"] = "coin_fr",
	["Hot Springs/Hot Springs/Hot Spring"] = "coin_hs",
	["Hot Springs/Hot Springs/Polar Bear Cave"] = "coin_hs",
	["Dimension X/Gladiator Attack/Race Jake"] = "coin_ga",
	["Dimension X/Gladiator Attack/Race Jake"] = "coin_ga",
	["Dimension X/Gladiator Attack/Race Jake"] = "coin_ga",
	["Dimension X/Gladiator Attack/Race Jake"] = "coin_ga",
	["Dimension X/Gladiator Attack/Race Jake"] = "coin_ga",
	["Sushi Temple/Sushi Temple/Outside"] = "coin_st",
	["Sushi Temple/Sushi Temple/Temple"] = "coin_st",
	["Sushi Temple/Sushi Temple/Well"] = "coin_st",
	["Wabi Sabi Wall/Wabi Sabi Wall/Barrel Room"] = "coin_wsw",
	["Wabi Sabi Wall/Wabi Sabi Wall/First Room"] = "coin_wsw",
	["Wabi Sabi Wall/Wabi Sabi Wall/Gong Room"] = "coin_wsw",
	["Crumbling Castle/Crumbling Castle/Button Room"] = "coin_cca",
	["Crumbling Castle/Crumbling Castle/Castle Main"] = "coin_cca",
	["Crumbling Castle/Crumbling Castle/Elevator Room"] = "coin_cca",
	["Crumbling Castle/Crumbling Castle/Outside"] = "coin_cca",
	["City Park/City Park/Barrel Room"] = "coin_cp",
	["City Park/City Park/Outside"] = "coin_cp",
	["City Park/City Park/Sewers Front"] = "coin_cp",
	["Specter's Factory/Specter's Factory/Lava Room"] = "coin_sf",
	["Specter's Factory/Specter's Factory/RC Car Room"] = "coin_sf",
	["TV Tower/TV Tower/Tank Room"] = "coin_tvt",
	["TV Tower/TV Tower/Water Basement"] = "coin_tvt",
	["Monkey Madness/Monkey Madness/Castle Main"] = "coin_mm",
	["Monkey Madness/Monkey Madness/Climb (Outside)"] = "coin_mm",
	["Monkey Madness/Monkey Madness/Coaster (Room 1)"] = "coin_mm",
	["Monkey Madness/Monkey Madness/Coaster (Room 2)"] = "coin_mm",
	["Monkey Madness/Monkey Madness/Crater"] = "coin_mm",
	["Monkey Madness/Monkey Madness/Haunted House"] = "coin_mm",
	["Monkey Madness/Monkey Madness/Monkey Head"] = "coin_mm",
	["Monkey Madness/Monkey Madness/Outside Castle"] = "coin_mm",
	["Monkey Madness/Monkey Madness/Side Entry"] = "coin_mm",
	["Monkey Madness/Monkey Madness/Western Land"] = "coin_mm"

}
function location_check(section)

	local SectionID = section.FullID
	Code = locationToCode[SectionID]
	isActive = Tracker:FindObjectForCode("@"..SectionID).AvailableChestCount == 1
		if (Code) ~= nil then
			if isActive == false then
				Tracker:FindObjectForCode(Code).AcquiredCount = Tracker:FindObjectForCode(Code).AcquiredCount + 1
			else
				Tracker:FindObjectForCode(Code).AcquiredCount = Tracker:FindObjectForCode(Code).AcquiredCount - 1
			end
		end
end

ScriptHost:AddOnLocationSectionChangedHandler("location_check",function(section) location_check(section) end)
