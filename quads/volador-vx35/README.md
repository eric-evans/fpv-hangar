# FlyFishRC Volador VX35

3.5" freestyle night ripper. DJI digital with Caddx Polar camera — exceptional low-light performance. High priority for firmware update and full retune.

## Weight

| Configuration | Weight |
|---------------|--------|
| No battery | 187g |

## Notes

- Revamp complete 2026-03-06: BF 2025.12.2, Bluejay 0.21.0, bidir DSHOT, RPM filtering
- HD OSD working via WTFOS (goggles) + fpv.os (Vista)
- **Hover test failed** — same symptom as Tadpole: armed fine, throttle unresponsive, motors slowly spun up over several seconds toward runaway. Likely a BF 2025.12.2 default issue (dshot_idle_value, throttle scaling, or similar). Investigate alongside Tadpole.
- **Blackbox not working** — SPI flash not detected after BF upgrade (JEDEC ID 0x00). Target changed from S7X2 to F722, likely broke flash pin mapping. Needs investigation.
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
| Betaflight | 2025.12.2 |
| ELRS RX | 3.3.0 |
| Bluejay (ESC firmware) | 0.21.0 @ 48kHz |
| Caddx Vista | — |
