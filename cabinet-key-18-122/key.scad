// print flat at 0.08mm layer height

module A_ShaftCut(length=8) {
  CUT_SIZE=[length,length,3];
  
  rotate([0,0,45])
  translate([0,0,0.5*CUT_SIZE[2]-0.5])
  translate(CUT_SIZE*-.5)
    cube(CUT_SIZE);
}

module A_Tooth() {
  SIZE_TOOTH=[1.2,1.2,2];
  
  rotate([0,0,45])
  translate([0,0,SIZE_TOOTH[2]*.5])
  translate(-.5*SIZE_TOOTH)
    cube(SIZE_TOOTH);
}

module A_Shaft() {
  difference() {
    union() {
      cube([19,5,2]);

      translate([9.5,5,0])
        A_Tooth();
    }
    
    translate([12.5,5,0])
      A_Tooth();

    translate([16.5,5,0])
      A_Tooth();
    
    // Bevelled ends
    translate([19,5,0])
      A_ShaftCut(3);
    
    translate([19,0,0])
      A_ShaftCut(3);
  }
}

module B_KeyBlank() {
  difference(){
    union() {
      // head
      translate([-12,-2,0])
        cube([12,10,2]);
      
      A_Shaft();
    }
    
    translate([-10,3,-1])
    cylinder(r=1, $fn=32, h=4);
    
    // channel 1
    translate([-2,2.8,-0.01])
      cube([19+4,0.8,0.8]);
   
    // channel 2
    translate([-2,2,2-0.8+0.01])
      cube([19+4,0.8,0.8]);
    
    // channel 3 (at the bottom of the blank)
    translate([-0.01,-0.01,2-0.8+0.01])
      cube([19+1,1.5,0.8]);
  }
}

module Z_Main(){

  B_KeyBlank();
  
}

Z_Main();