// Parameters
cube_length = 150;
cube_width = 25;
cube_height = 5;
hole_diameter = 7;
num_holes = 10;
hole_spacing = cube_length / (num_holes + 1); // Space between holes to make them equidistant

// Main cube
difference() {
    // Create the base cube
    cube([cube_length, cube_width, cube_height]);
    
    // Create the holes from top to bottom
    for (i = [1 : num_holes]) {
        translate([i * hole_spacing, cube_width / 2, 0]) 
            cylinder(d = hole_diameter, h = cube_height + 1, $fn = 50); // +1 to ensure it cuts through
    }
}
