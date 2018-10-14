module A_Nut() {    
  BOLT_SIZE=2.9;
  NUT_SIZE=6.3;

  difference(){
    cylinder(r=NUT_SIZE,$fn=6, h=5);
    
    translate([0,0,2])
      cylinder(r=NUT_SIZE/2,$fn=6, h=5);
    
    for(i=[0:60:360]) {
      rotate([0,0,i])
      translate([NUT_SIZE,0,0])
        cylinder(r=1,$fn=24,h=5);
    }
    
    cylinder(r=BOLT_SIZE/2,$fn=16, h=6);
  }
}


module B_ClampCrossSection(){
//  POLE1_OD=25.4;
  POLE1_OD=30.4;
  BOTTOM_SIZE=[POLE1_OD+15*2,10];

  difference() {
    union() {
      hull() {
        circle(r=(POLE1_OD+8)/2, $fn=32);

        scale([0.85,1])
        translate([0,-(POLE1_OD+8-BOTTOM_SIZE[1])/2])
        translate(BOTTOM_SIZE*-.5)
          square(BOTTOM_SIZE);
      }
      
      scale([1,1.67])
      translate([0,-5])
      translate(BOTTOM_SIZE*-.5)
        square(BOTTOM_SIZE);
      
    }
    
    circle(r=POLE1_OD/2, $fn=32);
  }
}

module C_ClampTop2D() {
  LINE_CUT=[100,2];
  HORIZON_CUT=[100,100];
  
  difference() {   
    B_ClampCrossSection();
    
    translate([0,-4])
    translate(LINE_CUT*-.5)
      square(LINE_CUT);
    
    translate([0,-55])
    translate(HORIZON_CUT*-.5)
      square(HORIZON_CUT);
  }
}

module C_ClampTop() {
  BOLT_HOLE=[3,20,3];
  difference() {  
    linear_extrude(height=7){
      C_ClampTop2D();
    }

    translate([50,-10,7]/2)
    translate(BOLT_HOLE*-.5)
      cube(BOLT_HOLE);
    
    translate([-50,-10,7]/2)
    translate(BOLT_HOLE*-.5)
      cube(BOLT_HOLE);
  }
}

module D_Hook2D() {
  translate([-40,0])
  difference() {
    hull(){
      circle(r=6);
      
      translate([10,-6])
        square([6,12]);
    }
    
    translate([2,6])
      circle(r=6);
  }
}

module D_Hooks(){
  translate([0,-14.2,6])
  rotate([90,0,0])
  linear_extrude(height=5) {
    D_Hook2D();
    
    mirror([1,0,0])    
      D_Hook2D();
  }
}

module D_ClampBottom() {
  BOLT_HOLE=[3,40,3];
  LINE_CUT=[100,2];
  HORIZON_CUT=[100,100];


  difference() {
    union() {
      // main piece
      linear_extrude(height=12){  
        difference() {
          B_ClampCrossSection();
          
          translate([0,-6])
          translate(LINE_CUT*-.5)
            square(LINE_CUT);
          
          translate([0,50-5])
          translate(HORIZON_CUT*-.5)
            square(HORIZON_CUT);
        }
      }
   
      // hooks
      D_Hooks();
    }
    
    translate([50,-15,13]/2)
    translate(BOLT_HOLE*-.5)
      cube(BOLT_HOLE);
    
    translate([-50,-15,13]/2)
    translate(BOLT_HOLE*-.5)
      cube(BOLT_HOLE);
  }
}

// C_ClampTop();

translate([0,-10,19])
rotate([90,0,0])
  D_ClampBottom();