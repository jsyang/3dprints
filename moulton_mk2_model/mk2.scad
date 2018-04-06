module MK2_main_tube(_fn=24,scale=3) {
  R_length = 15.38*2*scale;
  
  linear_extrude(height=R_length)
  union() {
    S_tube = [2, 2.3]*scale;
   
    translate(S_tube*-0.5)
      square(S_tube);
    
    translate(-S_tube/2 + [1, 0]*scale)
    circle(scale,$fn=_fn);

    translate(-S_tube/2 + [1, 2.3]*scale)
    circle(scale,$fn=_fn);
  }
}

module MK2_head_tube(_fn=24, scale=3) {
  translate([0,3,0]*scale)
  rotate([90,0,0])
    cylinder(r=scale, h=10.4*2*scale, $fn=_fn);
}

module MK2_seat_tube(_fn=24,scale=3) {
  translate([0,5,15.38*2]*scale)
  rotate([90,0,0])
    cylinder(r=scale, h=14.2*2*scale, $fn=_fn);
}

module MK2_top_tube(_fn=24,scale=3) {
  translate([0,-1,10]*scale)
  rotate([20,0,0])
    cylinder(r=0.75*scale, h=22*scale, $fn=_fn);
}

module MK2_bottom_bracket_shell(_fn=24,scale=3) {
  height=2;
 
  translate([0,6,30.8]*scale)
  rotate([0,90,0])
  difference() {
    translate([0,0,height*-.5]*scale)
    cylinder(r=1.75*scale, h=height*scale, $fn=_fn);
    
    translate([0,0,6*-.5]*scale)
    cylinder(r=scale, h=6*scale, $fn=_fn);
  }
}

module MK2_main_frame() {
  union() {
    MK2_main_tube();
    MK2_head_tube();
    MK2_seat_tube();
    MK2_top_tube();
    MK2_bottom_bracket_shell();
  }
}





MK2_main_frame();

MK2_seat_tube();