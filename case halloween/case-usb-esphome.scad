//Boks til liten forsterkerenhet.
//Dimensjoner
walls = 3;

inner_depth = 82;
inner_width = 122;

depth = inner_depth + 2 * walls;
width = inner_width + 2 * walls;

height = 40;
lid = 2;
lid_vents = 0.4; //how many percent of the lid should be vented?
vent_lid_hole_radius = 1.5;
lid_vents_marg = 5;
lid_vents_number = 20;
bottom = 2;

// Parameters for pin dimensions
pin_diameter = 2.5;  // Adjust diameter based on hole size on the ESP32
pin_height = 8;    // Height of the pins to hold the board

esp32_separation = 1;
esp32_power_width = 10;

// Parameters for ventilation grid
slot_width = 2;      // Width of each slot
slot_spacing = 4;   // Space between each slot
slot_margin = 15;    // Margin on each side for the slots
lid_insert = 3;
lid_pressure_plus = 0.3;


//Bottom
translate ([0,0,0]) cube([width, depth,bottom]);

//sides
//left
translate ([0,0,0]) cube([walls,depth,height]);

//right
translate ([width-walls,0,0]){
    cube ([walls,depth,height]);
}

//back
translate([0,depth-walls,0]){
   difference(){
       cube ([width, walls, height]);
	   //put holes to cutout below here...
       //line in
       //translate([width-30,walls-1,10])rotate([90,0,0])cylinder(r=2,h=walls*2,center=true,$fn=90);
       //translate ([width-15,-2,10]) cube ([8.1,walls*2,12.1]);

    //    //RELAY opening
    //    translate([width - walls - 30 - 2, -2, bottom + 9])
    //         cube([30, walls+5, walls*2]);

    //    //cable opening
    //    translate([22, -2, bottom + 25])
    //         cube([25, walls+5, walls*2]);


    }
}
//front
translate([0,0,0]){
    union() {
        //Power Cable for ESP32 usb, supports usb-c

        difference(){
            cube ([width, walls, height]);

            translate([width/2 - esp32_power_width/2, -1, bottom + 9])
                cube([esp32_power_width, walls + 2, walls+2]);


        //audio jack
        //    translate([width-walls-7, walls-1, bottom + 10 + 1.5])
        //         rotate([90,0,0])
        //         cylinder(r=3,h=walls*2,center=true,$fn=90);

        //sim card
            translate([width-walls-17-15, -1, bottom + 9])
                    cube([15, walls+2, 8]);

        //switch
        //    translate([walls+15, walls-1, bottom + 10 + 1.5])
        //         rotate([90,0,0])
        //         cylinder(r=15.5/2,h=walls*2,center=true,$fn=90);

        }
    }

}



// Lid with grid pattern
rotate([180, 0, 0]) {
    translate([0, -180, -lid]) {
        difference() {
            union() {
                // Outer part of the lid
                translate([0, 0, 0]) cube([width, depth, lid]);

                // Inner part to hollow out the lid
                translate([walls - lid_pressure_plus / 2, walls - lid_pressure_plus / 2, -lid_insert])
                    cube([
                        width - 2 * walls + lid_pressure_plus,
                        depth - 2 * walls + lid_pressure_plus,
                        lid_insert]);

            }

            translate([slot_margin, slot_margin, -lid_insert-1])
                cube([width - 2 * slot_margin, depth - 2 * slot_margin, lid_insert]);

            // translate([slot_margin, slot_margin, +lid-lid_insert-5])
            //     cube([width - 2 * slot_margin, depth - 2 * slot_margin, lid_insert]);

            // Horizontal slots for ventilation with margins on all sides
            for (y = [slot_margin + slot_spacing : slot_spacing : depth - slot_margin - slot_spacing]) {
                translate([slot_margin, y, +lid-lid_insert-5])
                    cube([width - 2 * slot_margin, slot_width, lid + lid_insert + 5]);
            }

        }
    }
}



// Creating pins for mounting ESP32
// translate([
//         walls + esp32_separation + pin_diameter / 2,
//         depth - walls - esp32_separation - pin_diameter / 2,
//         bottomspace + bottom
//     ])
//     cylinder(d = pin_diameter, h = pin_height);

// translate([
//         walls + esp32_separation + pin_diameter / 2 + 25,
//         depth - walls - esp32_separation - pin_diameter / 2,
//         bottomspace + bottom
//     ])
//     cylinder(d = pin_diameter, h = pin_height);

// translate([
//         walls + esp32_separation + pin_diameter / 2,
//         depth - walls - esp32_separation - pin_diameter / 2 - 50,
//         bottomspace + bottom
//     ])
//     cylinder(d = pin_diameter, h = pin_height);

// translate([
//         walls + esp32_separation + pin_diameter / 2 + 25,
//         depth - walls - esp32_separation - pin_diameter / 2 - 50,
//         bottomspace + bottom
//     ])
//     cylinder(d = pin_diameter, h = pin_height);


//Pins for Relay
// translate([
//         width - walls - esp32_separation - pin_diameter / 2,
//         depth - walls - esp32_separation - pin_diameter / 2,
//         bottomspace + bottom
//     ])
//     cylinder(d = pin_diameter, h = pin_height);
// translate([
//         width - walls - esp32_separation - pin_diameter / 2 - 33,
//         depth - walls - esp32_separation - pin_diameter / 2,
//         bottomspace + bottom
//     ])
//     cylinder(d = pin_diameter, h = pin_height);

// translate([
//         width - walls - esp32_separation - pin_diameter / 2,
//         depth - walls - esp32_separation - pin_diameter / 2 - 45,
//         bottomspace + bottom
//     ])
//     cylinder(d = pin_diameter, h = pin_height);

// translate([
//         width - walls - esp32_separation - pin_diameter / 2 - 33,
//         depth - walls - esp32_separation - pin_diameter / 2 - 45,
//         bottomspace + bottom
//     ])
//     cylinder(d = pin_diameter, h = pin_height);
