# Armattan Tadpole 2.5"

2.5" freestyle toothpick. Custom build. Analog. Flies — stock BF 4.5.3 tune, needs tuning flight.

## Notes

- ELRS EP2 RX with integrated SMD ceramic antenna
- Boot button does not work for DFU mode — use `bl` command in BF Configurator CLI instead
- **BF 2025.12.2 regression** — ACRO throttle completely non-responsive with Bluejay ESCs. Downgraded to 4.5.3, which fixed it.
- Hover confirmed on BF 4.5.3 with stock tune — 2026-03-15
- M4 motor startup twitchy — Bluejay Boost bumped to 1125 (max). Still slightly twitchy; likely mechanical. Motor swap recommended long-term.
- Video rolling observed at 1075 boost — `vcd_video_system` set to AUTO (PAL/NTSC auto-detect). `osd_canvas_height=13` (NTSC).
- `pid_process_denom=2` — auto-set by BF for F411, not configurable
- 1105 5000KV motors are a mismatch for 2.5" on 3S — low KV, too heavy; swap recommended (see Hardware)
- **No blackbox** — iFlight SucceX Micro F4 has no onboard flash. Blackbox not possible without external logging solution.

## Next Steps

1. Tuning flight — stock PIDs, note propwash and oscillations
2. Apply tune (UAV Tech 2-4" or manual based on feel)
3. Consider motor swap to 1103/1104 6000–8000KV (see Hardware notes)

## Hardware

| Component | Model | Notes |
|-----------|-------|-------|
| Frame | Armattan Tadpole 2.5" | — |
| FC / ESC / VTX | [iFlight SucceX Micro F4 V2.1](https://www.getfpv.com/iflight-succex-micro-f4-v2-1-16x16-flight-tower-system-stack-f411-pro-fc-200mw-vtx-15a-2-4s-esc.html) | STM32F411, 15A BLHeli_S ESC, 200mW VTX integrated, 16x16, 2-4S |
| Motors | BetaFPV 1105 5000KV | 3S — low KV for 2.5", better suited to 3" props; candidate for swap to 1103/1104 6000–8000KV |
| Props | AVAN Rush 2.5" tri-blade | — |
| RX | Happymodel EP2 | ELRS 2.4GHz, SMD ceramic antenna |
| Camera | Analog | — |

## LiPo

| Battery | Cells | Notes |
|---------|-------|-------|
| 450mAh 75C (aged, ~30mΩ IR) | 3S | Serviceable for tuning; monitor sag |

## Firmware

| Component | Version |
|-----------|---------|
| Betaflight | 4.5.3 |
| Bluejay (ESC) | v0.21.0, 48kHz |
| ELRS RX | 3.3.0 |

## Config History

| Snapshot | State | Files |
|----------|-------|-------|
| 2026-02-28 | Baseline — poorly flying stock config, BF 4.3.1 | [diff_all.txt](dumps/20260228/diff_all.txt), [dump_all.txt](dumps/20260228/dump_all.txt) |
| 2026-03-01 | Post-overhaul — BF 2025.12.2, Bluejay v0.21.0, ELRS 3.3.0, fresh config — **do not use, BF regression** | [diff_all.txt](dumps/20260301/diff_all.txt) |
| 2026-03-15 | BF 4.5.3 base config — hover confirmed. Default tune and rates. | [diff_all.txt](dumps/20260315/diff_all.txt) |

## Flashing Notes

- Boot button does not work for DFU mode — use `bl` command in BF Configurator CLI instead
- udev rule required for DFU mode (`0483:df11`) — added to `/etc/udev/rules.d/45-betaflight.rules`
- BF PWA Configurator will interfere with python3-serial CLI access — always close it before CLI work
