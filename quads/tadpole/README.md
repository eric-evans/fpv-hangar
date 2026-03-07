# Armattan Tadpole 2.5"

2.5" freestyle toothpick. Custom build. Analog. Overhaul in progress.

## Notes

- ELRS EP2 RX with integrated SMD ceramic antenna
- Boot button does not work for DFU mode — use `bl` command in BF Configurator CLI instead
- Front left motor (M4) struggles to start — compressed air didn't help; may need Bluejay startup power increase or motor swap
- All motors slightly sluggish at startup — consider bumping Bluejay Boost from 1025 to 1050–1075
- Throttle unresponsive during first hover attempt — possible dshot_idle_value or throttle range issue; runaway spool-up behavior observed on ground (PIDs or idle too high). Same behavior reproduced on VX35 — likely a BF 2025.12.2 default issue, not quad-specific.
- 1105 5000KV motors are a mismatch for 2.5" on 3S — low KV, too heavy; swap recommended (see Hardware)

## Next Steps

1. Investigate M4 startup issue — try increasing Bluejay Boost to 1050–1075
2. Diagnose throttle non-response — check `dshot_idle_value`, throttle min/max calibration
3. Successful hover test
4. Blackbox flight for PID/filter tuning
5. Consider motor swap to 1103/1104 6000–8000KV (see Hardware notes)

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
| Betaflight | 2025.12.2 (Feb 1 2026) |
| Bluejay (ESC) | v0.21.0, 48kHz |
| ELRS RX | 3.3.0 |

## Config History

| Snapshot | State | Files |
|----------|-------|-------|
| 2026-02-28 | Baseline — poorly flying stock config, BF 4.3.1 | [diff_all.txt](dumps/20260228/diff_all.txt), [dump_all.txt](dumps/20260228/dump_all.txt) |
| 2026-03-01 | Post-overhaul — BF 2025.12.2, Bluejay v0.21.0, ELRS 3.3.0, fresh config — **motor startup issues unresolved, do not fly** | [diff_all.txt](dumps/20260301/diff_all.txt) |

## Flashing Notes

- Boot button does not work for DFU mode — use `bl` command in BF Configurator CLI instead
- udev rule required for DFU mode (`0483:df11`) — added to `/etc/udev/rules.d/45-betaflight.rules`
- BF PWA Configurator will interfere with python3-serial CLI access — always close it before CLI work
