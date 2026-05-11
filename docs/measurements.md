# Measurements

This file is the source of truth for physical dimensions used by the CAD model.

All dimensions are millimeters. Values marked `TODO` must be measured from the original Shonan Monorail 5000 set or another compatible Plarail rail before final printing. Values marked `default` are modeling defaults used to keep the OpenSCAD files renderable before real measurements are entered.

## Reference Parts

| Part | Purpose | Status |
| --- | --- | --- |
| Shonan Monorail 5000 curve rail | Primary curve geometry and hanging vehicle clearance | TODO |
| Shonan Monorail 5000 straight rail | Connector and rail cross-section check | TODO |
| Standard Plarail rail | Shared connector comparison | TODO |
| Straddle monorail rail | Optional compatibility confirmation | TODO |

## Curve Geometry

| Dimension | Value | Status | Notes |
| --- | ---: | --- | --- |
| Curve angle | 45.0 | default | Eight pieces form a nominal full circle. |
| Centerline radius | 216.0 | default | Standard Plarail-style curve approximation; verify against scanned/chord data. |
| Centerline arc length | 169.65 | derived | `radius * angle_rad`; updates when radius changes. |
| Chord length | 165.31 | derived | `2 * radius * sin(angle / 2)`. |
| End face tangent angle | 45.0 | default | Should match the physical curve segment. |

## Rail Cross-Section

Measure the normal play orientation first, then note any monorail-specific vertical-use clearance differences.

| Dimension | Value | Status | Notes |
| --- | ---: | --- | --- |
| Overall rail width | 40.0 | default | Used for renderable placeholder profile. |
| Overall rail height | 12.0 | default | Used for renderable placeholder profile. |
| Central web width | 10.0 | default | Verify against hanging drive/guide wheels. |
| Upper running flange width | 6.0 | default | One side, measured from outer edge inward. |
| Lower running flange width | 6.0 | default | One side, if reversible/profile is symmetric. |
| Corner radius/chamfer | 0.8 | default | Keep printable and child-safe. |

## Connector Geometry

The connector module intentionally stays separate from the curve body so these values can be tuned independently.

| Dimension | Value | Status | Notes |
| --- | ---: | --- | --- |
| Male plug length | 16.0 | default | Measure from end face to plug tip. |
| Male plug width | 13.0 | default | Maximum width before tolerance offset. |
| Male plug height | 5.2 | default | Maximum height before tolerance offset. |
| Male plug neck width | 8.0 | default | Narrow waist where applicable. |
| Male plug taper length | 3.0 | default | Lead-in for easier insertion. |
| Female socket depth | 17.0 | default | Should exceed male plug length slightly. |
| Female socket width | 13.6 | default | Includes clearance. |
| Female socket height | 5.8 | default | Includes clearance. |
| Connector vertical offset | 0.0 | default | Relative to rail-body centerline. |
| Connector clearance | 0.25 | default | Tune per printer/material. |

## Scanner Workflow

1. Scan the connector ends and rail end face at 600 DPI or higher.
2. Include a metal ruler or calibration grid in the same scan plane.
3. Disable automatic perspective correction or document any software scaling.
4. Extract top-down outlines for connector shape only; confirm all critical values with calipers.
5. Record scanner scale error here before updating `src/dimensions.scad`.

| Scan | DPI | Calibration Length | Measured Pixels | Scale Error | Notes |
| --- | ---: | ---: | ---: | ---: | --- |
| Male connector top | TODO | TODO | TODO | TODO | TODO |
| Female connector top | TODO | TODO | TODO | TODO | TODO |
| Curve chord | TODO | TODO | TODO | TODO | TODO |

## Fit Tuning Log

| Version | Material | Clearance | Result | Next Change |
| --- | --- | ---: | --- | --- |
| v0 | TODO | 0.25 | TODO | TODO |
