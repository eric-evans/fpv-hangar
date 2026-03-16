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
serial 1 131073 115200 57600 0 115200
# feature OSD must be explicitly set after defaults nosave — not default-on for all targets
feature OSD
# osd_displayport_device auto-selects MSP when serial port is configured as DisplayPort
# vcd_video_system auto-locks to HD when Vista is detected
# osd_craftname_msgs must be OFF — otherwise craft name overrides with LQ telemetry string
```

Canvas: **60x22** (auto-reported by Vista via WTFOS). OSD elements and positions (finalized on VX35, 2026-03-10):

```
set osd_vbat_pos = 2563
set osd_current_pos = 2594
set osd_link_quality_pos = 2627
set osd_rssi_dbm_pos = 2659
set osd_craft_name_pos = 611
set osd_warnings_pos = 14744
set osd_avg_cell_voltage_pos = 2531
set osd_disarmed_pos = 2426
set osd_warn_bitmask = 49917
set osd_link_quality_alarm = 70
set osd_rssi_dbm_alarm = -102
set osd_stat_bitmask = 8519846
set osd_canvas_width = 60
set osd_canvas_height = 22
```

Warnings enabled: arming disabled, battery critical, battery warning, core temp, crash flip, ESC fail, failsafe, link quality, RC smoothing failure, RSSI dBm, visual beeper.
Warnings disabled: battery not full (nuisance), analog RSSI (not used with ELRS), GPS rescue.

### DJI Vista + OG DJI Camera (4:3)

Quads: Beaver, Demibot

Same BF/UART setup as above. Canvas is **4:3** — OSD element positions will differ from the Polar cam layout. Layout TBD when those quads are overhauled.

### DJI O3

O3 supports native BF HD OSD — no WTFOS required. Layout TBD.
