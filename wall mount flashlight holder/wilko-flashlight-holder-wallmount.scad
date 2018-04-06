// diameter of flash light tube = 15.2 mm
// space between rings = 64 mm

module ring(tolerance=0.3, _fn=32) {
  body_radius = 15.2/2;
  $fn=_fn;

  difference() {
    union(){  
      difference() {
        cylinder(r=body_radius*1.8, h=10);

        translate([0,0,-1])
          cylinder(r=body_radius+tolerance, h=12);

        translate([body_radius,body_radius,-1])
          cylinder(r=body_radius*1.2, h=12);

      }
      
      tabSize = [10,20, 0];
      rotate([0,0,45])
      translate(tabSize*-0.5+[-body_radius*1.8,0,0])
      cube(tabSize+[0,0,10]);
    }
    
    cutoutSize=[20,20,20];
    
    translate(cutoutSize*-0.5+[-24,4,0])
    cube(cutoutSize+[0,0,10]);
    
    translate(cutoutSize*-0.5+[4,-24,0])
    cube(cutoutSize+[0,0,10]);    

  }
}

module rail(tolerance=0.25) {
  union() {
    difference(){
      topSize = [5,28,64];
      
      rotate([0,0,45])
      translate(topSize*-.5 + [-16-tolerance,-0,0])
        cube(topSize);
      
      shaftSize=[20,20,64];
      shaftOffset = -16+tolerance;

      translate(shaftSize*-0.5+[shaftOffset,shaftOffset,-1])
      cube(shaftSize+[0,0,10]);
    
    }

      topSize = [5,28,64];
      rotate([0,0,45])
      translate(topSize*-.5 + [-16-5-tolerance,-0,0])
        cube(topSize);

    /*
      stopSize = [10,28,4];
      rotate([0,0,45])
      translate(stopSize*-.5 + [-18.5-tolerance,0,22])
        cube(stopSize);

      rotate([0,0,45])
      translate(stopSize*-.5 + [-18.5-tolerance,0,22])
        cube(stopSize);
    */
  }
}

rail();
//ring();