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

module S2B_handlebar_interface() {
  radius = (20.4+3)/2;
  height = 40;
  
  translate([0,30,radius+3.5])
  rotate([0,90,0])
  cylinder(h=height, r=radius, center=true, $fn=6);
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
  translate([-20, -10 + 25/2, 8])
    cube([40,10,16]);
  
  // Middle cutout (zip-tie)
  translate([-11.2, -12 + 25/2, -5])
    cube([22.4,12,40]);
  
  S2B_handlebar_interface();
}

