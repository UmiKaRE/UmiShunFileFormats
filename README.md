# UmiShunFileFormats
A description of the file formats used in Umihara Kawase Shun (PC).


## `.arc` Archive

Proprietary archive format.
The only file with this extension is `data/umires.arc`, which contains all game assets (except musics which are simply `.wav`s under `data/snd/`).

## `.bin` File List

Proprietary archive with only a list of files in it, no names attached to them.
Files of this type: 
- `snd/umise.bin` : sound effects
- `shader/sakstdvs.bin` : shaders
- `shader/sakstdps.bin` : shaders
- `enemy/enemypat.bin` : enemy-related stuff. Has 0 bytes entries
- `trap/trappat.bin` : ??
- `play/playpat.bin` : ??

Files that are **NOT** of this type:
- `sys/fontimg.bin`


### Resources

[`.arc` 010 Binary Template](010bt/arc.bt)
[`.bin` 010 Binary Template](010bt/bin_filelist.bt)