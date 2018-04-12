module creeXMLHolder(tolerance=0.2){
  stubRadius = (3.12 + tolerance)/2;

  OR = (27 + tolerance)/2;
  IR = (23 + tolerance)/2;

  union(){
    difference(){
      cylinder(r=OR, h=2.2, $fn=6);  

      translate([0,0,-1])
      cylinder(r=IR, h=4, $fn=6);
    }
    
    translate([IR - stubRadius*0.9,0,0])
    cylinder(r1=stubRadius,r2=stubRadius*1.1, h=2.2, $fn=24);
    
    translate([IR - stubRadius*0.9,0,0]*-1)
    cylinder(r1=stubRadius,r2=stubRadius*1.1, h=2.2, $fn=24);
  }
}
  
module frame() {
    
  union() {
    retainingRodSize = [27,3.2,0];
    union(){
      creeXMLHolder();

      translate(retainingRodSize*-.5)
        cube(retainingRodSize+[0,0,2.2]);
    }

    translate([0,0,2.2])
      creeXMLHolder();
  }
}

frame();