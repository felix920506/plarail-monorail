include <dimensions.scad>

// Local coordinate system:
// X: connector insertion direction, with x=0 at the rail end face.
// Y: track width.
// Z: track height.

connector_demo = false;

module _capsule_2d(length, width) {
    radius = width / 2;
    hull() {
        translate([radius, 0]) circle(r = radius, $fn = quality_fragments);
        translate([max(radius, length - radius), 0]) circle(r = radius, $fn = quality_fragments);
    }
}

module _connector_plan_2d(length, width, neck_width, taper_length) {
    neck_length = max(length * 0.42, taper_length + 1);
    head_start = max(neck_length - width * 0.35, 0);
    head_length = max(length - head_start, width);

    union() {
        translate([neck_length / 2, 0])
            square([neck_length, neck_width], center = true);
        translate([head_start, 0])
            _capsule_2d(head_length, width);
    }
}

module _connector_prism(length, width, height, neck_width, taper_length) {
    linear_extrude(height = height, center = true, convexity = 6)
        _connector_plan_2d(length, width, neck_width, taper_length);
}

module male_connector(
    clearance = connector_clearance,
    length = connector_male_length,
    width = connector_male_width,
    height = connector_male_height,
    neck_width = connector_male_neck_width,
    taper_length = connector_taper_length
) {
    fit_width = max(width - 2 * clearance, 0.1);
    fit_height = max(height - 2 * clearance, 0.1);
    fit_neck_width = max(neck_width - 2 * clearance, 0.1);

    translate([0, 0, connector_vertical_offset])
        _connector_prism(length, fit_width, fit_height, fit_neck_width, taper_length);
}

module female_connector_cutout(
    clearance = connector_clearance,
    depth = connector_socket_depth,
    width = connector_socket_width,
    height = connector_socket_height,
    neck_width = connector_male_neck_width,
    taper_length = connector_taper_length
) {
    cut_width = width + 2 * clearance;
    cut_height = height + 2 * clearance;
    cut_neck_width = neck_width + 2 * clearance;

    translate([-eps, 0, connector_vertical_offset])
        _connector_prism(depth + 2 * eps, cut_width, cut_height, cut_neck_width, taper_length);
}

module male_connector_coupon(body_length = coupon_body_length) {
    union() {
        translate([-body_length, -rail_width / 2, -rail_height / 2])
            cube([body_length, rail_width, rail_height]);
        male_connector();
    }
}

module female_connector_coupon(body_length = coupon_body_length) {
    difference() {
        translate([0, -rail_width / 2, -rail_height / 2])
            cube([body_length, rail_width, rail_height]);
        female_connector_cutout();
    }
}

module connector_coupon(kind = "pair") {
    if (kind == "male") {
        male_connector_coupon();
    } else if (kind == "female") {
        female_connector_coupon();
    } else {
        translate([0, -(rail_width + coupon_gap) / 2, 0])
            male_connector_coupon();
        translate([0, (rail_width + coupon_gap) / 2, 0])
            female_connector_coupon();
    }
}

module quick_male_connector_coupon() {
    male_connector_coupon(body_length = quick_coupon_male_body_length);
}

module quick_female_connector_coupon() {
    quick_body_length = connector_socket_depth + quick_coupon_female_body_extra;
    female_connector_coupon(body_length = quick_body_length);
}

module quick_connector_coupon(kind = quick_connector_kind) {
    if (kind == "male") {
        quick_male_connector_coupon();
    } else if (kind == "female") {
        quick_female_connector_coupon();
    } else {
        translate([0, -(rail_width + coupon_gap) / 2, 0])
            quick_male_connector_coupon();
        translate([0, (rail_width + coupon_gap) / 2, 0])
            quick_female_connector_coupon();
    }
}

if (connector_demo) {
    connector_coupon();
}
