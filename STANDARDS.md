# Standards

Preferred settings applied across the fleet.

## ELRS

Current fleet version: **3.3.0**

Upgrade path: planned, but blocked if any quad uses SPI ELRS (SPI receivers cannot be updated independently — ELRS is baked into Betaflight). No SPI ELRS found in fleet as of 2026-02-28.

To bind/update a serial ELRS receiver: power quad, wait ~60s for WiFi hotspot, connect and go to `10.0.0.1`, or use ELRS Configurator via Betaflight passthrough.

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

### DJI Vista + Polar Camera (widescreen)

Quads: Volador VX35

Requires WTFOS on goggles and fpv.os on Vista. BF setup:

```
# Ports tab: set UART connected to Vista as MSP + DisplayPort (131073)
serial UART2 131073 115200 57600 0 115200
set osd_displayport_device = MSP
# vcd_video_system locks to HD automatically when Vista is detected
```

Canvas: **53x20** (HD widescreen). OSD elements and positions (from VX35 as reference):

```
set osd_vbat_pos = 2595
set osd_current_pos = 2626
set osd_craft_name_pos = 2659
set osd_warnings_pos = 14744
set osd_avg_cell_voltage_pos = 2563
set osd_disarmed_pos = 2426
set osd_warn_bitmask = 50175
set osd_rssi_dbm_alarm = -102
set osd_stat_bitmask = 8519844
set osd_craftname_msgs = ON
```

### DJI Vista + OG DJI Camera (4:3)

Quads: Beaver, Demibot

Same BF/UART setup as above. Canvas is **4:3** — OSD element positions will differ from the Polar cam layout. Layout TBD when those quads are overhauled.

### DJI O3

O3 supports native BF HD OSD — no WTFOS required. Layout TBD.
