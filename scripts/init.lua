-- entry point for all lua code of the pack
ENABLE_DEBUG_LOG = true
local variant = Tracker.ActiveVariantUID
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Pikmin 1 PopTracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

ScriptHost:LoadScript("scripts/utils.lua")
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
Tracker:AddLocations("locations/pikmin_location_map.json")

-- Layout
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/option.jsonc")

-- Logique de visibilité dynamique (doit venir après items/layouts/locations)
ScriptHost:LoadScript("scripts/layout_options.lua")

-- AutoTracking
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end