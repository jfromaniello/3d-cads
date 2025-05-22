// Tapa cuadrada de 88x88x2mm con agujeros avellanados
difference() {
    // Base de la tapa
    cube([88, 88, 2]);

    // Agujeros avellanados para tornillos
    // Esquina superior izquierda
    translate([10, 10, 0]) {
        // Parte cónica para la cabeza del tornillo (ahora 1.5x más grande)
        cylinder(d1=7.5, d2=2, h=1.2, $fn=30);
        // Agujero pasante para el cuerpo del tornillo
        translate([0, 0, -1])
            cylinder(d=2, h=3, $fn=30);
    }

    // Esquina superior derecha
    translate([78, 10, 0]) {
        cylinder(d1=7.5, d2=2, h=1.2, $fn=30);
        translate([0, 0, -1])
            cylinder(d=2, h=3, $fn=30);
    }

    // Esquina inferior izquierda
    translate([10, 78, 0]) {
        cylinder(d1=7.5, d2=2, h=1.2, $fn=30);
        translate([0, 0, -1])
            cylinder(d=2, h=3, $fn=30);
    }

    // Esquina inferior derecha
    translate([78, 78, 0]) {
        cylinder(d1=7.5, d2=2, h=1.2, $fn=30);
        translate([0, 0, -1])
            cylinder(d=2, h=3, $fn=30);
    }
}
