module base() {
    difference() {
        hull() {
            cylinder(h=5, d=12, center=true, $fn=128);
        
            translate([1, 0, 0]*60)
                cylinder(h=5, d=12, center=true, $fn=128);
                
            translate([0, 1, 0]*60)
                cylinder(h=5, d=12, center=true, $fn=128);
        }
        
        // Outer rods
        cylinder(h=6, d=4.3, center=true, $fn=128);

        translate([1, 0, 0]*60)
            cylinder(h=6, d=4.3, center=true, $fn=128);
                
        translate([0, 1, 0]*60)
            cylinder(h=6, d=4.3, center=true, $fn=128);
            
        // Bead rods

        translate([1.5, .6, 0]*25)
            cylinder(h=6, d=4.3, center=true, $fn=128);
            
        translate([.6, 1.5, 0]*25)
            cylinder(h=6, d=4.3, center=true, $fn=128);
    }
}

module support() {
    difference() {
        union() {        
            hull() {
                cylinder(h=5, d=12, center=true, $fn=128);
            
                translate([1, 0, 0]*60)
                    cylinder(h=5, d=12, center=true, $fn=128);
            }
            
            hull() {
                cylinder(h=5, d=12, center=true, $fn=128);
            
                translate([0, 1, 0]*60)
                    cylinder(h=5, d=12, center=true, $fn=128);
            }
        }
        
        // Outer rods
        cylinder(h=6, d=4.3, center=true, $fn=128);

        translate([1, 0, 0]*60)
            cylinder(h=6, d=4.3, center=true, $fn=128);
                
        translate([0, 1, 0]*60)
            cylinder(h=6, d=4.3, center=true, $fn=128);
    }
}

THICKNESS_BEADS=8;

module one() {
    difference() {
        union() {
            cylinder(h=THICKNESS_BEADS/2, d1=15, d2=12, center=true, $fn=256);

            translate([0,0,1]*-THICKNESS_BEADS/2)
            rotate([0,180,0])
                cylinder(h=THICKNESS_BEADS/2, d1=15, d2=12, center=true, $fn=256);
        }
        
        cylinder(h=THICKNESS_BEADS*2, d=5, center=true, $fn=256);
    }        
}

module ten() {
    difference() {
        union() {
            cylinder(h=THICKNESS_BEADS/2, d1=15, d2=12, center=true, $fn=256);

            translate([0,0,1]*-THICKNESS_BEADS/2)
            rotate([0,180,0])
                cylinder(h=THICKNESS_BEADS/2, d1=15, d2=12, center=true, $fn=256);
        }
        
        cylinder(h=THICKNESS_BEADS*2, d=5, center=true, $fn=256);
        

        for(i=[0:30:360]) {
            rotate([0,0,1]*i)
            translate([1,0,0]*15/2)
            cylinder(h=THICKNESS_BEADS+1, d=2.5, center=true, $fn=256);
        }
    }        
}

union() {
    base();

    translate([60,90,0])
    mirror([1,1,0])
        base();

    translate([0,110,0])
        support();
        
    translate([15,125,0])
        support();    
}

%
for(i=[0:20:80]){

    translate([1,1,0]*60 + [0,1,0]*i)    
    ten();
    
    translate([1.3,1,0]*60 + [0,1,0]*i)    
    ten();
}

%
for(i=[0:20:80]){

    translate([1,1,0]*60 + [0,1,0]*i)    
    one();
    
    translate([1.3,1,0]*60 + [0,1,0]*i)    
    one();
}