module A_TerminalPlateSlot() {
  rotate([0,0,45])
  cylinder($fn=4,r1=12.2, r2=10, h=1.5);
}

module A1_SquareProtrusion() {
  BLOCK_SIZE=[14,14,80];
  CUTOUT=[7.8,100,15.8];

  difference() {
    translate([0,0,BLOCK_SIZE[2]*.5])
    translate(BLOCK_SIZE*-.5)
      cube(BLOCK_SIZE);

    translate([0,-1,80-12])
    rotate([0,0,90])
    translate(CUTOUT*-.5)
    cube(CUTOUT);
  }
}

module B_BatteryHolder() {
  difference() {
    union(){     
      cylinder(r=28/2, h=80, $fn=6);

      translate([cos(30),sin(30),0]*-17)
      rotate([0,0,-60])
        A1_SquareProtrusion();
    }
    
    // Battery cavity
    translate([0,0,5])
    hull() {
      translate([0,8,0])
        cylinder(r=18.15/2, h=70,$fn=32);
        
      cylinder(r=18.6/2,h=70,$fn=32);
    }
  
    TERMINAL_HOLE_SIZE = [3.5,10,2.4];
    
    // negative terminal slot    
    translate([0,-10,3.6])
    translate(TERMINAL_HOLE_SIZE*-.5)
      cube(TERMINAL_HOLE_SIZE);

    translate([0,5,3.6])
      A_TerminalPlateSlot();
    
    translate([0,-1,3.6])
      A_TerminalPlateSlot();


    // positive terminal slot
    translate([0,-10,80-(3.6+1.5)])
    translate(TERMINAL_HOLE_SIZE*-.5)
      cube(TERMINAL_HOLE_SIZE);
    
    translate([0,5,80-3.6])
      rotate([180,0,0])
      A_TerminalPlateSlot();
    
    translate([0,-1,80-3.6])
      rotate([180,0,0])
      A_TerminalPlateSlot();

  }
}


B_BatteryHolder();