// Main variables
width = 50;          // X axis
length = 75;        // Y axis
base_height = 5;     // Z axis for the base rectangle

inner_radius = 20;
wall_thickness = 3;  // Thickness of the semicylinder wall
outer_radius = inner_radius + wall_thickness;   // 40mm diameter / 2

hole_diameter = 33;
edge_distance = 10;

hole_center_x = width / 2;
hole_center_y = length - (edge_distance + (hole_diameter/2));
hole_center_z = wall_thickness ;

screw_dist_edge = 10;
screw_d = 5;
difference() {
    union() {
        // Main rectangle
        cube([width, length, base_height]);
        
        // Outer semicylinder
        translate([0, 0, outer_radius])  // Position at middle of length
            rotate([0, 90, 0])                // Rotate to align with X axis
            difference() {
                cylinder(h=width, r=outer_radius, $fn=100);  // Full cylinder
                // Cut cylinder in half
                translate([-outer_radius, -outer_radius, -1])
                    cube([outer_radius, outer_radius * 2, width + 2]);
            }
    }
    
    // Hollow out the inside of the semicylinder
    
    translate([0, 0, outer_radius])  // Position at middle of length
        rotate([0, 90, 0])                // Rotate to align with X axis
        difference() {
            cylinder(h=width + 2, r=inner_radius, $fn=100);  // Full cylinder
            // Cut cylinder in half
            translate([-inner_radius, -inner_radius, -1])
                cube([inner_radius, inner_radius, width + 4]);
        }
       
    translate([hole_center_x, hole_center_y, hole_center_z])
        cylinder(h = base_height + 2, d = hole_diameter, center = true, $fn=100); 

    // screw 1
    translate([screw_dist_edge, 0, hole_center_z])
        cylinder(h = base_height + 2, d = screw_d, center = true, $fn=100); 
    //screw 2
    translate([width / 2, 0, hole_center_z])
        cylinder(h = base_height + 2, d = screw_d, center = true, $fn=100); 

    //screw 3
    translate([width - screw_dist_edge, 0, hole_center_z])
        cylinder(h = base_height + 2, d = screw_d, center = true, $fn=100); 
        
}