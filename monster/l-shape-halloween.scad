// L-shaped object with 5mm wall thickness, main circular hole, and screw holes in square pattern
// All dimensions in millimeters

// Wall thickness
thickness = 5;

// First side dimensions
length1 = 70;
width = 55;

// Second side dimensions
length2 = 125;

// Main hole diameter
hole_diameter = 40;

// Screw holes parameters
screw_diameter = 5;
screw_edge_distance = 15; // Distance from edges
screw_square_size = 20;   // Size of the square pattern (distance between holes)

// Calculate the minimum distance from edges for main hole
edge_distance = (min(width, length2) - hole_diameter) / 2;

// Calculate main hole position
hole_center_z = edge_distance + (hole_diameter/2);
hole_center_y = length2 - (edge_distance + (hole_diameter/2));

difference() {
    // Main L shape
    union() {
        // First side (150mm x 100mm)
        cube([length1, thickness, width]);

        // Second side (130mm x 100mm)
        cube([thickness, length2, width]);

        translate([- (thickness + 10), hole_center_y, hole_center_z])
            rotate([0, 90, 0])
            cylinder(h = thickness + 10, d = hole_diameter + 5, $fn=100);
    }

    // Main circular hole in second side
    translate([- (thickness + 10), hole_center_y, hole_center_z])
        rotate([0, 90, 0])
        cylinder(h = thickness + 20, d = hole_diameter, $fn=100);

    // Four screw holes in square pattern near far edge
    for (x = [0:1], z = [0:1]) {
        translate([
            length1 - screw_edge_distance - (x * screw_square_size), // X position (from far edge)
            0,                                                       // Y position
            width/2 - (screw_square_size/2) + (z * screw_square_size) // Z position
        ])
        rotate([90, 0, 0])
        cylinder(h = thickness + 6, d = screw_diameter, center = true, $fn=50);
    }
}
