
## Layer 1
- 00: air
- 08: solid
- 09: solid (roof where you might be crushed)
- 10: lower part of slope /| (horizontal 2-tiles)
- 11: higher part of slope /| (horizontal 2-tiles)
- 12: higher part of slope |\ (horizontal 2-tiles)
- 13: lower part of slope |\ (horizontal 2-tiles)
- 14: left part of slope \| (horizontal 2-tiles)
- 15: right part of slope \| (horizontal 2-tiles)
- 16: left part of |/ slope (horizontal 2-tiles)
- 17: right part of |/ slope (horizontal 2-tiles)
- 18: lower part of /| slope (vertical 2-tiles)
- 19: higher part of /| slope (vertical 2-tiles)




## Layer 2

The second layer behaves differently if the corresponding layer 1 tile is solid (then it indicates the terrain type) or if it's empty (then it indicates an entity type or other flags).

Some entities can be further parametrized, for example 04 is a generic 'spawner' entity, the type is indicated by the tile directly to its right (eg 04 08). These parameters can be tricky (for example with the 1D yellow retracting blocks which have complex parametrization for their timings).

I've only done a quick pass and might have made mistakes but some entities might depend on the header or other external data, eg 04 24.

### Air

- 01: ladder
- 02: spawn / exit door
    - 00 exit door #1
    - 01 exit door #2
    - 04 spawn
    - 05 spawn
- 03: no-enemy spawn flag
- 04: Generic spawning flag (spawns object on its right)
    - 04: door (after boss) ?
    - 07: backpack
    - 08: ennemy (red white fish)
    - 09: tuna fish ?
    - 0A: brown eel (shoots bouncing stuff)
    - 14: shark
    - 18: bird spawn (ground)
    - 1A: bird spawn
    - 1B: bird spawn (air)
    - 1C: ?
    - 1D: bird spawn (air)
    - 22: spawning ladder below ?
    - 24: barred door / running water barrel boss
    - 2A: pufferfish boss
    - 32: enemy (tuna fish)
- 05: spawning flag ditto ?
    - 11: barnacle
    - 20: tadpole boss ?
- 1D 1D: expanding/retracting yellow blocks (2blocks wide)
    - #3 is the number of beats until they start retracting * 16 (a0=10 beats)
    - there are flags below such as (left to right)
        - (following examples are 2 beats per second, all are disjoint lines)
        - 80 f0 a0 60 80    (stays 0 beats retracted, 10 beats out)
        - 80 f0 a0 60   (stays 3 beats retracted, 10 beats out)
        - 80 f0 a0 60 d0    (1 beats retracted, 10 beats outs)
    - other example (right to left)
        - 80 10 a0 60 a0 (starts over before its finisehd all rertacting)
- 20: rising platform path ?
- 27: rising platform path (bluew/ spikes on top)
- 31: upward pillar path
- 3A: downward pillar path
- 40: rising platform (2 tiles right of C0)
- 70: downward pillar (1 tile right of 80)
- 80: 
    - rising platform ? (2 tiles right to 20)
    - downward pillar ? (1 tile right of 3A)
    - upward pillar ? (1 tile right of 31)
- C0: found 1 tile right of 20

Solid
- 01: blue solid block flag 
- 02: protruding yellow solid block flag 
- 03: protruding blue solid block flag ???
- 04: dirt terrain / rock terrain
- 05: yellow face/blue ground (O-shaped flying terrain)
- 0F: ?? found on invisible solid tile
- 10: ice
- 12: yellow terrain with spikes on top
- 13: blue terrain with spikes on top
- 15: counterclockwise conveyor
