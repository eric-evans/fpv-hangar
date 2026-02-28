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

## How To Read Configs

### Capture

1. Confirm FC serial port (usually `/dev/ttyACM0`) and ensure it is free:
   - `fuser /dev/ttyACM0 2>/dev/null && echo "port in use" || echo "port free"`
2. Enter Betaflight CLI over serial (115200) and run:
   - `version`
   - `diff all`
   - `dump all`
3. Save at minimum:
   - `diff_all.txt`
   - `dump_all.txt`
4. Archive under quad path:
   - `quads/<quad>/dumps/YYYYMMDD-<state>/`
   - Example states: `pre-initial-config`, `post-initial-config`, `pre-flash`, `post-flash`

### What To Extract For README

- Firmware identity:
  - `# Betaflight ...` from `version`/`diff all`
  - `board_name`, `manufacturer_id`
- RX and control basics:
  - `feature RX_SPI` or serial RX setup
  - `map TAER1234`
  - `serial ...` lines relevant to RX/GPS/MSP
- Modes:
  - `aux ...` lines (ARM/BEEPER/ANGLE/HORIZON/GPS RESCUE)
  - Compare against `STANDARDS.md`
- Hardware behavior:
  - `set motor_pwm_protocol`
  - `set dshot_bidir`
  - `set motor_output_reordering`
  - `set yaw_motors_reversed`
  - `set align_board_*`
- Video/OSD and safety:
  - `vtxtable ...`, `set vtx_*`
  - `set osd_*`
  - `set failsafe_procedure`, `set gps_*` (if equipped)

### Interpretation Rules

- `diff all` is the concise source of non-defaults; use it for quick review.
- `dump all` is full-state backup; keep it for restore and deep debugging.
- If `aux` mapping differs from standards, document whether it is intentional.
- If values are unknown/unverified, mark them in README notes and add a follow-up capture.

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
