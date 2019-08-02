// base

difference() {
  cube([22,16,6]);

  translate([0,0,1])  
  translate([22-6,0,0]*0.5)
    cube([6,16,4]);
}