# Installing WTFOS on DJI FPV Goggles V2

Reference: [Joshua Bardwell - WTFOS Install Guide](https://www.youtube.com/watch?v=tqiDspQoKDA&t=84s)

Required to display Betaflight MSP DisplayPort OSD on Vista quads with BF 2025.12.2+.
Does not affect O3 functionality.

## Context

- Goggles were on firmware **01.00.0607** which blocks WTFOS
- Downgraded to **01.00.0606** using butter, then rooted, then upgraded to latest via DJI Assistant
- **WTFOS is now installed and working**

## Process Followed (butter commit 8abdba8)

From the butter README for first-time V2 Goggles users:

1. Download butter from https://github.com/fpv-wtf/butter — use the `01.00.0606` recovery package
2. Follow included `README.txt` to downgrade goggles to 0606 — **all binds will be lost**
3. Go to https://fpv.wtf/root and root the device — **do NOT install WTFOS yet**
4. Switch goggles to **DJI FPV mode** from the device menus
5. Use **DJI Assistant (DJI FPV series)** to upgrade to latest firmware
6. Go to https://fpv.wtf/wtfos and install WTFOS
7. Install the **msp-osd** package for Betaflight OSD support

### Vista units also need rooting

The Vista air units must also be rooted and have **fpv.os** installed for HD OSD to work.
Process is similar — butter the Vista via USB, root via fpv.wtf, install fpv.os.

### Rebind all quads

All binds are lost during the downgrade. Rebind every quad after WTFOS is installed.

## Notes

- O3 quads already support native BF HD OSD — no WTFOS needed on the O3 side
- Optionally install **tweak-fix-bind-loss** WTFOS package to auto-rebind Vista quads when switching from O3 mode
- Do this on **Windows** — butter has USB stack issues on Linux
