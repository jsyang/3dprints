module housing_shell(tolerance=0.2){    
  toleranceAdjustment = [0.8,0.8,0.8]*tolerance;
  shellSize = [53, 20.4,16.5]*1.2+toleranceAdjustment;
  
  difference(){
    // main shell
    translate([0,0,-7])
    translate(shellSize * -0.5)
    cube(shellSize);
  
    translate([0,0,-shellSize[1]*1.475])
    rotate([0,90,0])
    cylinder(
      h=shellSize[0]+1, 
      r=shellSize[1]*0.9,
      center=true,
      $fn=32
    );
    
    translate([58/2,16/2,-30])
    cylinder(h=60,r=2.1/2, $fn=32);

    translate([-54/2,16/2,-30])
    cylinder(h=60,r=2.1/2, $fn=32);

    translate([-54/2,-16/2,-30])
    cylinder(h=60,r=2.1/2, $fn=32);

    translate([58/2,-16/2,-30])
    cylinder(h=60,r=2.1/2, $fn=32);
  }    
}

module housing_inner(tolerance=0.2){    
  toleranceAdjustment = [0.5,0.5,0.5]*+tolerance;
  
  cellSize = [56.5,13.5,8.4] + toleranceAdjustment;
  boardSize = [39, 20.4,3.8]+ toleranceAdjustment;
  usbPlugSize = [6.7,10,3.7]+ toleranceAdjustment;
  
  frontCutoutSize = [30,17,10];
  
  union() {
    translate([10,0,5])
    translate(frontCutoutSize * -.5)
    cube(frontCutoutSize);
    
    translate([-2,0,-5.4])
    translate(cellSize*-.5)
    cube(cellSize);
    
    translate([7,0,0])
    translate(boardSize*-.5)
    cube(boardSize);
    
    translate([29.5,0,0])
    translate(usbPlugSize*-.5)
    cube(usbPlugSize);
  }
}

module housing() {
  difference() {
    housing_shell();
    housing_inner();
  }
}


module housingHalf1(){
  size2 = [80,60,60];

  difference(){
    housing();
  
    translate([0,0,-31.85])  
    translate(size2*-.5)
    cube(size2);
  }
}

module housingHalf2(){
  size2 = [80,60,60];

  difference(){
    housing();
  
    translate([0,0,60-31.85])  
    translate(size2*-.5)
    cube(size2);
    
    translate([0,-30,-14])
    cube([9,60,3]);
    
    translate([25,-30,-32])
    cube([9,60,20]);
    
    translate([-32,-30,-32])
    cube([9,60,20]);
  }
}


// housing();

housingHalf1();
//housingHalf2();