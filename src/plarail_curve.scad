include <dimensions.scad>
include <plarail_connector.scad>

// Local coordinate system for the curve:
// The curve starts at angle 0 and sweeps counter-clockwise around the Z axis.
// The rail centerline is at curve_radius from the origin.
// Cross-section width is radial; cross-section height is Z.

part = "curve"; // "curve", "body", "connector_coupon", "profile_sample", "debug"

module _rounded_rect_2d(width, height, radius) {
    safe_radius = min(radius, min(width, height) / 2);

    if (safe_radius <= 0) {
        square([width, height], center = true);
    } else {
        hull() {
            for (x = [-width / 2 + safe_radius, width / 2 - safe_radius])
                for (y = [-height / 2 + safe_radius, height / 2 - safe_radius])
                    translate([x, y])
                        circle(r = safe_radius, $fn = quality_fragments);
        }
    }
}

module rail_profile_2d(
    width = rail_width,
    height = rail_height,
    web_width = rail_web_width,
    flange_height = rail_flange_height,
    corner_radius = rail_corner_radius
) {
    // Provisional reversible I-beam style profile. Replace/tune dimensions from
    // the scanned end face before final printing.
    union() {
        _rounded_rect_2d(web_width, height, corner_radius);
        translate([0, height / 2 - flange_height / 2])
            _rounded_rect_2d(width, flange_height, corner_radius);
        translate([0, -height / 2 + flange_height / 2])
            _rounded_rect_2d(width, flange_height, corner_radius);
    }
}

module straight_profile_sample(length = 30) {
    rotate([90, 0, 90])
        linear_extrude(height = length, center = true, convexity = 6)
            rail_profile_2d();
}

module curved_rail_body(
    angle = curve_angle,
    radius = curve_radius,
    width = rail_width,
    height = rail_height
) {
    rotate_extrude(angle = angle, convexity = 10, $fn = quality_fragments)
        translate([radius, 0])
            rail_profile_2d(width = width, height = height);
}

module _curve_start(direction = "inward") {
    target_angle = direction == "inward" ? 90 : -90;
    translate([curve_radius, 0, 0])
        rotate([0, 0, target_angle])
            children();
}

module _curve_end(direction = "inward", angle = curve_angle) {
    target_angle = direction == "inward" ? angle - 90 : angle + 90;
    translate([curve_radius * cos(angle), curve_radius * sin(angle), 0])
        rotate([0, 0, target_angle])
            children();
}

module _curve_male_connectors(layout = curve_connector_layout) {
    if (layout == "male_start_female_end" || layout == "male_both") {
        _curve_start(direction = "outward")
            male_connector();
    }

    if (layout == "female_start_male_end" || layout == "male_both") {
        _curve_end(direction = "outward")
            male_connector();
    }
}

module _curve_female_cutouts(layout = curve_connector_layout) {
    if (layout == "female_start_male_end" || layout == "female_both") {
        _curve_start(direction = "inward")
            female_connector_cutout();
    }

    if (layout == "male_start_female_end" || layout == "female_both") {
        _curve_end(direction = "inward")
            female_connector_cutout();
    }
}

module _curve_debug_sections() {
    translate([curve_radius, 0, 0])
        color("red")
            straight_profile_sample(length = 8);
    rotate([0, 0, curve_angle])
        translate([curve_radius, 0, 0])
            color("blue")
                straight_profile_sample(length = 8);
}

module plarail_curve_piece(
    layout = curve_connector_layout,
    show_debug_sections = debug_cross_sections
) {
    difference() {
        union() {
            curved_rail_body();
            _curve_male_connectors(layout = layout);
        }

        _curve_female_cutouts(layout = layout);
    }

    if (show_debug_sections) {
        _curve_debug_sections();
    }
}

module curve_body_debug() {
    union() {
        curved_rail_body();
        _curve_debug_sections();
    }
}

if (part == "curve") {
    plarail_curve_piece();
} else if (part == "body") {
    curved_rail_body();
} else if (part == "connector_coupon") {
    connector_coupon();
} else if (part == "profile_sample") {
    straight_profile_sample();
} else if (part == "debug") {
    curve_body_debug();
}
