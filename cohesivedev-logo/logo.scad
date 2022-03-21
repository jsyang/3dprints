$fn=256;
HEIGHT=5;

module ring0() {
  cylinder(h=HEIGHT, r=5);
}

module ring1() {
  difference() {
    cylinder(h=HEIGHT, r=20);
  
    cylinder(h=HEIGHT*3, r=15, center=true);
  }
}

module ring2() {
  difference() {
    cylinder(h=HEIGHT, r=35);
  
    cylinder(h=HEIGHT*3, r=30, center=true);
  }
}

module ring3() {
  difference() {
    cylinder(h=HEIGHT, r=65);
  
    cylinder(h=HEIGHT*3, r=45, center=true);
  }
}

rotate([-0,0,0])
color([.16,.16,.16])
rotate([0,0,-45])
difference() {
  union() {
    ring0();
    ring1();
    ring2();
    ring3();
  }
  
  translate([0,0,HEIGHT*0.05])
    cube([80,80,20]);
}