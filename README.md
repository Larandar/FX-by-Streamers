# Sound FX done by Streamers for Factorio

Because who does not enjoy earring Poober's suave slurping?

## Current sounds

- Poober slurping the belts

## Transcoding sounds:

Factorio use OGG file for playing sounds

```shell
ffmpeg -i $MP4_CLIP -vn -acodec libvorbis sounds/$SOUND_NAME.ogg -y
```

## Adding a new sound:

1. Transcode the sound to OGG file
2. Declare the sound with necessary settings in `sounds/manifest.lua`
3. Create a file for the associated sound in `prototypes` taking Poober's as a template
4. Add settings if necessary


## Known issues:

- GUI and utility sounds can not leverage the `aggregation` setting, and therefore require to be replaced by a silent sound and played in a script (see `controls/poober.lua`)
