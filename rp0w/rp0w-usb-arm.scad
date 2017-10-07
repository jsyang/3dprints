// use <ball-joint.scad>;
// This one from https://www.thingiverse.com/thing:1968
// did not work. Probably shouldn't have used it, as the
// author never even attempted to print it.

use <ball-joint-2.scad>;

module arm_body() {
    union(){        
        difference() {
            joint();
            
            translate([-10,6,-5])
            cube([20,5,20]);
            
            translate([-10,-5-6,-5])
            cube([20,5,20]);
        }
         
        translate([0,0,7])
            cylinder(r=5,h=20,$fn=24);
        
        translate([0,0,34])
            ball();
    }
}

rotate([90,0,0])
hollow()
arm_body();