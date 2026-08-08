-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface

Tracker:AddItems("items/items.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/pikmin_group_visible.json") -- état par défaut
Tracker:AddLayouts("layouts/areas_accessible_group_visible.json")

local function updatePikminGroup()
    local item = Tracker:FindObjectForCode("shuffle_pikmin") -- vérifie le code exact dans items.json
    if item and item.Active then
        Tracker:AddLayouts("layouts/pikmin_group_visible.json")
    else
        Tracker:AddLayouts("layouts/pikmin_group_hidden.json")
    end
end

ScriptHost:AddWatchForCode("pikmin_group_watch", "shuffle_pikmin", updatePikminGroup)
updatePikminGroup()

local function updateAreasAccessibleGroup()
    local item = Tracker:FindObjectForCode("shuffle_map") -- vérifie le code exact dans items.json
    if item and item.Active then
        Tracker:AddLayouts("layouts/areas_accessible_group_visible.json")
    else
        Tracker:AddLayouts("layouts/areas_accessible_group_hidden.json")
    end
end

ScriptHost:AddWatchForCode("areas_accessible_group_watch", "shuffle_map", updateAreasAccessibleGroup)
updateAreasAccessibleGroup()

ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Pikmin 1 Manuel PopTracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")


-- Items
Tracker:AddItems("items/items.jsonc")

    -- Maps
Tracker:AddMaps("maps/maps.jsonc")

    -- Locations
Tracker:AddLocations("locations/world_map.jsonc")
Tracker:AddLocations("locations/the_impact_site.jsonc")
Tracker:AddLocations("locations/the_forest_of_hope.jsonc")
Tracker:AddLocations("locations/the_forest_navel.jsonc")
Tracker:AddLocations("locations/the_distant_spring.jsonc")
Tracker:AddLocations("locations/the_final_trial.jsonc")

-- Layout
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/option.jsonc")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
