# Plarail Monorail Track CAD

Parametric OpenSCAD models for Plarail-compatible monorail track parts.

The first target is a curve track piece compatible with Plarail monorail use, using the shared Plarail-style rail connector and rail profile. The Shonan Monorail 5000 set is the primary physical reference for fit checks.

## Project Layout

- `src/` contains OpenSCAD source modules.
- `docs/` contains measurement notes, print settings, and fit-test results.
- `build/` is for local OpenSCAD intermediate output.
- `exports/` is for generated STL/3MF files.

Generated mesh files are ignored by default. Commit exported meshes only after physical validation.

## Workflow

1. Measure original parts and record dimensions in `docs/measurements.md`.
2. Tune connector coupons before printing a full curve.
3. Render or export the assembled curve from `src/plarail_curve.scad`.
4. Record fit-test results before committing any generated STL.

## OpenSCAD Outputs

`src/plarail_curve.scad` supports these `part` values:

- `curve`: full curve with the configured connector layout.
- `body`: curve body without connector subtraction/union.
- `connector_coupon`: male and female connector test coupons.
- `quick_connector_coupon`: very short male and female connector test coupons.
- `profile_sample`: short straight rail-profile sample.
- `debug`: curve body with colored end-section markers.

See `docs/print_and_fit_test.md` for export commands and fit-test order.

## Notes

This project models functional compatibility only. Do not add logos, brand marks, or decorative copies from original parts.
