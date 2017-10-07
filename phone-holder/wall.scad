module holder_wall() {
    difference() {
        minkowski() {
 
            cube([20, 12, 5]);
            sphere(r=1, $fn=16);
        }

        translate([1.6,2.5,1])
        cube([17.2, 25, 2.5]);
        
        translate([3.5,4.5,3])
        cube([13, 20, 3]);
    }
}

rotate([90,0,0])
holder_wall();