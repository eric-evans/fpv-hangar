# Sonny's Armattan Tadpole 2.5"

2.5" freestyle toothpick. Custom build. DJI O4 air unit. Betaflight 4.5.0 on BETAFPVF405.

## Issue

**Video oscillations under throttle / sharp inputs** — Reported 2026-03-15.

Video is smooth while hovering at steady throttle. When Sonny throws a roll or any sharp input, the recorded video goes comically shaky for ~0.5–1s before settling.

## Blackbox Analysis — 2026-03-15

Log: `dumps/20260315/btfl_001.bbl` (208.5s, 2S pack, 8.62V → 7.22V)

### The hover is genuinely clean

Stable/hover frames (setpoint < 10 deg/s on roll and pitch):

| Metric | Value |
|--------|-------|
| Gyro roll stdev | **4.6** deg/s |
| P roll stdev | 6.2 |
| D roll stdev | 4.0 |

This confirms the quad itself is quiet at hover. Matches Sonny's report: smooth video at steady throttle.

### Active maneuvers show real propwash oscillation

Maneuver frames (setpoint > 50 deg/s):

| Metric | Value |
|--------|-------|
| P roll max | 573 — pegging hard |
| D roll max | 335 — fighting hard |
| Gyro roll stdev | 327.6 |
| P-term sign reversals / 50ms (mean) | **4.3** |
| P-term sign reversals / 50ms (max) | **17** → ~340 Hz oscillation burst |

The P term is reversing sign 17 times in 50ms at worst — that's the flight controller fighting actual rapid attitude oscillation during propwash. It's not catastrophic but it's real.

### Roll axis noise increases significantly at high throttle

Gyro unfiltered roll stdev by throttle band (flying frames):

| Band | Roll stdev | Pitch stdev |
|------|-----------|-------------|
| 1100–1300 | 46.5 | 6.7 |
| 1300–1500 | 31.4 | 94.8 |
| 1500–1700 | 42.7 | 22.7 |
| **1700–2000** | **133.2** | 27.4 |

Roll noise triples at high throttle while pitch stays modest. Suggests a vibration source on the roll axis (left/right motors or props) that gets excited under throttle.

### What's causing the video shake

**Primary culprit: DJI Rock Steady (EIS)**

The temporal pattern — smooth at hover, shaky for 0.5–1s during/after rolls and sharp inputs — is textbook EIS overcorrection behavior. Rock Steady uses gyro data to crop and shift the frame. On a punchy 8000KV toothpick, rapid attitude changes during rolls or throttle punches produce acceleration spikes that the EIS algorithm chases and overshoots, creating a rubber-band wobble in the recorded video that doesn't correspond to actual flight motion. The 0.5–1s duration is the EIS settling time.

This is a well-documented, widespread problem across O3 and O4 builds — not specific to this quad. Community threads:
- [DJI O3: "Horrible Video With Rocksteady EIS on"](https://forum.dji.com/thread-280660-1-1.html) — EIS-on described as "absolutely terrible jello and jittery movement" while EIS-off from the same build is clean
- [DJI O4 Lite: "unusable footage with Rocksteady on"](https://forum.dji.com/thread-330830-1-1.html) — toothpick build, glitchy with EIS, clean without; a frame manufacturer acknowledged redesigning their canopy because of it
- [Avata 2: "wobbles/twitches before 360 rolls in rocksteady footage"](https://forum.dji.com/thread-311764-1-1.html) — describes the same pre-roll snap artifact

**Why small builds are worst affected:** The O3/O4 camera IMU samples at ~24kHz. Default ESC PWM frequency is also ~24kHz. When the camera is hard-mounted to stiff carbon, motor vibration resonates with the IMU and EIS "sees" phantom motion and overcorrects. Small/toothpick frames transmit vibration efficiently and have little mass to damp it — they are the worst-case scenario for this. DJI's own O3 installation guidelines recommend setting ESC PWM to 48kHz or 96kHz to break the resonance. Sonny's diff shows `DSHOT300` — worth checking what PWM frequency is set in Bluejay.

**Contributing factor: propwash is real**

The blackbox confirms actual P-term oscillation during maneuvers. The FC is fighting real propwash. Rock Steady then makes it worse by attempting to "stabilize" the oscillating motion — the EIS ends up amplifying the wobble in the video by tracking and overcorrecting it.

**Root cause of the propwash:** `simplified_dmax_gain = 0`. D_max is pegged at D_min, so the D term never boosts to suppress propwash during movement. This is the single biggest tune issue — the built-in propwash suppression mechanism is completely disabled.

### Tune flags

| Setting | Value | Issue |
|---------|-------|-------|
| `simplified_dmax_gain` | `0` | **D boost disabled** — D_max = D_min, no propwash suppression. Raise to 100–130. |
| `pidsum_limit` / `pidsum_limit_yaw` | `1000` | **PID authority cap removed** — default is 500. Combined with 1.5x master multiplier, nothing limits the FC from overcorrecting at full authority. If the tune goes hot (worn props, different battery), it will oscillate hard with no ceiling. |
| `rc_smoothing_setpoint_cutoff` / `feedforward_cutoff` | `25` Hz | Low for freestyle (normal 40–80Hz). Stick response feels behind, FF reaction is delayed — quad underresponds on initial input then catches up. `rc_smoothing_auto_factor = 250` is set too but the explicit cutoffs are what actually apply. |
| `simplified_master_multiplier` | `150` | 1.5x P/D — reasonable for 8000KV but on the high side if propwash is present. |
| `yaw_lowpass_hz` | `0` | Yaw lowpass disabled (default 100Hz). Intentional for snap, but can let yaw oscillation through on a toothpick. |
| `rpm_filter_harmonics` | `2` | Only 2 harmonics (default 3). Third harmonic noise from 8000KV motors passes through unfiltered. Easy win to bump to 3. |
| `debug_mode` | `GYRO_SCALED` | Left on from a debug session. Set back to `NONE` when not analyzing. |
| `pid_process_denom` | `2` | F405 cap at 4kHz PID loop — normal. |

### Safety / config notes

- **All beepers disabled** — including `BAT_CRIT_LOW`, `RX_LOST`, and `RX_LOST_LANDING`. `osd_rssi_dbm_alarm = -100` makes the RSSI audio alarm unreachable. OSD still shows battery/LQ but there's no audio warning for a dying pack or lost link.
- **`baro_hardware = AUTO`** — barometer is enabled and will be used if detected. Unnecessary noise source on a pure freestyle build; set to `NONE`.

### Recommendations

1. **Disable Rock Steady entirely** and review the raw footage. If the wobble disappears or becomes smooth proportional motion, EIS is confirmed. Community consensus for freestyle builds: leave it off. This is not a fixable tune issue — it's an EIS algorithm limitation on fast, stiff quads.

2. **If he wants post-flight stabilization: use Gyroflow.** Requires shooting with EIS off (so the gyro data is preserved). Gyroflow has better context to distinguish intentional motion from vibration and doesn't have the overcorrection problem. O4 is supported. Reference: [Gyroflow supported cameras](https://docs.gyroflow.xyz/app/getting-started/supported-cameras/dji).

3. **Check ESC PWM frequency in Bluejay.** DJI's own O3 guidelines recommend 48kHz or 96kHz PWM to eliminate camera IMU resonance with motor noise. The default 24kHz coincides with the O3/O4 IMU sample rate and is the root cause of EIS overcorrection on many builds. If it's at 24kHz, bumping to 48kHz may improve EIS behavior if he wants to keep it on.

4. **Fix the tune: set `simplified_dmax_gain = 100`** (or try 100–130). This re-enables D boost under movement, which is the primary lever for propwash suppression in BF 4.5 simplified tuning. Do this regardless of what he decides on Rock Steady.

5. **Check props and motor screws on roll-axis motors** (left/right pair). The high-throttle roll noise increase is worth investigating. Swap to a fresh set of props and see if it changes.

6. **Lower `simplified_master_multiplier`** from 150 to 120 as a trial if propwash persists after fixing dmax — the current P/D is on the aggressive side for a toothpick.

## Hardware

| Component | Model | Notes |
|-----------|-------|-------|
| Frame | Armattan Tadpole 2.5" | — |
| FC | BETAFPV F405 | STM32F405 |
| Motors | 1103 8000KV | 2S confirmed from log |
| Video TX | DJI O4 Air Unit | Rock Steady EIS — suspected video issue |
| Props | Unknown | Roll-axis noise worth investigating |
| RX | Unknown | ELRS (serial 3, UART4) |

## Firmware

| Component | Version |
|-----------|---------|
| Betaflight | 4.5.0 (Dec 25 2024) |
| FC target | BETAFPVF405 (STM32F405) |

## Config History

| Snapshot | State | Files |
|----------|-------|-------|
| 20260315 | Baseline from Sonny — stock tune, propwash present | [diff_all.txt](dumps/20260315/diff_all.txt), [btfl_001.bbl](dumps/20260315/btfl_001.bbl) |
