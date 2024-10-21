module holder1() {
    difference() {
        cube([25, 8,10],center=true);

        translate([0,0,6.5])
        rotate([90,0,0])
        cylinder(h=3.35, d=20, center=true, $fn=128);
        
    }
}

module array4x10() {
    for(i=[0:1:4]) {
        for(j=[0:1:10]) {
            translate([i*25,j*8,0])
            holder1();
        }
    }
}

array4x10();

//holder1();