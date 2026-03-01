# Armattan Tadpole 2.5"

2.5" freestyle toothpick. Custom build. Analog. Flies poorly — high priority for full overhaul.

## Notes

- **Flies bad — full overhaul planned**: new firmware, retune, blackbox analysis
- PID tune appears copied from another quad (nearly identical to Phantom) without adjustment — likely a root cause of poor flight characteristics
- ELRS EP2 RX with integrated SMD ceramic antenna

## Hardware

| Component | Model | Notes |
|-----------|-------|-------|
| Frame | Armattan Tadpole 2.5" | — |
| FC / ESC / VTX | [iFlight SucceX Micro F4 V2.1](https://www.getfpv.com/iflight-succex-micro-f4-v2-1-16x16-flight-tower-system-stack-f411-pro-fc-200mw-vtx-15a-2-4s-esc.html) | STM32F411, 15A BLHeli_S ESC, 200mW VTX integrated, 16x16, 2-4S |
| Motors | — | — |
| Props | AVAN Rush 2.5" | — |
| RX | Happymodel EP2 | ELRS 2.4GHz, SMD ceramic antenna |
| Camera | Analog | — |

## LiPo

| Battery | Cells | Notes |
|---------|-------|-------|
| — | — | — |

## Firmware

| Component | Version |
|-----------|---------|
| Betaflight | 4.3.1 (Jul 13 2022) |
| ELRS RX | — |

## Config History

| Snapshot | State | Files |
|----------|-------|-------|
| 2026-02-28 | Baseline — poorly flying stock config | [diff_all.txt](dumps/20260228/diff_all.txt), [dump_all.txt](dumps/20260228/dump_all.txt) |
