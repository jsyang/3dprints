module rod() {
    rotate([0,0,90])
    difference() {
        rotate([90,0,0])
        cylinder(h=65, r=7.22/2,center=true, $fn=64);

        translate([0,0,10-2])
            cube([300,300,10],center=true);
            
        translate([0,0,-10+2])
            cube([300,300,10],center=true);
    }    
}

module plate(){
    difference() {
        hull() {
            cylinder(h=5,r=12/2,center=true, $fn=64);
            
            translate([60,0,0])
                cylinder(h=5,r=12/2,center=true, $fn=64);
                
            translate([0,60,0])
                cylinder(h=5,r=12/2,center=true, $fn=64);
        }

        translate([1,1,0]*58)
            cylinder(h=10,r=96/2,center=true, $fn=64);    
        

        translate([1,1,0]*11)
            cylinder(h=10,r=24/2,center=true, $fn=64);    
        
        translate([60,0,0])
            cylinder(h=10,r=7.25/2,center=true, $fn=64);    
            
        translate([0,60,0])
            cylinder(h=10,r=7.25/2,center=true, $fn=64);    
    }
}

translate([0,-16,0])
    rod();

translate([0,-24,0])
    rod();    
    
translate([-30,0,0])
    plate();
    
translate([30,80,0])
rotate([0,0,180])
    plate();