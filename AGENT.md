# fpv-hangar — Agent Instructions

This repo tracks every quad and piece of gear in the fleet. Agent helps with setup, firmware management, blackbox analysis, and tuning.

## Goals

- Document every quad: frame, FC, ESC, motors, RX, video system, LiPo specs
- Track exact firmware versions for every component (Betaflight, ELRS, DJI, etc.)
- Archive stock configs before any changes are made
- Work through each quad one at a time — document current state, then update
- Use blackbox data to let Agent suggest filters and PIDs appropriate to the hardware
- Maintain standard rates per class (freestyle / whoop / cinewhoop)
- Maintain a standard OSD layout per class

## Fleet

| Name | Class | Status |
|------|-------|--------|
| [flylens75](quads/flylens75/) | Whoop | Setting up |

## Gear

| Name | Directory |
|------|-----------|
| TBS Tango 2 | [gear/tango2/](gear/tango2/) |
| DJI FPV Goggles V2 | [gear/dji-goggles-v2/](gear/dji-goggles-v2/) |

## Workflow — Adding a New Quad

Agent will prompt for:
1. Frame name and size
2. FC and ESC (stack or AIO)
3. Motors (model + KV)
4. RX (ELRS assumed)
5. Video system
6. LiPo cell count and capacity
7. Prop size

Then Agent will:
- Create the quad directory and README
- Connect via USB serial and dump current firmware + config
- Archive the dump under `dumps/YYYYMMDD/` (e.g. `dumps/20260227/`)
- Populate the README with all specs and firmware versions

## Workflow — Firmware Updates

1. Archive current config (`diff all` + `dump all`) under `dumps/YYYYMMDD/`
2. Flash new firmware
3. Restore config
4. Update README with new firmware versions

## Blackbox Analysis

Agent can analyze `.bbl` / `.bfl` logs and suggest Betaflight filter and PID changes based on:
- Motor KV
- LiPo cell count
- Quad class and weight
- Observed noise signature in the log

## Hardware

- **Controller**: TBS Tango 2 with ELRS adapter — all quads run ELRS
- **Goggles**: DJI FPV Goggles V2
- **OS**: Ubuntu (previously macOS)
- **Reference archive**: `SKYNET/FPV` on local drive (old Mac backups)
