# fpv-hangar — Claude Instructions

This repo tracks every quad and piece of gear in the fleet.

## Fleet Context

Read these READMEs at the start of every session to understand the current state of the ecosystem:

**Quads**
- [Flywoo Flylens 75](quads/flylens75/README.md) — 75mm cinewhoop, 2S, DJI O3, ELRS
- [Fractal 75](quads/fractal75/README.md) — 75mm whoop, 1S, analog, built-in ELRS
- [FlyFishRC Volador II VX5](quads/volador-ii-vx5/README.md) — 5" freestyle, 6S, DJI O3, GPS, ELRS
- [FlyFishRC Volador VX35](quads/volador-vx35/README.md) — 3.5" freestyle, 4S, Caddx Vista, ELRS
- [Ummagawd Botgrinder Demibot](quads/demibot/README.md) — 5" freestyle basher, 4S, Caddx Vista, ELRS, no GoPro mount, FC/ESC TBD
- [Armattan Beaver](quads/beaver/README.md) — 5" freestyle, 4S, Caddx Vista + OG DJI cam, GoPro Hero 7, ELRS, Hobbywing XRotor F7 CON
- [iFlight iH3](quads/ih3/README.md) — 3.5" cinematic, 4S, DJI O3, GPS, ELRS, full BNF
- [BetaFPV Pavo Pico](quads/pavo-pico/README.md) — 80mm whoop, 2S, DJI O3, serial ELRS, PAL→HD OSD fix still needed

**Gear**
- [TBS Tango 2](gear/tango2/README.md) — primary controller, OpenTX 1.3.0, BETAFPV ELRS Nano TX module (ELRS 3.3.0, 2.4GHz)
- [DJI FPV Goggles V2](gear/dji-goggles-v2/README.md) — primary goggles, supports legacy DJI FPV and O3 modes
- [TBS Fusion](gear/tbs-fusion/README.md) — analog VRX module for the goggles

**Top-level**
- [README.md](README.md) — fleet inventory overview
- [STANDARDS.md](STANDARDS.md) — standard rates, modes, and OSD layouts per class

## Goals

- Document every quad: frame, FC, ESC, motors, RX, video system, LiPo specs
- Track exact firmware versions for every component (Betaflight, ELRS, DJI, etc.)
- Archive stock configs before any changes are made
- Work through each quad one at a time — document current state, then update
- Use blackbox data to suggest filters and PIDs appropriate to the hardware
- Maintain standard rates, modes, and OSD layouts per class — see STANDARDS.md

## Workflow — Adding a New Quad

Prompt for:
1. Frame name and size
2. FC and ESC (stack or AIO)
3. Motors (model + KV)
4. RX (ELRS assumed)
5. Video system
6. LiPo cell count and capacity
7. Prop size

Then:
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

Analyze `.bbl` / `.bfl` logs and suggest Betaflight filter and PID changes based on:
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

- All quads run ELRS 2.4GHz receivers
- Controller is TBS Tango 2 with external BETAFPV ELRS Nano TX module (not internal Crossfire)
- OS: Ubuntu (previously macOS)
- udev rule for FC serial access: `/etc/udev/rules.d/45-betaflight.rules`
