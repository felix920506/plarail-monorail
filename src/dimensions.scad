// Shared dimensions for Plarail-compatible track models.
//
// All dimensions are millimeters. Defaults are provisional until replaced by
// caliper/scanner measurements in docs/measurements.md.

eps = 0.01;
preview_fragments = 32;
render_fragments = 96;
quality_fragments = $preview ? preview_fragments : render_fragments;

curve_angle = 45.0;
curve_radius = 216.0;

rail_width = 40.0;
rail_height = 12.0;
rail_web_width = 10.0;
rail_flange_width = 6.0;
rail_flange_height = 2.2;
rail_corner_radius = 0.8;

connector_clearance = 0.25;
connector_male_length = 16.0;
connector_male_width = 13.0;
connector_male_height = 5.2;
connector_male_neck_width = 8.0;
connector_taper_length = 3.0;

connector_socket_depth = 17.0;
connector_socket_width = 13.6;
connector_socket_height = 5.8;
connector_vertical_offset = 0.0;

coupon_body_length = 30.0;
coupon_gap = 12.0;
