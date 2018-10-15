//FN=128; // high quality
FN=32; // medium quality
//FN=16; // low quality

module A_Wheel() {
  HORIZON_CUT=[100,100];
  bevel=2;
  wheelRadius=20;
  
  minkowski($fn=FN) {
    rotate_extrude(convexity=10, $fn=FN)
    difference() {
      scale([1,0.1])
        circle(wheelRadius-bevel);
      
      translate([HORIZON_CUT[0]*-0.5,0])
      translate(HORIZON_CUT*-.5)
        square(HORIZON_CUT);
    }
    
    sphere(bevel);
  }
  
}

module B_Axle() {
  LENGTH=15;
  
  translate([0,0,-.5]*LENGTH)
    cylinder(r=2.5,h=LENGTH,$fn=FN);
}

module C_RearForkArmHalf() {
  difference() {

    union() {
      // tongs
      hull() {    
        translate([0,0,6])
        linear_extrude(height=1.5)
        hull(){
          circle(4,$fn=FN);
        
          translate([20,1])
            circle(3,$fn=FN);
        }

        translate([20,0,4])    
        linear_extrude(height=1.5)
        hull(){
          circle(4,$fn=FN);
        
          translate([8,1])
            circle(3,$fn=FN);
        }
      }

      hull(){
        translate([20,0,4])    
        linear_extrude(height=1.5)
        hull(){
          circle(4,$fn=FN);
        
          translate([8,1])
            circle(4,$fn=FN);
        }
      
        translate([24,0,4])    
        linear_extrude(height=1.5)
        hull(){
          circle(3,$fn=FN);
        
          translate([10,4])
            circle(3,$fn=FN);
        }
      }
    }
    
    // pivot hole
    translate([34,4,0])
      cylinder(r=2,h=10,$fn=FN);
    
    // axle hole
    translate([0,0,1])
      B_Axle();
  }
}

module C_RearSusHalf(){
  translate([24,0,0])    
  linear_extrude(height=4)
  intersection() {
    hull(){
      translate([1,1,0])
      circle(4.5,$fn=FN);
    
      translate([10,4])
        circle(3,$fn=FN);
    }
    
    // block keep
    translate([-5,-1])
    hull(){
      translate([12,-12])
      circle(6,$fn=FN);
    
      translate([-4,6])
        circle(6,$fn=FN);
    }
  }
}

module C_RearForkHalf() {
  union() {
    C_RearForkArmHalf();
    C_RearSusHalf();
  }
}

module C_RearFork() {
  rotate([0,0,5]) {
    C_RearForkHalf();
    mirror([0,0,1])
      C_RearForkHalf();
  }
}  

module D_FrameBlockKeep(){
  rotate([0,0,5])
  translate([24,0,-4])    
  linear_extrude(height=8) {
    // block keep
    translate([-6,-2])
    hull(){
      translate([12,-12])
      circle(6,$fn=FN);
    
      translate([-4,6])
        circle(6,$fn=FN);
    }
  }
}

module D_Frame() {
  difference() {
    translate([25,5,0])
    rotate([0,0,15]) 
    rotate([0,90,0]) {
      linear_extrude(height=90)
      hull()  {
        translate([0,-2])
          circle(4-0.5,$fn=FN);
        
        translate([0,1])
          circle(4-0.5,$fn=FN);
      }
      
      // bottom bracket shell
      // todo
      
      // seatpost
      translate([0,0,20])
      rotate([-90,0,0])
      hull() {
        cylinder(r=4-.5, h=50,$fn=FN);
      }
      
      // crosspost
      translate([0,20,20])
      rotate([22,0,0])
        cylinder(r=4-.5, h=50,$fn=FN);
      
      // headtube
      translate([0,-10,90])
      rotate([-90,0,0])
      hull() {
        cylinder(r=4-.5, h=50,$fn=FN);
      }

    }
    
    // pivot hole
    rotate([0,0,5])
    translate([34,4,-5])
      cylinder(r=2,h=10,$fn=FN);

    translate([4,0,0])
      D_FrameBlockKeep();
  }
}

# A_Wheel();
//# B_Axle();

C_RearFork();
  //rotate([0,0,5])
D_Frame();