module knob() {

    // tab is 
    // 41.5mm away from edge
    
    difference() {
    
        union() {
            translate([7,-6/2, -70])
                cube([6, 6, 60]);

            translate([0,0,1]*-25)
                cylinder(h=120, d=19, center=true, $fn=128);

            hull() {
                translate([0.5,-.1,.8]*-14)            
                translate([0,1.1,0]*-21/2)
                    cube([14,16,12]);
                
                translate([0.5,0,0]*-14)            
                translate([0,2,-1]*-40/2)
                    cube([14,6,6]);
                    
                            
            }
            
            translate([11.5, 0, -65])
                sphere(d=6, $fn=128, center=true);
        }

        translate([1,0,0]*-7)
        translate([-1,-.5,-.5]*500)
            cube([500,500,500]);
        
        
    }
    // 6mm width channel
    // 6mm diameter button
    
    //35mm height tab
    

}

module cableClipHalf() {

    difference() {
        // Body
        hull() {
            cylinder(h=8, d=4.3*2, $fn=128, center=true);
            
            translate([1,0,0]*(6.5 - 4.3))
                cylinder(h=8, d=4.3*2, $fn=128, center=true);
        }
    
        // Hole cable
        hull() {
            cylinder(h=10, d=4.3, $fn=128, center=true);
            
            translate([1,0,0]*(6.5 - 4.3))
                cylinder(h=10, d=4.3, $fn=128, center=true);
        }
        
        // Hole mouth
        translate([2.5,0,-20/2])
            cube([1,1,1]*20);
    }
}

module cableClip() {
    cableClipHalf();
    
    translate([2.1,6.4,0])
    rotate([0,0,180])
        cableClipHalf();
}


rotate([0,-90,0])
    knob();

translate([1,1,0]*50)   
    cableClip();