# Mobula 7 HD

75mm brushless whoop. Franken-build — Mobula 6 HD board, canopy, and camera on a Mobula 7 frame with Mobula 7 motors. Records to onboard SD card. FrSky D8 SPI receiver (not ELRS).

## Notes

- Mobula 6 HD electronics (FC, camera, canopy) grafted onto Mobula 7 frame and motors
- Onboard SD card slot for blackbox / DVR recording
- FrSky **D8** SPI receiver — requires FrSky TX module in Tango 2 external bay (not ELRS)
- SPI receiver cannot be updated independently — baked into firmware
- Already bound (tx_id and hop data present in config)
- Craft name: `|MOCKULA 6|`
- Running **EmuFlight** (not Betaflight) — EmuFlight-specific params: imuf, emu_boost, spa, feathered_pids
- Yaw motors reversed (`yaw_motors_reversed = ON`)
- Airmode disabled in features; starts at 40% throttle
- Channel map: TAER1234 ✓

## Hardware

| Component | Model | Notes |
|-----------|-------|-------|
| Frame | Happymodel Mobula 7 | 75mm ducted |
| FC / ESC | Happymodel CrazyBee F4 FR (CRAZYBEEF4FR) | STM32F4, integrated ESC, 1S |
| Motors | 0802 20000KV | Mobula 7 motors |
| Props | — | ~40mm |
| RX | Built-in FrSky SPI | On-FC, FrSky D8 (`FRSKY_D`) |
| Camera | Mobula 6 HD camera | Onboard SD card recording |
| VTX | Integrated | Analog, NTSC |

## LiPo

| Battery | Cells | Notes |
|---------|-------|-------|
| — | 1S | 300mAh configured |

## Firmware

| Component | Version |
|-----------|---------|
| EmuFlight | 0.3.3 (Jan 10 2021) |
| FrSky SPI RX | — (baked into EmuFlight) |

## Config History

| Snapshot | State | Files |
|----------|-------|-------|
| 2026-03-03 | Baseline — stock config as found | [diff_all.txt](dumps/20260303/diff_all.txt), [dump_all.txt](dumps/20260303/dump_all.txt) |
