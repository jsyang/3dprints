module zipTieHoles() {
    translate([0,-10,53.5])
        cube([50,10,4], center=true);            
        
    translate([0,10,53.5])
        cube([50,10,4], center=true);            
}

module cradle() {
    difference() {

        translate([0,0,65])
        rotate([90,0,0])
            cylinder(h=43, d=25, center=true);
    
        translate([0,0,65])
        rotate([90,0,0])
            cylinder(h=44, d=17, center=true);
            
        translate([0,0,65+50/2 -2])
            cube([50,50,50], center=true);
    }
}

module stem() {
    translate([0,0,25+1+15])
        cube([16,43,30],center=true);

    translate([0,0,25+1])
        hull() {
            cube([16,43,2], center=true);
            
            translate([0,0,-25])
                cube([33,33,2], center=true);
        }    

}


module base() {
    hull() {
        cube([33,33,2], center=true);
        
        translate([0,0,-6])
            cube([43,43,2], center=true);
    }
}

difference() {

    union() {
        cradle();
        stem();
        base();
    }
    
    zipTieHoles();
}