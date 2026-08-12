local function updatePikminGroup()
    local item = Tracker:FindObjectForCode("shuffle_pikmin")
    if item and item.Active then
        Tracker:AddLayouts("layouts/pikmin_group_visible.json")
    else
        Tracker:AddLayouts("layouts/pikmin_group_hidden.json")
    end
end

local function updateAreasAccessibleGroup()
    local item = Tracker:FindObjectForCode("shuffle_map")
    if item and item.Active then
        Tracker:AddLayouts("layouts/areas_accessible_group_visible.json")
    else
        Tracker:AddLayouts("layouts/areas_accessible_group_hidden.json")
    end
end

local function updatePikminLocationGroup()
    local item = Tracker:FindObjectForCode("pikmin_location")
    if item and item.Active then
        Tracker:AddLayouts("layouts/pikmin_location_group_visible.json")
    else
        Tracker:AddLayouts("layouts/pikmin_location_group_hidden.json")
    end
end

--local function updatePikminLocationGroup()
--    local item = Tracker:FindObjectForCode("pikmin_location")
--    if item and item.AcquiredCount >= 1 then
--        Tracker:AddLayouts("layouts/pikmin_location_group_visible.json")
--    else
--        Tracker:AddLayouts("layouts/pikmin_location_group_hidden.json")
--    end
--end

ScriptHost:AddWatchForCode("pikmin_group_watch", "shuffle_pikmin", updatePikminGroup)
ScriptHost:AddWatchForCode("areas_accessible_group_watch", "shuffle_map", updateAreasAccessibleGroup)
ScriptHost:AddWatchForCode("pikmin_location_group_watch", "pikmin_location", updatePikminLocationGroup)

updatePikminGroup()
updateAreasAccessibleGroup()
updatePikminLocationGroup()