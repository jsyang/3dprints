module dualCircleHull(t1, r1, t2, r2) {
  hull() {
    translate(t1)
    circle(r1);
    
    translate(t2)
    circle(r2);
  }
}

module finFlat() {
  $fn=24;
  radius=1.5;
  
  union() {    
    dualCircleHull(
      [0,-0.5,0], 1.5,
      [4,2,0], 1.7
    );

    dualCircleHull(
      [4,2,0], 1.7,
      [7,3,0], 1.9
    );
    
    dualCircleHull(
      [7,3,0], 1.9,
      [12,3.5,0], 2.1
    );
    
    dualCircleHull(
      [12,3.5,0], 2.1,
      [20,2.3,0], 2.5
    );
    
    dualCircleHull(
      [20,2.3,0], 2.5,
      [24,2,0], 2.5
    );
  }  
}

module finExtruded(h=5){
  translate([0,-4.2,0])
  linear_extrude(height=h)
    finFlat();
}

module handleFlat(){
  $fn=24;
  hull() {
    dualCircleHull(
      [0,2,0], 2,
      [0,-2,0], 2
    );
    
    dualCircleHull(
      [4,4,0], 3,
      [4,-4,0], 3
    );
  }
}

module handleExtruded(h=21){
  translate([24,0,0])
  linear_extrude(height=h)
    handleFlat();
}

union() {
  finExtruded();

  translate([0,0,5+3])
  mirror([0,1,0])
  finExtruded();

  translate([0,0,(5+3)*2])
  finExtruded();

  handleExtruded();
}