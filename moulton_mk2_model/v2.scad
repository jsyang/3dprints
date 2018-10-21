// https://www.ebay.co.uk/itm/MOULTON-SERIES-2-17-WHEELS-6-SPEEDS/302915113412
//FN=128; // high quality
FN=32; // medium quality
//FN=16; // low quality

module A_Wheel() {
  HORIZON_CUT=[100,100];
  bevel=3;
  wheelRadius=20;
  
  minkowski($fn=FN) {
    rotate_extrude(convexity=10, $fn=FN)
    difference() {
      scale([1,0.05])
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

// Slightly undersized for true fit 
// (front and rear wheel axles)
module B_AxleTrue(LENGTH=15,R=2.25) {
  CUT=[500,500,10];
  TOP_CUT_OFFSET=6.75;
  
  difference() {
    rotate([90,0,0])
    translate([0,0,-.5]*LENGTH)
      cylinder(r=R,h=LENGTH,$fn=FN);

    translate([0,0,TOP_CUT_OFFSET])
    translate(CUT*-.5)
      cube(CUT);
    
    translate([0,0,-TOP_CUT_OFFSET])
    translate(CUT*-.5)
      cube(CUT);
  }
}

// "Handle bars" | pivot pin
//B_AxleTrue(LENGTH=30,R=1.82);

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
        
          translate([7,2])
            circle(3,$fn=FN);
        }
      }
    }


    // pivot hole
    translate([31,2,0])
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

module D_SeatShape() {
  union() {
    translate([3,0,0])
      circle(3,$fn=FN);
    translate([-3,0,0])
      circle(3,$fn=FN);
    
    hull() {
      translate([2.5,-3,0])
        circle(4,$fn=FN);
      translate([-2.5,-3,0])
        circle(4,$fn=FN);

      translate([0,-8,0])
        circle(4,$fn=FN);
    }

    hull() {      
      translate([0,-8,0])
        circle(4,$fn=FN);
      
      translate([0,-20,0])
        circle(2.5,$fn=FN);
    }
  }
}

// needs a better one
module D_Seat(){
  translate([0,5,1])
  rotate([15,0,0]) {      
    minkowski($fn=FN) {
      linear_extrude(height=1)
        D_SeatShape();
    
      sphere(1);
    }
  }
}

module D_Seatpost(){
  TOP_SIZE=[7,4-.5,20];
  
  hull() {
    cylinder(r=4-.5, h=20,$fn=FN);
    cylinder(r=2, h=50,$fn=FN);
  }
  
  cylinder(r=2, h=55,$fn=FN);
  
  translate([0,0,55])
    D_Seat();
}

module D_FrontSusRibCut() {
  rotate_extrude() {
    translate([6,0,0])
    scale([1,0.5])
      circle(2,$fn=FN);
  }
}

module D_FrontForks(isWheelVisible){
  HEIGHT=4;
  
  rotate([0,90,0])
  translate([0,0,-3])
  translate([0,0,-.5]*10)
  union() {
    // Wheel
    if(isWheelVisible) {
      translate([20,-5,8])
        A_Wheel();
    }

    // Forks
    difference() {
      union(){
        translate([0,0,4])
          cylinder(r=5,h=HEIGHT,$fn=FN);
        
        hull() {
          cylinder(r=5,h=HEIGHT,$fn=FN);
          
          translate([15,-2,0])
            cylinder(r=4,h=HEIGHT,$fn=FN);
        }
        
        hull() {
          translate([15,-2,0])
            cylinder(r=4,h=HEIGHT,$fn=FN);
          
          translate([20,-4,0])
            cylinder(r=4,h=HEIGHT,$fn=FN);
        }
      }
      
      translate([20,-4,-2])
        cylinder(r=2.5,h=HEIGHT*2,$fn=FN);

      translate([20,-5,8])
      scale([1,1,1.1]*1.1)
        A_Wheel();
      
      
      HORIZON_CUT=[5,200,200];

      translate([-6,0,0])
      translate(HORIZON_CUT*-.5)
        cube(HORIZON_CUT);
    }
  }
}

module D_Stem(isHandlebarVisible=true) {
  translate([0,-8.5,-2.5])
  rotate([0,0,90])
    B_AxleTrue(LENGTH=30,R=1.82);
  
  difference() {
    hull() {
      sphere(3,$fn=FN);
      
      translate([0,-8,-2])
      minkowski($fn=FN/2){
        rotate([15,0,0])
        translate([1,1,1]*-.5*4)
          cube(3);
        sphere(2,$fn=FN/2);
      }
    }
    
    rotate([0,90,0])
    translate([2.5,-8.5,-8])
      cylinder(r=2,h=16,$fn=FN);
  }
}

module D_HeadTube(isWheelVisible=false) {
  translate([0,0,4])
  hull() {
    cylinder(r=4-.5, h=10,$fn=FN);
    cylinder(r=2.5, h=40,$fn=FN);
  }
  
  // Suspension
  translate([0,0,-10+4])
  difference() {
    cylinder(r=5, h=10,$fn=FN);

    for(i=[0:2:10]){
      translate([0,0,i])
        D_FrontSusRibCut();
    }
  }
    
  // Forks
  translate([0,0,-9]) 
  union() {
    D_FrontForks(isWheelVisible);
    mirror([1,0,0])
      D_FrontForks(isWheelVisible);
  }

  translate([0,0,45]) 
    D_Stem();
}

module D_Frame(isWheelVisible=false) {
  difference() {
    translate([25,5,0])
    rotate([0,0,15]) 
    rotate([0,90,0]) {
      linear_extrude(height=70)
      hull()  {
        translate([0,-2])
          circle(4-0.5,$fn=FN);
        
        translate([0,1])
          circle(4-0.5,$fn=FN);
      }
      
      // bottom bracket shell
      translate([0,-6,15])
      rotate([0,-90,0])
      translate([0,0,1]*-.5*7)
        cylinder(r=4, h=7, $fn=FN);
      
      // seatpost
      translate([0,0,15])
      rotate([-90,0,0])
        D_Seatpost();
      
      // top tube
      translate([0,16,14])
      rotate([22,0,0])
        cylinder(r=2.5, h=48,$fn=FN);
      
      // headtube
      translate([0,-10,70])
      rotate([-90,0,0])
        D_HeadTube(isWheelVisible);

    }
    
    // bottom bracket hole
    rotate([0,0,15]) 
    translate([40.5,-7.6,-8])
      cylinder(r=2, h=16, $fn=FN);

    
    // pivot hole
    rotate([0,0,5])
    translate([31,2,-5])
      cylinder(r=2,h=10,$fn=FN);

    translate([4,0,0])
      D_FrameBlockKeep();
  }
}

module BISECT() {
  HORIZON_CUT=[1000,1000,1000];
  
  difference(){
    children();
    
    translate([0,0,1]*HORIZON_CUT[0]*.5)
    translate(HORIZON_CUT*-.5)
      cube(HORIZON_CUT);
  }
}

// BISECTION op
if(0) {
//  rotate([0,180,0])
  mirror([0,0,1])
  BISECT()
  difference() {
    // Put stuff to be cut in here
    D_Frame();
  }
} 

// Display only
if(1) {
  rotate([90,0,0]) {
    A_Wheel();
    rotate([0,0,7.5])
      C_RearFork();
    rotate([0,0,7.5])
      D_Frame(true);
  }
}