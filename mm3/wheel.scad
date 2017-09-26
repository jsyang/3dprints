module wheel_body(diameter=20,width=4,hub_diameter=6) {
    difference() {   
        union(){
                
            difference(){ 
                cylinder(width,diameter,diameter);
                dz = width * 0.75;
                translate([0,0,dz]) 
                    cylinder(width,diameter-4,diameter-4);
                translate([0,0,-dz])  
                    cylinder(width,diameter-4,diameter-4);
            }
            
            cylinder(width,hub_diameter,hub_diameter);
           
        }
        translate([0,0,-50]) cylinder(100,hub_diameter-4,hub_diameter-4, $fn=20);
    }
}

module peg(){
    translate([0,-34,5]) 
    rotate([90,0,0]) 
    cylinder(6,2,2,$fn=20);
}

module wheel(){
    wheel_body(40,10,8);    
}

wheel();
