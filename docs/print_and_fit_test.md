# Print And Fit-Test Procedure

Use this procedure before printing a full curve. The model is parametric, but the default dimensions are provisional until measured against physical Plarail parts.

## Export Commands

Run these from the repository root after installing OpenSCAD.

```sh
openscad -o exports/connector_coupon.stl -D 'part="connector_coupon"' src/plarail_curve.scad
openscad -o exports/quick_connector_coupon.stl -D 'part="quick_connector_coupon"' src/plarail_curve.scad
openscad -o exports/profile_sample.stl -D 'part="profile_sample"' src/plarail_curve.scad
openscad -o exports/plarail_curve.stl -D 'part="curve"' src/plarail_curve.scad
```

To export individual quick connector coupons:

```sh
openscad -o exports/quick_male_connector_coupon.stl \
  -D 'part="quick_connector_coupon"' \
  -D 'quick_connector_kind="male"' \
  src/plarail_curve.scad

openscad -o exports/quick_female_connector_coupon.stl \
  -D 'part="quick_connector_coupon"' \
  -D 'quick_connector_kind="female"' \
  src/plarail_curve.scad
```

To test alternate connector layouts:

```sh
openscad -o exports/plarail_curve_female_start.stl \
  -D 'part="curve"' \
  -D 'curve_connector_layout="female_start_male_end"' \
  src/plarail_curve.scad
```

## Recommended Print Order

1. Print `quick_connector_coupon.stl` in PLA for the fastest first fit check.
2. Adjust `connector_clearance` in `src/dimensions.scad` until the male connector inserts without excessive force and the female socket does not wobble.
3. Print `connector_coupon.stl` if the quick coupon passes and you want a larger handling/retention sample.
4. Print `profile_sample.stl` and verify the Shonan Monorail 5000 vehicle clears the rail profile when used in the intended orientation.
5. Print one full curve in PETG after connector and profile checks pass.
6. Print additional curves only after the first full curve closes cleanly with original parts.

## Default Slicer Settings

| Setting | Value |
| --- | --- |
| Material | PETG for final parts, PLA for coupons |
| Layer height | 0.20 mm |
| Perimeters/walls | 4 |
| Top/bottom layers | 5 |
| Infill | 20-30% gyroid or grid |
| Supports | Avoid if possible |
| Brim | Recommended for full curve |

## Fit Checks

| Check | Pass Criteria |
| --- | --- |
| Connector insertion | Fully seats by hand without white stress marks or cracking. |
| Connector retention | Does not fall apart under light layout handling. |
| Mixed original/printed curve | End faces meet without forcing the loop out of plane. |
| Shonan vehicle clearance | Powered car and trailer pass without scraping, binding, or derailing. |
| Pylon clearance | Original Shonan pylons/holders do not interfere with the printed curve profile. |

## Tuning Notes

- If insertion is too tight, increase `connector_clearance` by 0.10 mm.
- If the connection wobbles, reduce `connector_clearance` by 0.05 mm.
- If the vehicle binds in the curve, verify curve radius and rail profile against physical measurements before changing clearance.
- If the loop does not close with 8 curves, prioritize corrected radius/chord measurements over connector tweaks.
