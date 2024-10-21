module plug() {
    $fn=128;
    H=4-0.24;
    
    union() {
    // Main body
    hull() {
        translate([1,1,0]*3/2)
        cylinder(h=H, d=3);
        
        translate([56.75-3,0,0])
        translate([1,1,0]*3/2)
        cylinder(h=H, d=3);
        
        translate([56.75-3,37.25-3,0])
        translate([1,1,0]*3/2)
        cylinder(h=H, d=3);
        
        translate([0,37.25-3,0])
        translate([1,1,0]*3/2)
        cylinder(h=H, d=3);
    }

    // Side pegs
    translate([56.75,2,0])
    hull() {
        cube([1,2,1]);
        
        translate([0,.2,3-.24])
        cube([1,2.5-.2,1]);
    }
    
    translate([-1,2,0])
    hull() {
        cube([1,2,1]);
        
        translate([0,.2,3-.24])
        cube([1,2.5-.2,1]);
    }
    
    // Top peg
    translate([56.75/2,37.25+2,1.25/2])
    cube([15.25,4,1.25], center=true);


    // Bottom tabs
    translate([3.5,-1,0])
    cube([14.92,1,1.2]);
    
    translate([56.75-3.5-14.92,-1,0])
    cube([14.92,1,1.2]);
    }
}

module fullPlug(){
    
    difference() {
        plug();

        hull() {
        
        translate([56.75*.5, 35.5,2])
        cube([56.75*0.9,1,6],center=true);
        
        translate([56.75*.5, 35,2])
        cube([56.75*0.8,1,6],center=true);
        
        }

        translate([(56.75-20)*.5,42,-1.5])
        rotate([55,0,0])
        cube([20,20,2]);
    }
}

fullPlug();