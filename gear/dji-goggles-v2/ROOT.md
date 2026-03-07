# Installing WTFOS on DJI FPV Goggles V2

Reference: [Joshua Bardwell - WTFOS Install Guide](https://www.youtube.com/watch?v=tqiDspQoKDA&t=84s)

Required to display Betaflight MSP DisplayPort OSD on Vista quads with BF 2025.12.2+.
Does not affect O3 functionality.

## Context

- Goggles are on firmware **01.00.0607** which blocks WTFOS
- Must downgrade to **01.00.0606** using the **butter** tool first
- Do this on **Windows** — butter has USB stack issues on Linux

## Process

### 1. Downgrade to 0606 (Windows)

1. Install Android platform tools (fastboot): https://developer.android.com/tools/releases/platform-tools
2. Download butter and `gp150_01.00.0606_recovery.zip` from https://github.com/fpv-wtf/butter/releases
3. Run `driver_installer.exe` from the butter package
4. Follow butter README to flash 0606 recovery
5. Goggles will reboot on 0606 — **all binds will be lost**

### 2. Root with WTFOS

1. Connect goggles via USB to Windows
2. Open **Chrome** and go to https://fpv.wtf
3. Follow the margerine exploit to root the goggles
4. Install the **msp-osd** package via the WTFOS configurator
5. Optionally install **tweak-fix-bind-loss** to auto-rebind Vista quads when switching from O3 mode

### 3. Rebind all quads

All binds are lost during the downgrade. Rebind every quad after WTFOS is installed.

## Notes

- WTFOS is goggles-only — Vista units are untouched
- O3 quads already support native BF HD OSD without WTFOS, no change needed there
- After rooting you can optionally upgrade goggles firmware via DJI Assistant and retain WTFOS
- If butter fails on 0607, check the fpv-wtf Discord for latest status
