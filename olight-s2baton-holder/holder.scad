module S2B_ring(
  baton_diameter=22 + .4, 
  outer_diameter=3
) {
  baton_r = baton_diameter/2;
  baton_r_outer = baton_r + outer_diameter;
  hull(){
    circle(r=baton_r_outer);    
    
    translate([-baton_r_outer, baton_r_outer + 9, 0])
      square([baton_r_outer*2, 2]);
  }
}

module S2B_handlebar_face(
  baton_diameter=22 + .4, 
  outer_diameter=3, 
  fillet_size=5
) {
  size = baton_diameter + outer_diameter + fillet_size * 2;
  
  difference() {
    translate([-size/2, baton_diameter/2 + outer_diameter, 0])
      square([size, baton_diameter/2]);
    
    translate([-size/2 - fillet_size/4, baton_diameter/2 + outer_diameter, 0])
    circle(r=fillet_size);
    
    translate([size/2 + fillet_size/4, baton_diameter/2 + outer_diameter, 0])
    circle(r=fillet_size);
  }
}

module S2B_holder_master(height=30) {
  linear_extrude(height=height)  
  union() {
    $fn=32;
    S2B_ring();
    S2B_handlebar_face();
  }
}

difference() {
  S2B_holder_master();
 
  // Baton space
  translate([0,0,-1])
  linear_extrude(height=32) 
    circle(r=22.4 / 2);
  
  // Middle cutout (zip-tie)
  translate([-20,-14 + 25/2, 8])
    cube([40,14,16]);
  
  // Adapter slot 
  union() {
    translate([-10, 20 - 5/2, 5])
      cube([40, 5 + .4, 20]); // 20 -.3 = fitting
    
    translate([-12/2, 20 + 5/2, (30 - 12)/2])
      cube([32, 6, 12]); // 12 -.3 = fitting
  }
}

