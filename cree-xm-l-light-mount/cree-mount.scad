module A_HeatSinkCutout() {
  SIZE=[20.2,20.2,7.95];

  translate(SIZE*-.5)
    cube(SIZE);
}

module C_Peg(){
  pegSize = [12.9,12.9,2.5];
  topSize = [17,17,2];

  // square insert
  translate([0,0,2])
  translate([0,0,pegSize[2]]*.5)
  translate(pegSize*-.5)
  cube(pegSize);

  // square insert top
  translate([0,0,2+2.5])
  translate([0,0,topSize[2]]*.5)
  translate(topSize*-.5)
  cube(topSize);
}
  

module Z_HeatSinkBlock() {
  SIZE=[58,26,10];
  difference(){
    union(){
      translate(SIZE*-.5)
        cube(SIZE);
      
      translate([6,0,-3])
      mirror([0,0,1])
      C_Peg();
    }
    
    translate([-16,0,-2]){
      A_HeatSinkCutout();
      translate([0,0,4])
        A_HeatSinkCutout();
    }
    
    translate([10,2,-2.5+.01]) 
    union(){
      translate([-20,-2+0.01,3.3])
        cube([50,3.4,4.2]);      

        cube([15.5,11.5,7.5]);
    }

    
  }
}

Z_HeatSinkBlock();
