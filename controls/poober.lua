local PooberScript = {}

function PooberScript:on_slurping_ground(event)
    local player = game.get_player(event.player_index)
    if player == nil then return end

    player.surface.play_sound {
        path = "slurping-up-items",
        position = player.position
    }
end

PooberScript.SLURPABLE_TYPES = {
    "transport-belt", "underground-belt", "splitter", "loader", "loader-1x1"
}
function PooberScript:on_slurping_belts(event)
    local player = game.get_player(event.player_index)
    if player == nil then return end

    if player.surface.count_entities_filtered {
        position = player.position,
        radius = player.item_pickup_distance + 1,
        type = self.SLURPABLE_TYPES
    } > 0 then
        player.surface.play_sound {
            path = "slurping-up-items",
            position = player.position
        }
    else
        player.surface.play_sound {
            path = "vanilla-picked-up-item",
            position = player.position
        }
    end
end

function PooberScript:register()
    local slurping_setting = settings.startup["fx-by-streamers-poober-slurping"]
                                 .value

    if slurping_setting == "Always" then
        script.on_event(defines.events.on_picked_up_item,
                        function(event) self:on_slurping_ground(event) end)
    elseif slurping_setting == "Only Belts" then
        script.on_event(defines.events.on_picked_up_item,
                        function(event) self:on_slurping_belts(event) end)
    end
end

return PooberScript
