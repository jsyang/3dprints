use <wheel.scad>;

module crank() {
    hull() {
        translate([0.5,2.5,0])
        cylinder(r1=0.3, r2=0.4,h=0.4,$fn=16);

        translate([0.5,-0.25,0])        
        cylinder(r=0.3,h=0.3,$fn=16);
    }
}

module chainset() {
    difference() {
        hull() {
            cylinder(r=2, h=0.3, $fn=20);
            
            translate([6,0.2,0])
            cylinder(r=1, h=0.3, $fn=20);    
        }
        
        hull() {
            translate([0,0,-0.2])
            cylinder(r=1.7, h=0.6, $fn=20);
            
            translate([6,0.2,-0.2])
            cylinder(r=0.7, h=0.6, $fn=20);    
        }
    }
    
    // right side crank
    translate([-0.5,-(3-0.5),-0.4])    
    crank();
    
    // left side crank
    rotate([0,0,180])
    translate([-0.5,-(3-0.5),2])    
    mirror([0,0,1])
    crank();
}


module handlebar_drop(){
    hull(){
        translate([0,0,-0.3])
        sphere(r=0.2, $fn=20);
        
        translate([-0.3,-0.3,0])
        sphere(r=0.2, $fn=20);
    }
    
    hull(){
        translate([-0.3,-0.3,0])
        sphere(r=0.2, $fn=20);
        
        translate([-0.4,-0.6,0])
        sphere(r=0.2, $fn=20);
    }
    
    hull(){
        translate([-0.4,-0.6,0])
        sphere(r=0.2, $fn=20);
        
        translate([-0.4,-0.9,0])
        sphere(r=0.2, $fn=20);
    }
    
    hull(){
        translate([-0.4,-0.9,0])
        sphere(r=0.2, $fn=20);
        
        translate([0,-1.3,0])
        sphere(r=0.2, $fn=20);
    }
    
    hull(){
        translate([0,-1.3,0])
        sphere(r=0.2, $fn=20);
        
        translate([0.6,-1.3,0])
        sphere(r=0.2, $fn=20);
    }
    
    hull(){
        translate([0.6,-1.3,0])
        sphere(r=0.2, $fn=20);
        
        translate([1.1,-1,0])
        sphere(r=0.2, $fn=20);
    }
}

module handlebars() {
    hull(){
        translate([0,0,1.2])
        sphere(r=0.2, $fn=20);
        
        translate([0,0,-1.2])
        sphere(r=0.2, $fn=20);
    }
    
    translate([0,0,1.5])     
    handlebar_drop();
    
    translate([0,0,-1.5])     
    mirror([0,0,1])
    handlebar_drop();
}

module cockpit() {
    translate([-0.04,0,0])
    rotate([90,0,0])
    cylinder(r=0.20,h=1,$fn=20);

    hull() {
        rotate([90,0,0])
        cylinder(r=0.25,h=0.4,$fn=20);
        
        translate([-1.1,-0.6,-0.3])
        cylinder(r=0.25,h=0.6,$fn=20);
    }

    translate([-1.1,-0.6,0])
    scale([1.25,1.25,1.25])
    handlebars();
}    
    

module seat() {
    union() {
        translate([3.4,1.3,0.2])
        rotate([0,0,90]) 
        import("./moulton-seat.stl", convexity=3); 
        
        hull() {        
            translate([1.8,1.3,0.5])
            sphere(r=0.25, $fn=20);
        
            translate([3.7,2.1,-0.1])
            sphere(r=0.2, $fn=20);
            
            translate([3.7,2.1,1.1])
            sphere(r=0.2, $fn=20);
            
            translate([4.5,2.4,0.2])
            sphere(r=0.2, $fn=20);
            
            translate([4.5,2.4,0.8])
            sphere(r=0.2, $fn=20);
        }
    }
}

module frame() { 
    union() {
        scale([1,1,1])
        translate([3.4,1.3,0.2])
        rotate([0,0,90]) 
        import("./moulton-frame.stl"); 
    
        hull(){
            translate([5.9,-0.55,-0.8])
            cylinder(r=0.45, h=1.6, $fn=20);
            
            translate([6.55,-0.3,-0.3])
            cylinder(r=0.35, h=0.6, $fn=20);
        }
        
        translate([5.9,-0.55,-0.9])
        cylinder(r=1.9, h=0.3, $fn=20);
        
        translate([5.9,-0.55,-0.9])
        chainset();
        
        translate([0,5,0.05])
        cockpit();

    }
    
    translate([2.5,5.3,-0.45])
    seat();
}

module rear_triangle() {
    difference() {
        union(){
            union() {
                translate([8.7,0.225,0.8])
                rotate([-7,9,90]) 
                import("./moulton-rear-triangle-side.stl"); 
                
                translate([8.7,0.225,-0.8])
                rotate([7,-9,90]) 
                import("./moulton-rear-triangle-side.stl", convexity=3); 
                
                translate([6.4,-0.45,-0.9])
                cylinder(r=0.35,h=1.8,$fn=10);
            }
            
            // Suspension plug
            translate([6.1,2.3,0])
            rotate([5,90,0])
            cylinder(r1=0.35,r2=0.5,h=1.2,$fn=16);

            translate([7.9,-0.55,-1])
            rotate([0,0,0])            
            cube([0.4,0.4,2]);
            
            translate([8.4,1.5,-0.5])
            rotate([0,0,-30])            
            cube([0.4,0.3,1]);
            
            translate([11,-0.5,-1.6])
            rotate([0,0,-35])            
            cube([1,0.8,0.6]);
            
            translate([11,-0.5,1])
            rotate([0,0,-35])            
            cube([1,0.8,0.6]);
        }
        
        translate([11.7,-0.5,-2])
        cylinder(r=0.2,h=4,$fn=10);
    }
    
}

module fork_side() {
    union() {
        rotate([0,5,90])
        import("./moulton-fork-side.stl", convexity=3); 
        
        // Align the flange so it's parallel to the hub surface
        translate([-0.3,-3.75,0.10])
            cylinder(h=0.42, r1=0.35, r2=0.35, $fn=12);
    }
}

module fork_front() { 
    difference(){
       union(){
            translate([-0.25,-0.5,-0.75])
            cube([0.5,0.5,1.5]);
           
            translate([0,-0.6,0.6]) 
            fork_side();

            translate([0,-0.6,-0.6])
            mirror([0,0,1])
            fork_side();
        }
        
        translate([-0.3,-4.35,-5]) 
        rotate([0, 0, 0]) 
        cylinder(r=0.2, h=10, $fn=20);
    }
}



// // // // Main // // // //

SCALE_FACTOR = 12;
WORLD_SCALE = [SCALE_FACTOR,SCALE_FACTOR,SCALE_FACTOR];

module rear_fork_and_wheel() {    
    scale(WORLD_SCALE) rear_triangle();
    % translate([140.5, -6.1, -5]) wheel();
}

module front_fork_and_wheel() {
    scale(WORLD_SCALE) fork_front();
    % translate([-3.8, -52, -5]) wheel();
}



front_fork_and_wheel();
union() {
    scale(WORLD_SCALE) frame();
    translate([2, 2, 0]) rear_fork_and_wheel();
}