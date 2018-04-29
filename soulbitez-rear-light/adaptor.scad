module fin(tolerance=0.3) {


  union(){
    square(2);

    translate([0,2,0])
    hull() {
      square([2,2]);
      
      translate([2+tolerance,4,0])
      square([2,5]);
    }
  }
}

module finExtruded(){
  translate([3.7/2,10.7,4+.3])
  rotate([180,90,0])
  linear_extrude(height=3.7)
  fin();
}

module adaptor(tolerance=0.3) {
  union(){
    translate([0,0,-5])
    cylinder(r=25/2,h=5);
    
    translate([0,0,0])
    cylinder(r=11/2,h=3.5);
    
    for(i=[0:120:360]){
      rotate([0,0,i])
      finExtruded();
    }
  }
}

adaptor();
// finExtruded();


