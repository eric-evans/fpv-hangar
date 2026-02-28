# Flywoo Flylens 75

75mm brushless whoop with DJI digital video. The first quad reigniting the flame. (Thanks Sonny!)

## Hardware

| Component | Model | Notes |
|-----------|-------|-------|
| Frame | [Flywoo Flylens 75](https://flywoo.net/products/flylens-75-hd-o3-2s-brushless-whoop-fpv-drone) | 75mm ducted, ~82g without battery |
| FC / ESC | Flywoo Goku F4 12A AIO | STM32F405, 12A integrated ESC |
| Motors | Flywoo 1003 14800KV | 12-pole, DSHOT300, bidir RPM filter |
| Props | Gemfan 1609 4-blade | 1.6 inch |
| RX | — | ELRS |
| Video | DJI O3 Air Unit | Digital |

## LiPo

| Battery | Cells | Capacity | C Rating | Connector |
|---------|-------|----------|----------|-----------|
| [Tattu 450mAh 75C](https://genstattu.com/tattu-450mah-7-4v-75c-2s1p-lipo-battery-pack-with-xt30-plug-long-size-for-h-frame.html) | 2S | 450mAh | 75C | XT30 |
| [Tattu R-Line 550mAh 95C](https://www.amazon.com/dp/B097BTRH2X) | 2S | 550mAh | 95C | XT30 |

## Firmware

| Component | Version |
|-----------|---------|
| Betaflight | 4.5.0 (Apr 28 2024) |
| ELRS RX | 3.3.0 (Flywoo EL24P 2400 RX) |
| DJI O3 | — |

## PID Profiles

| # | Name | Notes |
|---|------|-------|
| 0 | 2S-55/75 | Active — tuned for 2S with 55mm or 75mm props |
| 1 | 2S-1000 | 2S with 1000mAh pack |

## Rate Profile

| Profile | Name | Roll RC Rate | Pitch RC Rate | Yaw RC Rate | Expo | Super Rate |
|---------|------|-------------|--------------|------------|------|-----------|
| 0 | UAV-TECH | 1 | 1 | 1 | 70/70/70 | 100/100/70 |

## Config History

| Snapshot | State | Files |
|----------|-------|-------|
| 2026-02-27 | Pre-initial-config baseline (before your first setup pass/test flight) | [diff_all.txt](dumps/20260227/diff_all.txt), [dump_all.txt](dumps/20260227/dump_all.txt) |
| 2026-02-28 | Capture taken right after applying channel map and mode mapping for first flight | [diff_all.txt](dumps/20260228/diff_all.txt), [dump_all.txt](dumps/20260228/dump_all.txt) |

## References

- [Flywoo FlyLens 75 HD O3 — Official Product Page](https://flywoo.net/products/flylens-75-hd-o3-2s-brushless-whoop-fpv-drone)
- [Flywoo Flylens75 Review — Oscar Liang](https://oscarliang.com/flywoo-flylens75/)

## Notes

- Pre-configured by Sonny (pilot name `bpzl` on FC)
- Motor output reordering set (1,0,3,2) — yaw reversed
- Gyro orientation: CW180FLIP
- OSD units: Imperial
- Bind to Tango 2 before flying
- Confirm motor model and prop size visually — sourced from Flywoo product page
- Fill in ELRS RX firmware and DJI O3 firmware version after inspection
