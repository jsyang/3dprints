module A_PinTube() {
  cylinder(r=10.25/2, h=16.4,$fn=32);
}

module B_Plate() {
  union(){
    cube([38,3.75,16.4]);
    translate([0,3.75,0])
    linear_extrude(height=16.4){
      polygon([
        [32,0],
        [38,0],
        [32.2,2.75],
        [30.6,3.05]
      ]);
    }

    translate([31,6,0])
    cylinder(r=1.6/2, h=16.4,$fn=32);
  }
}

module C_PinHole(){
  translate([0,0,-1])
    cylinder(r=6.4/2, h=18,$fn=32);
}

module Z_Main() {
  difference(){  
    union(){
    A_PinTube();
    translate([0,-10.25/2,0])
      B_Plate();
    }
    
    C_PinHole();
  }
}

Z_Main();