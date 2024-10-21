module body() {
    difference() {
        cube([59+3+3,50,6]);
        
        H=8;
        $fn=128;
        
        translate([(59+3+3-57)*.5,2,0])
        hull() {
            translate([1,1,0]*3.5/2)
            cylinder(h=H, d=3.75);

            translate([0,37.25-3,-1])
            translate([1,1,0]*3.5/2)
            cylinder(h=H, d=3.75);
            
            translate([56.75-3,37.25-3,-1])
            translate([1,1,0]*3.5/2)
            cylinder(h=H, d=3.75);
            
            translate([56.75-3,0,-1])
            translate([1,1,0]*3.5/2)
            cylinder(h=H, d=3.75);
        }

        // Top dip
        translate([(59+3+3)*.5,(37.25+3.8),3])
        cube([16,4,8], center=true);
        
        // Top tab bottom OUT
        translate([(59+3+3)*.5,(37.25+3.8+2.5),4.5])
        cube([16,2.6,5], center=true);
        
        // Top slope
        translate([(59+3+3)*.5,(37.25+3.8+4),-1.5])
        rotate([-25,0,0])
        cube([16,8,3], center=true);
        
        // Small side holes
        translate([(59+3+3-57)*.5,0,0])
        union() {
            translate([-1.45,2+2,-2.5])
            cube([1.6,4,6]);
            

            translate([.45+56.75,2+2,-2.5])
            cube([1.6,4,6]);
        }
        
        // Large side holes
        translate([(59+3+3-57)*.5,0,0])
        union() {
            translate([-1.45,8+14,-2.5])
            cube([1.6,7.5,6]);
            

            translate([.45+56.75,8+14,-2.5])
            cube([1.6,7.5,6]);
        }
        
        // Bottom tab holes        
        translate([(59+3+3-57)*.5,0,0])
        union() {
            translate([3,-1,2])
            cube([16,4,5]);
            translate([56.75-3-16,-1,2])
            cube([16,4,5]);
            
        }
    }
}

// sheet is 200mm x 310mm

for(i=[0:1:1]){
for(j=[0:1:2]){
    translate([65*i,50*j,0])
    body();
}
}
