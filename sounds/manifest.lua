local function filename(sound)
    return string.format("__FX-by-Streamers__/sounds/%s.ogg", sound)
end

return {
    ["slurping-up-items"] = {
        type = "sound",
        name = "slurping-up-items",
        category = "game-effect",
        filename = filename("slurp_01"),
        aggregation = {
            max_count = 1,
            count_already_playing = true,
            remove = true,
            progress_threshold = 1.0
        }
    }
}
