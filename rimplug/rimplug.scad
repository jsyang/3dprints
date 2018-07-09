// Brompton wheel 16-349 rim plugs!

TOLERANCE = 0.3;

module rimPlugTop() {
  $fn=32;
  difference() {
    scale([9.8,12.5,2])
      sphere(0.5);
    
    translate([0,0,-1])
    scale([1,1,1]*1.2)
    scale([9.5,12.5,2])
      sphere(0.5); 
  }
}

module torus() {
  $fn=32;
  rotate_extrude(angle=360) {
    translate([8,0,0])
    circle(4);
  }
}

module finCut() {
  W=0.6;
  translate([-5,-W/2,-0.01])
    cube([10,W,3]);  
}
module rimPlugBody() {
  $fn=32;
  difference(){
    union() {
      cylinder(r=(9-TOLERANCE)/2,h=3.75);
      cylinder(r1=8.8/2, r2=9.4/2,h=2);
    }
    
    translate([0,0,-0.01])
    cylinder(r=(5-TOLERANCE)/2,h=3);

    finCut();

    rotate([0,0,90])
      finCut();

    rotate([0,0,45])
      finCut();

    rotate([0,0,-45])
      finCut();

  }
  
  
}

union(){
  rimPlugTop();
  translate([0,0,-3.7])
    rimPlugBody();
}