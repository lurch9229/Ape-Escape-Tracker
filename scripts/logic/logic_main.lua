--ScriptHost:AddWatchForCode("keydropshuffle handler", "key_drop_shuffle", keyDropLayoutChange)
--ScriptHost:AddWatchForCode("boss handler", "boss_shuffle", bossShuffle)
-- ScriptHost:AddWatchForCode("ow_dungeon details handler", "ow_dungeon_details", owDungeonDetails)


apeescape_location = {}
apeescape_location.__index = apeescape_location

local accessLVL= {
    [0] = "none",
    [1] = "partial",
    [3] = "inspect",
    [5] = "sequence break",
    [6] = "normal",
    [7] = "cleared"
}

-- Table to store named locations
named_locations = {}
local stale = true
local accessibilityCache = {}
local accessibilityCacheComplete = false
local currentParent = nil
local currentLocation = nil
local indirectConnections = {}


-- 
--
function CanReach(name,fakesuperflyer)
    local location
    --Ensure fakesuperflyer is something if not specified
    if fakesuperflyer == nil then
        fakesuperflyer = false
    end
    if stale then
        stale = false
        accessibilityCacheComplete = false
        accessibilityCache = {}
        indirectConnections = {}
        while not accessibilityCacheComplete do
            accessibilityCacheComplete = true
            entry_point:discover(AccessibilityLevel.Normal,fakesuperflyer)
            for dst, parents in pairs(indirectConnections) do
                if dst:accessibility() < AccessibilityLevel.Normal then
                    for parent, src in pairs(parents) do
                        --CR.luaprint("Checking indirect " .. src.name .. " for " .. parent.name .. " -> " .. dst.name)
                        --if name.name == "CC_CASTLEMAIN_ELEVATOR" then
                        --    print("parent:accessibility()")
                        --    print(parent:accessibility())
                        --end
                        parent:discover(parent:accessibility(),fakesuperflyer)
                    end
                end
            end
            --print("After Discover")
        end
        --entry_point:discover(AccessibilityLevel.Normal, 0) -- since there is no code to track indirect connections, we run it twice here
        --entry_point:discover(AccessibilityLevel.Normal, 0)
    end
    -- if type(region_name) == "function" then
    --     location = self
    -- else
    if type(name) == "table" then
        -- print(name.name)
        location = named_locations[name.name]
    else 
        location = named_locations[name]
    end
    -- print(location, name)
    -- end
    if location == nil then
        -- print(location, name)
        if type(name) == "table" then
        else
            print("Unknown location : " .. tostring(name))
        end
        return AccessibilityLevel.None
    end
    --If there is a SuperFlyer trick, ensure you can reach specified region without using it (See FakeSuperFlyer() helper function)
    if fakesuperflyer then
        --print("-------------SHOULD EVALUATE RULE-------------")
        --print(location:accessibility())
        returnvalue = any(location:accessibility(),FakeSuperFlyer())
    else
        returnvalue = location:accessibility()
    end
    return returnvalue
end

-- creates a lua object for the given name. it acts as a representation of a overworld reagion or indoor locatoin and
-- tracks its connected objects wvia the exit-table
function apeescape_location.new(name)
    local self = setmetatable({}, apeescape_location)
    if name then
        named_locations[name] = self
        self.name = name
    else
        self.name = self
    end
    
    self.exits = {}
    --self.keys = math.huge
    return self
end

local function always()
    return AccessibilityLevel.Normal
end

-- markes a 1-way connections between 2 "locations/regions" in the source "locations" exit-table with rules if provided
function apeescape_location:connect_one_way(exit, rule)
    if type(exit) == "string" then
        local existing = named_locations[exit]
        if existing then
            print("Warning: " .. exit .. " defined multiple times")  -- not sure if it's worth fixing in data or simply allowing this
            exit = existing
        else
            exit = apeescape_location.new(exit)
        end
    end
    if rule == nil then
        rule = always
    end
    self.exits[#self.exits + 1] = { exit, rule }
end

-- markes a 2-way connection between 2 locations. acts as a shortcut for 2 connect_one_way-calls 
function apeescape_location:connect_two_ways(exit, rule)
    self:connect_one_way(exit, rule)
    exit:connect_one_way(self, rule)
end

-- creates a 1-way connection from a region/location to another one via a 1-way connector like a ledge, hole,
-- self-closing door, 1-way teleport, ...
function apeescape_location:connect_one_way_entrance(name, exit, rule)
    if rule == nil then
        rule = always
    end
    -- print(name, "wann wird das aufgerufen?", exit.name)
    self.exits[#self.exits + 1] = { exit, rule }
end

-- creates a connection between 2 locations that is traversable in both ways using the same rules both ways
-- acts as a shortcut for 2 connect_one_way_entrance-calls
function apeescape_location:connect_two_ways_entrance(name, exit, rule)
    if exit == nil then -- for ER
        return
    end
    self:connect_one_way_entrance(name, exit, rule)
    exit:connect_one_way_entrance(name, self, rule)
end

-- creates a connection between 2 locations that is traversable in both ways but each connection follow different rules.
-- acts as a shortcut for 2 connect_one_way_entrance-calls
function apeescape_location:connect_two_ways_entrance_door_stuck(name, exit, rule1, rule2)
    self:connect_one_way_entrance(name, exit, rule1)
    exit:connect_one_way_entrance(name, self, rule2)
end

-- checks for the accessibility of a regino/location given its own exit requirements
function apeescape_location:accessibility()
    -- only executed when run from a rules within a connection
    if currentLocation ~= nil and currentParent ~= nil then
        if indirectConnections[currentLocation] == nil then
            indirectConnections[currentLocation] = {}
        end
        indirectConnections[currentLocation][currentParent] = self
    end
    -- up to here
    local res = accessibilityCache[self] -- get accessibilty lvl set in discover for a given location
    if res == nil then
        res = AccessibilityLevel.None
        accessibilityCache[self] = res
    end
    return res
end

-- 
function apeescape_location:discover(accessibility,fakesuperflyer)
    -- checks if given Accessbibility is higer then last stored one
    -- prevents walking in circles
     if fakesuperflyer == true then
        --if accessibility ~= nil then
            print("------------------------------------------")
            print("Old Rule :" .. tostring(accessibility))
            accessibility = all(accessibility,FakeSuperFlyer())
            print("New Rule :" .. tostring(accessibility))

        --else
        --    print("Rule is nil,please check")
        --end
    end
    if accessibility > self:accessibility() then
        --self.keys = math.huge -- resets keys used up to this point
        accessibilityCache[self] = accessibility
        accessibilityCacheComplete = false -- forces CanReach tu run again/further
    end
    --if keys < self.keys then
    --    self.keys = keys -- sets current amout of keys used
    --end
    --print("----------------------------------")

    if accessibility > 0 then -- if parent-location was accessible
        for _, exit in pairs(self.exits) do -- iterate over current watched locations exits
            local location = exit[1] -- exit name
            --print("------------------LOCATIONNAME----------------")
            --print(self.name)
            local oldAccess = location:accessibility() -- get most recent accessibilty level for exit

            if oldAccess < accessibility then -- if new accessibility from above is higher then currently stored one, so is more accessible then before
                local rule = exit[2] -- get rules to check
                currentParent, currentLocation = self, location -- just set for ":accessibilty()" check within rules
                local access = rule
                if type(access) == "function" then
                    access = access()
                end
                local parent_access = currentParent:accessibility()
                if type(access) == "boolean" then
                    access = A(access)
                end
                if access == nil then
                    -- For when a rule function returns nothing, the "access" variable is nil
                    --    access = 0

                    --print(location.name)
                    --print(currentParent.name)
                    --print(access)
                    --print(parent_access)
                end
                if access > parent_access then
                    access = parent_access
                end
                currentParent, currentLocation = nil, nil -- just set for ":accessibilty()" check within rules
                --print(access)
                if access == 5 then
                    access = AccessibilityLevel.SequenceBreak
                elseif access == true then
                    access = AccessibilityLevel.Normal
                elseif access == false then
                    access = AccessibilityLevel.None
                end
                if access == nil then
                    print("Warning: " .. self.name .. " -> " .. location.name .. " rule returned nil")
                    access = AccessibilityLevel.None
                end

                if access > oldAccess then -- not sure about the <
                    --print(self.name)
                    --print(accessLVL[self:accessibility()], "from", self.name, "to", location.name, ":", accessLVL[access])
                    location:discover(access,fakesuperflyer)
                end
            end
        end
    end
end

entry_point = apeescape_location.new("entry_point")
time_station = apeescape_location.new("time_station")

entry_point:connect_one_way(time_station, true)
--entry_point:connect_one_way(darkworld_spawns, function() return inverted() end)

-- 
function stateChanged()
    stale = true

    -- ScriptHost:LoadScript("scripts/logic/logic_helpers.lua")
    -- ScriptHost:LoadScript("scripts/logic/logic_main.lua")
    -- ScriptHost:LoadScript("scripts/logic_import.lua")
end

ScriptHost:AddWatchForCode("stateChanged", "*", stateChanged)
