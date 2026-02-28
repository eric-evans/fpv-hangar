# iFlight iH3

3.5" cinematic freestyle. Full BNF — DJI O3, GPS, capable of carrying a naked GoPro. 4S.

## Notes

- Full BNF — stock iFlight configuration
- GPS Rescue configured as failsafe (`failsafe_procedure = GPS-RESCUE`) but no AUX5 switch assigned — standard calls for one
- `gps_rescue_allow_arming_without_fix = ON` — can arm without GPS lock
- OSD running MSP DisplayPort (canvas mode) ✓
- Two PID profiles: profile 0 = stock iFlight tune, profile 1 = alternate with thrust linearization and dynamic idle
- 3100KV on 4S is aggressive/punchy — drop to 3S for more relaxed cinematic feel
- Can mount a naked GoPro

## Hardware

| Component | Model | Notes |
|-----------|-------|-------|
| Frame | iFlight iH3 3.5" | H-shaped, 168mm wheelbase |
| FC | iFlight BLITZ Mini F7 (IFLIGHT_BLITZ_F722) | STM32F7X2 |
| ESC | iFlight BLITZ Mini E55 4-in-1 | 55A |
| Motors | iFlight XING 1504 3100KV | 3-4S |
| Props | HQ 3.5×2.5×3 | 3-blade |
| RX | — | ELRS 2.4GHz |
| Video | DJI O3 Air Unit | Digital, 4K stabilized |
| GPS | Pre-installed | UBlox, Galileo enabled |

## LiPo

| Battery | Cells | Notes |
|---------|-------|-------|
| — | 4S | 3S also supported |

## Firmware

| Component | Version |
|-----------|---------|
| Betaflight | 4.3.1 (Jul 13 2022) |
| ELRS RX | — |
| DJI O3 | — |

## Config History

| Snapshot | State | Files |
|----------|-------|-------|
| 2026-02-28 | Baseline BNF stock dump | [diff_all.txt](dumps/20260228/diff_all.txt), [dump_all.txt](dumps/20260228/dump_all.txt) |
