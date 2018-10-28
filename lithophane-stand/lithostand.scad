HOLE=[181,4.5,10];
HORIZON=[500,500,500];

module Wing(){
  translate([0,0,1]*-sqrt(2)*16/2)
  rotate([45,0,0])
    cube([10,16,16]);
}

difference() {
  union(){
    translate([0,0,1]*0.5*HOLE[2])
    translate([1,0,0]*0.5*HOLE[0])
    translate(HOLE*-.5)
    minkowski($fn=64){
      cube(HOLE);
      sphere(1.3);
    }  
    
    Wing();

    translate([1,0,0]*-10)    
    translate([1,0,0]*HOLE[0])
      Wing();
  }

  translate([0,0,2])
  translate([1,0,0]*0.5*HOLE[0])
  translate([0,0,1]*0.5*HOLE[2])
  translate(HOLE*-.5)
    cube(HOLE);
  
  translate([0,0,1]*-.5*HORIZON[2])
    cube(HORIZON, center=true);
}