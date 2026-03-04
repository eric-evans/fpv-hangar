# fpv-hangar

Personal FPV fleet management. Tracks hardware specs, firmware versions, configs, and tuning for every quad.

## Fleet

| Quad | Class |
|------|-------|
| [FlyFishRC Volador II VX5](quads/volador-ii-vx5/) | 5" Freestyle |
| [Ummagawd Botgrinder Demibot](quads/demibot/) | 5" Freestyle |
| [Armattan Beaver](quads/beaver/) | 5" Freestyle |
| [FlyFishRC Volador VX35](quads/volador-vx35/) | 3.5" Freestyle |
| [iFlight iH3](quads/ih3/) | 3.5" Cinematic |
| [GepRC Phantom](quads/phantom/) | 2.5" Freestyle Toothpick |
| [Armattan Tadpole 2.5"](quads/tadpole/) | 2.5" Freestyle Toothpick |
| [BetaFPV Pavo Pico](quads/pavo-pico/) | 80mm Cinewhoop |
| [Flywoo Flylens 75](quads/flylens75/) | 75mm Cinewhoop |
| [Mobula 7 HD](quads/mobula7-hd/) | 75mm Whoop |
| [Fractal Engineering Fractal 75](quads/fractal75/) | 75mm Whoop |

## Gear

| Item | Type |
|------|------|
| [TBS Tango 2](gear/tango2/) | Controller |
| [BETAFPV ELRS Nano TX](gear/elrs-tx-module/) | TX Module |
| [FrSky TX Module](gear/frsky-tx-module/) | TX Module |
| [DJI FPV Goggles V2](gear/dji-goggles-v2/) | Goggles |
| [TBS Fusion](gear/tbs-fusion/) | Analog VRX |

## Stack

- **RX**: ELRS on most quads; GepRC Phantom runs TBS Crossfire; Mobula 7 HD runs FrSky SPI
- **Controller**: TBS Tango 2 w/ ELRS adapter
- **Goggles**: DJI FPV Goggles V2

## Notes

- `dump all` produces no output in BF 2025.12.2 — use `diff all` only; sufficient for restoration when combined with known firmware defaults
