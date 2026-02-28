# fpv-hangar — Agent Instructions

This repo tracks every quad and piece of gear in the fleet. See README.md for the fleet inventory.

## Goals

- Document every quad: frame, FC, ESC, motors, RX, video system, LiPo specs
- Track exact firmware versions for every component (Betaflight, ELRS, DJI, etc.)
- Archive stock configs before any changes are made
- Work through each quad one at a time — document current state, then update
- Use blackbox data to let Agent suggest filters and PIDs appropriate to the hardware
- Maintain standard rates, modes, and OSD layouts per class — see STANDARDS.md

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
- Archive the dump under `dumps/YYYYMMDD/`
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

## Toolchain

| Tool | Version | Notes |
|------|---------|-------|
| Betaflight Configurator | 10.10.0 | Installed via .deb |
| ELRS Configurator | 1.7.11 | Installed via .deb |
| python3-serial | system | FC serial CLI access |

## Notes

- All quads run ELRS 2.4GHz
- OS: Ubuntu (previously macOS)
- udev rule for FC serial access: `/etc/udev/rules.d/45-betaflight.rules`
