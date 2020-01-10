A_THICK=5;
A_HOLE=[31.5,10,3];
A_BODY=[
  A_HOLE[0]+A_THICK,
  A_HOLE[1]+A_THICK,
  A_HOLE[2]+A_THICK
];

module A_MountPlate() {
  difference() {
    translate([A_BODY[0],A_BODY[1],0]*-.5)
      cube(A_BODY);
    
    translate([A_HOLE[0],A_HOLE[1],0]*-.5)
    translate([0,0,-0.5])
      cube(A_HOLE);
    
    // screw holes
    translate([A_HOLE[0]*0.5 - 5.5,0,0])
      cylinder(r=2.7, h=5+A_THICK, $fn=24);
    
    translate([A_HOLE[0]*0.5 - 5.5,0,0]*-1)
      cylinder(r=2.7, h=5+A_THICK, $fn=24);
  }
}

module B_PivotRod(radius=3) {
  union(){
    translate([A_BODY[0]+10,0,11]*-.5)
    rotate([0,90,0])
    difference(){
      cylinder(r=radius, h=A_BODY[0]+10, $fn=24);

      translate([radius-0.5,0,0])
      translate([0,1,1]*-50)
        cube([100,100,100]);
      
      mirror([1,0,0])
      translate([radius-0.5,0,0])
      translate([0,1,1]*-50)
        cube([100,100,100]);
    }

    translate([0,0,-A_BODY[2]])    
    translate([A_BODY[0],0,0]*-.5)
      cube([A_BODY[0],8,5]);
  }
}

mirror([0,0,1])
  A_MountPlate();
translate([0,-A_BODY[1],0])
  B_PivotRod();
mirror([0,1,0])
translate([0,-A_BODY[1],0])
  B_PivotRod();