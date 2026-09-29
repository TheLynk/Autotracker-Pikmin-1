-- affiche une table (utilisé par les logs de debug)
function dump_table(o, depth)
    depth = depth or 0
    if type(o) == "table" then
        local tabs = string.rep("\t", depth)
        local s = "{\n"
        for k, v in pairs(o) do
            s = s .. tabs .. "\t[" .. tostring(k) .. "] = " .. dump_table(v, depth + 1) .. ",\n"
        end
        return s .. tabs .. "}"
    end
    return tostring(o)
end
