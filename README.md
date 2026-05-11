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

## Notes

This project models functional compatibility only. Do not add logos, brand marks, or decorative copies from original parts.
