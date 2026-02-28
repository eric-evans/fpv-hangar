# BetaFPV Pavo Pico

80mm brushless whoop with DJI O3. 2S.

## Notes


- `vcd_video_system` set to PAL — should be HD for O3 canvas mode, needs correction
- Full BNF — stock BetaFPV configuration
- Requires USB-C to JST adapter to connect to a computer for configuration — adapter kept in garage wall toolbox

## Hardware

| Component | Model | Notes |
|-----------|-------|-------|
| Frame | BetaFPV Pavo Pico | 80mm, PA12 |
| FC / ESC | BetaFPV F4 2-3S 20A AIO V1 | STM32F4, 20A cont / 25A peak, integrated |
| Motors | BetaFPV 1102 14000KV | 2-3S |
| Props | Gemfan 45mm 3-blade | — |
| RX | Serial ELRS | ELRS 2.4GHz |
| Video | DJI O3 Air Unit | — |

## LiPo

| Battery | Cells | Capacity | Notes |
|---------|-------|----------|-------|
| Included 2S | 2S | 450mAh | 45C |

## Firmware

| Component | Version |
|-----------|---------|
| Betaflight | 4.4.1 (Apr 13 2023) |
| ELRS RX | 3.3.0 |
| DJI O3 | — |

## Config History

| Snapshot | State | Files |
|----------|-------|-------|
| 2026-02-28 | Baseline dump — unbound, PAL OSD, pre-fix | [diff_all.txt](dumps/20260228/diff_all.txt), [dump_all.txt](dumps/20260228/dump_all.txt) |
