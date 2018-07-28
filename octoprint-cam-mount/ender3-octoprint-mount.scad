// Set this to false if printing
DISPLAY = true;

module endStopHole(){
  translate([0,0,-0.5]*3)
  cylinder(r=4.85/2, h=4, $fn=24);
}

module bracket() {
  translate([0,0,20])
  rotate([0,90,0])
  linear_extrude(height=2)
  hull(){
    translate([20-2,-20,0])
      square(2);
    
    translate([20-2,20-2,0])
      square(2);
    
    translate([0,20-2,0])
      square(2);
  }
}

module plate() {
  union() {
    translate([-0.5,-0.5,0]*40)
      cube([40,40,2]);
    
    translate([0,20,20])
    rotate([90,0,0])
    translate([-0.5,-0.5,0]*40)
      cube([40,20,2]);
    
    translate([20-2,0,0])
      bracket();
    
    translate([-20,0,0])
      bracket();

  }
}

// Part A -- End Stop Bracket x 1

module A_EndStopBracket(IS_LEFT_BRACKET=true) {
  difference() {
    ES_HOLE_OFFSET = 19.5/2;
    
    plate();
    
    if(IS_LEFT_BRACKET) {
      translate([1,-1,0]*ES_HOLE_OFFSET)
        endStopHole();

      translate([-1,1,0]*ES_HOLE_OFFSET)
        endStopHole();
    } else {
      translate([-1,-1,0]*ES_HOLE_OFFSET)
        endStopHole();

      translate([1,1,0]*ES_HOLE_OFFSET)
        endStopHole();      
    }
    
    translate([0,20,10])
    rotate([90,0,0])
    translate([0,0,-1])
      cylinder(r=5,h=4,$fn=32);
  }
}

// Part B -- Swiveling Pivot x 1

module B_SwivelingPivot() {
  TOLERANCE = 0.1;
  
  difference() {
    union() {
      cylinder(r=5-TOLERANCE,h=3,$fn=32); 
      
      translate([0,0,-1])
      cylinder(r=10,h=1,$fn=32); 
      
      translate([0,0,-7])
      cylinder(r=5-TOLERANCE,h=6,$fn=32); 
      
      translate([0,0,-7])
      sphere(5-TOLERANCE, $fn=32);
    }
    
    translate([2,-10,-20-2])
    cube([4,20,20]);
    
    translate([-4-2,-10,-20-2])
    cube([4,20,20]);

    translate([-4,0,-7])
    rotate([0,90,0])
    cylinder(r=1.6,h=8,$fn=32);
  }
}

// Part C -- Arm Plate x 4

module C_ArmPlate() {

  difference() {
    linear_extrude(height=2)
    hull() {
      $fn = 32;
      circle(3.75);

      translate([50,0,0])      
      circle(3.75);
    }
    
    translate([0,0,-1])
    cylinder(r=1.6,h=4,$fn=32);
    
    translate([50,0,-1])
    cylinder(r=1.6,h=4,$fn=32);
  }
}

// Part D -- Elbow Plate x 1

module D_ElbowPlate() {
  difference() {
    linear_extrude(height=2)
    hull() {
      $fn = 32;
      circle(3.75);

      translate([9,0,0])      
      circle(3.75);
    }
    
    translate([0,0,-1])
    cylinder(r=1.6,h=4,$fn=32);
    
    translate([9,0,-1])
    cylinder(r=1.6,h=4,$fn=32);
  }
}

/*
translate([0,0,0])
  C_ArmPlate();
translate([0,10,0])
  C_ArmPlate();
translate([0,20,0])
  C_ArmPlate();
translate([0,30,0])
  C_ArmPlate();
*/


// D_ElbowPlate();


// Part E -- Mount Plate x 1

module E_MountPlate() {
  TOLERANCE = 0.25;
  
  difference() {
    union() {
      translate([-20,-10,-1])
      cube([40,20,2]);
      
      translate([0,0,-1])
      cylinder(r=10,h=1,$fn=32); 
      
      translate([0,0,-7])
      cylinder(r=5-TOLERANCE,h=6,$fn=32); 
      
      translate([0,0,-7])
      sphere(5-TOLERANCE, $fn=32);
    }
    
    
    translate([2,-10,-20-2])
    cube([4,20,20]);
    
    translate([-4-2,-10,-20-2])
    cube([4,20,20]);

    translate([-4,0,-7])
    rotate([0,90,0])
    cylinder(r=1.6,h=8,$fn=32);
  }
}


if(DISPLAY) {
  translate([0,37,-22]) 
  rotate([90,0,0]) 
    A_EndStopBracket();

  translate([0,27,3]) 
    rotate([180,0,0]) 
    B_SwivelingPivot();

  translate([2,27,10])
  rotate([90,0,90])
    C_ArmPlate();
  
  translate([-4,27,10])
  rotate([90,0,90])
    C_ArmPlate();

  translate([-1,77,10])
  rotate([90,0,90])
    D_ElbowPlate();

  //// 

  translate([0,96,-17])
  rotate([90,0,0])
  translate([2,27,10])
  rotate([90,0,90])
    C_ArmPlate();

  translate([0,96,-17])
  rotate([90,0,0])
  translate([-4,27,10])
  rotate([90,0,90])
    C_ArmPlate();
    
  ////

  translate([0,81,65])  
  rotate([90,0,0])
  rotate([-45,0,0])
  E_MountPlate();
} else {
  
  translate([0,35,0])
    A_EndStopBracket();

  translate([-35,-0,3])
  rotate([180,0,0])
    B_SwivelingPivot();
  
  translate([-35,-20,0])
    C_ArmPlate();
  translate([-35,-30,0])
    C_ArmPlate();
  translate([-35,-40,0])
    C_ArmPlate();
  translate([-35,-50,0])
    C_ArmPlate();

  translate([-35,-60,0])
    D_ElbowPlate();


  translate([0,0,1])
  rotate([180,0,0])
    E_MountPlate();
}

