module A_Pin(){
  cylinder(r=1.3/2,h=5, $fn=32);
}

module Z_CobLightMount() {
  PLATE=[8,60,4];
  union() {
    
    translate(PLATE*-.5)
      cube(PLATE);
    
    translate([0,27,0])
    A_Pin();
    
    translate([0,-27,0])
    A_Pin();
  }
}

Z_CobLightMount();