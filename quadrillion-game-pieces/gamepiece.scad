DIAM = 17.75;
RES=64;
R_CYL=4;
DEGRADE_FACTOR=1.042;


module Bridge() {
  for(i=[7:-.5:4]){
    translate([0,DIAM/(2^i)-2,0])
    rotate([0,90,90])
      cylinder(
        h=DIAM/(1.75^i),
        r2=R_CYL*(DEGRADE_FACTOR^i), 
        r1=R_CYL*(DEGRADE_FACTOR^(i+1.5)),
        center=true,
        $fn=RES
      );
  }
}

module P1x2() {  
  union() {
    sphere(d=DIAM, $fn=RES);
    
    translate([0,DIAM,0])
      sphere(d=DIAM, $fn=RES);
    
    translate([0,DIAM*.5,0])
      union(){
        Bridge();
  
        mirror([0,1,0])
        Bridge();
      }
  }
}

union() { 
  P1x2();
  
  translate([0,DIAM,0])
  rotate([0,0,90])
    P1x2();
  
  translate([-DIAM,DIAM,0])
    P1x2();
  
  translate([-DIAM,2*DIAM,0])
    P1x2();
}