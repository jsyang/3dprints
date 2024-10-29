$fn=256;

difference() {
    cube([20,10,3]);
    
    translate([3,5,1])
    cylinder(h=6, d=1, center=true);

    translate([6,5,1])
    cylinder(h=6, d=.75, center=true);

    translate([9,5,1])
    cylinder(h=6, d=.5, center=true);

    translate([12,5,1])
    cylinder(h=6, d=.4, center=true);

    translate([15,5,1])
    cylinder(h=6, d=.3, center=true);

    translate([18,5,1])
    cylinder(h=6, d=.2, center=true);
    
}