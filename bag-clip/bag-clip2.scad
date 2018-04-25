module dualCircleHull(t1, r1, t2, r2) {
  hull() {
    translate(t1)
    circle(r1);
    
    translate(t2)
    circle(r2);
  }
}

module fin() {
  $fn=16;
  union() {
    dualCircleHull(
      [0,0,0], 1.2,
      [4,2,0], 1.3
    );
    
    dualCircleHull(
      [4,2,0], 1.3,
      [3,3,0], 1.2
    );
    
    dualCircleHull(
      [3,3,0], 1.2,
      [1.5,16,0], 1.5
    );
  }
}

module finExtruded(h=15) {
  linear_extrude(height=h)
    fin();
}

module handle(){
  $fn=24;
  rotate([0,0,90])
  hull() {
    dualCircleHull(
      [0,4,0], 2,
      [0,-4,0], 2
    );
    
    dualCircleHull(
      [4,4,0], 3,
      [4,-4,0], 3
    );
  }
}

union() {
  linear_extrude(height=15)
    handle();

  translate([-6,-16,0])
  finExtruded();

  mirror([1,0,0])
  translate([-6,-16,0])
  finExtruded();
}