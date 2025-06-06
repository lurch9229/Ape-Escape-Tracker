function A(result)
    if result then
        return AccessibilityLevel.Normal
    else
        return AccessibilityLevel.None
    end
end

function all(...)
    local args = { ... }
    local min = AccessibilityLevel.Normal
    for _, v in ipairs(args) do
        if type(v) == "boolean" then
            v = A(v)
        end
        if v < min then
            if v == AccessibilityLevel.None then
                return AccessibilityLevel.None
            else
                min = v
            end
        end
    end
    return min
end

function any(...)
    local args = { ... }
    local max = AccessibilityLevel.None
    for _, v in ipairs(args) do
        if type(v) == "boolean" then
            v = A(v)
        end
        if tonumber(v) > tonumber(max) then
            if tonumber(v) == AccessibilityLevel.Normal then
                return AccessibilityLevel.Normal
            else
                max = tonumber(v)
            end
        end
    end
    return max
end

function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
		if count > 0 then
			return true
		else
			return false
		end
	else
		if count >= amount then
			return true
		else
			return false
		end
    end
end

function isMMToken()
    return Tracker:FindObjectForCode("op_goal").CurrentStage == 3
end

function isnotMMGoal()
    return Tracker:FindObjectForCode("op_goal").CurrentStage > 0
end

function Eval_Logic(boolRule,minlogic)
    --boolrule is the result of the rule presented
    --minlogic is the minimum logic required for the rule(0,1 or 2)
    local logic = Tracker:FindObjectForCode("op_logic").CurrentStage
    if boolRule then
        --this means you are in logic
        if logic >= minlogic then
            return AccessibilityLevel.Normal
        else
            --Not in logic but rule validated
            return AccessibilityLevel.SequenceBreak
        end
    else
        --rule is false
        return AccessibilityLevel.None
    end

end

function Access_to_Bool(access)
    if type(access) ~= "boolean" then
        if access == 6 then
            access = true
        else
            access = false
        end
    end
    return access
end

function HasClub()
    return has ("club")
end

function HasNet()
    return has ("net")
end

function HasHoop()
    return has ("hoop")
end

function HasPunch()
    return has ("punch")
end

function HasSling()
    return has ("sling")
end

function HasCar()
    return has ("car")
end

function HasRC()
    return has ("car")
end

function HasFlyer()
    return has ("flyer")
end

function HasRadar()
    return has ("radar")
end

function CanHitOnce()
	local AccessRule = (HasClub() or HasRadar() or HasSling() or HasHoop() or HasFlyer() or HasCar() or HasPunch())
	--print("CanHitOnce")
	--print(AccessRule)
	if AccessRule then
		return true
	else
		return false
	end
end

function CanHitMultiple(logic)
    local logicrules = {
        [0] = (HasClub() or HasPunch()),
        [1] = (HasClub() or HasSling() or HasHoop() or HasPunch()),
        [2] = (HasClub() or HasSling() or HasHoop() or HasPunch())
    }
    if not logic then
	    logic = Tracker:FindObjectForCode("op_logic").CurrentStage
	end
    accessrule = logicrules[logic]
	return accessrule
end

function CanHitWheel(logic)
    
	local logicrules = {
        [0] = CanHitMultiple(0),
        [1] = CanHitMultiple(1),
        [2] = CanHitMultiple(2) or HasFlyer() or HasCar()
	}
    if not logic then
	    logic = Tracker:FindObjectForCode("op_logic").CurrentStage
	end
    accessrule = logicrules[logic]
	return accessrule
	
end

function WaterNet()
	if CanSwim() and CanWaterCatch() then
		return true
	else
		return false
	end
end


function IJ()
    if HasSling() and has("op_IJ_on") then
        return true
    else
        return false
    end
end
function SuperFlyer(region,logic)
    --To see if SuperFlyer trick is in logic
    if not logic then
	    logic = Tracker:FindObjectForCode("op_logic").CurrentStage
	end
    flyer = Tracker:FindObjectForCode("op_superflyer").CurrentStage
    -- If the option is off, Super Flyer is not in logic.
    if flyer == 0 then
        return false
    end

    -- If the difficulty is normal, Super Flyer is never in logic.
    --if logic == 0 then
     --   return false
    --end

    -- If the player does not have the required gadgets, Super Flyer is unavailable.
    if (HasFlyer() and (HasNet() or HasClub() or HasSling() or HasPunch())) == false then
        return false
    end


    -- If the player can reach this location without activating the Flyer, Super Flyer is available. To check for this, we check for the ability to access this region on a modified CollectionState. The Radar conveniently has the same ground pound properties as the Flyer while introducing no new access, and so replacing the Flyer with the Radar in this state serves as a valid check.
    if region ~= nil then
        -- Rerun the accesibility checkup, but this time taking into account you cannot use the Flyer
        -- TODO Currently there is no way of spliting the Item in 2 parts.I will need to change the locations rules instead
        return Access_to_Bool(CanReach(region,true))
     else
        return true
    end
end
function FakeSuperFlyer()
    logic = Tracker:FindObjectForCode("op_logic").CurrentStage
    flyer = Tracker:FindObjectForCode("op_superflyer").CurrentStage
    -- If the option is off, Super Flyer is not in logic.
    if flyer == 0 then
        return AccessibilityLevel.None
    end

    -- If the difficulty is normal, Super Flyer is never in logic.
    --if logic == 0 then
    --    return AccessibilityLevel.None
    --end
    if (HasFlyer() and (HasNet() or HasClub() or HasSling() or HasPunch())) == false then
        return AccessibilityLevel.None
    end
    -- If the player does not have the required gadgets, Super Flyer is unavailable.
    if (CanHitOnce() and (HasNet() or HasClub() or HasSling() or HasPunch())) == false then
        return AccessibilityLevel.None
    end

    -- TODO change SuperFlyer to account for region access
    -- If the player can reach this location without activating the Flyer, Super Flyer is available.
    return AccessibilityLevel.Normal
end
function OldSuperFlyer(logic)
	local logicrules = {
        [0] = true,
        [1] = ((HasFlyer() and (HasNet() or HasClub() or HasSling() or HasPunch())) and (op_superflyer())),
        [2] = ((HasFlyer() and (HasNet() or HasClub() or HasSling() or HasPunch())) and (op_superflyer()))
	}
    if not logic then
	    logic = Tracker:FindObjectForCode("op_logic").CurrentStage
	end
    accessrule = logicrules[logic]
	return accessrule
end

--WATER NET
function CanSwim()
    return ((has ("op_wn_off") or has("op_wn_on")) and has ("water")) or (has ("op_wn_prog") and (has ("swim") or has ("dive")))
end

function CanDive()
    return ((has ("op_wn_off") or has("op_wn_on")) and has ("water")) or (has ("op_wn_prog") and has ("dive"))
end

function CanWaterCatch()
    return ((has ("op_wn_off") or has("op_wn_on")) and has ("water")) or (has ("op_wn_prog") and has ("watercatch"))
end

-- Logic Helper Functions
function HasWaterNet() -- CanSwim + CanWaterCatch together
    return (CanSwim() and CanWaterCatch())
end
