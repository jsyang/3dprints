module dualSphereHull(t1,r1,t2,r2,nothing) {
  hull(){
    translate(t1)
      sphere(r1);
    
    translate(t2)
      sphere(r2);
  }
}

module halfHandle() {
  difference(){
    union() {
      dualSphereHull(
        [-15,0,-5], 6,
        [-2,0,3], 6,
        123456
      );

      dualSphereHull(
        [-2,0,3], 6,
        [15,0,10], 5.8,
        123456
      );

      
      dualSphereHull(
        [15,0,10], 5.8,
        [38,0,18], 5.6,
        123456
      );
      
      dualSphereHull(
        [38,0,18], 5.6,
        [45,0,19], 5.3,
        123456
      );
      
      dualSphereHull(
        [45,0,19], 5.3,
        [60,0,20], 5,
        123456
      );
      
      dualSphereHull(
        [60,0,20], 5,
        [65,0,20], 5,
        123456
      );
    }
    
    $fn=24;  
    translate([0,0,-30])
      cylinder(r=(3.85+.3)/2, h=60);
    
    // lower plane
    translate([-200,-200,-20])
      cube([400,400,20]);
    
    // side plane -- used to cut the half handle
    // 2 x half-handle should join exactly at that plane
    translate([65,-100,-20])
      cube([200,200,400]);
  }
}

union() {
  halfHandle();

  translate([130,0,0])
  mirror([1,0,0])
  halfHandle();
}