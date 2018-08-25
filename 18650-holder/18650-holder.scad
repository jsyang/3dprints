module A_TerminalPlateSlot() {
  RADIUS_TO_WIDTH=1/sqrt(2);
  
  rotate([0,0,45])
  cylinder($fn=4,r1=12.8*RADIUS_TO_WIDTH, r2=11*RADIUS_TO_WIDTH, h=1.5);
}

module A1_SquareProtrusion() {
  BLOCK_SIZE=[14,14,80];
  CUTOUT=[7.6,50,15.8];

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

      translate([0,-19,0])
        A1_SquareProtrusion();
    }
    
    // Battery cavity
    translate([0,0,5])
    hull() {
      translate([0,8,0])
        cylinder(r=18.15/2, h=70,$fn=32);
        
      cylinder(r=18.6/2,h=70,$fn=32);
    }
  
    TERMINAL_HOLE_SIZE = [3.5,20,2.4];
    
    // negative terminal slot    
    translate([0,-10,3.6])
    translate(TERMINAL_HOLE_SIZE*-.5)
      cube(TERMINAL_HOLE_SIZE);

    translate([0,8,3.6])
      A_TerminalPlateSlot();

    translate([0,-1,3.6])
      A_TerminalPlateSlot();


    // positive terminal slot
    translate([0,-10,80-(3.6+1.5)])
    translate(TERMINAL_HOLE_SIZE*-.5)
      cube(TERMINAL_HOLE_SIZE);
    
    translate([0,8,80-3.6])
      rotate([180,0,0])
      A_TerminalPlateSlot();
    
    translate([0,-1,80-3.6])
      rotate([180,0,0])
      A_TerminalPlateSlot();


    translate([-2,-23.8,4])
    cube([10,7.6,60]);
  }
}

// B_BatteryHolder();

module C_WireSlotFiller() {
  union() {  
    cube([7.4,3.5,69]);

    translate([0,3.5,0])
      cube([7.4,4,59]);
  }
}

/*
rotate([90,0,0])
  C_WireSlotFiller();
*/

module D_HexCover() {
  difference() {
    cylinder(r=28/2+3, h=80, $fn=6);

    translate([0,0,-1])
      cylinder(r=28/2+0.15, h=90, $fn=6);

    translate([-100,-20-10,-1])    
      cube([200,20,200]);
  }
}

D_HexCover();