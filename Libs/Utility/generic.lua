require 'Libs/Utility/math'
require 'Libs/Utility/logger'

function MessageAll(s) --luacheck: allow defined top
    for _, player in pairs(game.players) do
        if player.mod_settings["pitch-display-messages"].value then
            player.print(s)
        end
    end
end

function DeepCopy(orig) --luacheck: allow defined top
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[DeepCopy(orig_key)] = DeepCopy(orig_value)
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function SetBrightness(scalar) --luacheck: allow defined top
	--Lerp between day (0.5 = noon) and night (0.0 = midnight)
	game.surfaces.nauvis.daytime = Math.Lerp(0.42, 0.25, scalar)
end