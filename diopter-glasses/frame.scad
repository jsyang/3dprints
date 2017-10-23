module frame_half() {
    difference() {
        linear_extrude(height=4){
            union() {    
                hull(){
                    translate([38, 32.5,0])
                        circle(d=7.5, $fn=16);

                    translate([7, 32.5,0])
                        circle(d=7.5, $fn=16);

                    translate([3.75, 30,0])
                        circle(d=7.5, $fn=16);

                    translate([2.5, 20,0])
                        circle(d=5, $fn=16);
                    
                    translate([5, 5,0])
                        circle(d=3, $fn=16);
                    
                    translate([9, 6, 0])
                        circle(d=10, $fn=24);
                    
                    translate([30, 5,0])
                        circle(d=10, $fn=16);

                    translate([40, 6,0])
                        circle(d=7.5, $fn=16);

                    translate([50, 15,0])
                        circle(d=7.5, $fn=16);
                    
                    translate([55, 25,0])
                        circle(d=7.5, $fn=16);

                    translate([55, 30,0])
                        circle(d=7.5, $fn=16);
                }
            
                
                translate([55,27,0])
                square([15,5]);
            }
        }

        translate([10,15,0.8])
        cube([30,25,2.4]);

        translate([10,15,-0.5])
        cube([30,3,5]);
        
        translate([10,15,1])
        cube([30,30,5]);
    }
}

module hinge() {

    translate([2.5,0,0])
    union() {
        translate([0,0,2])
        cylinder(h=1,d=2,$fn=10);

        translate([0,0,1])
        cylinder(h=1,d=5,$fn=16);

        translate([-2.5,-2.5,1])
        cube([2.5,5,1]);

        translate([0,0,0])
        cylinder(h=1,d=2,$fn=10);
    }
    
}

module frame_full() {
    frame_half();
    translate([2.5,30,4])
    rotate([90,-90,0])
        hinge();
}    

module body() {
    frame_full();

    translate([130,0,0])
    mirror([-1,0,0])
    frame_full();
}

module wing() {
}

module blind(){
    cube([30-0.4,25,1]);
}

body();

translate([90,-30,0])
blind();

translate([10,-30,0])
blind();