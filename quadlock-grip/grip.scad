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
    DD=.55;

    hull() {
        translate([8.5,-5,0])
        cylinder(h=30, d=DD, center=true, $fn=64);

        translate([-8.5,-5,0])
        cylinder(h=30, d=DD, center=true, $fn=64);
        
        translate([-3.5,0,0])            
        cylinder(h=30, d=DD, center=true, $fn=64);
        
        translate([-3.5,0,0])
        cylinder(h=30, d=DD, center=true, $fn=64);
        
        translate([3.5,0,0])
        cylinder(h=30, d=DD, center=true, $fn=64);
    }
    
    hull() {
        translate([-3.5,-1,0])
        cylinder(h=30, d=DD, center=true, $fn=64);
        
        translate([3.5,-1,0])
        cylinder(h=30, d=DD, center=true, $fn=64);


        translate([-4,1,0])
        cylinder(h=30, d=DD, center=true, $fn=64);

        translate([4,1,0])
        cylinder(h=30, d=DD, center=true, $fn=64);
    }
    
    hull() {
        translate([-3.8,0,0])
        cylinder(h=30, d=DD, center=true, $fn=64);
        
        translate([3.8,0,0])
        cylinder(h=30, d=DD, center=true, $fn=64);


        translate([-4.5,1,0])
        cylinder(h=30, d=DD, center=true, $fn=64);

        translate([4.5,1,0])
        cylinder(h=30, d=DD, center=true, $fn=64);
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

module triggerRail() {
    rotate([0,0,90])
    difference() {
        cube([20,10,20],center=true);
        railMaleCut();
    }
    
}

module qlArm() {
    difference() {
        union() {
            hull() {        
                translate([0,-7,0])
                cube([24,16,20], center=true);

                translate([0,-32,0])            
                cylinder(h=20, d=24, center=true, $fn=128);
                
            }

            translate([13,-13,0])
            triggerRail();
        }

        railFemaleCut();
        

        translate([0,-32,6])
        hull() {
            cylinder(h=12, d=24, center=true, $fn=128);
            
            translate([3,-10,0])
            cylinder(h=12, d=24, center=true, $fn=128);
            
            translate([-12,10,0])
            cylinder(h=12, d=24, center=true, $fn=128);
        }
        
        // Holes for 20mm rod to hold halves together
        translate([0,-32,0])
            cylinder(h=30,r=7.3/2,center=true, $fn=64);    
    }
    
}

module triggerHousing() {
    $fn=128;
    difference() {
    union() {
        // POWER sw bump
        hull() {
            translate([-3.5,-(38-5)+7,-32+5-2]*.5)
            rotate([0,90,0])
            cylinder(h=11.5, d=3, center=true);

            translate([-3.5,-(38-5)+21-4-5,-32+5-2-6]*.5)
            rotate([0,90,0])
            cylinder(h=11.5, d=3, center=true);
            
            translate([-3.5,-(38-5)+21+7+7,-32+5-2]*.5)
            rotate([0,90,0])
            cylinder(h=11.5, d=3, center=true);
            
            translate([-3.5,-(38-5)+21+7+7-4,-32+5-2-6]*.5)
            rotate([0,90,0])
            cylinder(h=11.5, d=3, center=true);
        }
    
    difference() {
        hull() {
            cube([15, 38, 32], center=true);
            
            translate([-12.5,0,0])
            cube([10, 15,20], center=true);
        }
        
        translate([-17,0,0])
        rotate([0,0,90])
        railFemaleCut();
        
        // DE-Lid
        translate([8,0,0])
        cube([8, 35*2, 30*2],center=true);
        
        // Center hollow
        translate([2,0,0])
        cube([12, 27.6, 26.25],center=true);
        
        // TEMP: rail cut out
        if(0) {
        translate([-(40+15)/2,0,0])
        cube([40,40,40],center=true);
        }
        
        // M3 screw holes
        translate([0,-(38-5),32-5]*.5)
        rotate([0,90,0])
        cylinder(h=12, d=3, center=true);
        
        // M3
        translate([0,-(38-5),-(32-5)]*.5)
        rotate([0,90,0])
        cylinder(h=12, d=3, center=true);
        
        // M3
        translate([0,(38-5),0]*.5)
        rotate([0,90,0])
        cylinder(h=12, d=3, center=true);
        
        // Ditch to USB-C
        hull() {
            translate([-2,-38/2+9-1,32/2-1])
            rotate([0,90,0])
            cylinder(h=15, d=2, center=true);

            translate([-2,-38/2+9-5-1,32/2-1+5])
            rotate([0,90,0])
            cylinder(h=15, d=2, center=true);
            
            translate([-2,-38/2+9+9-1+1,32/2-1])
            rotate([0,90,0])
            cylinder(h=15, d=2, center=true);
            
            translate([-2,-38/2+9+9+5-1+1,32/2-1+5])
            rotate([0,90,0])
            cylinder(h=15, d=2, center=true);
        }
        
        // USB-C port
        translate([1,-38/2+13.5-0.5,10])
        cube([4,10.5,10],center=true);
        
    }
    
    
        translate([-(8-4.5)/2 -2,-(27.6-10.75)/2,-(15-3.75)/2])
        cube([4.5, 10.75, 15],center=true);
    

        translate([-(8-4.5)/2 -2,(27.6-5.5)/2,0])
        cube([4.5, 5.5, 30],center=true);
    }
    
    // Cut out for sliding POWER sw
    translate([0,-7+1.5,-(35-1.5-3)/2])
    cube([8,14,1.5],center=true);
    

    translate([5,-7+1.5,-(35-1.5-6)/2])
    cube([8,11,1.5],center=true);

    
    // POWER sw hole
    translate([2.5,-(38-7.5)/2 + 9.5,-(30+7)/2])
    cube([5,7.5,5],center=true);
    
    }
}

module tabPivotTrigger() {
    difference() {
    hull() {
        translate([1,0,5])
        cylinder(h=5, d=8, center=true);

        translate([-4,0,5])
        cube([2,8,5],center=true);
    }
        translate([1,0,5])
        cylinder(h=6, d=3.3, center=true);
    }
}

module triggerHousingLid() {
    $fn=128;
    
    difference() {
        union() {
            cube([4, 38, 32], center=true);
            
            translate([5,-10,.5])
            tabPivotTrigger();

            mirror([0,0,1])
            translate([5,-10,.5])
            tabPivotTrigger();
            
            // POWER sw bump
            hull() {
                translate([-0,-(38-5)+7,-32+5-2]*.5)
                rotate([0,90,0])
                cylinder(h=4, d=3, center=true);

                translate([-0,-(38-5)+21-4-5,-32+5-2-6]*.5)
                rotate([0,90,0])
                cylinder(h=4, d=3, center=true);
                
                translate([-0,-(38-5)+21+7+7,-32+5-2]*.5)
                rotate([0,90,0])
                cylinder(h=4, d=3, center=true);
                
                translate([-0,-(38-5)+21+7+7-4,-32+5-2-6]*.5)
                rotate([0,90,0])
                cylinder(h=4, d=3, center=true);
            }
        }
        
        // M3 screw holes
        translate([0,-(38-5),32-5]*.5)
        rotate([0,90,0])
        cylinder(h=12, d=3, center=true);
        
        // M3
        translate([0,-(38-5),-(32-5)]*.5)
        rotate([0,90,0])
        cylinder(h=12, d=3, center=true);
        
        // M3
        translate([0,(38-5),0]*.5)
        rotate([0,90,0])
        cylinder(h=12, d=3, center=true);
        
        translate([4,(38-5),0]*.5)
        rotate([0,90,0])
        cylinder(h=1, d=5, center=true);
        
        // Hole for trigger button
        translate([0,0,0])
        cube([12,6,6],center=true);
    }
}

module trigger() {
    $fn=128;
    H=5.3;
    
    difference() {
    
    union() {
        hull() {
        cylinder(h=H, d=8, center=true);
        
        translate([-21,0,0])
        cylinder(h=H, d=8, center=true);
        }
   
        hull() {
        translate([-21,0,0])
        cylinder(h=H, d=8, center=true);
        
        translate([-28,4,0])
        cylinder(h=H, d=6, center=true);
        }

        hull() {
        translate([-28,4,0])
        cylinder(h=H, d=6, center=true);

        translate([-36,4,0])
        cylinder(h=H, d=6, center=true);
        }        

        hull() {
        translate([-36,4,0])
        cylinder(h=H, d=6, center=true);
        
        translate([-41,-25,0])
        cylinder(h=H, d=6, center=true);
        }
        
        hull() {
        translate([-41,-25,0])
        cylinder(h=H, d=6, center=true);
        
        translate([-45,-27,0])
        cylinder(h=H, d=4, center=true);
        }
        
        hull() {
        translate([-45,-27,0])
        cylinder(h=H, d=4, center=true);

        translate([-50,-28,0])
        cylinder(h=H, d=4, center=true);
        }
        
        hull() {
        translate([-50,-28,0])
        cylinder(h=H, d=4, center=true);
        
        translate([-60,-27,0])
        cylinder(h=H, d=4, center=true);
        }
    }
    
        cylinder(h=12, d=3.3, center=true);    

        translate([-9,0,0])
        rotate([90,0,0])
        cylinder(h=12, d=3.2, center=true);    
    }

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


translate([40,-20,0])
rotate([0,-90,0])
triggerHousing();


translate([-40,-20,0])
rotate([0,90,0])
triggerHousingLid();

translate([-30,40,0])
rotate([0,0,-90])
trigger();
