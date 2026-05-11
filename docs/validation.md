# Validation Log

This log records physical and CAD validation results for the Plarail monorail curve.

## Current Status

| Area | Status | Notes |
| --- | --- | --- |
| Connector measurements | Pending | Defaults are placeholders until caliper/scanner data is entered. |
| Rail profile measurements | Pending | The current profile is a printable provisional I-beam style profile. |
| Connector coupon print | Pending | Print before any full curve. |
| Shonan Monorail 5000 vehicle clearance | Pending | Test powered car and trailer in both directions. |
| Mixed original/printed loop closure | Pending | Test with original curve/straight pieces after first full print. |
| Generated STL committed | No | Mesh exports remain ignored until physically validated. |

## Initial CAD Review

| Check | Result | Notes |
| --- | --- | --- |
| Source files split by responsibility | Pass | Dimensions, connectors, curve body, and assembly are separate. |
| Connector module reusable | Pass | `male_connector()` and `female_connector_cutout()` are standalone modules. |
| Alternate connector layouts available | Pass | `curve_connector_layout` supports male/female orientation variants. |
| OpenSCAD render/export | Not run | `openscad` is not installed in this environment. |
| Physical fit proven | Not run | Requires printed coupons and original parts. |

## First Physical Test Template

| Version | Date | Material | Part | Result | Change Needed |
| --- | --- | --- | --- | --- | --- |
| v0 | TODO | PLA | connector coupon | TODO | TODO |
| v0 | TODO | PLA | profile sample | TODO | TODO |
| v0 | TODO | PETG | full curve | TODO | TODO |
