

function CanSwim()
    return ((has ("op_wn_off") or has("op_wn_on")) and has ("water")) or (has ("op_wn_prog") and (has ("swim") or has ("dive")))
end

function CanDive()
    return ((has ("op_wn_off") or has("op_wn_on")) and has ("water")) or (has ("op_wn_prog") and has ("dive"))
end

function IJ()
    ij = Tracker:ProviderCountForCode("op_ij").CurrentStage
    return HasSling() and ij == 1
end

-- Lamp and Door Functions
function MM_DoubleDoor()
    return (has ("mm_lobby_doubledoor"))
end

function CB_Lamp()
    if has ("cb_lamp_on") then
        return true
    end
    return HasNet() and has ("op_lamps_off")
    --return has("monkey_cb",3) and has ("op_lamps_off")
end

function DI_Lamp()
    if has ("di_lamp_on") then
        return true
    end
    return HasNet() and has ("op_lamps_off")
    --return has("monkey_di",3) and has ("op_lamps_off")
end

function CRC_Lamp()
    if has ("crc_lamp_on") then
        return true
    end
    return HasNet() and has ("op_lamps_off")
    --return has("monkey_crc",3) and has ("op_lamps_off")
end

function CP_Lamp()
    if has ("cp_lamp_on") then
        return true
    end
    return HasNet() and has ("op_lamps_off")
    --return has("monkey_cp",3) and has ("op_lamps_off")
end

function SF_Lamp()
    if has ("sf_lamp_on") then
        return true
    end
    return HasNet() and has ("op_lamps_off")
    --return has("monkey_sf",3) and has ("op_lamps_off")
end

function TVT_Lobby_Lamp()
    if has ("tvt_lamp_l_on") then
        return true
    end
    --return HasNet() and has ("op_lamps_off")
    return has("monkey_tvt",3) and has ("op_lamps_off")
end

function TVT_Tank_Lamp()
    if has ("tvt_lamp_tr_on") then
        return true
    end
    return HasNet() and has ("op_lamps_off")
    --return has("monkey_tvt",3) and has ("op_lamps_off")
end

function MM_Lamp()
    if has ("mm_lamp_on") then
        return true
    end
    return HasNet() and has ("op_lamps_off")
    --return has("monkey_mm",3) and has ("op_lamps_off")
end

function HasAllMonKeys()
    return (Tracker:ProviderCountForCode("tot_ape") == 204)
end

--Level Entries
function TIME_Access ()
    return true
end

function FF_Access ()
    return Tracker:FindObjectForCode("ff_key").Active == true
end

function PO_Access ()
    return Tracker:FindObjectForCode("po_key").Active == true
end

function ML_Access ()
    return Tracker:FindObjectForCode("ml_key").Active == true
end

function TJ_Access ()
    return Tracker:FindObjectForCode("tj_key").Active == true
end

function DR_Access ()
    return Tracker:FindObjectForCode("dr_key").Active == true
end

function CR_Access ()
    return Tracker:FindObjectForCode("cr_key").Active == true
end

function SA_Access ()
    return Tracker:FindObjectForCode("sa_key").Active == true
end

function CB_Access ()
    return Tracker:FindObjectForCode("cb_key").Active == true
end

function CCAVE_Access ()
    return Tracker:FindObjectForCode("cc_key").Active == true
end

function DI_Access ()
    return Tracker:FindObjectForCode("di_key").Active == true
end

function SM_Access ()
    return Tracker:FindObjectForCode("sm_key").Active == true
end

function FR_Access ()
    return Tracker:FindObjectForCode("fr_key").Active == true
end

function HS_Access ()
    return Tracker:FindObjectForCode("hs_key").Active == true
end

function GA_Access ()
    return Tracker:FindObjectForCode("ga_key").Active == true
end

function ST_Access ()
    return Tracker:FindObjectForCode("st_key").Active == true
end

function WSW_Access ()
    return Tracker:FindObjectForCode("wsw_key").Active == true
end

function CC_Access ()
    return Tracker:FindObjectForCode("crc_key").Active == true
end

function CP_Access ()
    return Tracker:FindObjectForCode("cp_key").Active == true
end

function SF_Access ()
    return Tracker:FindObjectForCode("sf_key").Active == true
end

function TVT_Access ()
    return Tracker:FindObjectForCode("tvt_key").Active == true
end

function MM_Access ()
    return Tracker:FindObjectForCode("mm_key").Active == true
end

function PPM_Access ()
    goal = Tracker:FindObjectForCode("op_goal").CurrentStage
    worldkeys = Tracker:ProviderCountForCode("keyWorld")
    if requiredKeys == nil then
        getReqKeys()
    end
    -- 0 = MM, 1 = PPM, 2 = tokenhunt, 3 = mmtoken, 4 = ppmtoken
    if goal == 0 then
        return false
    elseif goal == 1 then
        return worldkeys >= requiredKeys[22] and HasAllMonKeys()
    elseif goal == 4 then
        return worldkeys >= requiredKeys[22] and Tokens()
    elseif goal == 2 or goal == 3 then
        return worldkeys >= requiredKeys[22]
    end
end


function Keys(count)
    return has("keyWorld",count)
end

function Tokens()
    goal = Tracker:FindObjectForCode("op_goal").CurrentStage
    requiredtokens = Tracker:ProviderCountForCode("required_tokens")
    if goal == 0 or goal == 1 then
        return true
    end
    --return true
    return has("specter_tokens", requiredtokens)
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
					--print(Tracker:FindObjectForCode(Code).Increment)
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
