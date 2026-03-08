# FlyFishRC Volador VX35

3.5" freestyle night ripper. DJI digital with Caddx Polar camera — exceptional low-light performance. High priority for firmware update and full retune.

## Weight

| Configuration | Weight |
|---------------|--------|
| No battery | 187g |

## Notes

- Revamp complete 2026-03-07: BF 4.5.3, Bluejay 0.21.0, bidir DSHOT, RPM filtering, HD OSD
- HD OSD working via WTFOS (goggles) + fpv.os (Vista)
- **Hover test complete** — flies on 4.5.3 with ported 4.4.2 tune, motor_poles corrected to 12
- **BF 2025.12.2 regression** — ACRO throttle completely non-responsive with Bluejay ESCs (tested on F722 and F411). ANGLE/HORIZON immediate flyaway. Downgrading to 4.5.3 fixed it. Affects both VX35 and Tadpole. Worth filing on Betaflight GitHub.
- **No blackbox** — Diatone Mamba MK1 F722 AIO has no onboard flash. Blackbox not possible without external logging solution.
- **Retune pending** — currently on ported 4.4.2 tune. Blackbox flight needed for proper filter/PID tune on 4.5.3.
- Battery must be connected to access FC via USB

## Hardware

| Component | Model | Notes |
|-----------|-------|-------|
| Frame | FlyFishRC Volador VX35 | 3.5" |
| FC / ESC | [Diatone Mamba MK1 F722 AIO 35A](https://www.getfpv.com/diatone-mamba-mk1-aio-f722-fc-35a-blheli-s-2-6s-esc-external-usb.html) | STM32F7X2, BLHeli-S 35A, 2-6S, external USB-C (double-sided taped) |
| Motors | iFlight XING2 1404 3800KV | — |
| Props | Gemfan Hurricane 3520 Tri-blade | — |
| RX | [Happymodel ExpressLRS Nano EP1](https://www.getfpv.com/happymodel-expresslrs-nano-2-4ghz-ep1-rx.html) | ELRS 2.4GHz |
| Video | Caddx Vista | DJI Digital |
| Camera | Caddx Polar | Excellent night performance |

## LiPo

| Battery | Cells | Capacity | C Rating | Connector |
|---------|-------|----------|----------|-----------|
| [Tattu R-Line 650mAh 95C](https://pyrodrone.com/products/tattu-r-line-650mah-14-8v-95c-4s1p-lipo-battery-pack-with-xt30-plug) | 4S | 650mAh | 95C | XT30 |
| [Pyrodrone Graphene 850mAh 95C](https://pyrodrone.com/products/pyrodrone-graphene-850mah-4s-14-8v-95c-xt30) | 4S | 850mAh | 95C | XT30 |

## Firmware

| Component | Version |
|-----------|---------|
| Betaflight | 4.5.3 |
| ELRS RX | 3.3.0 |
| Bluejay (ESC firmware) | 0.21.0 @ 48kHz |
| Caddx Vista | — |

## Config History

| Snapshot | State | Files |
|----------|-------|-------|
| 2026-02-28 | Pre-overhaul baseline — BF unknown, Bluejay 0.16 @ 48kHz | [esc-configurator.png](dumps/20260228/esc-configurator.png) |
| 2026-03-06 | Post-overhaul — BF 2025.12.2, Bluejay 0.21.0, HD OSD, UAV Tech preset — **do not use, BF regression** | [diff_all.txt](dumps/20260306/diff_all.txt), [diff_all_uavtech_preset.txt](dumps/20260306/diff_all_uavtech_preset.txt), [esc-bluejay-0.21-configured.png](dumps/20260306/esc-bluejay-0.21-configured.png) |
| 2026-03-07 | BF 4.5.3, ported 4.4.2 tune, motor_poles=12, HD OSD — hover confirmed | [diff_all_453_hd_osd.txt](dumps/20260307/diff_all_453_hd_osd.txt) |
