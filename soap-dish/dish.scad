difference() {
    cube([110,80,20]);

    
    translate([5,5,12])
    hull(){
        cube([120-20,90-20,20]);

        
        translate([1,1,-.5]*5) sphere(r=5);
        translate([(120-20-5)/5,1,-.5]*5) sphere(r=5);

        translate([1,(90-20-5)/5,0]*5) sphere(r=5);
        translate([(120-20-5)/5,(90-20-5)/5,0]*5) sphere(r=5);
    }


    translate([120-40,0,10]/2)
    hull() {
        cube([30,20,1]);

        translate([10,-40,-8])
        cube([10,20,20]);
    }
}