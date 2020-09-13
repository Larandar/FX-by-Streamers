local PooberSounds = {}

function PooberSounds:register(sounds)
    local slurping_setting = settings.startup["fx-by-streamers-poober-slurping"]
    self:register_slurping(sounds, slurping_setting.value)
end

function PooberSounds:register_slurping(sounds, slurping_setting)
    if slurping_setting == "No" then return end

    -- We save the normal sound effect if we need the normal sound for when not on belts
    if slurping_setting == "Only Belts" then
        data:extend({
            {
                type = "sound",
                name = "vanilla-picked-up-item",
                category = "game-effect",
                filename = "__core__/sound/picked-up-item.ogg"
            }
        })
    end
    -- We silence vanilla picking sound
    data.raw["utility-sounds"]["default"]["picked_up_item"] =
        {filename = "__core__/sound/silence-1sec.ogg"}
    -- And register the "special" sound
    data:extend({sounds["slurping-up-items"]})
end

return PooberSounds
