module prism(l, w, h){
    polyhedron(
        points=[
            [0,0,0], 
            [l,0,0], 
            [l,w,0], 
            [0,w,0], 
            [0,w,h], 
            [l,w,h]
        ],
        faces=[
            [0,1,2,3],
            [5,4,3,2],
            [0,4,5,1],
            [0,3,4],
            [5,2,1]
        ]
   );
}

module tub_bottom_cutout() {
    translate([3,3,0])
    rotate([0,0,180])
    hull() {
        cube([3,3,3]);
            
        rotate([90,0,0]) 
            prism(3,3,3)
            translate([1.5,0,0]);
    }
}

module tub_bottom() {
    linear_extrude(height=4){
        hull() {
            translate([1,1]) circle(r=1,$fn=20);
            translate([1,7]) circle(r=1,$fn=20);
            translate([8,7]) circle(r=1,$fn=20);
            translate([8,1]) circle(r=1,$fn=20);
        }
    }
}

module tub_peg(size=3) {
    difference() {
        translate([0,0,2])
        rotate([0,90,0])
        linear_extrude(height=size) {
            translate([1.5,0.5,0]) circle(r=0.5,$fn=20);
            translate([1.5,0,1]) square(size=[0.5,1]);
        }    
        
        translate([-1,0.5,0.5])
        rotate([0,90,0])
        cylinder(r=0.3,h=5, $fn=20);
    }
}


module tub_top() {
    union(){
        difference() {
            linear_extrude(height=1){
                hull() {
                    translate([1,1]) circle(r=1,$fn=20);
                    translate([0,8]) square(1);
                    translate([8,8]) square(1);
                    translate([8,1]) circle(r=1,$fn=20);
                }
            }
            
            translate([0,0,0.5])
            linear_extrude(height=1){
                hull() {
                    translate([1.5,1.5]) circle(r=1,$fn=20);
                    translate([1.5,6]) circle(r=1,$fn=20);
                    translate([7.5,6]) circle(r=1,$fn=20);
                    translate([7.5,1.5]) circle(r=1,$fn=20);
                }
            }
        }

        translate([0,8,1]) 
            tub_peg(0.95);
        
        translate([4,8,1]) 
            tub_peg(0.95);
        
        
        translate([8,8,1]) 
            tub_peg(0.95);
    }
}


module tub(){    
    union(){
        difference(){
            tub_bottom();
            translate([1,1,1.01]) 
                tub_bottom_cutout();
            translate([5,1,1.01]) 
                tub_bottom_cutout();

        }
        
        translate([1,8,4]) rotate([-90,0,0]) tub_peg();
        translate([5,8,4]) rotate([-90,0,0]) tub_peg();
    }
}


/////////////////////////////

scale([10,10,10]) tub_top();
translate([110,0,0]) scale([10,10,10]) tub();
