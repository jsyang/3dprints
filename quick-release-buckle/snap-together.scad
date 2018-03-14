$fn = 20;

module snap_together_key_half() {
  translate([6,0,0])
  difference() {
    union() {
      // Tooth
      
      hull(){  
        translate([1,10,0])
        minkowski() {
          circle(1);
          square([1,1]);
        }

        translate([1,1,0])
        minkowski() {
          circle(1);
          square([3.5,1]);
        }

        translate([1,0,0])
        minkowski() {
          circle(1);
          square([2,1]);
        }
      }
              
      // Prong
      translate([0,-20,0])
      square([3,20]);
      
      // Handle
      translate([-6,-35,0])
      minkowski() {
        circle(1);
        square([8,15]);
      }
    }
    
    // Detent hole
    translate([3.7,-1.5,0])
    circle(1.3);

    // Fillet
    translate([-11,-20,0])
    minkowski() {
      circle(1);
      square([10,2]);
    }
        
    // Loophole
    translate([-7,-34,0])
    square([5,3]);
  }
}

module snap_together_key() {
  union() {
    snap_together_key_half();
    mirror([1,0,0])
    snap_together_key_half();
  }
}

module snap_together_lock_half() {

  translate([10,-3,0])
  hull() {
    translate([0,0.25,0])
    minkowski() {
      circle(1);
      square([1,1]);
    }
    
    translate([0,-10,0])
    minkowski() {
      circle(1);
      square([5,1]);
    }
    
    translate([0,-18,0])
    minkowski() {
      circle(1);
      square([5,1]);
    }
  }

  translate([0,12,0])
  square([5,5]);
}

module snap_together_lock_posts() {
  union() {
    snap_together_lock_half();
    mirror([1,0,0])
    snap_together_lock_half();
  }
}

//linear_extrude(height=5)
//snap_together_key();

module snap_together_lock(isMale=true) {
  difference() {
    union() {
      difference(){
        linear_extrude(height=3.7)
        snap_together_lock_posts();
        
        // Cuts to interlock the two halves
        if(isMale==true){
          translate([-20,11,2.7])
          cube([40,3,2]);
          
          translate([-20,-3,2.7])
          cube([40,3,2]);
          
          translate([-20,-9,2.7])
          cube([40,3,2]);
          
          translate([-20,-15,2.7])
          cube([40,3,2]);
          
          translate([-20,-21,2.7])
          cube([40,3,2]);
        } else {
          translate([-20,14-0.1,2.7])
          cube([40,3.2,2]);
          
          translate([-20,-6+.1,2.7])
          cube([40,3-.2,2]);
          
          translate([-20,-12+.1,2.7])
          cube([40,3-.2,2]);
          
          translate([-20,-18+.1,2.7])
          cube([40,3-.2,2]);
          
          translate([-20,-24+.1,2.7])
          cube([40,3-.2,2]);
        }
      }

      translate([0,0,-2])
      linear_extrude(height=2) {
        difference(){
          hull() {
            translate([15,-21,0])
            circle(1);
            translate([-15,-21,0])
            circle(1);

            translate([15,-12,0])
            circle(1);
            translate([-15,-12,0])
            circle(1);
            
            translate([11,-1.7,0])
            circle(1);
            translate([-11,-1.7,0])
            circle(1);

            translate([5,16,0])
            circle(1);        
            translate([-5,16,0])
            circle(1);
          }
          
          translate([11,6,0])
          circle(7);
          
          translate([-11,6,0])
          circle(7);

        }
      }
    }
    
    translate([-3.6,13.7,-4])
    cube([7.2,2,8]);
    
    translate([11.5,-18,-4])
    cube([2,7.2,8]);

    translate([-13.5,-18,-4])
    cube([2,7.2,8]);
  }
}

snap_together_lock();

translate([40,0,0])
snap_together_lock(false);