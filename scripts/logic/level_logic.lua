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
    Club() or Sling() or Punch()
    or 
    (op_no_ij() and (Radar() or Hoop() or Flyer() or Car()))
    or
    (op_et() and (Radar() or Hoop() or Flyer() or Car()))
end

function CanHitMultiple()
    return Club() or Punch()
    or 
    (op_no_ij() and (Hoop() or Sling()))
    or 
    (op_et() and (Hoop() or Sling()))
end

function HasMobility()
    return Flyer()
    or
    (op_no_ij() and Hoop())
    or
    (op_et() and (Sling() or Hoop()))
end

function RCMonkey()
    return
    Car()
    or
    (op_no_ij() and Sling())
    or
    (op_et() and Sling())
end

--May have to get the setting to know if it's used or not
--For now glitchless is always false,then other logic is always on
function SuperFlyer()
    return --FALSE
    (op_no_ij() and op_superflyer() and (Flyer() and (Net() or Club() or Sling() or Punch())))
    or
    (op_et() and op_superflyer() and (Flyer() and (Net() or Club() or Sling() or Punch())))
end

--WATER NET
function CanSwim()
    return Swim()
end

function CanDive()
    return Dive()

end

function CanWaterCatch()
    return WaterCatch()
end

--THICK JUNGLE
function TJ_UFOEntry()
    return
    CanSwim()
end

function TJ_UFOCliff()
    return 
    Flyer()
    or
    (op_no_ij())
    or
    (op_et())
end

function TJ_FishEntry()
    return
    CanSwim()
    or
    (op_no_ij() and Flyer())
    or
    (op_et() and Flyer())
end

function TJ_Mushroom()
    return
    (HasMobility() and CanHitMultiple())
    or
    (op_no_ij() and SuperFlyer())
    or
    (op_no_ij() and SuperFlyer())
end

function CR_Inside()
    return Sling() or Punch()
end

function DI_SecondHalf()
    return 
    CanHitOnce() and CanDive()
    or
    (op_no_ij() and (CanHitMultiple() and CanDive()))
    or
    (op_et() and (Sling() or (CanHitMultiple() and CanDive())))
end

function DI_Boulders()
    return
    Hoop() or Car()
    or
    (op_no_ij() and Flyer())
    or
    (op_et() and (Flyer() or Sling()))
end

function WSW_ThirdRoom()
    return 
	(Net() and Sling()) or Flyer()
    or
    (op_no_ij() and ((Net() and (Sling() or Hoop()))))
    or
    (op_et() and ((Net() and Hoop()) or Sling()))
end

function WSW_FourthRoom()
    return 
	CanHitMultiple() or Flyer()
    or
    op_no_ij()
    or
    op_et()
end

function CC_5Monkeys()
    return CRC_Lamp() and (Club() or Flyer() or Punch())
    or
    (op_no_ij() and (CRC_Lamp() and (Hoop() or Sling())))
    or
    (op_et() and (CRC_Lamp() and (Hoop() or Sling())))
end

function CC_WaterRoom()
    return 
	(CanHitMultiple() and CRC_Lamp()) or (CanSwim() and Punch())
    or
    (op_no_ij() and ((CanSwim() and Flyer()) or (Hoop() and Flyer()) or SuperFlyer()))
    or
    (op_et() and ((CanSwim() and Flyer()) or (Hoop() and Flyer()) or Sling() or SuperFlyer()))
end

function CC_ButtonRoom()
    return 
    CC_WaterRoom() and CanSwim()
    or
    (op_no_ij() and (CC_WaterRoom() and Flyer()))
    or
    (op_et() and (CC_WaterRoom() and (Flyer() or Sling())))
end

function CP_FrontSewer()
    return CP_Lamp() and Car()
    or
    (op_et() and CP_Lamp() and Sling())
end


function CP_FrontBarrels()
    return CP_FrontSewer() and (CanSwim() or HasMobility())
end

function CP_BackSewer()
    return -- FALSE
    (op_no_ij() and (Flyer() and CanDive()))
    or
    (op_et() and (Sling() or ((Flyer() and CanDive()))))
end

function SF_CarRoom()
    return Car() or Punch()
    or
    (op_no_ij() and (Hoop() and Flyer()))
    or
    (op_et() and (Sling() or (Hoop() and Flyer())))
end

function SF_MechRoom()
    return SF_Lamp() and Club() and SF_CarRoom()
	or
	(op_no_ij() and ((Hoop() and Flyer()) or (SF_Lamp() and ((Club() and (Sling() or Car())) or Punch())) or SuperFlyer()))
	or
	(op_et() and (Sling() or (Hoop() and Flyer()) or (SF_Lamp() and ((Club() and Car()) or Punch())) or SuperFlyer()))
end

function TVT_HitButton()
    return Flyer() and CanHitOnce()
    or
    (op_no_ij() and (Club() or Sling() or Flyer()))
    or
    (op_et() and (Club() or Sling() or Flyer()))
end

function TVT_TankRoom()
    return TVT_HitButton() and TVT_Lobby_Lamp()
end

function TVT_BossRoom()
    return TVT_TankRoom() and TVT_Tank_Lamp()
end

function MM_Natalie()
    return CanHitOnce() and Net()
end

function MM_Professor()
    return Flyer() and CanHitMultiple()
    or
    (op_no_ij() and Flyer() and (Club() or Sling()))
    or
    (op_et() and Sling() or (Flyer() and (Club() or Punch())))
end

function Jake_Open()
    return true
end

function MM_Jake()
    return CanHitMultiple() and Jake_Open()
    or
    (op_et() and (CanHitMultiple() and (Sling() or Jake_Open())))
end

function MM_SHA()
    return MM_Lobby_DoubleDoor()
end

function MM_UFOMonkeys()
    return MM_SHA() and Net() and Sling()
    or
    (op_no_ij() and MM_SHA() and (Club() or Punch()))
    or
    (op_et() and MM_SHA() and (Club() or Punch()))
end

function MM_UFODoor()
    return MM_UFOMonkeys() and MM_Lamp()
end
-------------------------EDIT DOWN HERE TO CONTINUE---------------------

function MM_DoubleDoor()
    return (MM_UFODoor() and Hoop() and Car() and CanHitMultiple())
    or
    (op_no_ij() and (MM_UFODoor() and Hoop() and Car()))
    or
    (op_et() and (MM_UFODoor() and Hoop() and Car()))
end

function MM_SpaceMonkeys()
    return MM_DoubleDoor() and Flyer()
	or
	(op_et() and (MM_DoubleDoor() and Sling()))
end

function MM_FinalBoss()
    return MM_DoubleDoor() and Sling() and Flyer()
    or
    (op_no_ij() and MM_UFODoor() and SuperFlyer())
    or
    (op_et() and MM_UFODoor() and SuperFlyer())
    or
    (op_et() and MM_UFODoor() and (Sling() or SuperFlyer()))
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
        Tracker:FindObjectForCode("crc_key").Active = true
    end
end

function FuturamaAccess()
    if WorldkeyTotal() >= 6 then
        Tracker:FindObjectForCode("cp_key").Active = true
        Tracker:FindObjectForCode("sf_key").Active = true
        Tracker:FindObjectForCode("tvt_key").Active = true
    end
end

function stadiumAttack()
	return Tracker:FindObjectForCode("sa_key").Active
end

function gladiatorAttack()
	return Tracker:FindObjectForCode("ga_key").Active
end
function PPMAccess()
	return (Tracker:ProviderCountForCode("tot_ape") == 204)
end
function location_check(section)

	local SectionID = section.FullID
	Code = locationToCode[SectionID]
	isActive = Tracker:FindObjectForCode("@"..SectionID).AvailableChestCount == 1
		
		--print(Code)
		if (Code) ~= nil then
		MinCount = Tracker:FindObjectForCode(Code).MinCount
		MaxCount = Tracker:FindObjectForCode(Code).MaxCount
		--print (MinCount)
		--print (MaxCount)
			if isActive == false then
			    if (string.find(string.upper(Code), "SPECTER")) then
			        Tracker:FindObjectForCode(Code).Active = true
				elseif Tracker:FindObjectForCode(Code).AcquiredCount +1 <= MaxCount then
					if (string.find(string.upper(Code), "COIN")) then
						Tracker:FindObjectForCode("tot_coin").AcquiredCount = Tracker:FindObjectForCode("tot_coin").AcquiredCount + Tracker:FindObjectForCode(Code).Increment
						if Tracker:FindObjectForCode("tot_coin").AcquiredCount > 0 then
							Tracker:FindObjectForCode("tot_coin").Active = true
						end
					elseif (string.find(string.upper(Code), "MONKEY")) then
						Tracker:FindObjectForCode("tot_ape").AcquiredCount = Tracker:FindObjectForCode("tot_ape").AcquiredCount + Tracker:FindObjectForCode(Code).Increment
						if Tracker:FindObjectForCode("tot_ape").AcquiredCount > 0 then
							Tracker:FindObjectForCode("tot_ape").Active = true
						end
					end
					--Tracker:FindObjectForCode(Code).AcquiredCount = Tracker:FindObjectForCode(Code).MaxCount
					Tracker:FindObjectForCode(Code).AcquiredCount = Tracker:FindObjectForCode(Code).AcquiredCount + Tracker:FindObjectForCode(Code).Increment
					if not Tracker:FindObjectForCode(Code).Active and (Tracker:FindObjectForCode(Code).AcquiredCount >= MinCount) then
						Tracker:FindObjectForCode(Code).Active = true
					end
				end
			else
			    if (string.find(string.upper(Code), "SPECTER")) then
			        Tracker:FindObjectForCode(Code).Active = false
				elseif Tracker:FindObjectForCode(Code).AcquiredCount -1 >= MinCount then
					if (string.find(string.upper(Code), "COIN")) then
					print(Tracker:FindObjectForCode(Code).Increment)
						Tracker:FindObjectForCode("tot_coin").AcquiredCount = Tracker:FindObjectForCode("tot_coin").AcquiredCount - Tracker:FindObjectForCode(Code).Increment
						if Tracker:FindObjectForCode("tot_coin").AcquiredCount == 0 then
							Tracker:FindObjectForCode("tot_coin").Active = false
						end
					elseif (string.find(string.upper(Code), "MONKEY")) then
						Tracker:FindObjectForCode("tot_ape").AcquiredCount = Tracker:FindObjectForCode("tot_ape").AcquiredCount - Tracker:FindObjectForCode(Code).Increment
						if Tracker:FindObjectForCode("tot_ape").AcquiredCount == 0 then
							Tracker:FindObjectForCode("tot_ape").Active = false
						end
					end
					--Tracker:FindObjectForCode(Code).AcquiredCount = Tracker:FindObjectForCode(Code).MinCount
					Tracker:FindObjectForCode(Code).AcquiredCount = Tracker:FindObjectForCode(Code).AcquiredCount - Tracker:FindObjectForCode(Code).Increment
					if Tracker:FindObjectForCode(Code).Active and (Tracker:FindObjectForCode(Code).AcquiredCount == MinCount) then
						Tracker:FindObjectForCode(Code).Active = false
					end
				end
			end
		end
end

ScriptHost:AddOnLocationSectionChangedHandler("location_check",function(section) location_check(section) end)
