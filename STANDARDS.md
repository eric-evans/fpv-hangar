# Standards

Preferred settings applied across the fleet.

## Channel Map

```
TAER1234
```

## Modes

Standard mode setup. Applied to all quads — add GPS Rescue on AUX5 for GPS-equipped quads.

| AUX | Low (900-1300) | Mid (1300-1700) | High (1700-2100) |
|-----|---------------|-----------------|-----------------|
| AUX1 | — | — | ARM |
| AUX2 | — | — | BEEPER |
| AUX3 | — | — | FLIP OVER AFTER CRASH |
| AUX4 | ANGLE | HORIZON | — |
| AUX5 | — | GPS RESCUE | — | ← GPS quads only |

### Betaflight CLI

```
aux 0 0 0 1700 2100 0 0
aux 1 13 1 1700 2100 0 0
aux 2 35 2 1700 2100 0 0
aux 3 1 3 900 1300 0 0
aux 4 2 3 1300 1700 0 0
aux 5 46 4 1300 1700 0 0
```

## OSD Layouts

### Analog

> TBD

### DJI (Standard / O3)

> TBD

### DJI O3

> TBD
