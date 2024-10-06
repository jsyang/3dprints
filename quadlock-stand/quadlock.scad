module snapRings() {
    H=35.8;
    rotate([0,90,45])
    cylinder(h=H, r=1.2/2, center=true, $fn=64);

    rotate([0,90,-45])
    cylinder(h=H, r=1.2/2, center=true, $fn=64);    
}

module holes() {
        R = 36/2;
        ratio=1.73;

        translate([1,0,0]*R*ratio)
        cylinder(h=2, r=R, $fn=128, center=true);
        
        translate([0,1,0]*R*ratio)
        cylinder(h=2, r=R, $fn=128, center=true);
        
        
        translate([-1,0,0]*R*ratio)
        cylinder(h=2, r=R, $fn=128, center=true);
        
        translate([0,-1,0]*R*ratio)
        cylinder(h=2, r=R, $fn=128, center=true);
}

module interface() {
    union() {
        difference() {
            cylinder(h=1.6, r=36/2, $fn=128, center=true);        
            holes();
        }
    
        translate([0,0,1]*.5)
        snapRings();
        
        difference() {
        
            translate([0,0,6])
                cylinder(h=12, r2=16/2,r1=24/2,center=true, $fn=64);

            translate([0,0,1]*6)
            rotate([90,0,45])
            cylinder(h=30, r=7.25/2,center=true, $fn=64);            
        }
    }
}

rotate([0,0,45])
    interface();