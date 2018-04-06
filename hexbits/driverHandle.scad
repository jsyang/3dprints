module driverHandle(tolerance=0.2) {
  hexHeight = 7.15;

  difference(){    
    cylinder(r=hexHeight, h=10, $fn=6);
    
    translate([0,0,-1])
    cylinder(r=(hexHeight + tolerance)/2, h=20, $fn=6);
  }
}

driverHandle();