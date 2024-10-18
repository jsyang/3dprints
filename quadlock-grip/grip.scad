module rod() {
    rotate([0,0,90])
    difference() {
        rotate([90,0,0])
        cylinder(h=20, r=7.22/2,center=true, $fn=64);

        translate([0,0,10-2])
            cube([300,300,10],center=true);
            
        translate([0,0,-10+2])
            cube([300,300,10],center=true);
    }    
}

module railMaleCut() {
    hull() {
        translate([5,0,0])
        cylinder(h=30, d=2, center=true, $fn=64);

        translate([10,0,0])            
        cylinder(h=30, d=2, center=true, $fn=64);
        
        translate([10,-5,0])            
        cylinder(h=30, d=2, center=true, $fn=64);
    }
    
    
    hull() {
        translate([-5,0,0])            
        cylinder(h=30, d=2, center=true, $fn=64);

        translate([-10,0,0])            
        cylinder(h=30, d=2, center=true, $fn=64);
        
        translate([-10,-5,0])            
        cylinder(h=30, d=2, center=true, $fn=64);
    }
    
    translate([0,-15,0])
        cube([30,20,30],center=true);
        
    translate([12.5,-14.5,0])
        cube([10,30,30],center=true);

    translate([-12.5,-14.5,0])
        cube([10,30,30],center=true);
}

module railFemaleCut() {
    hull() {
        translate([8.5,-5,0])
        cylinder(h=30, d=.5, center=true, $fn=64);

        translate([-8.5,-5,0])
        cylinder(h=30, d=.5, center=true, $fn=64);
        
        translate([-3.5,0,0])            
        cylinder(h=30, d=.5, center=true, $fn=64);
        
        translate([-3.5,0,0])
        cylinder(h=30, d=.5, center=true, $fn=64);
        
        translate([3.5,0,0])
        cylinder(h=30, d=.5, center=true, $fn=64);
    }
    
    hull() {
        translate([-3.5,-1,0])
        cylinder(h=30, d=.5, center=true, $fn=64);
        
        translate([3.5,-1,0])
        cylinder(h=30, d=.5, center=true, $fn=64);


        translate([-4,1,0])
        cylinder(h=30, d=.5, center=true, $fn=64);

        translate([4,1,0])
        cylinder(h=30, d=.5, center=true, $fn=64);
    }
    
    hull() {
        translate([-3.8,0,0])
        cylinder(h=30, d=.5, center=true, $fn=64);
        
        translate([3.8,0,0])
        cylinder(h=30, d=.5, center=true, $fn=64);


        translate([-4.5,1,0])
        cylinder(h=30, d=.5, center=true, $fn=64);

        translate([4.5,1,0])
        cylinder(h=30, d=.5, center=true, $fn=64);
    }
}

module halfHandle() {
    difference() {
    
        union() {
        
        hull() {        
            translate([0,1,0]*-10)
            rotate([90,0,0])
                cylinder(h=110, d=20, center=true, $fn=128);
            
            translate([20,-10,0])
            rotate([90,0,0])
                cylinder(h=110, d=20, center=true, $fn=128);
        }
        

        hull() {
            translate([20,45,0])
            sphere(d=20, center=true, $fn=128);
            
            translate([5,30,0])
            cylinder(h=20, d=10, center=true, $fn=128);        
            
            translate([-15,50,5])
            sphere(d=10, center=true, $fn=128);

            translate([-15,50,0])
            sphere(d=10, center=true, $fn=128);
        }
        
        }
        
        
        // Top bevel
        hull() {
            scale([1,1.2,1])
            translate([35,-40,0])
                cylinder(h=80, d=50, center=true, $fn=128);

            translate([0,-50,0])
            scale([1,1.2,1])
            translate([35,-40,0])
                cylinder(h=80, d=50, center=true, $fn=128);
        }
            
        // Finger grooves
        for(i=[0:-20:-60]) {
            translate([-15,26.25+i,0])
            cylinder(h=80, d=25, center=true, $fn=128);        
        }
        
        // Lanyard loop
        translate([20,45,0])
        rotate([0,0,45])
            difference() {
                cylinder(h=30,d=10,center=true, $fn=64);

                translate([-30,-10,-40/2])
                cube([30,30,40]);
            }
        
        // Holes for 20mm rod to hold halves together
        translate([10,30,0])
            cylinder(h=30,r=7.3/2,center=true, $fn=64);    

        translate([10,-10,0])
            cylinder(h=30,r=7.3/2,center=true, $fn=64);    

            
        // Top rail
        translate([0,-59,0])
        railMaleCut();
        
        // Taper for lanyard hole
        translate([25,50,10])
        rotate([0,0,45])
        rotate([12,12,45])
        cube([50,50,10],center=true);
            
        // Chop in half
        translate([-300/2,-300/2,-50])
            cube([300,300,50]);
    }
}

module qlArm() {
    difference() {
        hull() {        
            translate([0,-7,0])
            cube([24,16,20], center=true);

            translate([0,-22,0])            
            cylinder(h=20, d=24, center=true, $fn=128);
            
        }

        railFemaleCut();
        

        translate([0,-22,6])
        hull() {
            cylinder(h=12, d=24, center=true, $fn=128);
            
            translate([3,-10,0])
            cylinder(h=12, d=24, center=true, $fn=128);
            
            translate([-12,0,0])
            cylinder(h=12, d=24, center=true, $fn=128);
        }
        
        // Holes for 20mm rod to hold halves together
        translate([0,-22,0])
            cylinder(h=30,r=7.3/2,center=true, $fn=64);    
    }
    
}

module qlTip() {
    
}


translate([65/2,10,0])
    rod();


translate([65/2,30,0])
    rod();

translate([65/2,50,0])
    rod();    

translate([0,90,0])
    halfHandle();

translate([65,90,0])
    mirror([1,0,0])
    halfHandle();


qlArm();
